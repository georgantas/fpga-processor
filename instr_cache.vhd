
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity instr_cache is
	port(
		address : in std_logic_vector(4 downto 0);
		data : out std_logic_vector(31 downto 0)
	);
end instr_cache;

architecture arch_instr_cache of instr_cache is
  signal reg1 : std_logic_vector(31 downto 0) := "00100000000000010000000000000001";
  signal reg2 : std_logic_vector(31 downto 0) := "00100000000000100000000000000010";
  signal reg3 : std_logic_vector(31 downto 0) := "00000000010000010001000000100000";
  signal reg4 : std_logic_vector(31 downto 0) := "00001000000000000000000000000010";
  signal reg5 : std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
  signal reg6 : std_logic_vector(31 downto 0);
  signal reg7 : std_logic_vector(31 downto 0);
  signal reg8 : std_logic_vector(31 downto 0);
  signal reg9 : std_logic_vector(31 downto 0);
  signal reg10 : std_logic_vector(31 downto 0);
  signal reg11 : std_logic_vector(31 downto 0);
  signal reg12 : std_logic_vector(31 downto 0);
  signal reg13 : std_logic_vector(31 downto 0);
  signal reg14 : std_logic_vector(31 downto 0);
  signal reg15 : std_logic_vector(31 downto 0);
  signal reg16 : std_logic_vector(31 downto 0);
  signal reg17 : std_logic_vector(31 downto 0);
  signal reg18 : std_logic_vector(31 downto 0);
  signal reg19 : std_logic_vector(31 downto 0);
  signal reg20 : std_logic_vector(31 downto 0);
  signal reg21 : std_logic_vector(31 downto 0);
  signal reg22 : std_logic_vector(31 downto 0);
  signal reg23 : std_logic_vector(31 downto 0);
  signal reg24 : std_logic_vector(31 downto 0);
  signal reg25 : std_logic_vector(31 downto 0);
  signal reg26 : std_logic_vector(31 downto 0);
  signal reg27 : std_logic_vector(31 downto 0);
  signal reg28 : std_logic_vector(31 downto 0);
  signal reg29 : std_logic_vector(31 downto 0);
  signal reg30 : std_logic_vector(31 downto 0);
  signal reg31 : std_logic_vector(31 downto 0);
  signal reg32 : std_logic_vector(31 downto 0);
begin

process(address)
begin
  case address is
    when "00000" => data <= reg1;
    when "00001" => data <= reg2;
    when "00010" => data <= reg3;
    when "00011" => data <= reg4;
    when "00100" => data <= reg5;
    when "00101" => data <= reg6;
    when "00110" => data <= reg7;
    when "00111" => data <= reg8;
    when "01000" => data <= reg9;
    when "01001" => data <= reg10;
    when "01010" => data <= reg11;
    when "01011" => data <= reg12;
    when "01100" => data <= reg13;
    when "01101" => data <= reg14;
    when "01110" => data <= reg15;
    when "01111" => data <= reg16;
    when "10000" => data <= reg17;
    when "10001" => data <= reg18;
    when "10010" => data <= reg19;
    when "10011" => data <= reg20;
    when "10100" => data <= reg21;
    when "10101" => data <= reg22;
    when "10110" => data <= reg23;
    when "10111" => data <= reg24;
    when "11000" => data <= reg25;
    when "11001" => data <= reg26;
    when "11010" => data <= reg27;
    when "11011" => data <= reg28;
    when "11100" => data <= reg29;
    when "11101" => data <= reg30;
    when "11110" => data <= reg31;
    when others => data <= reg32;  
  end case;
end process;

end arch_instr_cache;

