----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:54:23 03/19/2015 
-- Design Name: 
-- Module Name:    GestorPerifericos - Behavioral 
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

entity GestorPerifericos is
    Port ( EntradaP 	: in  STD_LOGIC_VECTOR (7 downto 0);
           EntradaA 	: in  STD_LOGIC_VECTOR (7 downto 0); --Operando1
           CLK 		: in  STD_LOGIC;
           ESCR_P 	: in  STD_LOGIC;
           SaidaP	 	: out  STD_LOGIC_VECTOR (7 downto 0);
           SaidaB 	: out  STD_LOGIC_VECTOR (7 downto 0) );
end GestorPerifericos;

architecture Behavioral of GestorPerifericos is

begin
	
	process(EntradaP, EntradaA, ESCR_P, CLK)
	
	begin
	
		if ESCR_P = '1' then
		
			SaidaB <= EntradaP;
				
		else
		
			if RISING_EDGE(CLK) then
			
				SaidaP <= EntradaA;
			
			end if;
			
		end if;
		
	end process;

end Behavioral;

