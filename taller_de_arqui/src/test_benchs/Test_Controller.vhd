-------------------------------------------------------------------------------
--
-- Title       : Test_Controller
-- Design      : taller_de_arqui
-- Author      : fran
-- Company     : Facultad de Informatica - UNLP
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\franc\Desktop\TallerDeArquitectura\taller_de_arqui\src\Test_Controller.vhd
-- Generated   : Mon Oct 24 11:27:27 2022
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
--{entity {Test_Controller} architecture {Test_Controller}}



entity Test_Controller is end;

architecture Driver of Test_Controller is
  component Controller
    port (STB, CLK, LSB, Stop: in   Bit;
             Init, Shift, Add, Done: out  Bit);
  end component;
  signal STB, LSB, Done, Init, Shift, Add, Stop: Bit;
  signal CLK, ENA: Bit := '1';
begin
  UUT: Controller port map (STB, CLK, LSB, Stop, Init, Shift, Add, Done);
  Clock:  CLK <= not (CLK and ENA) after 10 ns;
  Enable: ENA <= '0' after 500 ns;
  Stimulus: process
      variable Val: Bit_Vector(7 downto 0);
    begin
      wait until CLK'Event and CLK='1';
      STB <= '1', '0' after 20 ns;
      Val := "01110101";
      loop
        LSB <= Val(0);
        Stop <= not (Val(7) or Val(6) or Val(5) or Val(4) or
                           Val(3) or Val(2) or Val(1) or Val(0));
        wait until CLK'Event and CLK='1';
        exit when Done = '1';
        if Shift = '1' then
           Val := '0' & Val(7 downto 1);
        end if;
      end loop;	  
	  STB <= '1'; 
      wait;
    end process;
end;

