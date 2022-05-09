----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    04:22:19 04/14/2021 
-- Design Name: 
-- Module Name:    registers - Behavioral 
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

entity Registers is
    Port ( READ_REG1 : in  STD_LOGIC_VECTOR (4 downto 0);
           READ_REG2 : in  STD_LOGIC_VECTOR (4 downto 0);
           WRITE_REG : in  STD_LOGIC_VECTOR (4 downto 0);
           READ_DATA_1 : out  STD_LOGIC_VECTOR (31 downto 0);
           READ_DATA_2 : out  STD_LOGIC_VECTOR (31 downto 0);
           WRITE_DATA : in  STD_LOGIC_VECTOR (31 downto 0);
           REGWRITE : in  STD_LOGIC ;
			  clk: in STD_LOGIC);
end Registers;

architecture Behavioral of Registers is 
type RegisterFile is array (0 to 31) of STD_LOGIC_VECTOR (31 downto 0);
 
 signal registers: RegisterFile :=(5=> x"00000030",
								   Others=>x"00000000" );
 
  
  
begin 
process(clk,REGWRITE,READ_REG1,READ_REG2,WRITE_REG,WRITE_DATA) 
begin 
READ_DATA_1 <=registers(to_integer(unsigned(READ_REG1))); 
READ_DATA_2 <=registers(to_integer(unsigned(READ_REG2))); 

if(rising_edge(clk) and REGWRITE ='1') then 
	registers(to_integer(unsigned(WRITE_REG))) <=WRITE_DATA; 
end if;
end process;




end Behavioral;