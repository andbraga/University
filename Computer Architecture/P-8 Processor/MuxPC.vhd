----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:43:10 03/13/2015 
-- Design Name: 
-- Module Name:    MuxPC - Behavioral 
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
use IEEE.STD_LOGIC_SIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MuxPC is
    Port ( Operando1 : in  STD_LOGIC_VECTOR (7 downto 0);
           SEL_PC 	: in  STD_LOGIC_VECTOR (2 downto 0);
           Nulo 		: in  STD_LOGIC;
           Positivo 	: in  STD_LOGIC;
           S_FLG 		: in  STD_LOGIC;
           ESCR_PC 	: out  STD_LOGIC );
end MuxPC;

architecture Behavioral of MuxPC is

begin

	process(Operando1, SEL_PC, Nulo, Positivo, S_FLG)
	
	variable ESCR_PC_Var : STD_LOGIC;
	
	begin

		case SEL_PC is
			when "000" => ESCR_PC_Var := S_FLG;
			when "001" => ESCR_PC_Var := Positivo;
			when "010" => ESCR_PC_Var := Nulo;
			when "011" =>
								if Operando1 = "00000000" then
									ESCR_PC_Var := '1';
								else
									ESCR_PC_Var := '0';
								end if;
								
			when "100" => 
								if Operando1 < "00000000" then
									ESCR_PC_Var := '1';
								else
									ESCR_PC_Var := '0';
								end if;
								
			when others => ESCR_PC_Var := 'X';
		end case;
		
		ESCR_PC <= ESCR_PC_Var;
		
	end process;
	
end Behavioral;

