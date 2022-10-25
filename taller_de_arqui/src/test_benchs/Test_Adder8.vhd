-------------------------------------------------------------------------------
--
-- Title       : Test_Adder8
-- Design      : taller_de_arqui
-- Author      : franciscogaray
-- Company     : Facultad de Informatica UNLP
--
-------------------------------------------------------------------------------
--
-- File        : C:\My_Designs\taller_de_arqui\taller_de_arqui\src\Test_Adder8.vhd
-- Generated   : Tue Sep 27 12:26:41 2022
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
--{entity {Test_Adder8} architecture {Test_Adder8}}



entity Test_Adder8 is end;

architecture Driver of Test_Adder8 is
          component Adder8
            port (A, B: in Bit_Vector(7 downto 0); Cin: in Bit; Cout: out Bit; Sum: out Bit_Vector(7 downto 0));
          end component;
          signal A, B, Sum: Bit_Vector(7 downto 0);
          signal Cin, Cout: Bit := '0';
begin
         UUT: Adder8 port map (A, B, Cin, Cout, Sum);
    Stimulus: process
                variable Temp: Bit_Vector(7 downto 0);
            begin
                Temp := "00000000";
                for i in 1 to 32 loop
                  if i mod 2 /= 1 then
                    A <= Temp; B <= "00000001";
                  else
                    B <= Temp; A <= "00000001";
                  end if;
                  wait for 1 ns;
                  Temp := Sum;
                end loop;
                wait; -- to terminate simulation
            end process;
end;
