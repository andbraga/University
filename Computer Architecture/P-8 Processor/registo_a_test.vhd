--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:45:57 03/25/2015
-- Design Name:   
-- Module Name:   C:/UMa Informatica/2_Ano/AC/Projecto1/registo_a_test.vhd
-- Project Name:  Projecto1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RegistoA
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
 
ENTITY registo_a_test IS
END registo_a_test;
 
ARCHITECTURE behavior OF registo_a_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RegistoA
    PORT(
         Valor_A : IN  std_logic_vector(7 downto 0);
         ESCR_A : IN  std_logic;
         CLK : IN  std_logic;
         Operando1 : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Valor_A : std_logic_vector(7 downto 0) := (others => '0');
   signal ESCR_A : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal Operando1 : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RegistoA PORT MAP (
          Valor_A => Valor_A,
          ESCR_A => ESCR_A,
          CLK => CLK,
          Operando1 => Operando1
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      --wait for 100 ns;	

      wait for 100 ns;
		
      ESCR_A <= '0';  -- valores esperados mas o update so acontece na mudança do ESCR_A
		Valor_A <= "00001100";
		
		wait for 100 ns;
		
      ESCR_A <= '1';
		Valor_A <= "00001100";
		
		wait for 100 ns;
		
      ESCR_A <= '0';
		Valor_A <= "11000000";
		
		wait for 100 ns;
		
      ESCR_A <= '1';
		Valor_A <= "11000000";----

      
   end process;

END;
