--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:38:04 03/25/2015
-- Design Name:   
-- Module Name:   C:/UMa Informatica/2_Ano/AC/Projecto1/mux_b_test.vhd
-- Project Name:  Projecto1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MuxB
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
 
ENTITY mux_b_test IS
END mux_b_test;
 
ARCHITECTURE behavior OF mux_b_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MuxB
    PORT(
         Dados_P : IN  std_logic_vector(7 downto 0);
         Dados_M : IN  std_logic_vector(7 downto 0);
         Constante : IN  std_logic_vector(7 downto 0);
         SEL_B : IN  std_logic_vector(1 downto 0);
         Valor_B : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Dados_P : std_logic_vector(7 downto 0) := (others => '0');
   signal Dados_M : std_logic_vector(7 downto 0) := (others => '0');
   signal Constante : std_logic_vector(7 downto 0) := (others => '0');
   signal SEL_B : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal Valor_B : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MuxB PORT MAP (
          Dados_P => Dados_P,
          Dados_M => Dados_M,
          Constante => Constante,
          SEL_B => SEL_B,
          Valor_B => Valor_B
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
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		SEL_B <= "00"; -- devolve o valor de constante
		Dados_P <= "00000000";
		Dados_M <= "00000011";
		Constante <= "00001100";
		
		wait for 100 ns;	
		SEL_B <= "01"; -- devolve o valor Dados_M
		Dados_P <= "00000000";
		Dados_M <= "00000011";
		Constante <= "00001100";
		
		wait for 100 ns;	
		SEL_B <= "10"; -- devolve o valor de Dados_P
		Dados_P <= "00000000";
		Dados_M <= "00000011";
		Constante <= "00001100";
		
		wait for 100 ns;	
		SEL_B <= "11"; -- devolve XXXXXXX
		Dados_P <= "00000000";
		Dados_M <= "00000011";
		Constante <= "00001100";
		
   end process;

END;
