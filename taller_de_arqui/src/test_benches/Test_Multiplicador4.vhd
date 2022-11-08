-------------------------------------------------------------------------------
--
-- Title       : Test_Multiplicador4
-- Design      : taller_de_arqui
-- Author      : fran
-- Company     : Facultad de Informatica - UNLP
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\franc\Desktop\TallerDeArquitectura\taller_de_arqui\src\Test_Multiplicador4.vhd
-- Generated   : Sat Nov  5 20:34:34 2022
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
--{entity {Test_Multiplicador4} architecture {Test_Multiplicador4}}


use work.Utils.all;

entity Test_Multiplicador4 is
end Test_Multiplicador4;

--}} End of automatically maintained section

architecture Test_Multiplicador4 of Test_Multiplicador4 is
	component Multiplicador4
		port (A,B: in Bit_Vector(3 downto 0); STB, CLK: in Bit; Done:out Bit; Result: out Bit_Vector(7 downto 0));
	end component;
	signal A,B: Bit_Vector(3 downto 0);
	signal STB, Done, C: Bit;
	signal Result: Bit_Vector(7 downto 0);	
begin		
	-- Número de legajo 02714/4	 
	CLK: Clock(C, 9.26 ns, 9.26 ns); -- XX = 27 * 2 = 54 Mhz
	UUT: Multiplicador4 port map (A, B, STB, C, Done, Result);

	Stimulus: process					  
	begin	  		
		A <= "0111";  -- A = 7
		B <= "0001" ; -- B = 1				  
		STB <= '1', '0' after 25ns;
		wait for 500ns;
		wait;
	end process;


end Test_Multiplicador4;
