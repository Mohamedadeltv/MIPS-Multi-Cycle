----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    04:06:21 05/06/2021 
-- Design Name: 
-- Module Name:    datamemory - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DataMemory is
    Port ( Address  : in  STD_LOGIC_VECTOR (31 downto 0);
           WriteData : in  STD_LOGIC_VECTOR (31 downto 0);
           MemData : out  STD_LOGIC_VECTOR (31 downto 0);
           MemRead : in  STD_LOGIC;
           MemWrite : in  STD_LOGIC;
           CLK : in  STD_LOGIC );
end DataMemory;

	architecture Behavioral of DataMemory is

type DM is array (0 to 255) of STD_LOGIC_VECTOR(7 downto 0);

signal RAM : DM :=(  x"43",x"6F",x"6D",x"70", 
							x"75",x"74",x"65",x"72",									
							x"20",x"41",x"72",x"63",									
							x"68",x"69",x"74",x"65",									
							x"63",x"74",x"75",x"72",									
							x"65",x"20",x"32",x"30",
							x"32",x"31",x"21",x"21",
							x"32",x"31",x"21",x"21",
							x"00",x"00",x"00",x"00",
							x"00",x"00",x"00",x"00",
							x"00",x"00",x"00",x"00",
							x"00",x"00",x"00",x"00",
							x"00",x"00",x"00",x"00",
							x"00",x"00",x"00",x"00",
							x"00",x"00",x"00",x"00",
							x"00",x"00",x"00",x"00",
							x"00",x"00",x"00",x"00",
							x"00",x"00",x"00",x"00",
							x"00",x"00",x"00",x"00",
							x"00",x"00",x"00",x"00",
							x"00",x"00",x"00",x"00",
							x"00",x"00",x"00",x"00",
							x"00",x"00",x"00",x"00",
							x"00",x"00",x"00",x"00",
							x"00",x"00",x"00",x"00",
							x"20",x"08",x"00",x"04", -- addi $t0, $zero, 4  => Mem[100]
							x"20",x"86",x"00",x"00", -- addi $a2, $a0, 0
							x"20",x"A7",x"00",x"00", -- addi $a3, $a1, 0
							x"20",x"09",x"00",x"01", -- addi $t1, $zero, 1
	   					x"8C",x"C3",x"00",x"00", -- lw $v1, 0($a2)
							x"20",x"42",x"00",x"01", -- addi $v0, $v0,1
							x"AC",x"E3",x"00",x"00", -- sw $v1, 0($a3) 
							x"00",x"C8",x"30",x"20", -- add $a2, $a2, $t0
							x"00",x"E8",x"38",x"20", -- add $a3, $a3, $t0
							x"00",x"69",x"50",x"2A", -- slt $t2, $v1, $t1
							x"11",x"40",x"FF",x"F9", -- beq $t2, $zero, loop(-7*4)
							x"00",x"49",x"10",x"22", -- sub $v0,$v0,$t1x`
							others => x"00"
						 );

begin

process(MemRead, MemWrite, CLK, WriteData)
begin
				if(falling_edge(CLK) and MemRead = '1' and MemWrite = '0') then
							MemData <=  RAM(to_integer(unsigned(Address)))&
										   RAM(to_integer(unsigned(Address))+1)&
										   RAM(to_integer(unsigned(Address))+2)&
										   RAM(to_integer(unsigned(Address))+3);
				end if; 

				if(rising_edge(CLK) and MemRead = '0' and MemWrite = '1') then
							RAM(to_integer(unsigned(Address))) 	<= WriteData(31 downto 24);
							RAM(to_integer(unsigned(Address))+1) <= WriteData(23 downto 16);
							RAM(to_integer(unsigned(Address))+2) <= WriteData(15 downto 8);
							RAM(to_integer(unsigned(Address))+3) <= WriteData(7 downto 0);
				end if;
end process;
	
end Behavioral;
