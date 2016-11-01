--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:21:50 03/25/2015
-- Design Name:   
-- Module Name:   C:/UMa Informatica/2_Ano/AC/Projecto1/registo_flags_test.vhd
-- Project Name:  Projecto1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RegistoFlags
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
 
ENTITY registo_flags_test IS
END registo_flags_test;
 
ARCHITECTURE behavior OF registo_flags_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RegistoFlags
    PORT(
         E_Flag : IN  std_logic_vector(4 downto 0);
         SEL_F : IN  std_logic_vector(2 downto 0);
         ESCR_F : IN  std_logic;
         CLK : IN  std_logic;
         S_FLG : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal E_Flag : std_logic_vector(4 downto 0) := (others => '0');
   signal SEL_F : std_logic_vector(2 downto 0) := (others => '0');
   signal ESCR_F : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal S_FLG : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RegistoFlags PORT MAP (
          E_Flag => E_Flag,
          SEL_F => SEL_F,
          ESCR_F => ESCR_F,
          CLK => CLK,
          S_FLG => S_FLG
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
      
      wait for 100 ns;	---nao esta a fazer nda.....
		ESCR_F <= '1';
		E_Flag <= "10101";
		
		wait for 100 ns;	
		ESCR_F <= '0';
		SEL_F <= "000";
	
      wait for 100 ns;	
		ESCR_F <= '0';
		SEL_F <= "001";
		
		wait for 100 ns;	
		ESCR_F <= '0';
		SEL_F <= "010";
		
		wait for 100 ns;	
		ESCR_F <= '0';
		SEL_F <= "011";
		
		wait for 100 ns;	
		ESCR_F <= '0';
		SEL_F <= "100";
	
		wait for 100 ns;	
		ESCR_F <= '0';
		SEL_F <= "111";

		

      
   end process;

END;
