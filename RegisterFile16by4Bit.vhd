library ieee;
use ieee.std_logic_1164.all;


entity RegisterFile16by4Bit is
port(
clock, reset, RF_write :in std_logic;
AddressA, AddressB, AddressC :in std_logic_vector(3 downto 0);
InputC :in std_logic_vector(3 downto 0);
OutputA, OutputB :out std_logic_vector(3 downto 0) );
end RegisterFile16by4Bit;


architecture implementation of RegisterFile16by4Bit is
component Decoder4Bit is
	port(
		x : in  std_logic_vector(3 downto 0);
		y : out std_logic_vector(15 downto 0));
end component;

component Mux16Input4Bit is
	port(
		s : in  std_logic_vector(3 downto 0);
		input0, input1, input2, input3, input4 : in  std_logic_vector(3 downto 0);
		input5, input6, input7, input8, input9 : in  std_logic_vector(3 downto 0);
		input10, input11, input12, input13, input14 : in  std_logic_vector(3 downto 0);
		input15 : in  std_logic_vector(3 downto 0);
		output : out std_logic_vector(3 downto 0));
end component;

component Reg1Bit is
	port(
		clock   : in std_logic;
		reset   : in std_logic;
		enable  : in std_logic;
		D		  : in std_logic;
		Q		  : out std_logic
	);
end component;

component Reg4Bit is
	port(
		clock   : in std_logic;
		reset   : in std_logic;
		enable  : in std_logic;
		D		  : in std_logic_vector(3 downto 0);
		Q		  : out std_logic_vector(3 downto 0)
	);
end component;

signal Y : std_logic_vector(15 downto 0);
signal temp : std_logic_vector(15 downto 0);
signal Q0 : std_logic_vector(3 downto 0);
signal Q1 : std_logic_vector(3 downto 0);
signal Q2 : std_logic_vector(3 downto 0);
signal Q3 : std_logic_vector(3 downto 0);
signal Q4 : std_logic_vector(3 downto 0);
signal Q5 : std_logic_vector(3 downto 0);
signal Q6 : std_logic_vector(3 downto 0);
signal Q7 : std_logic_vector(3 downto 0);
signal Q8 : std_logic_vector(3 downto 0);
signal Q9 : std_logic_vector(3 downto 0);
signal Q10 : std_logic_vector(3 downto 0);
signal Q11 : std_logic_vector(3 downto 0);
signal Q12 : std_logic_vector(3 downto 0);
signal Q13 : std_logic_vector(3 downto 0);
signal Q14 : std_logic_vector(3 downto 0);
signal Q15 : std_logic_vector(3 downto 0);


begin

t1: Decoder4Bit port map(AddressC,Y);

temp(0)<=RF_write and Y(1);
temp(1)<=RF_write and Y(2);
temp(2)<=RF_write and Y(3);
temp(3)<=RF_write and Y(4);
temp(4)<=RF_write and Y(5);
temp(5)<=RF_write and Y(6);
temp(6)<=RF_write and Y(7);
temp(7)<=RF_write and Y(8);
temp(8)<=RF_write and Y(9);
temp(9)<=RF_write and Y(10);
temp(10)<=RF_write and Y(11);
temp(11)<=RF_write and Y(12);
temp(12)<=RF_write and Y(13);
temp(13)<=RF_write and Y(14);
temp(14)<=RF_write and Y(15);

R1: Reg4Bit port map(clock,reset,temp(0),InputC, Q0);
R2: Reg4Bit port map(clock,reset,temp(1),InputC, Q1);
R3: Reg4Bit port map(clock,reset,temp(2),InputC, Q2);
R4: Reg4Bit port map(clock,reset,temp(3),InputC, Q3);
R5: Reg4Bit port map(clock,reset,temp(4),InputC, Q4);
R6: Reg4Bit port map(clock,reset,temp(5),InputC, Q5);
R7: Reg4Bit port map(clock,reset,temp(6),InputC, Q6);
R8: Reg4Bit port map(clock,reset,temp(7),InputC, Q7);
R9: Reg4Bit port map(clock,reset,temp(8),InputC, Q8);
R10: Reg4Bit port map(clock,reset,temp(9),InputC, Q9);
R11: Reg4Bit port map(clock,reset,temp(10),InputC, Q10);
R12: Reg4Bit port map(clock,reset,temp(11),InputC, Q11);
R13: Reg4Bit port map(clock,reset,temp(12),InputC, Q12);
R14: Reg4Bit port map(clock,reset,temp(13),InputC, Q13);
R15: Reg4Bit port map(clock,reset,temp(14),InputC, Q14);

M1: Mux16Input4Bit port map(AddressA,"0000",Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Q10,Q11,Q12,Q13,Q14, OutputA);
M2: Mux16Input4Bit port map(AddressB,"0000",Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Q10,Q11,Q12,Q13,Q14, OutputB);



end implementation;