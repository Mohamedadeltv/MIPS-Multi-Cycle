----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    04:01:52 06/18/2021 
-- Design Name: 
-- Module Name:    instructionbuffer - Behavioral 
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


entity instructionbuffer is
    Port ( input : in  STD_LOGIC_VECTOR (31 downto 0);
           output : out  STD_LOGIC_VECTOR (31 downto 0);
           IRWrite : in  STD_LOGIC;
           clk : in  STD_LOGIC);
end instructionbuffer;

architecture Behavioral of InstructionMemory is

begin

			process(input, IRWrite, clk)

			begin
					if rising_edge(clk) and IRWrite = '1' then
						output <= input;
					end if;
			end process;


end Behavioral;
