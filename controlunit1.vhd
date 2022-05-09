----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    04:12:19 04/14/2021 
-- Design Name: 
-- Module Name:    controlunit1 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ControlUnit is
	Port(
			  Opcode 		: in  STD_LOGIC_VECTOR (5 downto 0);
           RegDst 		: out  STD_LOGIC;
           MemToReg 		: out  STD_LOGIC;
           RegWrite 		: out  STD_LOGIC;
           MemRead		: out  STD_LOGIC;
           MemWrite 		: out  STD_LOGIC;
			  PCWriteCond	: out  STD_LOGIC;
			  PCWrite		: out  STD_LOGIC;
			  IorD			: out  STD_LOGIC;
			  IRWrite		: out  STD_LOGIC;
			  ALUop 			: out  STD_LOGIC_VECTOR (1 downto 0);
			  PCSource		: out  STD_LOGIC_VECTOR (1 downto 0);
           ALUSrcB		: out  STD_LOGIC_VECTOR (1 downto 0);
			  ALUSrcA 		: out  STD_LOGIC;
			  CLK 			: in  STD_LOGIC
		);
end ControlUnit;

architecture Behavioral of ControlUnit is

signal currentState : STD_LOGIC_VECTOR(3 downto 0) := "0000";

begin

process(Opcode, currentState, CLK)
 
begin
 
if rising_edge(CLK) then
        if currentState = "0000" then
				currentState <= "0001"; -- state 1 (Decode)
        elsif currentState = "0001" then
           
            if Opcode = "100011" or Opcode = "101011" then  --if lw or sw
            currentState <= "0010"; -- state 2
            
            elsif Opcode = "000000" then  --if R-type
            currentState <= "0110";  -- state 6
            
            elsif Opcode = "000100" then --if beq
            currentState <= "1000";  -- state 8
            
            elsif Opcode = "001000" then --if addi
            currentState <= "1010";  -- state 10
            end if;
        elsif currentState = "0010" then
            
            if Opcode = "100011" then --if lw
            currentState <= "0011"; -- state 3
            else
            currentState <= "0101"; -- state 5
            end if;
        elsif currentState = "1010" then
            currentState <= "1011"; -- state 11
        elsif currentState = "1011" then
            currentState <= "0000"; -- go to the start
        elsif currentState = "0011" then
            currentState <= "0100"; -- state 4
        elsif currentState = "0100" then
            currentState <= "0000"; -- go to the start
        elsif currentState = "0101" then
            currentState <= "0000"; 
        elsif currentState = "0110" then
            currentState <= "0111";
        elsif currentState = "0111" then
            currentState <= "0000";
        elsif currentState = "1000" then
            currentState <="0000";
        end if;
end if;

