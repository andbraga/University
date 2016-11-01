----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:25:23 03/21/2015 
-- Design Name: 
-- Module Name:    MemoriaInstrucoes - Behavioral 
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

entity MemoriaInstrucoes is
    Port ( Endereco	: in  STD_LOGIC_VECTOR (7 downto 0);
           Opcode 	: out  STD_LOGIC_VECTOR (4 downto 0);
           Constante : out  STD_LOGIC_VECTOR (7 downto 0));
end MemoriaInstrucoes;

architecture Behavioral of MemoriaInstrucoes is

begin

	process(Endereco)
	
	begin
	
		case Endereco is
		
			when "00000000" => Opcode <= "00000"; Constante <= "00000010";
			when "00000001" => Opcode <= "00011"; Constante <= "00000001";
			when "00000010" => Opcode <= "10110"; Constante <= "XXXXXXXX";
			when "00000011" => Opcode <= "00010"; Constante <= "10000001";
			when "00000100" => Opcode <= "00101"; Constante <= "00000001";
			when "00000101" => Opcode <= "01000"; Constante <= "10000001";
			when "00000110" => Opcode <= "10110"; Constante <= "XXXXXXXX";
			when "00000111" => Opcode <= "01011"; Constante <= "00000011";
			when "00001000" => Opcode <= "01111"; Constante <= "00001011";
			when "00001001" => Opcode <= "00000"; Constante <= "00000100";
			when "00001010" => Opcode <= "10010"; Constante <= "00000100";
			when "00001011" => Opcode <= "00001"; Constante <= "10000001";
			when "00001100" => Opcode <= "00100"; Constante <= "10000001";
			when "00001101" => Opcode <= "10110"; Constante <= "XXXXXXXX";
			when "00001110" => Opcode <= "10101"; Constante <= "XXXXXXXX";
			when "00001111" => Opcode <= "01011"; Constante <= "10101010";
			when "00010000" => Opcode <= "01111"; Constante <= "00010010";
			when "00010001" => Opcode <= "10010"; Constante <= "00001110";
			when "00010010" => Opcode <= "10110"; Constante <= "XXXXXXXX";
			when "00010011" => Opcode <= "10010"; Constante <= "00010010";
			when others => Opcode <= "XXXXX"; Constante <= "XXXXXXXX";
			
		end case;	
	
	end process;

end Behavioral;

