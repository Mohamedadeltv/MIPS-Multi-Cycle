----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:27:14 03/17/2021 
-- Design Name: 
-- Module Name:    THIRDSECTION - Behavioral 
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
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity THIRDSECTION is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           x : in  STD_LOGIC_VECTOR (3 downto 0);
           zero : out  STD_LOGIC;
           C : out  STD_LOGIC_VECTOR (31 downto 0));
end THIRDSECTION;

architecture Behavioral of THIRDSECTION is

begin

process(A,B,x)
begin if
(x="0000")
then C<= A AND B;
elsif(x="0001")
 then C<= A OR B;
elsif(x="0010")
  then C<= A+B;
elsif(x="0111")
  then if(A<B)
    then C<=x"00000001";
	 else 
	 C<=x"00000000";
	 end if;
elsif (x="1100")
	 then C<= A nor B; 
	 else 
	  C<=x"00000000";
end if;

if(A=B)
then zero<= '1';
else
zero<='0';
end if;
end process;


end Behavioral;

