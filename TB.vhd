--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   06:35:32 06/18/2021
-- Design Name:   
-- Module Name:   C:/Users/ybarr/OneDrive/Desktop/muxmohamedadel/TB.vhd
-- Project Name:  muxmohamedadel
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MIPS
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB IS
END TB;
 
ARCHITECTURE behavior OF TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MIPS
    PORT(
         CLKmain : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLKmain : std_logic := '0';

   -- Clock period definitions
   constant CLKmain_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MIPS PORT MAP (
          CLKmain => CLKmain
        );

   -- Clock process definitions
   CLKmain_process :process
   begin
		CLKmain <= '0';
		wait for CLKmain_period/2;
		CLKmain <= '1';
		wait for CLKmain_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLKmain_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
