-------------------------------------------------------------------------------
--
-- Title       : Utils
-- Design      : taller_de_arqui
-- Author      : fran
-- Company     : Facultad de Informatica - UNLP
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\franc\Desktop\TallerDeArquitectura\taller_de_arqui\src\Utils.vhd
-- Generated   : Fri Oct 28 20:50:56 2022
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
--{entity {Utils} architecture {Utils}}



package Utils is
	procedure Clock(signal C: out Bit; HT,LT: Time);
	
	function Convert(N,L:Natural) return Bit_Vector;
	function Convert(B:Bit_Vector) return Natural;

end Utils;

package body Utils is
	procedure Clock(signal C: out Bit; HT,LT: Time) is
		begin
		loop
			C <='1' after LT, '0' after LT + HT;
			wait for LT + HT; 
		end loop;	 		
	end;
	
	function Convert(N,L:Natural) return Bit_Vector is
		variable Temp: Bit_Vector(L - 1 downto 0);				
		variable Value:Natural:= N;						
	begin
		for i in Temp'Right to Temp'Left loop
			Temp(i):=Bit'Val(Value mod 2);								 
			Value:=Value / 2;
		end loop;
		return Temp;
	end;
	
	function Convert(B:Bit_Vector) return Natural is
		variable Temp: Bit_Vector(B'Length-1 downto 0):=B;				
		variable Value:Natural:= 0;						
	begin
		for i in Temp'Right to Temp'Left loop
		if Temp(i) = '1' then
			Value:=Value + (2**i);
		 end if;			
		end loop;
		return Value;
	end;

end Utils;