if currentState = "0000" then  --instruction fetch  
        PCWrite <= '1';
        PCWriteCond <= '0';
        IorD <= '0';
        MemRead <= '1';
        MemWrite <= '0';
        IRWrite <= '1';
        MemtoReg <='0';
        PCSource <="00";
        ALUOp <="00";
        ALUSrcB <= "01";
        ALUSrcA <='0';
        RegWrite <='0';
        RegDst <= '0';
		  
    elsif currentState = "0001" then --decode/register fetch
        PCWrite <= '0';
        PCWriteCond <= '0';
        IorD <= '0';
        MemRead <= '0';
        MemWrite <= '0';
        IRWrite <= '0';
        MemtoReg <='0';
        PCSource <="00";
        ALUOp <="00";
        ALUSrcB <= "11";
        ALUSrcA <='0';
        RegWrite <='0';
        RegDst <= '0';
		  
    elsif currentState = "0010" then --lw/sw execute
        PCWrite <= '0';
        PCWriteCond <= '0';
        IorD <= '0';
        MemRead <= '0';
        MemWrite <= '0';
        IRWrite <= '0';
        MemtoReg <='0';
        PCSource <="00";
        ALUOp <="00";
        ALUSrcB <= "10";
        ALUSrcA <='1';
        RegWrite <='0';
        RegDst <= '0';
		  
    elsif currentState = "0011" then --lw memory access
        PCWrite <= '0';
        PCWriteCond <= '0';
        IorD <= '1';
        MemRead <= '1';
        MemWrite <= '0';
        IRWrite <= '0';
        MemtoReg <='0';
        PCSource <="00";
        ALUOp <="00";
        ALUSrcB <= "00";
        ALUSrcA <='0';
        RegWrite <='0';
        RegDst <= '0';
		  
    elsif currentState = "0100" then --lw write back
        PCWrite <= '0';
        PCWriteCond <= '0';
        IorD <= '0';
        MemRead <= '0';
        MemWrite <= '0';
        IRWrite <= '0';
        MemtoReg <='1';
        PCSource <="00";
        ALUOp <="00";
        ALUSrcB <= "00";
        ALUSrcA <='0';
        RegWrite <='1';
        RegDst <= '0';
		  
    elsif currentState = "0101" then --sw write back
        PCWrite <= '0';
        PCWriteCond <= '0';
        IorD <= '1';
        MemRead <= '0';
        MemWrite <= '1';
        IRWrite <= '0';
        MemtoReg <='0';
        PCSource <="00";
        ALUOp <="00";
        ALUSrcB <= "00";
        ALUSrcA <='0';
        RegWrite <='0';
        RegDst <= '0';
        
    elsif currentState = "0110" then --R-type execution
        PCWrite <= '0';
        PCWriteCond <= '0';
        IorD <= '0';
        MemRead <= '0';
        MemWrite <= '0';
        IRWrite <= '0';
        MemtoReg <='0';
        PCSource <="00";
        ALUOp <="10";
        ALUSrcB <= "00";
        ALUSrcA <='1';
        RegWrite <='0';
        RegDst <= '0';
		  
    elsif currentState = "0111" then --R-type completion
        PCWrite <= '0';
        PCWriteCond <= '0';
        IorD <= '0';
        MemRead <= '0';
        MemWrite <= '0';
        IRWrite <= '0';
        MemtoReg <='0';
        PCSource <="00";
        ALUOp <="00";
        ALUSrcB <= "00";
        ALUSrcA <='0';
        RegWrite <='1';
        RegDst <= '1';
		  
    elsif currentState = "1000" then --BEQ Completion
        PCWrite <= '0';
        PCWriteCond <= '1';
        IorD <= '0';
        MemRead <= '0';
        MemWrite <= '0';
        IRWrite <= '0';
        MemtoReg <='0';
        PCSource <="01";
        ALUOp <="01";
        ALUSrcB <= "00";
        ALUSrcA <='1';
        RegWrite <='0';
        RegDst <= '0';

	 elsif currentState = "1001" then --Jump
        PCWrite <= '1';
        PCWriteCond <= '0';
        IorD <= '0';
        MemRead <= '0';
        MemWrite <= '0';
        IRWrite <= '0';
        MemtoReg <='0';
        PCSource <="10";
        ALUOp <="00";
        ALUSrcB <= "00";
        ALUSrcA <='0';
        RegWrite <='0';
        RegDst <= '0';
        
     elsif currentState = "1010" then --addi execute
        PCWrite <= '0';
        PCWriteCond <= '0';
        IorD <= '0';
        MemRead <= '0';
        MemWrite <= '0';
        IRWrite <= '0';
        MemtoReg <='0';
        PCSource <="10";
        ALUOp <="00";
        ALUSrcB <= "10";
        ALUSrcA <='1';
        RegWrite <='0';
        RegDst <= '0';
        
     elsif currentState = "1011" then --addi write back
        PCWrite <= '0';
        PCWriteCond <= '0';
        IorD <= '0';
        MemRead <= '0';
        MemWrite <= '0';
        IRWrite <= '0';
        MemtoReg <='0';
        PCSource <="00";
        ALUOp <="00";
        ALUSrcB <= "00";
        ALUSrcA <='0';
        RegWrite <='1';
        RegDst <= '0';
    end if;
end process;


end Behavioral;

