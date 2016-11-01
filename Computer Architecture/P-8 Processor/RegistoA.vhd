----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:48:58 03/18/2015 
-- Design Name: 
-- Module Name:    RegistoA - Behavioral 
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

entity RegistoA is
    Port ( Valor_A	: in  STD_LOGIC_VECTOR (7 downto 0);
           ESCR_A		: in  STD_LOGIC;
           CLK			: in  STD_LOGIC;
           Operando1 : out  STD_LOGIC_VECTOR (7 downto 0) );
end RegistoA;

architecture Behavioral of RegistoA is

begin

	process(Valor_A, ESCR_A, CLK)
	
	variable REG : STD_LOGIC_VECTOR (7 downto 0);
	
	begin
	
		if ESCR_A = '1' then
		
			if RISING_EDGE(CLK) then
			
				REG := Valor_A;
			
			end if;
			
		end if;
			
		Operando1 <= REG;
								
	end process;

end Behavioral;

