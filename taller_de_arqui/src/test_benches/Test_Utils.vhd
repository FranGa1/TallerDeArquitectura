-------------------------------------------------------------------------------
--
-- Title       : Test_Utils
-- Design      : taller_de_arqui
-- Author      : fran
-- Company     : Facultad de Informatica - UNLP
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\franc\Desktop\TallerDeArquitectura\taller_de_arqui\src\Test_Utils.vhd
-- Generated   : Fri Oct 28 20:51:23 2022
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
--{entity {Test_Utils} architecture {Test_Utils}}


entity Test_Utils is end;

use work.Utils.all;

architecture Driver of Test_Utils is
  signal N: Natural;
  signal B: Bit_Vector(5 downto 0);
  signal C: Bit;

  --use work.Utils.all;

begin

  CLK: Clock(C, 10 ns, 10 ns);
  
  process
    --use work.Utils.all;
  begin  
    for i in 0 to 127 loop
            B <= Convert (i, B'Length) after 10 ns;
            wait for 10 ns;
        end loop;
        wait;
  end process;

  N <= Convert (B) after 1 ns;

end;

