library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity regfile is
port( din : in std_logic_vector(31 downto 0);
      reset : in std_logic;
      clk : in std_logic;
      write : in std_logic;
      read_a : in std_logic_vector(4 downto 0);
      read_b : in std_logic_vector(4 downto 0);
      write_address : in std_logic_vector(4 downto 0);
      out_a : out std_logic_vector(31 downto 0);
      out_b : out std_logic_vector(31 downto 0));
end regfile;

architecture arch_regfile of regfile is
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
  process(din, reset, clk, read_a, read_b, write, write_address)
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
      elsif(write = '1' and clk = '1' and clk'event) then
        case write_address is
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
  
  process(din, reset, clk, write, read_a, read_b, write_address)
  begin
  case read_a is
    when "00000" => out_a <= reg1;
    when "00001" => out_a <= reg2;
    when "00010" => out_a <= reg3;
    when "00011" => out_a <= reg4;
    when "00100" => out_a <= reg5;
    when "00101" => out_a <= reg6;
    when "00110" => out_a <= reg7;
    when "00111" => out_a <= reg8;
    when "01000" => out_a <= reg9;
    when "01001" => out_a <= reg10;
    when "01010" => out_a <= reg11;
    when "01011" => out_a <= reg12;
    when "01100" => out_a <= reg13;
    when "01101" => out_a <= reg14;
    when "01110" => out_a <= reg15;
    when "01111" => out_a <= reg16;
    when "10000" => out_a <= reg17;
    when "10001" => out_a <= reg18;
    when "10010" => out_a <= reg19;
    when "10011" => out_a <= reg20;
    when "10100" => out_a <= reg21;
    when "10101" => out_a <= reg22;
    when "10110" => out_a <= reg23;
    when "10111" => out_a <= reg24;
    when "11000" => out_a <= reg25;
    when "11001" => out_a <= reg26;
    when "11010" => out_a <= reg27;
    when "11011" => out_a <= reg28;
    when "11100" => out_a <= reg29;
    when "11101" => out_a <= reg30;
    when "11110" => out_a <= reg31;
    when others => out_a <= reg32;  
  end case;
  end process;
  
  process(din, reset, clk, write, read_a, read_b, write_address)
  begin
  case read_b is
    when "00000" => out_b <= reg1;
    when "00001" => out_b <= reg2;
    when "00010" => out_b <= reg3;
    when "00011" => out_b <= reg4;
    when "00100" => out_b <= reg5;
    when "00101" => out_b <= reg6;
    when "00110" => out_b <= reg7;
    when "00111" => out_b <= reg8;
    when "01000" => out_b <= reg9;
    when "01001" => out_b <= reg10;
    when "01010" => out_b <= reg11;
    when "01011" => out_b <= reg12;
    when "01100" => out_b <= reg13;
    when "01101" => out_b <= reg14;
    when "01110" => out_b <= reg15;
    when "01111" => out_b <= reg16;
    when "10000" => out_b <= reg17;
    when "10001" => out_b <= reg18;
    when "10010" => out_b <= reg19;
    when "10011" => out_b <= reg20;
    when "10100" => out_b <= reg21;
    when "10101" => out_b <= reg22;
    when "10110" => out_b <= reg23;
    when "10111" => out_b <= reg24;
    when "11000" => out_b <= reg25;
    when "11001" => out_b <= reg26;
    when "11010" => out_b <= reg27;
    when "11011" => out_b <= reg28;
    when "11100" => out_b <= reg29;
    when "11101" => out_b <= reg30;
    when "11110" => out_b <= reg31;
    when others => out_b <= reg32;  
  end case;
  end process;
end arch_regfile;

