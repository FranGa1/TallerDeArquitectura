-------------------------------------------------------------------------------
--
-- Title       : Controller
-- Design      : taller_de_arqui
-- Author      : fran
-- Company     : Facultad de Informatica - UNLP
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\franc\Desktop\TallerDeArquitectura\taller_de_arqui\src\Controller.vhd
-- Generated   : Mon Oct 24 11:26:20 2022
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
--{entity {Controller} architecture {Controller}}



entity Controller is
  port (STB, CLK, LSB, Stop: in  Bit;
           Init, Shift, Add, Done: out  Bit);
end Controller;

architecture FSM of Controller is
  type States is (InitS, CheckS, AddS, ShiftS, EndS);
  signal State: States := EndS;
begin
-- Drive control outputs based upon State
  Init  <= '1' when State = InitS  else '0';
  Add <= '1' when State = AddS   else '0';
  Shift <= '1' when State = ShiftS else '0';
  Done <= '1' when State = EndS else '0';

-- Determine Next State from control inputs
  StateMachine: process (CLK)
    begin
      if CLK'Event and CLK = '0' then -- funciona con flanco descendente		 
		  case State is
	          when InitS =>
	            State <= CheckS;		
	          when CheckS =>
	            if LSB = '1' then
	               State <= AddS;
	            elsif Stop = '0' then
	               State <= ShiftS;
	            else
	               State <= EndS;
	            end if;
	          when AddS =>
	            State <= ShiftS;
	          when ShiftS =>
	            State <= CheckS;
	          when EndS =>
	            if STB = '1' then
	               State <= InitS;
	            end if;
        end case;
      end if;
    end process;
end;

