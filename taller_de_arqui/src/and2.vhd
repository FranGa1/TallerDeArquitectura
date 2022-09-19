-------------------------------------------------------------------------------
--
-- Title       : and2
-- Design      : taller_de_arqui
-- Author      : franciscogaray
-- Company     : Facultad de Informatica UNLP
--
-------------------------------------------------------------------------------
--
-- File        : C:\My_Designs\taller_de_arqui\taller_de_arqui\src\and2.vhd
-- Generated   : Tue Aug 30 12:37:08 2022
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
--{entity {and2} architecture {and2}}



entity and2 is	  
	port(
		input1, input2 : in bit;
		output: out bit 
	);
end and2;

--}} End of automatically maintained section

architecture rtl of and2 is
begin
	output <= input1 and input2;
end rtl;
