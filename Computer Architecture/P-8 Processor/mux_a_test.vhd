--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:49:32 03/23/2015
-- Design Name:   
-- Module Name:   C:/UMa Informatica/2_Ano/AC/Projecto1/mux_a_test.vhd
-- Project Name:  Projecto1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MuxA
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
 
ENTITY mux_a_test IS
END mux_a_test;
 
ARCHITECTURE behavior OF mux_a_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MuxA
    PORT(
         Valor_B : IN  std_logic_vector(7 downto 0);
         Resultado : IN  std_logic_vector(7 downto 0);
         SEL_A : IN  std_logic;
         Valor_A : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Valor_B : std_logic_vector(7 downto 0) := (others => '0');
   signal Resultado : std_logic_vector(7 downto 0) := (others => '0');
   signal SEL_A : std_logic := '0';

 	--Outputs
   signal Valor_A : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MuxA PORT MAP (
          Valor_B => Valor_B,
          Resultado => Resultado,
          SEL_A => SEL_A,
          Valor_A => Valor_A
        );

   -- Clock process definitions
--   <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
   wait for 100 ns; -- devolve valor de Resultado
	SEL_A <= '1';
	Valor_B <= "00001111";
	Resultado <= "11110000";
	--end process;
	
	--stim_proc1: process
	--begin
	wait for 100 ns; -- devolve o valor de Valor_B
	SEL_A <= '0';
	Valor_B <= "00001111";
	Resultado <= "11110000";
	end process;

--    wait for <clock>_period*10;
--
--      -- insert stimulus here 
--
--      wait;
--   end process;

END;
