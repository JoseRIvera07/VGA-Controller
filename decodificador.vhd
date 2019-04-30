library ieee;
use ieee.std_logic_1164.all;
library altera;
use altera.altera_syn_attributes.all;
ENTITY decodificador IS
port
(
O :out std_logic_vector(6 downto 0);
ent :in std_logic_vector(2 downto 0)

);
END decodificador;
ARCHITECTURE Behavioral OF decodificador IS

begin

with ent select
O<=
				"1000000" when "000",--0 
				"1111001" when "001",--1
				"0100100" when "010",--2
				"0110000" when "011",--3
				"0011001" when "100",--4
				"0010010" when "101",--5
				"0000010" when "110",--6
				"1111000" when "111",--7
				"0000000" when others;
end Behavioral;