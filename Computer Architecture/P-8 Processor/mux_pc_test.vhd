--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:16:15 03/25/2015
-- Design Name:   
-- Module Name:   C:/UMa Informatica/2_Ano/AC/Projecto1/mux_pc_test.vhd
-- Project Name:  Projecto1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MuxPC
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
 
ENTITY mux_pc_test IS
END mux_pc_test;
 
ARCHITECTURE behavior OF mux_pc_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MuxPC
    PORT(
         Operando1 : IN  std_logic_vector(7 downto 0);
         SEL_PC : IN  std_logic_vector(2 downto 0);
         Nulo : IN  std_logic;
         Positivo : IN  std_logic;
         S_FLG : IN  std_logic;
         ESCR_PC : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Operando1 : std_logic_vector(7 downto 0) := (others => '0');
   signal SEL_PC : std_logic_vector(2 downto 0) := (others => '0');
   signal Nulo : std_logic := '0';
   signal Positivo : std_logic := '0';
   signal S_FLG : std_logic := '0';

 	--Outputs
   signal ESCR_PC : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  -- constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MuxPC PORT MAP (
          Operando1 => Operando1,
          SEL_PC => SEL_PC,
          Nulo => Nulo,
          Positivo => Positivo,
          S_FLG => S_FLG,
          ESCR_PC => ESCR_PC
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
		SEL_PC <= "000"; --devolve o valor de S_flag = 0
		S_FLG <= '0';
		Operando1 <= "00001111";
		Positivo <= '1';
		Nulo <= '0';
		
		wait for 100 ns;	
		SEL_PC <= "000"; -- devolve o valor de S_flag = 1
		S_FLG <= '1';
		Operando1 <= "00001111";
		Positivo <= '1';
		Nulo <= '0';
		
		wait for 100 ns;	
		SEL_PC <= "001"; -- devolve o valor de positivo = 1
		S_FLG <= '0';
		Operando1 <= "00001111";
		Positivo <= '1';
		Nulo <= '0';
		
		wait for 100 ns;	
		SEL_PC <= "010"; -- devolve o valor de nulo = 0
		S_FLG <= '0';
		Operando1 <= "00001111";
		Positivo <= '1';
		Nulo <= '0';
		
		wait for 100 ns;	
		SEL_PC <= "011"; -- devolve 1 se o valor de operando é 00000000
		S_FLG <= '0';
		Operando1 <= "00000000";
		Positivo <= '1';
		Nulo <= '0';
		
		wait for 100 ns;	
		SEL_PC <= "011"; -- devolve 0 pk o valor de operando não é 00000000
		S_FLG <= '0';
		Operando1 <= "00001111";
		Positivo <= '1';
		Nulo <= '0';
		
		wait for 100 ns;	
		SEL_PC <= "100"; --devolve 0 pk o valo não é negativo
		S_FLG <= '0';
		Operando1 <= "00001111";
		Positivo <= '1';
		Nulo <= '0';
		
		wait for 100 ns;	
		SEL_PC <= "100"; -- devolve 1 pk o valor é negtivo 
		S_FLG <= '0';
		Operando1 <= "10001111";
		Positivo <= '1';
		Nulo <= '0';

		end process;

      -- insert stimulus here 

--      wait;
--   end process;

END;
