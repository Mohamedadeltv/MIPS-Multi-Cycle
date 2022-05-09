----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    04:57:26 06/18/2021 
-- Design Name: 
-- Module Name:    mux2to11 - Behavioral 
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


entity mux2to11 is
	 Generic (
	 N : integer := 32
	 );
    Port ( a : in  STD_LOGIC_Vector(N-1 downto 0);
           b : in  STD_LOGIC_VECTOR(N-1 downto 0);
           sel : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR(N-1 downto 0)
			  );
end mux2to11;

architecture Behavioral of mux2to11 is

begin

output <= a when sel = '0' else
     b;

end Behavioral;
