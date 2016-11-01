----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:48:52 03/14/2015 
-- Design Name: 
-- Module Name:    RAM - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_TEXTIO.ALL;
use STD.textio.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RAM is
    Port ( Entrada 	: in  STD_LOGIC_VECTOR (7 downto 0); -- Operando1 output do RegistoA;
           Constante : in  STD_LOGIC_VECTOR (7 downto 0); -- funciona como um endereço
           WR 			: in  STD_LOGIC;
			  CLK			: in 	STD_LOGIC;
           Dados_M 	: out  STD_LOGIC_VECTOR (7 downto 0) );
end RAM;

architecture Behavioral of RAM is

begin
	
	process(Entrada, Constante, WR, CLK)

	-- RAM de 8 bits tem 2^8 endereços. 2^8 = 256;
	
	type reg is array (0 to 255) of STD_LOGIC_VECTOR (7 downto 0);
	
	variable F: reg;
	
	begin
	
		if WR = '1' then
			
			if RISING_EDGE(CLK) then
		
				F(CONV_INTEGER(Constante)) := Entrada;
			
			end if;
			
		else
				
			Dados_M <= F(CONV_INTEGER(Constante));
			
		end if;
		
	end process;
	
end Behavioral;

