----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:18:43 06/09/2021 
-- Design Name: 
-- Module Name:    ALU2 - Behavioral 
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

entity ALU2 is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           S : in  STD_LOGIC_VECTOR (3 downto 0);
           RESULT : out  STD_LOGIC_VECTOR (31 downto 0);
           FLAG : out  STD_LOGIC);
end ALU2;
architecture Behavioral of ALU2 is


signal resultTemp : std_logic_vector(31 downto 0);

begin

process(A,B,S)
  
 begin
  case(S) is
		  when "1100" => -- NOR
			resultTemp <=  A nor B;   
		  when "0000" => -- AND
			resultTemp <= A and B ;
		  when "0001" => -- OR
			resultTemp <= A or B;
		  when "0111" => -- Less Than or Not
				if(signed(A) < signed(B)) then
			 resultTemp <= x"00000001"  ;
				else
			 resultTemp <= x"00000000" ;
				end if; 
		  when "0010" => -- ADD
			 resultTemp <= std_logic_vector(unsigned(A) + unsigned(B)) ; 
		  when "0110" => -- Subtract
		    resultTemp <= std_logic_vector(unsigned(A) - unsigned(B)) ; 
		  when others => null;
		    resultTemp <= x"00000000"; 
	end case; end process;
  
 RESULT<= resultTemp;
 FLAG <= '1' when resultTemp = x"00000000" else
				 '0';

end Behavioral;

