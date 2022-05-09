----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:19:30 03/10/2021 
-- Design Name: 
-- Module Name:    mux4to1 - Behavioral 
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

entity mux4to1 is
    Port ( X : in  STD_LOGIC_VECTOR (3 downto 0);
           Y : in  STD_LOGIC_VECTOR (1 downto 0);
           Z : out  STD_LOGIC);
end mux4to1;

architecture Behavioral of mux4to1 is
component muxTwoTOne is
    Port ( A : in  STD_LOGIC_VECTOR (1 downto 0);
           S :in  STD_LOGIC;
           c : out  STD_LOGIC);
end component;
Signal w1,w2:STD_LOGIC;

begin

m1:muxTwoTOne port map(
A=> X(1 downto 0),
S=> Y(0),
c=> w1
);
m2:muxTwoTOne port map(
A=> X(3 downto 2),
S=>Y(0),
c=>w2
);
m3:muxTwoTOne port map(
A(0)=>w1,
A(1)=> w2,
S=>Y(1),
c=>Z
);

end Behavioral;

