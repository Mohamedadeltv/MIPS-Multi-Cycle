----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:59:12 06/09/2021 
-- Design Name: 
-- Module Name:    shiftleft - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity shiftleft is
 Generic (
	 N : integer := 32
	 ); 
    Port ( shiftin : in  STD_LOGIC_VECTOR (N-1 downto 0);
           shiftout : out  STD_LOGIC_VECTOR (N-1 downto 0));
end shiftleft;


architecture Behavioral of shiftleft is

begin
process (shiftin)
begin
shiftout<= STD_LOGIC_VECTOR(shift_left(unsigned(shiftin),2));
end process;

end Behavioral;


