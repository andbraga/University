----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:34:44 03/21/2015 
-- Design Name: 
-- Module Name:    Motherboard - Struct
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

entity Motherboard is
    Port ( EntradaP	: in  STD_LOGIC_VECTOR (7 downto 0);
           Reset 	 	: in  STD_LOGIC;
           CLK 		: in  STD_LOGIC;
           SaidaP 	: out  STD_LOGIC_VECTOR (7 downto 0) );
end Motherboard;

architecture Struct of Motherboard is

	Component P8

		Port ( 	Endereco  : out  STD_LOGIC_VECTOR (7 downto 0);
					Operando1 : out  STD_LOGIC_VECTOR (7 downto 0);
					SaidaP 	 : out  STD_LOGIC_VECTOR (7 downto 0);
					WR 		 : out  STD_LOGIC;           
					Constante : in  STD_LOGIC_VECTOR (7 downto 0);                    
					Dados_M 	 : in  STD_LOGIC_VECTOR (7 downto 0);
					EntradaP  : in  STD_LOGIC_VECTOR (7 downto 0);
					Opcode 	 : in  STD_LOGIC_VECTOR (4 downto 0);			  
					Positivo  : in  STD_LOGIC;
					Nulo 		 : in  STD_LOGIC;
					Reset 	 : in  STD_LOGIC;
					CLK 		 : in  STD_LOGIC );
			  
	end Component;


	Component MemoriaInstrucoes

		Port (	Endereco	 : in  STD_LOGIC_VECTOR (7 downto 0);
					Opcode 	 : out  STD_LOGIC_VECTOR (4 downto 0);
					Constante : out  STD_LOGIC_VECTOR (7 downto 0) );
			  
	end Component;


	Component RAM

		Port (	Entrada 	 : in  STD_LOGIC_VECTOR (7 downto 0); -- Operando1 output do RegistoA;
					Constante : in  STD_LOGIC_VECTOR (7 downto 0); -- funciona como um endereço
					WR 		 : in  STD_LOGIC;
					CLK		 : in 	STD_LOGIC;
					Dados_M 	 : out  STD_LOGIC_VECTOR (7 downto 0) );
			  
	end Component;	

	signal sEndereco: STD_lOGIC_VECTOR (7 downto 0);
	signal sOperando1: STD_lOGIC_VECTOR (7 downto 0);
	signal sWR: STD_lOGIC;
	signal sConstante: STD_lOGIC_VECTOR (7 downto 0);
	signal sDados_M: STD_lOGIC_VECTOR (7 downto 0);
	signal sOpcode: STD_lOGIC_VECTOR (4 downto 0);
	
	signal sPositivo: STD_lOGIC := '1';
	signal sNulo: STD_lOGIC := '0';
	
begin

	xP8: P8 PORT MAP(sEndereco, sOperando1, SaidaP, sWR, sConstante, sDados_M, EntradaP, sOpcode, sPositivo, sNulo, Reset, CLK);
	
	xRAM: RAM PORT MAP(sOperando1, sConstante, sWR, CLK, sDados_M);
	
	xMemoriaInstrucoes: MemoriaInstrucoes PORT MAP(sEndereco, sOpcode, sConstante);

end Struct;

