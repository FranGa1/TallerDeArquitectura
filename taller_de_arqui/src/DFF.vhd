-------------------------------------------------------------------------------
--
-- Title       : DFF
-- Design      : taller_de_arqui
-- Author      : franciscogaray
-- Company     : Facultad de Informatica UNLP
--
-------------------------------------------------------------------------------
--
-- File        : C:\My_Designs\taller_de_arqui\taller_de_arqui\src\DFF.vhd
-- Generated   : Tue Sep  6 12:54:26 2022
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
--{entity {DFF} architecture {DFF}}



entity DFF is
	port (Preset: in Bit; Clear: in Bit; Clock: in Bit; Data: in Bit; Q:out Bit; QBar: out Bit);
end DFF;
					
architecture flujodedatos of DFF is 
	signal A, B, C, D: Bit;
	signal Qint, QbarInt: Bit;
begin
	A <= not (Preset and D and B) after 1 ns;
	B <= not (A and Clear and Clock) after 1 ns;
 	C <= not (B and Clock and D) after 1 ns;
	D <= not (C and Clear and Data) after 1 ns;
	Qint <= not (Preset and B and QbarInt) after 1 ns;
	QbarInt <= not (Qint and Clear and C) after 1ns;
	Q <= Qint;
	QBar <= QbarInt;
end;
