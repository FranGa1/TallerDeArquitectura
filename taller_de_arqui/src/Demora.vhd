library IEEE;
use IEEE.std_logic_1164.all;

entity Demora is
end entity Demora;

architecture Ejemplo of Demora is
   signal A, B, C : std_logic:='0';
begin
   A <= '0', '1' after 5 ns, '0' after 14 ns, '1' after 25 ns, '0' after 30 ns;
   B <= transport A after 10 ns;
   C <= reject 9 ns inertial A after 10 ns;
end architecture Ejemplo; -- Entity: Demora	 
	
-- El tiempo de reject de C no puede ser mayor a 10ns porque este es el retardo
-- que tiene en aplicarse la señal, y en ese momento se evalúa si el pulso de A
-- es mayor a los x ns del reject. 
-- Si el tiempo del reject es 10 ns, se rechazan todos los pulsos < a 10 ns.
-- Si el tiempo del reject es <=9ns, se rechazan todos los pulsos <= a 9ns.