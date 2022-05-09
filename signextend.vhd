----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:45:50 06/09/2021 
-- Design Name: 
-- Module Name:    signextend - Behavioral 
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


entity signextend is
    Port ( imm : in  STD_LOGIC_VECTOR (15 downto 0);
           SignExtend : out  STD_LOGIC_VECTOR (31 downto 0));
end signextend;

architecture Behavioral of signextend is

begin
SignExtend <= x"0000" & imm 	when imm(15) = '0' else
			 x"FFFF" & imm ;



end Behavioral;

