----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:59:27 03/12/2015 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_SIGNED.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( Operando1 : in  STD_LOGIC_VECTOR (7 downto 0);
           Operando2 : in  STD_LOGIC_VECTOR (7 downto 0); -- Valor_B output do MuxB;
           SEL_ALU	: in  STD_LOGIC_VECTOR (2 downto 0);
           Resultado : out  STD_LOGIC_VECTOR (7 downto 0);
           E_Flag 	: out  STD_LOGIC_VECTOR (4 downto 0));
end ALU;

architecture Behavioral of ALU is

begin

	process(Operando1, Operando2, SEL_ALU)

	variable ResultadoVar : STD_LOGIC_VECTOR (7 downto 0);
	variable E_FlagVar : STD_LOGIC_VECTOR (4 downto 0);
	
	begin
	
		case SEL_ALU is
			when "000" => ResultadoVar := Operando1 + Operando2;
			when "001" => ResultadoVar := Operando1 - Operando2;
			when "010" => ResultadoVar := Operando1 AND Operando2;
			when "011" => ResultadoVar := Operando1 OR Operando2;
			when "100" =>
								if Operando1 < Operando2 then								
									E_FlagVar(0) := '1';								
								else									
									E_FlagVar(0) := '0';									
								end if;
								
								if Operando1 <= Operando2 then								
									E_FlagVar(1) := '1';								
								else								
									E_FlagVar(1) := '0';									
								end if;
								
								if Operando1 = Operando2 then							
									E_FlagVar(2) := '1';								
								else									
									E_FlagVar(2) := '0';									
								end if;
								
								if Operando1 >= Operando2 then								
									E_FlagVar(3) := '1';								
								else									
									E_FlagVar(3) := '0';									
								end if;
								
								if Operando1 > Operando2 then								
									E_FlagVar(4) := '1';							
								else									
									E_FlagVar(4) := '0';								
								end if;

			when others => ResultadoVar := "XXXXXXXX";
		end case;	
		
		Resultado <= ResultadoVar;
		E_Flag <= E_FlagVar;
		
	end process;

end Behavioral;

