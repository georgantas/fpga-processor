
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity d_cache is
	port(
		address : in std_logic_vector(4 downto 0);
		reset : in std_logic;
		din : in std_logic_vector(31 downto 0);
		clk : in std_logic;
		data_write : in std_logic;
		data : out std_logic_vector(31 downto 0)	
	);
end d_cache;

architecture arch_d_cache of d_cache is
  signal reg1 : std_logic_vector(31 downto 0);
  signal reg2 : std_logic_vector(31 downto 0);
  signal reg3 : std_logic_vector(31 downto 0);
  signal reg4 : std_logic_vector(31 downto 0);
  signal reg5 : std_logic_vector(31 downto 0);
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

-- write
process(address, reset, din, clk, data_write)
begin
  if(reset = '1') then
    reg1 <= "00000000000000000000000000000000";
    reg2 <= "00000000000000000000000000000000";
    reg3 <= "00000000000000000000000000000000";
    reg4 <= "00000000000000000000000000000000";
    reg5 <= "00000000000000000000000000000000";
    reg6 <= "00000000000000000000000000000000";
    reg7 <= "00000000000000000000000000000000";
    reg8 <= "00000000000000000000000000000000";
    reg9 <= "00000000000000000000000000000000";
    reg10 <= "00000000000000000000000000000000";
    reg11 <= "00000000000000000000000000000000";
    reg12 <= "00000000000000000000000000000000";
    reg13 <= "00000000000000000000000000000000";
    reg14 <= "00000000000000000000000000000000";
    reg15 <= "00000000000000000000000000000000";
    reg16 <= "00000000000000000000000000000000";
    reg17 <= "00000000000000000000000000000000";
    reg18 <= "00000000000000000000000000000000";
    reg19 <= "00000000000000000000000000000000";
    reg20 <= "00000000000000000000000000000000";
    reg21 <= "00000000000000000000000000000000";
    reg22 <= "00000000000000000000000000000000";
    reg23 <= "00000000000000000000000000000000";
    reg24 <= "00000000000000000000000000000000";
    reg25 <= "00000000000000000000000000000000";
    reg26 <= "00000000000000000000000000000000";
    reg27 <= "00000000000000000000000000000000";
    reg28 <= "00000000000000000000000000000000";
    reg29 <= "00000000000000000000000000000000";
    reg30 <= "00000000000000000000000000000000";
    reg31 <= "00000000000000000000000000000000";
    reg32 <= "00000000000000000000000000000000"; 
   elsif(data_write = '1' and clk = '1' and clk'event) then
    case address is
       when "00000" => reg1 <= din;
       when "00001" => reg2 <= din;
       when "00010" => reg3 <= din;
       when "00011" => reg4 <= din;
       when "00100" => reg5 <= din;
       when "00101" => reg6 <= din;
       when "00110" => reg7 <= din;
       when "00111" => reg8 <= din;
       when "01000" => reg9 <= din;
       when "01001" => reg10 <= din;
       when "01010" => reg11 <= din;
       when "01011" => reg12 <= din;
       when "01100" => reg13 <= din;
       when "01101" => reg14 <= din;
       when "01110" => reg15 <= din;
       when "01111" => reg16 <= din;
       when "10000" => reg17 <= din;
       when "10001" => reg18 <= din;
       when "10010" => reg19 <= din;
       when "10011" => reg20 <= din;
       when "10100" => reg21 <= din;
       when "10101" => reg22 <= din;
       when "10110" => reg23 <= din;
       when "10111" => reg24 <= din;
       when "11000" => reg25 <= din;
       when "11001" => reg26 <= din;
       when "11010" => reg27 <= din;
       when "11011" => reg28 <= din;
       when "11100" => reg29 <= din;
       when "11101" => reg30 <= din;
       when "11110" => reg31 <= din;
       when others => reg32 <= din;  
     end case;
   end if;
end process;

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

end arch_d_cache;

