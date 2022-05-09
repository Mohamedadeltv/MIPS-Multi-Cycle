----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:08:14 03/24/2021 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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

entity ALU is
    Port ( func : in  STD_LOGIC_VECTOR (5 downto 0);
           ALUOP : in  STD_LOGIC_VECTOR (1 downto 0);
           Operation : out  STD_LOGIC_VECTOR (3 downto 0));
end ALU;

architecture Behavioral of ALU is

begin


Operation(3) <= '0';
Operation(2) <= ALUOP(0) or (ALUOP(1) and func(1));
Operation(1) <= not ALUOP(1) or not func(2);
Operation(0) <= (func(3) or func(0)) and ALUOP(1);



end Behavioral;

