----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:07:02 03/20/2015 
-- Design Name: 
-- Module Name:    ROM - Behavioral 
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

entity ROM is
    Port ( Opcode 	: in  STD_LOGIC_VECTOR (4 downto 0);
           SEL_ALU 	: out  STD_LOGIC_VECTOR (2 downto 0);
           ESCR_P		: out  STD_LOGIC;
           SEL_A 		: out  STD_LOGIC;
           SEL_B 		: out  STD_LOGIC_VECTOR (1 downto 0);
           WR 			: out  STD_LOGIC;
           SEL_PC 	: out  STD_LOGIC_VECTOR (2 downto 0);
           ESCR_A 	: out  STD_LOGIC;
           ESCR_F 	: out  STD_LOGIC;
           SEL_F 		: out  STD_LOGIC_VECTOR (2 downto 0) );
end ROM;

architecture Behavioral of ROM is

begin

	process(Opcode)
	
	begin
	
		case Opcode is
			
			--Leitura e Escrita
			
			when "00000" => SEL_ALU <= "XXX"; ESCR_P <= '1'; SEL_A <= '0'; SEL_B <= "00"; WR <= '0'; SEL_PC <= "010"; ESCR_A <= '1'; ESCR_F <= '0'; SEL_F <= "XXX";
			when "00001" => SEL_ALU <= "XXX"; ESCR_P <= '1'; SEL_A <= '0'; SEL_B <= "01"; WR <= '0'; SEL_PC <= "010"; ESCR_A <= '1'; ESCR_F <= '0'; SEL_F <= "XXX";
			when "00010" => SEL_ALU <= "XXX"; ESCR_P <= '1'; SEL_A <= 'X'; SEL_B <= "XX"; WR <= '1'; SEL_PC <= "010"; ESCR_A <= '0'; ESCR_F <= '0'; SEL_F <= "XXX";
	
			--Lógica e Aritmética
			
			when "00011" => SEL_ALU <= "000"; ESCR_P <= '1'; SEL_A <= '1'; SEL_B <= "00"; WR <= '0'; SEL_PC <= "010"; ESCR_A <= '1'; ESCR_F <= '0'; SEL_F <= "XXX";
			when "00100" => SEL_ALU <= "000"; ESCR_P <= '1'; SEL_A <= '1'; SEL_B <= "01"; WR <= '0'; SEL_PC <= "010"; ESCR_A <= '1'; ESCR_F <= '0'; SEL_F <= "XXX";
			when "00101" => SEL_ALU <= "001"; ESCR_P <= '1'; SEL_A <= '1'; SEL_B <= "00"; WR <= '0'; SEL_PC <= "010"; ESCR_A <= '1'; ESCR_F <= '0'; SEL_F <= "XXX";
			when "00110" => SEL_ALU <= "001"; ESCR_P <= '1'; SEL_A <= '1'; SEL_B <= "01"; WR <= '0'; SEL_PC <= "010"; ESCR_A <= '1'; ESCR_F <= '0'; SEL_F <= "XXX";
			when "00111" => SEL_ALU <= "010"; ESCR_P <= '1'; SEL_A <= '1'; SEL_B <= "00"; WR <= '0'; SEL_PC <= "010"; ESCR_A <= '1'; ESCR_F <= '0'; SEL_F <= "XXX";
			when "01000" => SEL_ALU <= "010"; ESCR_P <= '1'; SEL_A <= '1'; SEL_B <= "01"; WR <= '0'; SEL_PC <= "010"; ESCR_A <= '1'; ESCR_F <= '0'; SEL_F <= "XXX";
			when "01001" => SEL_ALU <= "011"; ESCR_P <= '1'; SEL_A <= '1'; SEL_B <= "00"; WR <= '0'; SEL_PC <= "010"; ESCR_A <= '1'; ESCR_F <= '0'; SEL_F <= "XXX";
			when "01010" => SEL_ALU <= "011"; ESCR_P <= '1'; SEL_A <= '1'; SEL_B <= "01"; WR <= '0'; SEL_PC <= "010"; ESCR_A <= '1'; ESCR_F <= '0'; SEL_F <= "XXX";
			when "01011" => SEL_ALU <= "100"; ESCR_P <= '1'; SEL_A <= 'X'; SEL_B <= "00"; WR <= '0'; SEL_PC <= "010"; ESCR_A <= '0'; ESCR_F <= '1'; SEL_F <= "XXX";
			when "01100" => SEL_ALU <= "100"; ESCR_P <= '1'; SEL_A <= 'X'; SEL_B <= "01"; WR <= '0'; SEL_PC <= "010"; ESCR_A <= '0'; ESCR_F <= '1'; SEL_F <= "XXX";
			when "01101" => SEL_ALU <= "XXX"; ESCR_P <= '1'; SEL_A <= 'X'; SEL_B <= "XX"; WR <= '0'; SEL_PC <= "000"; ESCR_A <= '0'; ESCR_F <= '0'; SEL_F <= "000";
			when "01110" => SEL_ALU <= "XXX"; ESCR_P <= '1'; SEL_A <= 'X'; SEL_B <= "XX"; WR <= '0'; SEL_PC <= "000"; ESCR_A <= '0'; ESCR_F <= '0'; SEL_F <= "001";
			when "01111" => SEL_ALU <= "XXX"; ESCR_P <= '1'; SEL_A <= 'X'; SEL_B <= "XX"; WR <= '0'; SEL_PC <= "000"; ESCR_A <= '0'; ESCR_F <= '0'; SEL_F <= "010";
			when "10000" => SEL_ALU <= "XXX"; ESCR_P <= '1'; SEL_A <= 'X'; SEL_B <= "XX"; WR <= '0'; SEL_PC <= "000"; ESCR_A <= '0'; ESCR_F <= '0'; SEL_F <= "011";
			when "10001" => SEL_ALU <= "XXX"; ESCR_P <= '1'; SEL_A <= 'X'; SEL_B <= "XX"; WR <= '0'; SEL_PC <= "000"; ESCR_A <= '0'; ESCR_F <= '0'; SEL_F <= "100";
			when "10010" => SEL_ALU <= "XXX"; ESCR_P <= '1'; SEL_A <= 'X'; SEL_B <= "XX"; WR <= '0'; SEL_PC <= "001"; ESCR_A <= '0'; ESCR_F <= '0'; SEL_F <= "XXX";
			when "10011" => SEL_ALU <= "XXX"; ESCR_P <= '1'; SEL_A <= 'X'; SEL_B <= "XX"; WR <= '0'; SEL_PC <= "011"; ESCR_A <= '0'; ESCR_F <= '0'; SEL_F <= "XXX";
			when "10100" => SEL_ALU <= "XXX"; ESCR_P <= '1'; SEL_A <= 'X'; SEL_B <= "XX"; WR <= '0'; SEL_PC <= "100"; ESCR_A <= '0'; ESCR_F <= '0'; SEL_F <= "XXX";
			
			--Periféricos
			
			when "10101" => SEL_ALU <= "XXX"; ESCR_P <= '1'; SEL_A <= '0'; SEL_B <= "10"; WR <= '0'; SEL_PC <= "010"; ESCR_A <= '1'; ESCR_F <= '0'; SEL_F <= "XXX";
			when "10110" => SEL_ALU <= "XXX"; ESCR_P <= '0'; SEL_A <= 'X'; SEL_B <= "XX"; WR <= '0'; SEL_PC <= "010"; ESCR_A <= '0'; ESCR_F <= '0'; SEL_F <= "XXX";
			
			--Sem Operação
			
			when others => SEL_ALU <= "XXX"; ESCR_P <= '1'; SEL_A <= 'X'; SEL_B <= "XX"; WR <= '0'; SEL_PC <= "010"; ESCR_A <= '0'; ESCR_F <= '0'; SEL_F <= "XXX";			
	
		end case;
	
	end process;
	
end Behavioral;

