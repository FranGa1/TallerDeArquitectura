-------------------------------------------------------------------------------
--
-- Title       : FullAdder
-- Design      : taller_de_arqui
-- Author      : franciscogaray
-- Company     : Facultad de Informatica UNLP
--
-------------------------------------------------------------------------------
--
-- File        : C:\My_Designs\taller_de_arqui\taller_de_arqui\src\FullAdder.vhd
-- Generated   : Tue Sep 27 12:17:07 2022
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
--{entity {FullAdder} architecture {FullAdder}}



entity FullAdder is
 port (X,Y,Cin: in Bit; Cout, Sum: out Bit);
end FullAdder;

architecture ecuacion of fulladder is
begin
 Sum <= X xor Y xor Cin;
 Cout <= (X and Y) or (X and Cin) or (Y and Cin);
end;

			  
