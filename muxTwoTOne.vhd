----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:57:43 03/10/2021 
-- Design Name: 
-- Module Name:    muxTwoTOne - Behavioral 
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

entity muxTwoTOne is
    Port ( A : in  STD_LOGIC_VECTOR (1 downto 0);
           S : in  STD_LOGIC;
           c : out  STD_LOGIC);
end muxTwoTOne;

architecture Behavioral of muxTwoTOne is

begin
process (A,S)
begin 
if S='0' then
c <=A(0);
else
c <=A(1);
end if;
end process;


end Behavioral;

