-------------------------------------------------------------------------------
--
-- Title       : Multiplicador4
-- Design      : taller_de_arqui
-- Author      : fran
-- Company     : Facultad de Informatica - UNLP
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\franc\Desktop\TallerDeArquitectura\taller_de_arqui\src\Multiplicador4.vhd
-- Generated   : Fri Oct 28 23:19:32 2022
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
--{entity {Multiplicador4} architecture {Multiplicador4}}



entity Multiplicador4 is	 
	port (A,B: in Bit_Vector(7 downto 0); STB: in Bit; Done:out Bit; Result: out Bit_Vector(7 downto 0));
end Multiplicador4;

--}} End of automatically maintained section

architecture Multiplicador4 of Multiplicador4 is 
	component ShiftN
	    port (CLK: in  Bit;  CLR: in  Bit; LD: in  Bit;
	          SH: in  Bit;  DIR: in  Bit;
	          D: in Bit_Vector; Q: out  Bit_Vector);
	end component;		
begin 
	
end Multiplicador4;
