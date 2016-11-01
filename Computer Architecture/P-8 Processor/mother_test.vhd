--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:59:59 03/27/2015
-- Design Name:   
-- Module Name:   C:/UMa Informatica/2_Ano/AC/projecto com fpga/Projecto1/mother_test.vhd
-- Project Name:  Projecto1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Motherboard
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
 
ENTITY mother_test IS
END mother_test;
 
ARCHITECTURE behavior OF mother_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Motherboard
    PORT(
         EntradaP : IN  std_logic_vector(7 downto 0);
         Reset : IN  std_logic;
         CLK : IN  std_logic;
         SaidaP : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal EntradaP : std_logic_vector(7 downto 0) := (others => '0');
   signal Reset : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal SaidaP : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Motherboard PORT MAP (
          EntradaP => EntradaP,
          Reset => Reset,
          CLK => CLK,
          SaidaP => SaidaP
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
      --Reset <= '1';
		
      wait for 50 ns;	
		Reset <= '1';
      EntradaP <= "10101010";
		
		wait for 10 ns;
		Reset <= '0';
		
		wait;
		
   end process;

END;
