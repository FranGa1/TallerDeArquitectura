-------------------------------------------------------------------------------
--
-- Title       : Test_latch8
-- Design      : taller_de_arqui
-- Author      : franciscogaray
-- Company     : Facultad de Informatica UNLP
--
-------------------------------------------------------------------------------
--
-- File        : C:\My_Designs\taller_de_arqui\taller_de_arqui\src\Test_latch8.vhd
-- Generated   : Fri Sep  9 12:41:03 2022
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
--{entity {Test_latch8} architecture {Test_latch8}}



entity Test_latch8 is end;

architecture Driver of Test_latch8 is
     component Latch8
        port (D: in Bit_Vector(7 downto 0); Clk: in Bit; Pre: in Bit; Clr: in Bit; Q: out Bit_Vector(7 downto 0));
     end component;
     signal D, Q: Bit_Vector(7 downto 0);
     signal Clk, Pre, Clr: Bit := '1';
begin
      UUT: Latch8 port map (D, Clk, Pre, Clr, Q);
     Stimulus: process
variable Temp: Bit_Vector(7 downto 0);
begin
-- Set the latch
                Pre <= '0', '1' after 5 ns;
                wait for 10 ns;
-- Clear the latch
                Clr <= '0', '1' after 5 ns;
                wait for 10 ns;
-- Load the latch
                Temp := "00010011";
                for i in 1 to 8 loop
                  D <= Temp;
                  Clk <= '0' after 1 ns, '1' after 5 ns;
                  wait for 10 ns;
                  assert not Q = Temp report "Load Failed";
                  Temp := Temp(0) & Temp(7 downto 1);
                end loop;
                 wait; -- to terminate simulation
             end process;
end;

