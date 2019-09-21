library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_signed.all;

entity cpu is
port(
	reset : in std_logic;
	clk : in std_logic;
	rs_out, rt_out : out std_logic_vector(3 downto 0);
	--output ports from register file

	pc_out : out std_logic_vector(3 downto 0); --pc reg
	overflow, zero : out std_logic);
	-- will not be constrained in Xilinx since not enough LEDs
end cpu;

architecture cpu_arch of cpu is
	component datapath is
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
	end component;

	component control is
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
	end component;

	signal opcode : std_logic_vector(5 downto 0);
	signal op_function : std_logic_vector(5 downto 0);
	signal reg_write : std_logic;
	signal reg_dst : std_logic;
	signal reg_in_src : std_logic;
	signal alu_src : std_logic;
	signal add_sub :  std_logic;
	signal data_write : std_logic;
	signal logic_func : std_logic_vector(1 downto 0);
	signal func : std_logic_vector(1 downto 0);
	signal branch_type : std_logic_vector(1 downto 0);
	signal pc_sel : std_logic_vector(1 downto 0);
begin

	datapath_inst : datapath port map(
		clk => clk,
		reset => reset,
		data_write => data_write,
		pc_sel => pc_sel,
		branch_type => branch_type,
		func => func,
		reg_dst => reg_dst,
		reg_write => reg_write,
		add_sub => add_sub,
		logic_func => logic_func,
		alu_src => alu_src,
		reg_in_src => reg_in_src,
		overflow => overflow,
		zero => zero,
		opcode => opcode,
		op_function => op_function,
		rs_out => rs_out,
		rt_out => rt_out,
		pc_out => pc_out
	);

	control_inst : control port map(
		opcode => opcode,
		op_function => op_function,
		reg_write => reg_write,
		reg_dst => reg_dst,
		reg_in_src => reg_in_src,
		alu_src => alu_src,
		add_sub => add_sub,
		data_write => data_write,
		logic_func => logic_func,
		func => func,
		branch_type => branch_type,
		pc_sel => pc_sel
	);

end cpu_arch;

