----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:10:46 06/09/2021 
-- Design Name: 
-- Module Name:    Instruction_Memory - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
entity Instruction_Memory is
    Port ( input : in  STD_LOGIC_VECTOR (31 downto 0);
           output : out  STD_LOGIC_VECTOR (31 downto 0);
           irwwrite : in  STD_LOGIC;
           clk : in  STD_LOGIC);
end Instruction_Memory;
architecture Behavioral of Instruction_Memory is

begin

			process(input, irwwrite, clk)

			begin
					if rising_edge(clk) and irwwrite = '1' then
						output <= input;
					end if;
			end process;



end Behavioral;

