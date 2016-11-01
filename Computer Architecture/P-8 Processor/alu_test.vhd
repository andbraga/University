--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:02:31 03/25/2015
-- Design Name:   
-- Module Name:   C:/UMa Informatica/2_Ano/AC/Projecto1/alu_test.vhd
-- Project Name:  Projecto1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
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
 
ENTITY alu_test IS
END alu_test;
 
ARCHITECTURE behavior OF alu_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         Operando1 : IN  std_logic_vector(7 downto 0);
         Operando2 : IN  std_logic_vector(7 downto 0);
         SEL_ALU : IN  std_logic_vector(2 downto 0);
         Resultado : OUT  std_logic_vector(7 downto 0);
         E_Flag : OUT  std_logic_vector(4 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Operando1 : std_logic_vector(7 downto 0) := (others => '0');
   signal Operando2 : std_logic_vector(7 downto 0) := (others => '0');
   signal SEL_ALU : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal Resultado : std_logic_vector(7 downto 0);
   signal E_Flag : std_logic_vector(4 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          Operando1 => Operando1,
          Operando2 => Operando2,
          SEL_ALU => SEL_ALU,
          Resultado => Resultado,
          E_Flag => E_Flag
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
      
      wait for 100 ns;	
		SEL_ALU <= "000";
		Operando1 <= "00000001";
		Operando2 <= "00000010";
		
		wait for 100 ns;	
		SEL_ALU <= "001";
		Operando1 <= "00000001";
		Operando2 <= "00000010";
      
		wait for 100 ns;	
		SEL_ALU <= "010";
		Operando1 <= "00000001";
		Operando2 <= "00000010";
		
		wait for 100 ns;	
		SEL_ALU <= "011";
		Operando1 <= "00000001";
		Operando2 <= "00000010";
		
		wait for 100 ns;	
		SEL_ALU <= "100";
		Operando1 <= "00000001";
		Operando2 <= "00000010";
   end process;

END;
