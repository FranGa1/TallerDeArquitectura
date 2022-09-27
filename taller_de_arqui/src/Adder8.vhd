-------------------------------------------------------------------------------
--
-- Title       : Adder8
-- Design      : taller_de_arqui
-- Author      : franciscogaray
-- Company     : Facultad de Informatica UNLP
--
-------------------------------------------------------------------------------
--
-- File        : C:\My_Designs\taller_de_arqui\taller_de_arqui\src\Adder8.vhd
-- Generated   : Tue Sep 27 12:16:02 2022
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
--{entity {Adder8} architecture {Adder8}}



entity Adder8 is
          port (A, B: in Bit_Vector(7 downto 0); Cin: in Bit; Cout: out Bit; Sum: out  Bit_Vector(7 downto 0));
end Adder8;

architecture Estructura of Adder8 is
          component FullAdder
            port (X, Y: in Bit; Cin: in Bit; Cout: out Bit; Sum: out Bit);
          end component;
          signal C: Bit_Vector(7 downto 0);
begin
          Stages:
            for i in 7 downto 0 generate    -- Cambiando el indice del vector se genera un sum de n bits
              LowBit:
                if i = 0 generate
                  FA: FullAdder port map  -- Un fa generara el bit menos significativo del sumador
                        (A(0), B(0), Cin, C(0), Sum(0));
                end generate;
              OtherBits:
                if i /= 0 generate
                  FA: FullAdder port map
                        (A(i), B(i), C(i-1), C(i), Sum(i));
                end generate;
            end generate;
          Cout <= C(7);
end;

			   
