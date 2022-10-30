-------------------------------------------------------------------------------
--
-- Title       : test_fulladder
-- Design      : taller_de_arqui
-- Author      : fran
-- Company     : Facultad de Informatica - UNLP
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\franc\Desktop\TallerDeArquitectura\taller_de_arqui\src\test_fulladder.vhd
-- Generated   : Mon Oct 10 12:39:03 2022
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
--{entity {test_fulladder} architecture {test_fulladder}}


entity test_fulladder is
end;

architecture driver of test_fulladder is
component FullAdder
 port (X, Y, Cin: in Bit; Cout, Sum: out Bit);
end component;
signal X, Y, Cin, Cout, Sum: Bit;
begin
 uut: FullAdder port map (X, Y, Cin, Cout, Sum);
 estimulo: process
	type Entry is record
	 X, Y, Cin: Bit;
	 Cout, Sum: Bit;
	end record;
	type Table is array (0 to 7) of Entry;
	constant Tabla: Table:=
	(('0', '0', '0', '0', '0'),
	 ('0', '0', '1', '0', '1'),
	 ('0', '1', '0', '0', '1'),
	 ('0', '1', '1', '1', '0'),
	 ('1', '0', '0', '0', '1'),
	 ('1', '0', '1', '1', '0'),
	 ('1', '1', '0', '1', '0'),
	 ('1', '1', '1', '1', '1')
	);
 begin
	for i in Tabla'range loop
	 X <= Tabla(i).X;
	 Y <= Tabla(i).Y;
	 Cin <= Tabla(i).Cin;
	 wait for 1 ns;
	 assert
	  Cout = Tabla(i).Cout and
	  Sum = Tabla(i).Sum;
	end loop;
	wait;
 end process;
end;
