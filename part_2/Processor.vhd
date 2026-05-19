library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- =========================================================
-- RISC Pipelined Processor
-- Stages: IF -> ID -> EX -> MEM -> WB
-- =========================================================

entity Processor is
    Port (
        clk           : in  STD_LOGIC;
        -- Inputs
        instr         : in  STD_LOGIC_VECTOR(15 downto 0);  -- από instruction memory
        fromData      : in  STD_LOGIC_VECTOR(15 downto 0);  -- από data memory (LW)
        keyData       : in  STD_LOGIC_VECTOR(15 downto 0);  -- από πληκτρολόγιο (ReadDigit)
        -- Outputs
        printEnable   : out STD_LOGIC;                       -- PrintDigit enable
        keyEnable     : out STD_LOGIC;                       -- ReadDigit enable
        dataWriteFlag : out STD_LOGIC;                       -- SW: γράψε στη data memory
        dataAd        : out STD_LOGIC_VECTOR(15 downto 0);  -- διεύθυνση data memory
        toData        : out STD_LOGIC_VECTOR(15 downto 0);  -- δεδομένα προς data memory (SW)
        printCode     : out STD_LOGIC_VECTOR(15 downto 0);  -- κωδικός εκτύπωσης
        printData     : out STD_LOGIC_VECTOR(15 downto 0);  -- δεδομένα εκτύπωσης
        regOut        : out STD_LOGIC_VECTOR(143 downto 0); -- pc_out & OUTall (143..128=PC, 127..0=registers)
        instrAd       : out STD_LOGIC_VECTOR(15 downto 0);  -- διεύθυνση instruction memory
        -- Debug outputs
        debug_ifid_instr : out STD_LOGIC_VECTOR(15 downto 0);
        debug_alu_result : out STD_LOGIC_VECTOR(15 downto 0);
        debug_memwb_data : out STD_LOGIC_VECTOR(15 downto 0);
        debug_memwb_ad   : out STD_LOGIC_VECTOR(2 downto 0);
        debug_ctrl_regwr : out STD_LOGIC;
        debug_exmem_we   : out STD_LOGIC;
        debug_idex_r2ad  : out STD_LOGIC_VECTOR(2 downto 0);
        debug_memwb_we   : out STD_LOGIC
    );
end Processor;

