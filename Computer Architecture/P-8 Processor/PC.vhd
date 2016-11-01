----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:30:17 03/13/2015 
-- Design Name: 
-- Module Name:    PC - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PC is
    Port ( Constante : in  STD_LOGIC_VECTOR (7 downto 0);
           ESCR_PC 	: in  STD_LOGIC;
           CLK 		: in  STD_LOGIC;
           Reset 		: in  STD_LOGIC;
           Endereco : out  STD_LOGIC_VECTOR (7 downto 0) );
end PC;

architecture Behavioral of PC is

begin
	
	process(Constante, ESCR_PC, CLK, Reset)
	
	variable CONTA: STD_LOGIC_VECTOR (7 downto 0);
	
	begin
	
		if rising_edge(CLK) then
			if Reset = '0' then		
				if ESCR_PC = '1' then
					CONTA := Constante;	
				else
					CONTA := CONTA + 1;
				end if;
			else
				CONTA := "00000000";
			end if;
		end if;
		Endereco <= CONTA;	
	end process;
end Behavioral;

