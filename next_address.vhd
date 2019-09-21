
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_signed.all;

entity next_address is
port(	rt, rs : in std_logic_vector(31 downto 0);
	-- two register inputs
	pc : in std_logic_vector(31 downto 0);
	target_address : in std_logic_vector(25 downto 0);
	branch_type : in std_logic_vector(1 downto 0);
	pc_sel : in std_logic_vector(1 downto 0);
	next_pc : out std_logic_vector(31 downto 0));
end next_address;

architecture arch_next_address of next_address is
	signal sign_extended_jump : std_logic_vector(31 downto 0);
	signal sign_extended_branch : std_logic_vector(31 downto 0);
begin

	sign_extended_branch <= "0000000000000000" & target_address(15 downto 0) when target_address(15) = '0' else
				"1111111111111111" & target_address(15 downto 0); 

	sign_extended_jump <= "000000" & target_address;

	process(rt, rs, pc, target_address, branch_type, pc_sel)
	begin
		case branch_type is
			when "00" =>
				case pc_sel is
					when "00" =>
						next_pc <= pc + 1;
					when "01" =>
						next_pc <= sign_extended_jump;
					when others =>
						next_pc <= rs;
				end case;
			when "01" =>
				if(rs = rt) then
					next_pc <= pc + 1 + sign_extended_branch;
				else
					next_pc <= pc + 1;
				end if;
			when "10" =>
				if(rs /= rt) then
					next_pc <= pc + 1 + sign_extended_branch;
				else
					next_pc <= pc + 1;
				end if;
			when others =>
				if(rs < 0) then
					next_pc <= pc + 1 + sign_extended_branch;
				else
					next_pc <= pc + 1;
				end if;
		end case;
	end process;

end arch_next_address;

