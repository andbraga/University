--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:15:33 03/25/2015
-- Design Name:   
-- Module Name:   C:/UMa Informatica/2_Ano/AC/Projecto1/rom_test.vhd
-- Project Name:  Projecto1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ROM
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
 
ENTITY rom_test IS
END rom_test;
 
ARCHITECTURE behavior OF rom_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ROM
    PORT(
         Opcode : IN  std_logic_vector(4 downto 0);
         SEL_ALU : OUT  std_logic_vector(2 downto 0);
         ESCR_P : OUT  std_logic;
         SEL_A : OUT  std_logic;
         SEL_B : OUT  std_logic_vector(1 downto 0);
         WR : OUT  std_logic;
         SEL_PC : OUT  std_logic_vector(2 downto 0);
         ESCR_A : OUT  std_logic;
         ESCR_F : OUT  std_logic;
         SEL_F : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Opcode : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal SEL_ALU : std_logic_vector(2 downto 0);
   signal ESCR_P : std_logic;
   signal SEL_A : std_logic;
   signal SEL_B : std_logic_vector(1 downto 0);
   signal WR : std_logic;
   signal SEL_PC : std_logic_vector(2 downto 0);
   signal ESCR_A : std_logic;
   signal ESCR_F : std_logic;
   signal SEL_F : std_logic_vector(2 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ROM PORT MAP (
          Opcode => Opcode,
          SEL_ALU => SEL_ALU,
          ESCR_P => ESCR_P,
          SEL_A => SEL_A,
          SEL_B => SEL_B,
          WR => WR,
          SEL_PC => SEL_PC,
          ESCR_A => ESCR_A,
          ESCR_F => ESCR_F,
          SEL_F => SEL_F
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
		Opcode <= "00000";
		
		wait for 100 ns;
		Opcode <= "00010";
		
		wait for 100 ns;
		Opcode <= "00011";
		
     
    
   end process;

END;