architecture structural of Processor is

    -- =========================================================
    -- COMPONENT DECLARATIONS
    -- =========================================================

    component PC_Register is
        Port (
            clock  : in  STD_LOGIC;
            enable : in  STD_LOGIC;
            pc_in  : in  STD_LOGIC_VECTOR(15 downto 0);
            pc_out : out STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;

    component IF_ID is
        Port (
            clk            : in  STD_LOGIC;
            en             : in  STD_LOGIC;
            flush          : in  STD_LOGIC;
            inPC           : in  STD_LOGIC_VECTOR(15 downto 0);
            inInstruction  : in  STD_LOGIC_VECTOR(15 downto 0);
            outPC          : out STD_LOGIC_VECTOR(15 downto 0);
            outInstruction : out STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;

    component register_control is
        Port (
            flush        : in  STD_LOGIC;
            opcode       : in  STD_LOGIC_VECTOR(3 downto 0);
            func         : in  STD_LOGIC_VECTOR(2 downto 0);
            IsBranch     : out STD_LOGIC;
            IsJR         : out STD_LOGIC;
            IsJumpD      : out STD_LOGIC;
            IsLW         : out STD_LOGIC;
            IsMFPC       : out STD_LOGIC;
            IsPrintDigit : out STD_LOGIC;
            IsR          : out STD_LOGIC;
            IsReadDigit  : out STD_LOGIC;
            IsSW         : out STD_LOGIC;
            RegWrite     : out STD_LOGIC
        );
    end component;

    component register_file is
        Port (
            clk         : in  STD_LOGIC;
            writeEnable : in  STD_LOGIC;
            write1AD    : in  STD_LOGIC_VECTOR(2 downto 0);
            write1      : in  STD_LOGIC_VECTOR(15 downto 0);
            readAD1     : in  STD_LOGIC_VECTOR(2 downto 0);
            readAD2     : in  STD_LOGIC_VECTOR(2 downto 0);
            Read1       : out STD_LOGIC_VECTOR(15 downto 0);
            Read2       : out STD_LOGIC_VECTOR(15 downto 0);
            OUTall      : out STD_LOGIC_VECTOR(127 downto 0)
        );
    end component;

    component sign_extender is
        Port (
            imm : in  STD_LOGIC_VECTOR(5 downto 0);
            ext : out STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;

    component TrapUnit is
        Port (
            opcode : in  STD_LOGIC_VECTOR(3 downto 0);
            EOR    : out STD_LOGIC
        );
    end component;

    component ID_EX is
        Port (
            clock              : in  STD_LOGIC;
            isBranch           : in  STD_LOGIC;
            isEOR              : in  STD_LOGIC;
            IsJR               : in  STD_LOGIC;
            IsJump             : in  STD_LOGIC;
            IsLW               : in  STD_LOGIC;
            IsMFPC             : in  STD_LOGIC;
            IsPrintDigit       : in  STD_LOGIC;
            IsR                : in  STD_LOGIC;
            IsReadDigit        : in  STD_LOGIC;
            IsSW               : in  STD_LOGIC;
            RegWrite           : in  STD_LOGIC;
            WasJumpOut         : in  STD_LOGIC;
            ALUFunc            : in  STD_LOGIC_VECTOR(6 downto 0);
            R1Reg              : in  STD_LOGIC_VECTOR(15 downto 0);
            R2Reg              : in  STD_LOGIC_VECTOR(15 downto 0);
            Immediate16        : in  STD_LOGIC_VECTOR(15 downto 0);
            R1AD               : in  STD_LOGIC_VECTOR(2 downto 0);
            R2AD               : in  STD_LOGIC_VECTOR(2 downto 0);
            RdAD               : in  STD_LOGIC_VECTOR(2 downto 0);
            JumpShortAddr      : in  STD_LOGIC_VECTOR(11 downto 0);
            IsBranch_IDEX      : out STD_LOGIC;
            IsEOR_IDEX         : out STD_LOGIC;
            IsJR_IDEX          : out STD_LOGIC;
            IsJump_IDEX        : out STD_LOGIC;
            IsLW_IDEX          : out STD_LOGIC;
            IsMFPC_IDEX        : out STD_LOGIC;
            IsPrintDigit_IDEX  : out STD_LOGIC;
            IsR_IDEX           : out STD_LOGIC;
            IsReadDigit_IDEX   : out STD_LOGIC;
            IsSW_IDEX          : out STD_LOGIC;
            RegWrite_IDEX      : out STD_LOGIC;
            ALUFunc_IDEX       : out STD_LOGIC_VECTOR(6 downto 0);
            R1Reg_IDEX         : out STD_LOGIC_VECTOR(15 downto 0);
            R2Reg_IDEX         : out STD_LOGIC_VECTOR(15 downto 0);
            Immediate16_IDEX   : out STD_LOGIC_VECTOR(15 downto 0);
            R1AD_IDEX          : out STD_LOGIC_VECTOR(2 downto 0);
            R2AD_IDEX          : out STD_LOGIC_VECTOR(2 downto 0);
            RdAD_IDEX          : out STD_LOGIC_VECTOR(2 downto 0);
            JumpShortAddr_IDEX : out STD_LOGIC_VECTOR(11 downto 0)
        );
    end component;

    component alu_control is
        Port (
            opcode : in  STD_LOGIC_VECTOR(3 downto 0);
            func   : in  STD_LOGIC_VECTOR(2 downto 0);
            alu_op : out STD_LOGIC_VECTOR(2 downto 0)
        );
    end component;

    component alu_16bit is
        Port (
            A        : in  STD_LOGIC_VECTOR(15 downto 0);
            B        : in  STD_LOGIC_VECTOR(15 downto 0);
            OP       : in  STD_LOGIC_VECTOR(2 downto 0);
            Result   : out STD_LOGIC_VECTOR(15 downto 0);
            overflow : out STD_LOGIC
        );
    end component;

    component forwarding_unit is
        Port (
            RS          : in  STD_LOGIC_VECTOR(2 downto 0);
            RT          : in  STD_LOGIC_VECTOR(2 downto 0);
            regAD_EXMEM : in  STD_LOGIC_VECTOR(2 downto 0);
            regAD_MEMWB : in  STD_LOGIC_VECTOR(2 downto 0);
            we_EXMEM    : in  STD_LOGIC;
            we_MEMWB    : in  STD_LOGIC;
            forwardA    : out STD_LOGIC_VECTOR(1 downto 0);
            forwardB    : out STD_LOGIC_VECTOR(1 downto 0)
        );
    end component;

    component Selector is
        Port (
            sel         : in  STD_LOGIC_VECTOR(1 downto 0);
            reg_data    : in  STD_LOGIC_VECTOR(15 downto 0);
            mem_forward : in  STD_LOGIC_VECTOR(15 downto 0);
            wb_forward  : in  STD_LOGIC_VECTOR(15 downto 0);
            final_out   : out STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;

    component hazard_unit is
        Port (
            isJump     : in  STD_LOGIC;
            isJR       : in  STD_LOGIC;
            isBranch   : in  STD_LOGIC;
            aluResult  : in  STD_LOGIC_VECTOR(15 downto 0);
            flush_IFID : out STD_LOGIC;
            flush_IDEX : out STD_LOGIC;
            JRopcode   : out STD_LOGIC_VECTOR(1 downto 0)
        );
    end component;

    component EX_MEM is
        Port (
            clk             : in  STD_LOGIC;
            isPrint         : in  STD_LOGIC;
            isRead          : in  STD_LOGIC;
            writeEnable     : in  STD_LOGIC;
            isLW            : in  STD_LOGIC;
            isSW            : in  STD_LOGIC;
            Result          : in  STD_LOGIC_VECTOR(15 downto 0);
            regAD           : in  STD_LOGIC_VECTOR(2 downto 0);
            R2Reg           : in  STD_LOGIC_VECTOR(15 downto 0);
            out_isPrint     : out STD_LOGIC;
            out_isRead      : out STD_LOGIC;
            out_writeEnable : out STD_LOGIC;
            out_isLW        : out STD_LOGIC;
            out_isSW        : out STD_LOGIC;
            out_Result      : out STD_LOGIC_VECTOR(15 downto 0);
            out_regAD       : out STD_LOGIC_VECTOR(2 downto 0);
            out_R2Reg       : out STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;

    component MEM_WB is
        Port (
            clk             : in  STD_LOGIC;
            isLW            : in  STD_LOGIC;
            isRead          : in  STD_LOGIC;
            writeEnable     : in  STD_LOGIC;
            regAD           : in  STD_LOGIC_VECTOR(2 downto 0);
            fromData        : in  STD_LOGIC_VECTOR(15 downto 0);
            keyData         : in  STD_LOGIC_VECTOR(15 downto 0);
            aluResult       : in  STD_LOGIC_VECTOR(15 downto 0);
            writeEnable_out : out STD_LOGIC;
            writeData       : out STD_LOGIC_VECTOR(15 downto 0);
            writeAD         : out STD_LOGIC_VECTOR(2 downto 0)
        );
    end component;

    component JRSelector is
        Port (
            JRopcode : in  STD_LOGIC_VECTOR(1 downto 0);
            PCP2AD   : in  STD_LOGIC_VECTOR(15 downto 0);
            JumpAD   : in  STD_LOGIC_VECTOR(15 downto 0);
            BranchAD : in  STD_LOGIC_VECTOR(15 downto 0);
            PCnext   : out STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;

    -- =========================================================
    -- SIGNALS
    -- =========================================================

    -- IF Stage
    signal pc_out      : STD_LOGIC_VECTOR(15 downto 0);
    signal pc_next     : STD_LOGIC_VECTOR(15 downto 0);
    signal pc_enable   : STD_LOGIC;
    signal ifid_pc     : STD_LOGIC_VECTOR(15 downto 0);
    signal ifid_instr  : STD_LOGIC_VECTOR(15 downto 0);
    signal ifid_flush  : STD_LOGIC;
    signal ifid_en     : STD_LOGIC;

    -- ID Stage
    -- R-type: op(15:12) | rd(11:9) | rs(8:6) | rt(5:3) | func(2:0)
    -- I-type: op(15:12) | rd(11:9) | rs(8:6) | immediate(5:0)
    -- J-type: op(15:12) | jumpAddr(11:0)
    signal id_opcode   : STD_LOGIC_VECTOR(3 downto 0);
    signal id_rd       : STD_LOGIC_VECTOR(2 downto 0);
    signal id_rs       : STD_LOGIC_VECTOR(2 downto 0);
    signal id_rt       : STD_LOGIC_VECTOR(2 downto 0);
    signal id_func     : STD_LOGIC_VECTOR(2 downto 0);
    signal id_imm6     : STD_LOGIC_VECTOR(5 downto 0);
    signal id_imm16    : STD_LOGIC_VECTOR(15 downto 0);
    signal id_jumpaddr : STD_LOGIC_VECTOR(11 downto 0);
    signal id_destAD   : STD_LOGIC_VECTOR(2 downto 0);
    signal id_alufunc  : STD_LOGIC_VECTOR(6 downto 0);  -- opcode & func

    -- Control signals
    signal ctrl_isBranch : STD_LOGIC;
    signal ctrl_isJR     : STD_LOGIC;
    signal ctrl_isJump   : STD_LOGIC;
    signal ctrl_isLW     : STD_LOGIC;
    signal ctrl_isMFPC   : STD_LOGIC;
    signal ctrl_isPrint  : STD_LOGIC;
    signal ctrl_isR      : STD_LOGIC;
    signal ctrl_isRead   : STD_LOGIC;
    signal ctrl_isSW     : STD_LOGIC;
    signal ctrl_regWrite : STD_LOGIC;

    -- TrapUnit
    signal trap_eor : STD_LOGIC;

    -- Register File
    signal rf_read1  : STD_LOGIC_VECTOR(15 downto 0);
    signal rf_read2  : STD_LOGIC_VECTOR(15 downto 0);
    signal rf_outall : STD_LOGIC_VECTOR(127 downto 0);
    signal id_r1reg_fwd : STD_LOGIC_VECTOR(15 downto 0);
    signal id_r2reg_fwd : STD_LOGIC_VECTOR(15 downto 0);

    -- ID/EX outputs
    signal idex_isBranch : STD_LOGIC;
    signal idex_isEOR    : STD_LOGIC;
    signal idex_isJR     : STD_LOGIC;
    signal idex_isJump   : STD_LOGIC;
    signal idex_isLW     : STD_LOGIC;
    signal idex_isMFPC   : STD_LOGIC;
    signal idex_isPrint  : STD_LOGIC;
    signal idex_isR      : STD_LOGIC;
    signal idex_isRead   : STD_LOGIC;
    signal idex_isSW     : STD_LOGIC;
    signal idex_regwrite : STD_LOGIC;
    signal idex_alufunc  : STD_LOGIC_VECTOR(6 downto 0);
    signal idex_r1reg    : STD_LOGIC_VECTOR(15 downto 0);
    signal idex_r2reg    : STD_LOGIC_VECTOR(15 downto 0);
    signal idex_imm16    : STD_LOGIC_VECTOR(15 downto 0);
    signal idex_r1ad     : STD_LOGIC_VECTOR(2 downto 0);
    signal idex_r2ad     : STD_LOGIC_VECTOR(2 downto 0);
    signal idex_rdad     : STD_LOGIC_VECTOR(2 downto 0);  -- destination register
    signal idex_jumpaddr : STD_LOGIC_VECTOR(11 downto 0);
    signal idex_pc       : STD_LOGIC_VECTOR(15 downto 0);  -- PC gia MFPC

    -- EX Stage
    signal fwd_a          : STD_LOGIC_VECTOR(1 downto 0);
    signal fwd_b          : STD_LOGIC_VECTOR(1 downto 0);
    signal alu_in_a       : STD_LOGIC_VECTOR(15 downto 0);
    signal alu_in_b       : STD_LOGIC_VECTOR(15 downto 0);
    signal alu_a_final    : STD_LOGIC_VECTOR(15 downto 0);
    signal alu_b_final    : STD_LOGIC_VECTOR(15 downto 0);
    signal alu_op         : STD_LOGIC_VECTOR(2 downto 0);
    signal alu_result     : STD_LOGIC_VECTOR(15 downto 0);
    signal alu_overflow   : STD_LOGIC;
    signal branch_ad      : STD_LOGIC_VECTOR(15 downto 0);
    signal jump_ad        : STD_LOGIC_VECTOR(15 downto 0);
    signal haz_flush_ifid : STD_LOGIC;
    signal haz_flush_idex : STD_LOGIC;
    signal haz_jropcode   : STD_LOGIC_VECTOR(1 downto 0);
    signal wasJumpOut     : STD_LOGIC;

    -- EX/MEM outputs
    signal exmem_isPrint : STD_LOGIC;
    signal exmem_isRead  : STD_LOGIC;
    signal exmem_we      : STD_LOGIC;
    signal exmem_isLW    : STD_LOGIC;
    signal exmem_isSW    : STD_LOGIC;
    signal exmem_result  : STD_LOGIC_VECTOR(15 downto 0);
    signal exmem_regAD   : STD_LOGIC_VECTOR(2 downto 0);
    signal exmem_r2reg   : STD_LOGIC_VECTOR(15 downto 0);

    -- MEM/WB outputs
    signal memwb_writeData : STD_LOGIC_VECTOR(15 downto 0);
    signal memwb_writeAD   : STD_LOGIC_VECTOR(2 downto 0);
    signal memwb_we        : STD_LOGIC;

begin

    -- =========================================================
    -- STAGE 1: IF (Instruction Fetch)
    -- =========================================================

    pc_enable  <= not idex_isEOR;
    ifid_flush <= haz_flush_ifid or trap_eor;
    ifid_en    <= '1';

    PC_REG: PC_Register
        port map (
            clock  => clk,
            enable => pc_enable,
            pc_in  => pc_next,
            pc_out => pc_out
        );

    -- Διεύθυνση προς instruction memory
    instrAd <= pc_out;

    -- regOut: pc_out (143..128) & OUTall (127..0)
    regOut <= pc_out & rf_outall;

    IF_ID_REG: IF_ID
        port map (
            clk            => clk,
            en             => ifid_en,
            flush          => ifid_flush,
            inPC           => pc_out,
            inInstruction  => instr,
            outPC          => ifid_pc,
            outInstruction => ifid_instr
        );

    -- =========================================================
    -- STAGE 2: ID (Instruction Decode)
    -- =========================================================
    -- R-type: op(15:12) | rd(11:9) | rs(8:6) | rt(5:3) | func(2:0)
    -- I-type: op(15:12) | rd(11:9) | rs(8:6) | immediate(5:0)
    -- J-type: op(15:12) | jumpAddr(11:0)

    id_opcode   <= ifid_instr(15 downto 12);
    id_rs       <= ifid_instr(11 downto 9);  -- rs
    id_rt       <= ifid_instr(8  downto 6);  -- rt
    id_rd       <= ifid_instr(5  downto 3);  -- rd (destination)
    id_func     <= ifid_instr(2  downto 0);
    id_imm6     <= ifid_instr(5  downto 0);
    id_jumpaddr <= ifid_instr(11 downto 0);
    id_alufunc  <= id_opcode & id_func;
    id_destAD   <= id_rd;

    SE: sign_extender
        port map (
            imm => id_imm6,
            ext => id_imm16
        );

    CTRL: register_control
        port map (
            flush        => ifid_flush,
            opcode       => id_opcode,
            func         => id_func,
            IsBranch     => ctrl_isBranch,
            IsJR         => ctrl_isJR,
            IsJumpD      => ctrl_isJump,
            IsLW         => ctrl_isLW,
            IsMFPC       => ctrl_isMFPC,
            IsPrintDigit => ctrl_isPrint,
            IsR          => ctrl_isR,
            IsReadDigit  => ctrl_isRead,
            IsSW         => ctrl_isSW,
            RegWrite     => ctrl_regWrite
        );

    TRAP: TrapUnit
        port map (
            opcode => id_opcode,
            EOR    => trap_eor
        );

    -- Register File: διαβάζει rs και rt
    -- Γράφει από το WB stage
    RF: register_file
        port map (
            clk         => clk,
            writeEnable => memwb_we,
            write1AD    => memwb_writeAD,
            write1      => memwb_writeData,
            readAD1     => id_rs,
            readAD2     => id_rt,
            Read1       => rf_read1,
            Read2       => rf_read2,
            OUTall      => rf_outall
        );

    -- WB forwarding: αν ο register που γράφεται (WB) είναι ο ίδιος
    -- με αυτόν που διαβάζεται (ID), χρησιμοποιούμε το WB data
    -- αντί το register file output
    id_r1reg_fwd <= memwb_writeData when (memwb_we = '1' and 
                                          memwb_writeAD /= "000" and 
                                          memwb_writeAD = id_rs)
                    else rf_read1;

    id_r2reg_fwd <= memwb_writeData when (memwb_we = '1' and 
                                          memwb_writeAD /= "000" and 
                                          memwb_writeAD = id_rt)
                    else rf_read2;

    wasJumpOut <= haz_flush_idex;

    ID_EX_REG: ID_EX
        port map (
            clock              => clk,
            isBranch           => ctrl_isBranch,
            isEOR              => trap_eor,
            IsJR               => ctrl_isJR,
            IsJump             => ctrl_isJump,
            IsLW               => ctrl_isLW,
            IsMFPC             => ctrl_isMFPC,
            IsPrintDigit       => ctrl_isPrint,
            IsR                => ctrl_isR,
            IsReadDigit        => ctrl_isRead,
            IsSW               => ctrl_isSW,
            RegWrite           => ctrl_regWrite,
            WasJumpOut         => wasJumpOut,
            ALUFunc            => id_alufunc,
            R1Reg              => id_r1reg_fwd,
            R2Reg              => id_r2reg_fwd,
            Immediate16        => id_imm16,
            R1AD               => id_rs,
            R2AD               => id_rt,
            RdAD               => id_destAD,
            JumpShortAddr      => id_jumpaddr,
            IsBranch_IDEX      => idex_isBranch,
            IsEOR_IDEX         => idex_isEOR,
            IsJR_IDEX          => idex_isJR,
            IsJump_IDEX        => idex_isJump,
            IsLW_IDEX          => idex_isLW,
            IsMFPC_IDEX        => idex_isMFPC,
            IsPrintDigit_IDEX  => idex_isPrint,
            IsR_IDEX           => idex_isR,
            IsReadDigit_IDEX   => idex_isRead,
            IsSW_IDEX          => idex_isSW,
            RegWrite_IDEX      => idex_regwrite,
            ALUFunc_IDEX       => idex_alufunc,
            R1Reg_IDEX         => idex_r1reg,
            R2Reg_IDEX         => idex_r2reg,
            Immediate16_IDEX   => idex_imm16,
            R1AD_IDEX          => idex_r1ad,
            R2AD_IDEX          => idex_r2ad,
            RdAD_IDEX          => idex_rdad,
            JumpShortAddr_IDEX => idex_jumpaddr
        );

    -- =========================================================
    -- STAGE 3: EX (Execute)
    -- =========================================================

    FWD: forwarding_unit
        port map (
            RS          => idex_r1ad,    -- RS address
            RT          => idex_r2ad,    -- RT address
            regAD_EXMEM => exmem_regAD,
            regAD_MEMWB => memwb_writeAD,
            we_EXMEM    => exmem_we,
            we_MEMWB    => memwb_we,
            forwardA    => fwd_a,
            forwardB    => fwd_b
        );

    SEL_A: Selector
        port map (
            sel         => fwd_a,
            reg_data    => idex_r1reg,
            mem_forward => exmem_result,
            wb_forward  => memwb_writeData,
            final_out   => alu_in_a
        );

    SEL_B: Selector
        port map (
            sel         => fwd_b,
            reg_data    => idex_r2reg,
            mem_forward => exmem_result,
            wb_forward  => memwb_writeData,
            final_out   => alu_in_b
        );

    -- To PC pernaei kai apo to ID_EX register gia MFPC
    -- ifid_pc = PC+2 ths entolis pou twra einai sto EX stage (exei hdh perasei to ID_EX)
    idex_pc <= ifid_pc;

    -- MFPC: ALU_A = PC+2 ths trexousas entolis
    alu_a_final <= idex_pc when (idex_isMFPC = '1') else alu_in_a;

    -- LW/SW: ALU_B = immediate (address = RS + offset)
    alu_b_final <= idex_imm16 when (idex_isLW = '1' or idex_isSW = '1')
                   else alu_in_b;

    ALU_CTRL: alu_control
        port map (
            opcode => idex_alufunc(6 downto 3),  -- bits 6:3 = opcode
            func   => idex_alufunc(2 downto 0),  -- bits 2:0 = func
            alu_op => alu_op
        );

    ALU_INST: alu_16bit
        port map (
            A        => alu_a_final,
            B        => alu_b_final,
            OP       => alu_op,
            Result   => alu_result,
            overflow => alu_overflow
        );

    branch_ad <= idex_pc + idex_imm16;  -- branch = PC_EX + offset
    jump_ad   <= "0000" & idex_jumpaddr;

    HAZ: hazard_unit
        port map (
            isJump     => idex_isJump,
            isJR       => idex_isJR,
            isBranch   => idex_isBranch,
            aluResult  => alu_result,
            flush_IFID => haz_flush_ifid,
            flush_IDEX => haz_flush_idex,
            JRopcode   => haz_jropcode
        );

    JR_SEL: JRSelector
        port map (
            JRopcode => haz_jropcode,
            PCP2AD   => ifid_pc,
            JumpAD   => jump_ad,
            BranchAD => branch_ad,
            PCnext   => pc_next
        );

    EX_MEM_REG: EX_MEM
        port map (
            clk             => clk,
            isPrint         => idex_isPrint,
            isRead          => idex_isRead,
            writeEnable     => idex_regwrite,
            isLW            => idex_isLW,
            isSW            => idex_isSW,
            Result          => alu_result,
            regAD           => idex_rdad,
            R2Reg           => alu_in_b,
            out_isPrint     => exmem_isPrint,
            out_isRead      => exmem_isRead,
            out_writeEnable => exmem_we,
            out_isLW        => exmem_isLW,
            out_isSW        => exmem_isSW,
            out_Result      => exmem_result,
            out_regAD       => exmem_regAD,
            out_R2Reg       => exmem_r2reg
        );

    -- =========================================================
    -- STAGE 4: MEM (Memory Access)
    -- =========================================================

    -- PrintDigit
    printEnable <= exmem_isPrint;
    printData   <= exmem_result;
    printCode   <= exmem_result;  -- ίδια τιμή με printData

    -- ReadDigit
    keyEnable <= exmem_isRead;

    -- SW: γράψε στη data memory
    -- SW: grapse sti data memory mono otan einai SW (oxi LW)
    dataWriteFlag <= exmem_isSW;
    dataAd        <= exmem_result;   -- διεύθυνση = αποτέλεσμα ALU
    toData        <= exmem_r2reg;    -- δεδομένα = RT register

    MEM_WB_REG: MEM_WB
        port map (
            clk             => clk,
            isLW            => exmem_isLW,
            isRead          => exmem_isRead,
            writeEnable     => exmem_we,
            regAD           => exmem_regAD,
            fromData        => fromData,
            keyData         => keyData,
            aluResult       => exmem_result,
            writeEnable_out => memwb_we,
            writeData       => memwb_writeData,
            writeAD         => memwb_writeAD
        );

    -- Debug outputs
    debug_ifid_instr <= ifid_instr;
    debug_alu_result <= alu_result;
    debug_memwb_data <= memwb_writeData;
    debug_memwb_ad   <= memwb_writeAD;
    debug_ctrl_regwr <= ctrl_regWrite;
    debug_exmem_we   <= exmem_we;
    debug_idex_r2ad  <= idex_rdad;
    debug_memwb_we   <= memwb_we;

    -- =========================================================
    -- STAGE 5: WB (Write Back)
    -- =========================================================
    -- Το write back γίνεται μέσω του register_file παραπάνω
    -- memwb_we έρχεται από MEM_WB register (writeEnable_out)

end structural;