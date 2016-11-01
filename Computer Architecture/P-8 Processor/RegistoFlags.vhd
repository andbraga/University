----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:01:34 03/20/2015 
-- Design Name: 
-- Module Name:    RegistoFlags - Behavioral 
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

entity RegistoFlags is
    Port ( E_Flag	: in  STD_LOGIC_VECTOR (4 downto 0);
           SEL_F 	: in  STD_LOGIC_VECTOR (2 downto 0);
           ESCR_F : in  STD_LOGIC;
           CLK 	: in  STD_LOGIC;
           S_FLG : out  STD_LOGIC);
end RegistoFlags;

architecture Behavioral of RegistoFlags is

begin

	process(E_Flag, SEL_F, ESCR_F, CLK)
	
	variable REG : STD_LOGIC_VECTOR (4 downto 0);
	
	begin
	
		if ESCR_F = '1' then
		
			if RISING_EDGE(CLK) then
			
				REG := E_Flag;
			
			end if;
			
		else
		
			case SEL_F is
				when "000" => S_FLG <= REG(0);
				when "001" => S_FLG <= REG(1); 
				when "010" => S_FLG <= REG(2);
				when "011" => S_FLG <= REG(3);
				when "100" => S_FLG <= REG(4);
				when others => S_FLG <= 'X';
			end case;
		
		end if;
	
	end process;

end Behavioral;

