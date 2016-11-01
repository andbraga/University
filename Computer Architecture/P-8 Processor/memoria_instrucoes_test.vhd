--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:09:47 03/25/2015
-- Design Name:   
-- Module Name:   C:/UMa Informatica/2_Ano/AC/Projecto1/memoria_instrucoes_test.vhd
-- Project Name:  Projecto1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MemoriaInstrucoes
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
 
ENTITY memoria_instrucoes_test IS
END memoria_instrucoes_test;
 
ARCHITECTURE behavior OF memoria_instrucoes_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MemoriaInstrucoes
    PORT(
         Endereco : IN  std_logic_vector(7 downto 0);
         Opcode : OUT  std_logic_vector(4 downto 0);
         Constante : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Endereco : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal Opcode : std_logic_vector(4 downto 0);
   signal Constante : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MemoriaInstrucoes PORT MAP (
          Endereco => Endereco,
          Opcode => Opcode,
          Constante => Constante
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
		Endereco <= "00000000";
		
		wait for 100 ns;
		
		Endereco <= "00000011";
   end process;

END;
