-------------------------------------------------------------------------------
--
-- Title       : ShiftN
-- Design      : taller_de_arqui
-- Author      : fran
-- Company     : Facultad de Informatica - UNLP
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\franc\Desktop\TallerDeArquitectura\taller_de_arqui\src\ShiftN.vhd
-- Generated   : Mon Oct 24 10:33:04 2022
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
--{entity {ShiftN} architecture {ShiftN}}



entity ShiftN is
  port (CLK: in Bit; 
		CLR: in Bit; -- borrar todo 
		LD: in Bit;  -- cargar el registro
		SH: in Bit;  -- iniciar desplazamiento
		DIR: in Bit; -- especificar direccion (0 derecha, 1 izquierda)
		D: in Bit_Vector; 
		Q: out Bit_Vector);
begin
  assert (D'Length <= Q'Length)
    report "Entrada D no debe ser mas 'ancha' que la salida Q"
      severity Failure;
end ShiftN;

architecture Behavior of ShiftN is
begin
  Shifter: process (CLR, CLK)
    subtype InBits  is Natural range D'Length-1 downto 0;
    subtype OutBits is Natural range Q'Length-1 downto 0;
    variable State: Bit_Vector(OutBits);
  begin
    if CLR = '1' then
      State := (others => '0');	 -- http://computer-programming-forum.com/42-vhdl/8625dca6593d01d5.htm
      Q <= State after 3ns;
    elsif CLK'Event and CLK='1' then
         if LD = '1' then
            State := (others => '0');
            State(InBits) := D;
            Q <= State after 5ns;
         elsif SH = '1' then
            case DIR is
              when '0' => State := '0' & State(State'Left downto 1);
              when '1' => State := State(State'Left-1 downto 0) & '0';
            end case;
            Q <= State after 7ns;
         end if;
    end if;
  end process;
end;
