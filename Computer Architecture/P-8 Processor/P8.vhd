----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:52:13 03/21/2015 
-- Design Name: 
-- Module Name:    P8 - Struct 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity P8 is
    Port ( Endereco 	: out  STD_LOGIC_VECTOR (7 downto 0);
			  Operando1 : out  STD_LOGIC_VECTOR (7 downto 0);
			  SaidaP 	: out  STD_LOGIC_VECTOR (7 downto 0);
			  WR 			: out  STD_LOGIC;           
           Constante : in  STD_LOGIC_VECTOR (7 downto 0);                    
           Dados_M 	: in  STD_LOGIC_VECTOR (7 downto 0);
           EntradaP 	: in  STD_LOGIC_VECTOR (7 downto 0);
			  Opcode 	: in  STD_LOGIC_VECTOR (4 downto 0);			  
           Positivo 	: in  STD_LOGIC;
           Nulo 		: in  STD_LOGIC;
           Reset 		: in  STD_LOGIC;
           CLK 		: in  STD_LOGIC );
end P8;

architecture Struct of P8 is

	Component ALU
	
		Port (	Operando1 : in  STD_LOGIC_VECTOR (7 downto 0);
					Operando2 : in  STD_LOGIC_VECTOR (7 downto 0); -- Valor_B output do MuxB;
					SEL_ALU	 : in  STD_LOGIC_VECTOR (2 downto 0);
					Resultado : out  STD_LOGIC_VECTOR (7 downto 0);
					E_Flag 	 : out  STD_LOGIC_VECTOR (4 downto 0) );
			  
	end Component;
	
	
	Component GestorPerifericos
	
		Port (	EntradaP : in  STD_LOGIC_VECTOR (7 downto 0);
					EntradaA : in  STD_LOGIC_VECTOR (7 downto 0);  -- Operando1
					CLK 		: in  STD_LOGIC;
					ESCR_P 	: in  STD_LOGIC;
					SaidaP	: out  STD_LOGIC_VECTOR (7 downto 0);
					SaidaB 	: out  STD_LOGIC_VECTOR (7 downto 0) );
			  
	end Component;
	
	
	Component MuxA
	
		Port (   Valor_B 	 : in  STD_LOGIC_VECTOR (7 downto 0);
					Resultado : in  STD_LOGIC_VECTOR (7 downto 0);
					SEL_A 	 : in  STD_LOGIC;
					Valor_A 	 : out STD_LOGIC_VECTOR (7 downto 0) );
			  
	end Component;
	
	
	Component MuxB
	
		Port ( 	Dados_P 	 : in  STD_LOGIC_VECTOR (7 downto 0); -- SaidaB , output do GESTOR DE PERIFERICOS;
					Dados_M   : in  STD_LOGIC_VECTOR (7 downto 0);
					Constante : in  STD_LOGIC_VECTOR (7 downto 0);
					SEL_B 	 : in  STD_LOGIC_VECTOR (1 downto 0);
					Valor_B 	 : out  STD_LOGIC_VECTOR (7 downto 0) );
					
	end Component;
	
	
	Component MuxPC
	
		Port (	Operando1 : in  STD_LOGIC_VECTOR (7 downto 0);
					SEL_PC 	 : in  STD_LOGIC_VECTOR (2 downto 0);
					Nulo 		 : in  STD_LOGIC;
					Positivo  : in  STD_LOGIC;
					S_FLG 	 : in  STD_LOGIC;
					ESCR_PC 	 : out  STD_LOGIC );
					
	end Component;
	
	
	Component PC
	
		Port (	Constante : in  STD_LOGIC_VECTOR (7 downto 0);
					ESCR_PC 	 : in  STD_LOGIC;
					CLK 		 : in  STD_LOGIC;
					Reset 	 : in  STD_LOGIC;
					Endereco  : out  STD_LOGIC_VECTOR (7 downto 0) );
			  
	end Component;
	
	
	Component ROM
	
		Port ( 	Opcode 	: in  STD_LOGIC_VECTOR (4 downto 0);
					SEL_ALU 	: out  STD_LOGIC_VECTOR (2 downto 0);
					ESCR_P	: out  STD_LOGIC;
					SEL_A 	: out  STD_LOGIC;
					SEL_B 	: out  STD_LOGIC_VECTOR (1 downto 0);
					WR 		: out  STD_LOGIC;
					SEL_PC 	: out  STD_LOGIC_VECTOR (2 downto 0);
					ESCR_A 	: out  STD_LOGIC;
					ESCR_F 	: out  STD_LOGIC;
					SEL_F 	: out  STD_LOGIC_VECTOR (2 downto 0) );
			  
	end Component;
	
	
	Component RegistoA
	
		Port ( 	Valor_A	 : in  STD_LOGIC_VECTOR (7 downto 0);
					ESCR_A	 : in  STD_LOGIC;
					CLK		 : in  STD_LOGIC;
					Operando1 : out  STD_LOGIC_VECTOR (7 downto 0) );
			  
	end Component;
	
	
	Component RegistoFlags
	
		Port (	E_Flag : in  STD_LOGIC_VECTOR (4 downto 0);
					SEL_F  : in  STD_LOGIC_VECTOR (2 downto 0);
					ESCR_F : in  STD_LOGIC;
					CLK 	 : in  STD_LOGIC;
					S_FLG  : out  STD_LOGIC );
			  
	end Component;

	-- Saidas da ROM
	signal sESCR_P: STD_lOGIC;
	signal sSEL_B: STD_lOGIC_VECTOR (1 downto 0);
	signal sSEL_A: STD_lOGIC;
	signal sSEL_ALU: STD_lOGIC_VECTOR (2 downto 0);
	signal sESCR_A: STD_lOGIC;
	signal sSEL_F: STD_lOGIC_VECTOR (2 downto 0);
	signal sESCR_F: STD_lOGIC;
	signal sSEL_PC: STD_lOGIC_VECTOR (2 downto 0);
	
	-- Outras Saidas
	signal sESCR_PC: STD_lOGIC;
	signal sS_FLG: STD_lOGIC;
	signal sOperando1: STD_lOGIC_VECTOR (7 downto 0);
	signal sE_Flag: STD_lOGIC_VECTOR (4 downto 0);
	signal sResultado: STD_lOGIC_VECTOR (7 downto 0);
	signal sValor_A: STD_lOGIC_VECTOR (7 downto 0);
	signal sValor_B: STD_lOGIC_VECTOR (7 downto 0);
	signal sSaidaB: STD_lOGIC_VECTOR (7 downto 0);


