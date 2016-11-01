----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:46:26 03/13/2015 
-- Design Name: 
-- Module Name:    MuxA - Behavioral 
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

entity MuxA is
    Port ( Valor_B 	: in  STD_LOGIC_VECTOR (7 downto 0);
           Resultado : in  STD_LOGIC_VECTOR (7 downto 0);
           SEL_A 		: in  STD_LOGIC;
           Valor_A 	: out STD_LOGIC_VECTOR (7 downto 0) );
end MuxA;

architecture Behavioral of MuxA is

begin
	
	process(Valor_B, Resultado, SEL_A)
	
	variable Valor_A_Var : STD_LOGIC_VECTOR (7 downto 0);
	
	begin
	
		case SEL_A is
			when '0' => Valor_A_Var := Valor_B;
			when '1' => Valor_A_Var := Resultado;
			when others => Valor_A_Var := "XXXXXXXX";
		end case;
		
		Valor_A <= Valor_A_Var;
		
	end process;

end Behavioral;

