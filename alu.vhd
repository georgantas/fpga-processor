library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_signed.all;

entity alu is
port(	x, y : in std_logic_vector(31 downto 0);
	--two input operands
	add_sub:	in std_logic;
	logic_func :	in std_logic_vector(1 downto 0);
	-- 00 = AND, 01 = OR, 10 = XOR, 11 = NOR
	func:		in std_logic_vector(1 downto 0);
	-- 00 = lui, 01 = setless, 10 = arith, 11 = logic
	output:		out std_logic_vector(31 downto 0);
	overflow:	out std_logic;
	zero:		out std_logic);
end alu;

architecture arch_alu of alu is
	signal xy_sub : std_logic_vector(31 downto 0);
	signal add_subtract_res : std_logic_vector(32 downto 0);
	signal add_subtract_res2 : std_logic_vector(31 downto 0);
	signal logic_res : std_logic_vector(31 downto 0);
	signal slt_res: std_logic_vector(31 downto 0);
	signal lui_res : std_logic_vector(31 downto 0);
	signal c_out : std_logic;
	signal c_in : std_logic;
begin

	xy_sub <= x - y;

	c_out <= add_subtract_res(32);
	c_in <= add_subtract_res2(31);

	with add_sub select
		add_subtract_res2 <=	('0' & x(30 downto 0)) + ('0' & y(30 downto 0)) when '0',
					('0' & x(30 downto 0)) + ('0' & (-y(30 downto 0))) when others;

	with add_sub select
		add_subtract_res <= 	('0' & x) + ('0' & y) when '0',
					('0' & x) + ('0' & (-y)) when others;
	with logic_func select
		logic_res <=		x and y when "00",
					x or y when "01",
					x xor y when "10",
					x nor y when others;
	

	slt_res <= "0000000000000000000000000000000" & xy_sub(31);

	lui_res <= y;

	with func select
		output <= 		lui_res when "00",
					slt_res when "01",
					add_subtract_res(31 downto 0) when "10",
					logic_res when others;

	zero <= '1' when add_subtract_res(31 downto 0) = 0 else '0';
		-- and func = "10" else '0';
	
	overflow <= c_out xor c_in;
		--when func = "10" else '0';

end arch_alu;