begin

	xROM: ROM PORT MAP(Opcode, sSEL_ALU, sESCR_P, sSEL_A, sSEL_B, WR, sSEL_PC, sESCR_A, sESCR_F, sSEL_F);
	
	xPC: PC PORT MAP(Constante, sESCR_PC, CLK, Reset, Endereco);
	
	xMuxPC: MuxPC PORT MAP(sOperando1, sSEL_PC, Nulo, Positivo, sS_FLG, sESCR_PC);
	
	xMuxA: MuxA PORT MAP(sValor_B, sResultado, sSEL_A, sValor_A);
	
	xMuxB: MuxB PORT MAP(sSaidaB, Dados_M, Constante, sSEL_B, sValor_B);
	
	xRegistoA: RegistoA PORT MAP(sValor_A, sESCR_A, CLK, sOperando1);
	
	xRegistoFlags: RegistoFlags PORT MAP(sE_Flag, sSEL_F, sESCR_F, CLK, sS_FLG);
	
	xGestorPerifericos: GestorPerifericos PORT MAP(EntradaP, sOperando1, CLK, sESCR_P, SaidaP, sSaidaB);
	
	xALU: ALU PORT MAP(sOperando1, sValor_B, sSEL_ALU, sResultado, sE_Flag);
	
	Operando1 <= sOperando1;
	
end Struct;

