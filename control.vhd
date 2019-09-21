
library IEEE;
use IEEE.std_logic_1164.all;

entity control is
	port(
		opcode : in std_logic_vector(5 downto 0);
		op_function : in std_logic_vector(5 downto 0);
		reg_write : out std_logic;
		reg_dst : out std_logic;
		reg_in_src : out std_logic;
		alu_src : out std_logic;
		add_sub : out std_logic;
		data_write : out std_logic;
		logic_func : out std_logic_vector(1 downto 0);
		func : out std_logic_vector(1 downto 0);
		branch_type : out std_logic_vector(1 downto 0);
		pc_sel : out std_logic_vector(1 downto 0)
	);
end control;

architecture control_arch of control is

begin

process(opcode, op_function)

begin
	case opcode is
		when "000000" =>
			case op_function is
				when "100000" =>
					reg_write <= '1';
					reg_dst <= '1';
					reg_in_src <= '1';
					alu_src <= '0';
					add_sub <= '0';
					data_write <= '0';
					logic_func <= "00";
					func <= "10";
					branch_type <= "00";
					pc_sel <= "00";
				when "100010" =>
					reg_write <= '1';
					reg_dst <= '1';
					reg_in_src <= '1';
					alu_src <= '0';
					add_sub <= '1';
					data_write <= '0';
					logic_func <= "00";
					func <= "10";
					branch_type <= "00";
					pc_sel <= "00";
				when "101010" =>
					reg_write <= '1';
					reg_dst <= '1';
					reg_in_src <= '1';
					alu_src <= '0';
					add_sub <= '0';
					data_write <= '0';
					logic_func <= "00";
					func <= "01";
					branch_type <= "00";
					pc_sel <= "00";
				when "100100" =>
					reg_write <= '1';
					reg_dst <= '1';
					reg_in_src <= '1';
					alu_src <= '0';
					add_sub <= '1';
					data_write <= '0';
					logic_func <= "00";
					func <= "11";
					branch_type <= "00";
					pc_sel <= "00";
				when "100101" =>
					reg_write <= '1';
					reg_dst <= '1';
					reg_in_src <= '1';
					alu_src <= '0';
					add_sub <= '1';
					data_write <= '0';
					logic_func <= "00";
					func <= "11";
					branch_type <= "00";
					pc_sel <= "00";
				when "100110" =>
					reg_write <= '1';
					reg_dst <= '1';
					reg_in_src <= '1';
					alu_src <= '0';
					add_sub <= '0';
					data_write <= '0';
					logic_func <= "01";
					func <= "11";
					branch_type <= "00";
					pc_sel <= "00";
				when "100111" =>
					reg_write <= '1';
					reg_dst <= '1';
					reg_in_src <= '1';
					alu_src <= '0';
					add_sub <= '0';
					data_write <= '0';
					logic_func <= "11";
					func <= "11";
					branch_type <= "00";
					pc_sel <= "00";
				when others =>
					reg_write <= '0';
					reg_dst <= '1';
					reg_in_src <= '0';
					alu_src <= '0';
					add_sub <= '0';
					data_write <= '0';
					logic_func <= "00";
					func <= "10";
					branch_type <= "00";
					pc_sel <= "10";
				end case;
			when "001111" =>
				reg_write <= '1';
				reg_dst <= '0';
				reg_in_src <= '1';
				alu_src <= '1';
				add_sub <= '0';
				data_write <= '0';
				logic_func <= "00";
				func <= "00";
				branch_type <= "00";
				pc_sel <= "00";
			when "001000" =>
				reg_write <= '1';
				reg_dst <= '0';
				reg_in_src <= '1';
				alu_src <= '1';
				add_sub <= '0';
				data_write <= '0';
				logic_func <= "00";
				func <= "10";
				branch_type <= "00";
				pc_sel <= "00";
			when "001010" =>
				reg_write <= '1';
				reg_dst <= '0';
				reg_in_src <= '1';
				alu_src <= '1';
				add_sub <= '0';
				data_write <= '0';
				logic_func <= "00";
				func <= "01";
				branch_type <= "00";
				pc_sel <= "00";
			when "001100" =>
				reg_write <= '1';
				reg_dst <= '0';
				reg_in_src <= '1';
				alu_src <= '1';
				add_sub <= '0';
				data_write <= '0';
				logic_func <= "00";
				func <= "11";
				branch_type <= "00";
				pc_sel <= "00";
			when "001101" =>
				reg_write <= '1';
				reg_dst <= '0';
				reg_in_src <= '1';
				alu_src <= '1';
				add_sub <= '0';
				data_write <= '0';
				logic_func <= "01";
				func <= "11";
				branch_type <= "00";
				pc_sel <= "00";
			when "001110" =>
				reg_write <= '1';
				reg_dst <= '0';
				reg_in_src <= '1';
				alu_src <= '1';
				add_sub <= '0';
				data_write <= '0';
				logic_func <= "10";
				func <= "11";
				branch_type <= "00";
				pc_sel <= "00";
			when "100011" =>
				reg_write <= '1';
				reg_dst <= '0';
				reg_in_src <= '0';
				alu_src <= '1';
				add_sub <= '0';
				data_write <= '0';
				logic_func <= "10";
				func <= "10";
				branch_type <= "00";
				pc_sel <= "00";
			when "101011" =>
				reg_write <= '0';
				reg_dst <= '0';
				reg_in_src <= '0';
				alu_src <= '1';
				add_sub <= '0';
				data_write <= '1';
				logic_func <= "00";
				func <= "10";
				branch_type <= "00";
				pc_sel <= "00";
			when "000010" =>
				reg_write <= '0';
				reg_dst <= '0';
				reg_in_src <= '0';
				alu_src <= '1';
				add_sub <= '0';
				data_write <= '0';
				logic_func <= "00";
				func <= "10";
				branch_type <= "00";
				pc_sel <= "01";
			when "000001" =>
				reg_write <= '0';
				reg_dst <= '0';
				reg_in_src <= '0';
				alu_src <= '0';
				add_sub <= '0';
				data_write <= '0';
				logic_func <= "00";
				func <= "10";
				branch_type <= "11";
				pc_sel <= "00";
			when "000100" =>
				reg_write <= '0';
				reg_dst <= '0';
				reg_in_src <= '0';
				alu_src <= '0';
				add_sub <= '0';
				data_write <= '0';
				logic_func <= "00";
				func <= "00";
				branch_type <= "01";
				pc_sel <= "00";
			when others =>
				reg_write <= '0';
				reg_dst <= '0';
				reg_in_src <= '0';
				alu_src <= '0';
				add_sub <= '0';
				data_write <= '0';
				logic_func <= "00";
				func <= "10";
				branch_type <= "10";
				pc_sel <= "00";
			end case;
end process;

end control_arch;

