-------------------------------------------------------------------------------
--
-- Title       : test_and2
-- Design      : taller_de_arqui
-- Author      : franciscogaray
-- Company     : Facultad de Informatica UNLP
--
-------------------------------------------------------------------------------
--
-- File        : C:\My_Designs\taller_de_arqui\taller_de_arqui\src\test_and2.vhd
-- Generated   : Tue Aug 30 12:36:41 2022
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {test_and2} architecture {test_and2}}


entity test_bench_and2 is
end test_bench_and2;

--}} End of automatically maintained section

architecture test of test_bench_and2 is
	signal s_input1, s_input2, s_output: bit; 
	constant retardo: time:= 10 ns;
begin
	s_input1 <= '1' after retardo;
	s_input2 <= '1' after 5 ns, '0' after retardo,
	'1' after 15 ns;		 
	dut: entity work.and2(rtl)
		port map(input1=>s_input1, input2=>s_input2, output=>s_output);
		
end test;
