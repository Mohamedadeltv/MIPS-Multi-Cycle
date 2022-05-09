
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;


entity MIPS is
    Port ( CLKmain : in  STD_LOGIC);
end MIPS;

architecture Behavioral of MIPS is

signal PCout, PCin, AddressInput, ALUBufferOut, MemDataSignal, Instruction, MemoryDataRegisterOutput, WriteDataOutput, SignExtendOutput, RegAInput, RegAOutput, RegBInput, RegBOutput, ShiftLeftOutput, ALUInput_A, ALUInput_B, ALUOutput : STD_LOGIC_VECTOR(31 downto 0);
signal IorDSignal, IRWriteSignal, MemReadSignal, MemWriteSignal, MemtoRegSignal, RegDstSignal, RegWriteSignal, ALUSrcASignal, ZeroFlagSignal, PCWriteCondSignal, PCWriteSignal : STD_LOGIC;
signal ALUSrcBSignal, ALUOpSignal, PCSourceSignal : STD_LOGIC_VECTOR(1 downto 0);
signal OperationSignal : STD_LOGIC_VECTOR(3 downto 0);
signal WriteRegisterOutput : STD_LOGIC_VECTOR(4 downto 0);
signal ShiftLeftPCOutput : STD_LOGIC_VECTOR(27 downto 0);
			 
	
	
	
	
begin


-- instantiating THE ALU MUX
	U1Memorymux: entity work.mux2to11(Behavioral)
		port map(
			  a => PCout,
			  b => ALUBufferOut,
			  sel =>  IorDSignal,
			  output => AddressInput
		);
		
-- instantiating THE SIGN EXTENDER
	U2signextend: entity work.signextend(Behavioral)
	   port map(
			imm => Instruction(15 downto 0),
			SignExtend=> SignExtendOutput
		);
		
-- instantiating THE RegisterFile	
	U3registers: entity work.Registers(Behavioral)
		port map(
			  READ_REG1 => Instruction(25 downto 21) ,
           READ_REG2 =>Instruction(20 downto 16),
           WRITE_REG => WriteRegisterOutput,
           READ_DATA_1 => RegAInput,
           READ_DATA_2 =>RegBInput,
			  clk => CLKmain,
           WRITE_DATA => WriteDataOutput,
           REGWRITE => RegWriteSignal
			);
			
-- instantiating THE Instruction MUX
	U4WritedDataMux: entity work.mux2to11(Behavioral)
		port map(
			  a => ALUBufferOut,
			  b => MemoryDataRegisterOutput,
			  sel =>  MemtoRegSignal,
			  output => WriteDataOutput
		);
	
	U5instructionbuffer: entity work.Instruction_Memory(Behavioral)
		port map(
			  input => MemDataSignal,
           output => Instruction,
           irwwrite => IRWriteSignal,
           clk => CLKmain
					
		);
	
	U6ALUcontrolunit: entity work.ALU(Behavioral)
	   port map(
					func => Instruction(5 downto 0),
					ALUOP => ALUOpSignal,
					Operation => OperationSignal
		);
	
	U7ALUnit: entity work.ALU2(Behavioral)
	   port map(
					A => ALUInput_A,
					B => ALUInput_B,
					S => OperationSignal,
					RESULT => ALUOutput,
					FLAG => ZeroFlagSignal
		);
		
	U8: entity work.datamemory(Behavioral)
	   port map(
			  Address => AddressInput,
           WriteData => RegBOutput,
           MemData => MemDataSignal,
           MemRead => MemReadSignal,
           MemWrite => MemWriteSignal,
           CLK => CLKmain
		);
		
	U9WriteRegisterMux: entity work.mux2to11(Behavioral)
		Generic map( N => 5)
		port map(
			  a => Instruction(20 downto 16),
			  b => Instruction(15 downto 11),
			  sel => RegDstSignal,
			  output => WriteRegisterOutput
		);
		
	U10: entity work.ControlUnit(Behavioral)
		port map(
			  Opcode => Instruction(31 downto 26),
           RegDst => RegDstSignal,
           MemToReg => MemtoRegSignal,
           RegWrite => RegWriteSignal,
           MemRead  => MemReadSignal,
           MemWrite => MemWriteSignal,
			  PCWriteCond => PCWriteCondSignal,
			  PCWrite => PCWriteSignal ,
			  IorD => IorDSignal,
			  IRWrite => IRWriteSignal,
			  ALUop => ALUOpSignal,
			  PCSource => PCSourceSignal,
           ALUSrcB => ALUSrcBSignal,
			  ALUSrcA => ALUSrcASignal,
			  CLK => CLKmain
				);
		
	U11pc : entity work.pc(Behavioral)
		port map(
				input => PCin,
            output => PCout,
            sig => (ZeroFlagSignal and PCWriteCondSignal) or PCWriteSignal,
            clk => CLKmain
		);
		

	 U12ShiftLeftPC : entity work.shiftleft(Behavioral)
		Generic map(N => 28)
		port map(
			  shiftin => Instruction(27 downto 0),
			  shiftout => ShiftLeftPCOutput
		);
		
	
	
	U13ALUinputAmux : entity work.mux2to11(Behavioral)
		port map(
					a => PCout,
					b => RegAOutput,
					sel => ALUSrcASignal,
					output => ALUInput_A
		);
			U14ALUinputBmux : entity work.muxfourtone(Behavioral)
		port map(
			  A => RegBOutput,
			  B => x"00000004",
			  C => SignExtendOutput,
			  D => ShiftLeftOutput,
			  S => ALUSrcBSignal,
			  Y => ALUInput_B
		);

    U15regA : entity work.RegisterBuffer(Behavioral)
		port map(
			  input => RegAInput,
           output => RegAOutput,
           clk => CLKmain
		);
		U16regB : entity work.RegisterBuffer(Behavioral)
		port map(
			  input => RegBInput,
           output => RegBOutput,
           clk => CLKmain
		);
				U17ALUOutBuffer : entity work.RegisterBuffer(Behavioral)
		port map(
			  input => ALUOutput,
           output => ALUBufferOut,
           clk => CLKmain
		);
			U18PCmux : entity work.muxfourtone(Behavioral)
		port map(
			  A => ALUOutput,
			  B => ALUBufferOut,
			  C => x"00000000",
			  D => x"00000000",
			  S => PCSourceSignal,
			  Y => PCin
		);
		U19memorydataregister : entity work.RegisterBuffer(Behavioral)
		port map(
			  input => MemDataSignal,
           output => MemoryDataRegisterOutput,
           clk => CLKmain
		);
		U20ShiftLeft : entity work.shiftleft(Behavioral)
		port map(
			  shiftin => SignExtendOutput,
			  shiftout => ShiftLeftOutput
		);


		
	
	

end Behavioral;

