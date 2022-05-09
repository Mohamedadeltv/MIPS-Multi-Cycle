----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:14:10 06/09/2021 
-- Design Name: 
-- Module Name:    pcadder - Behavioral 
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

entity pcadder is
    Port ( pcold : in  STD_LOGIC_VECTOR (31 downto 0);
           update : in  STD_LOGIC_VECTOR (31 downto 0);
           pcplusfour : out  STD_LOGIC_VECTOR (31 downto 0));
end pcadder;

architecture Behavioral of pcadder is

begin
pcplusfour <=STD_LOGIC_VECTOR(Unsigned(pcold) + x"00000004");

end Behavioral;

