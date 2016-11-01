--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:14:54 03/25/2015
-- Design Name:   
-- Module Name:   C:/UMa Informatica/2_Ano/AC/Projecto1/p8_test.vhd
-- Project Name:  Projecto1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: P8
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
 
ENTITY p8_test IS
END p8_test;
 
ARCHITECTURE behavior OF p8_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT P8
    PORT(
         Endereco : OUT  std_logic_vector(7 downto 0);
         Operando1 : OUT  std_logic_vector(7 downto 0);
         SaidaP : OUT  std_logic_vector(7 downto 0);
         WR : OUT  std_logic;
         Constante : IN  std_logic_vector(7 downto 0);
         Dados_M : IN  std_logic_vector(7 downto 0);
         EntradaP : IN  std_logic_vector(7 downto 0);
         Opcode : IN  std_logic_vector(4 downto 0);
         Positivo : IN  std_logic;
         Nulo : IN  std_logic;
         Reset : IN  std_logic;
         CLK : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Constante : std_logic_vector(7 downto 0) := (others => '0');
   signal Dados_M : std_logic_vector(7 downto 0) := (others => '0');
   signal EntradaP : std_logic_vector(7 downto 0) := (others => '0');
   signal Opcode : std_logic_vector(4 downto 0) := (others => '0');
   signal Positivo : std_logic := '0';
   signal Nulo : std_logic := '0';
   signal Reset : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal Endereco : std_logic_vector(7 downto 0);
   signal Operando1 : std_logic_vector(7 downto 0);
   signal SaidaP : std_logic_vector(7 downto 0);
   signal WR : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: P8 PORT MAP (
          Endereco => Endereco,
          Operando1 => Operando1,
          SaidaP => SaidaP,
          WR => WR,
          Constante => Constante,
          Dados_M => Dados_M,
          EntradaP => EntradaP,
          Opcode => Opcode,
          Positivo => Positivo,
          Nulo => Nulo,
          Reset => Reset,
          CLK => CLK
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
		Constante <= "00000111"; --guarda no reg_A o valor de Dados_M
		Dados_M <= "00000001";
		EntradaP <= "00000010";
		Opcode <= "00001";
		Positivo <= '1';
		Nulo <= '0';
		Reset <= '0';
		
		wait for 100 ns;	
		Constante <= "00000111"; -- soma reg A com a Constante
		Dados_M <= "00000001";
		EntradaP <= "00000010";
		Opcode <= "00011";
		Positivo <= '1';
		Nulo <= '0';
		Reset <= '0';
		
		wait for 100 ns;	
		Constante <= "00000111"; -- guarda no reg_a o valor de constante
		Dados_M <= "00000001";
		EntradaP <= "00000010";
		Opcode <= "00000";
		Positivo <= '1';
		Nulo <= '0';
		Reset <= '0';
		
		wait for 100 ns;	
		Constante <= "00000111"; --guarda no reg_A o valor de EntradaP
		Dados_M <= "00000001";
		EntradaP <= "00000010";
		Opcode <= "10101";
		Positivo <= '1';
		Nulo <= '0';
		Reset <= '0';
		
		wait for 100 ns;	
		Constante <= "00000111"; -- pasa para SaidaP o valor de RegA
		Dados_M <= "00000001";
		EntradaP <= "00000010";
		Opcode <= "10110";
		Positivo <= '1';
		Nulo <= '0';
		Reset <= '0';
		
		wait for 100 ns;	
		Constante <= "00000111"; -- soma reg A com a Constante
		Dados_M <= "00000001";
		EntradaP <= "00000010";
		Opcode <= "00011";
		Positivo <= '1';
		Nulo <= '0';
		Reset <= '0';
		
		wait for 100 ns;	
		Constante <= "00000111"; -- soma reg A com a Constante
		Dados_M <= "00000001";
		EntradaP <= "00000010";
		Opcode <= "01101";
		Positivo <= '1';
		Nulo <= '0';
		Reset <= '0';
		
      
   end process;

END;
