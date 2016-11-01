----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:45:06 03/13/2015 
-- Design Name: 
-- Module Name:    MuxB - Behavioral 
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

entity MuxB is
    Port ( Dados_P 	: in  STD_LOGIC_VECTOR (7 downto 0); -- SaidaB , output do GESTOR DE PERIFERICOS;
           Dados_M 	: in  STD_LOGIC_VECTOR (7 downto 0);
           Constante : in  STD_LOGIC_VECTOR (7 downto 0);
           SEL_B 		: in  STD_LOGIC_VECTOR (1 downto 0);
           Valor_B 	: out  STD_LOGIC_VECTOR (7 downto 0) );
end MuxB;

architecture Behavioral of MuxB is

begin

	process(Dados_P, Dados_M, Constante, SEL_B)
	
	variable Valor_B_Var : STD_LOGIC_VECTOR (7 downto 0);
	
	begin
	
		case SEL_B is
			when "00" => Valor_B_Var := Constante;
			when "01" => Valor_B_Var := Dados_M;
			when "10" => Valor_B_Var := Dados_P;
			when others => Valor_B_Var := "XXXXXXXX";
		end case;
		
		Valor_B <= Valor_B_Var;
		
	end process;
		
end Behavioral;

