
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_signed.all;

entity datapath is
port(
	clk : in std_logic;
	reset : in std_logic;
	data_write : in std_logic;
	pc_sel : in std_logic_vector(1 downto 0);
	branch_type : in std_logic_vector(1 downto 0);
	func : in std_logic_vector(1 downto 0);
	reg_dst : in std_logic;
	reg_write : in std_logic;
	add_sub : in std_logic;
	logic_func : in std_logic_vector(1 downto 0);
	alu_src : in std_logic;
	reg_in_src : in std_logic;
	overflow : out std_logic;
	zero : out std_logic;
	opcode : out std_logic_vector(5 downto 0);
	op_function : out std_logic_vector(5 downto 0);
	rs_out, rt_out, pc_out : out std_logic_vector(3 downto 0)
);
end datapath;

architecture arch_datapath of datapath is
	component instr_cache is
		port(
			address : in std_logic_vector(4 downto 0);
			data : out std_logic_vector(31 downto 0)
		);
	end component;

	component d_cache is
		port(
			address : in std_logic_vector(4 downto 0);
			reset : in std_logic;
			din : in std_logic_vector(31 downto 0);
			clk : in std_logic;
			data_write : in std_logic;
			data : out std_logic_vector(31 downto 0)
		);
	end component;

	component next_address is
		port(
			rt, rs : in std_logic_vector(31 downto 0);
			pc : in std_logic_vector(31 downto 0);
			target_address : in std_logic_vector(25 downto 0);
			branch_type : in std_logic_vector(1 downto 0);
			pc_sel : in std_logic_vector(1 downto 0);
			next_pc : out std_logic_vector(31 downto 0)
		);
	end component;

	component alu is
		port(
			x, y : in std_logic_vector(31 downto 0);
			add_sub : in std_logic;
			logic_func : in std_logic_vector(1 downto 0);
			func : in std_logic_vector(1 downto 0);
			output : out std_logic_vector(31 downto 0);
			overflow : out std_logic;
			zero : out std_logic
		);
	end component;

	component regfile is
		port(
			din : in std_logic_vector(31 downto 0);
			reset : in std_logic;
			clk : in std_logic;
			write : in std_logic;
			read_a : in std_logic_vector(4 downto 0);
			read_b : in std_logic_vector(4 downto 0);
			write_address : in std_logic_vector(4 downto 0);
			out_a : out std_logic_vector(31 downto 0);
			out_b : out std_logic_vector(31 downto 0)
		);
	end component;

	signal immediate_sign_extended : std_logic_vector(31 downto 0);
	signal pc_reg : std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
	signal pc_reg_next : std_logic_vector(31 downto 0);
	signal instruction : std_logic_vector(31 downto 0);
	signal regfile_mux : std_logic_vector(4 downto 0);
	signal rs : std_logic_vector(4 downto 0);
	signal rt : std_logic_vector(4 downto 0);
	signal rd : std_logic_vector(4 downto 0);
	--signal opcode : std_logic_vector(5 downto 0);
	signal target_address : std_logic_vector(25 downto 0);
	signal immediate_value : std_logic_vector(15 downto 0);
	--signal op_function : std_logic_vector(5 downto 0);
	signal out_a : std_logic_vector(31 downto 0);
	signal out_b : std_logic_vector(31 downto 0);
	signal alu_mux : std_logic_vector(31 downto 0);
	signal alu_output : std_logic_vector(31 downto 0);
	signal dcache_mux : std_logic_vector(31 downto 0);
	signal dcache_output : std_logic_vector(31 downto 0);
begin
	rs_out <= out_a(3 downto 0);
	rt_out <= out_b(3 downto 0);
	pc_out <= pc_reg(3 downto 0);
	immediate_value <= instruction(15 downto 0);
	rs <= instruction(25 downto 21);
	rt <= instruction(20 downto 16);
	rd <= instruction(15 downto 11);
	opcode <= instruction(31 downto 26);
	target_address <= instruction(25 downto 0);
	immediate_value <= instruction(15 downto 0);
	op_function <= instruction(5 downto 0);

	regfile_mux <= rt when reg_dst = '0' else rd;
	alu_mux <= out_b when alu_src = '0' else immediate_sign_extended;
	dcache_mux <= dcache_output when reg_in_src = '0' else alu_output;

	immediate_sign_extended <= immediate_value & "0000000000000000" when func = "00" else
				   "1111111111111111" & immediate_value when (func = "01" or func = "10") and immediate_value(15) = '1' else
				   "0000000000000000" & immediate_value;

	process(pc_reg, pc_reg_next, clk)
	begin
		if(reset = '1') then
			pc_reg <= (others => '0');
		elsif(clk = '1' and clk'event) then
			pc_reg <= pc_reg_next;
		end if;
	end process;

	next_address_inst : next_address port map(
		rt => out_b,
		rs => out_a,
		pc => pc_reg,
		target_address => target_address,
		branch_type => branch_type,
		pc_sel => pc_sel,
		next_pc => pc_reg_next
	);

	instr_cache_inst: instr_cache port map(
		address => pc_reg(4 downto 0),
		data => instruction
	);

	regfile_inst: regfile port map(
		din => dcache_mux,
		reset => reset,
		clk => clk,
		write => reg_write,
		read_a => rs,
		read_b => rt,
		write_address => regfile_mux,
		out_a => out_a,
		out_b => out_b
	);

	alu_inst: alu port map(
		x => out_a,
		y => alu_mux,
		add_sub => add_sub,
		logic_func => logic_func,
		func => func,
		output => alu_output,
		overflow => overflow,
		zero => zero
	);

	d_cache_inst: d_cache port map(
		address => alu_output(4 downto 0),
		reset => reset,
		din => out_b,
		clk => clk,
		data_write => data_write,
		data => dcache_output
	);
end arch_datapath;

