-------------------------------------------------------------------------------
--
-- Title       : ejercicio1
-- Design      : taller_de_arqui
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\taller_de_arqui\taller_de_arqui\src\ejercicio1.vhd
-- Generated   : Fri Aug 26 10:10:04 2022
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
--{entity {ejercicio1} architecture {ejercicio1}}


USE std.textio.all;	 

entity ejercicio1 is
end ejercicio1;

--}} End of automatically maintained section

architecture ejercicio1 of ejercicio1 is   
	CONSTANT mensaje: String := "hola, mundo!";
	SIGNAL canal: Character := ' ';

begin
	p1: PROCESS	  
		variable linea: line;		
		variable dummy: side;

		BEGIN
			FOR i IN mensaje'Range LOOP
				canal <= mensaje(i);   
				write(linea, mensaje(i), dummy,1);

				WAIT FOR 1 ns;
			END LOOP;		 
			writeline(output, linea);

			WAIT;
		END PROCESS;	  

end ejercicio1;
