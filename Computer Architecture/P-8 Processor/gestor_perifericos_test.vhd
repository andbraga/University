--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:44:13 03/25/2015
-- Design Name:   
-- Module Name:   C:/UMa Informatica/2_Ano/AC/Projecto1/gestor_perifericos_test.vhd
-- Project Name:  Projecto1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: GestorPerifericos
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
 
ENTITY gestor_perifericos_test IS
END gestor_perifericos_test;
 
ARCHITECTURE behavior OF gestor_perifericos_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT GestorPerifericos
    PORT(
         EntradaP : IN  std_logic_vector(7 downto 0);
         EntradaA : IN  std_logic_vector(7 downto 0);
         CLK : IN  std_logic;
         ESCR_P : IN  std_logic;
         SaidaP : OUT  std_logic_vector(7 downto 0);
         SaidaB : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal EntradaP : std_logic_vector(7 downto 0) := (others => '0');
   signal EntradaA : std_logic_vector(7 downto 0) := (others => '0');
   signal CLK : std_logic := '0';
   signal ESCR_P : std_logic := '0';

 	--Outputs
   signal SaidaP : std_logic_vector(7 downto 0);
   signal SaidaB : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: GestorPerifericos PORT MAP (
          EntradaP => EntradaP,
          EntradaA => EntradaA,
          CLK => CLK,
          ESCR_P => ESCR_P,
          SaidaP => SaidaP,
          SaidaB => SaidaB
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
      wait for 100 ns;	
		ESCR_P <= '1';
		EntradaP <= "00001111";
		EntradaA <= "11000011";
		
		wait for 100 ns;	
		ESCR_P <= '0';
		EntradaP <= "00000000";
		EntradaA <= "11110000";
		
		wait for 100 ns;	
		ESCR_P <= '1';
		EntradaP <= "10101010";
		EntradaA <= "00110011";
		
		wait for 100 ns;	
		ESCR_P <= '0';
		EntradaP <= "00001111";
		EntradaA <= "10111000";
      
   end process;

END;
