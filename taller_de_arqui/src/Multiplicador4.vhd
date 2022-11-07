-------------------------------------------------------------------------------
--
-- Title       : Multiplicador4
-- Design      : taller_de_arqui
-- Author      : Francisco Garay
-- Company     : Facultad de Informatica - UNLP
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\franc\Desktop\TallerDeArquitectura\taller_de_arqui\src\Multiplicador4.vhd
-- Generated   : Fri Oct 28 23:19:32 2022
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : Multiplicador de dos números en BSS de 4 bits
--
-------------------------------------------------------------------------------

entity Multiplicador4 is
	port (A,B: in Bit_Vector(3 downto 0); STB, CLK: in Bit; Done:out Bit; Result: out Bit_Vector(7 downto 0));
end Multiplicador4;

--}} End of automatically maintained section

architecture Multiplicador4 of Multiplicador4 is
	component ShiftN
	    port (CLK: in  Bit;  CLR: in  Bit; LD: in  Bit;
	          SH: in  Bit;  DIR: in  Bit;
	          D: in Bit_Vector; Q: out  Bit_Vector);
	end component;
	component Latch8
        port (D: in Bit_Vector(7 downto 0); Clk: in Bit; Pre: in Bit; Clr: in Bit; Q: out Bit_Vector(7 downto 0));
	end component;
	component Adder8
            port (A, B: in Bit_Vector(7 downto 0); Cin: in Bit; Cout: out Bit; Sum: out Bit_Vector(7 downto 0));
     end component;
	component Controller
    port (STB, CLK, LSB, Stop: in   Bit;
             Init, Shift, Add, Done: out  Bit);
  	end component;
	component DFF
		port (Preset, Clear, Clock, Data: in Bit; Q, Qbar: out Bit);
	end component;

	signal A_shifted, B_shifted: Bit_Vector(7 downto 0);
	signal Result_adder, Result_ACC: Bit_Vector(7 downto 0);
	signal STOP, LSB, Carrys, Shift, Add, Init, not_Init, Done_in, not_CLK, dont_care: Bit;
begin
	SR_A: ShiftN port map (CLK => CLK, CLR => '0', LD => Init, SH => Shift, DIR => '0', D => A, Q => A_shifted);
	SR_B: ShiftN port map (CLK => CLK, CLR => '0', LD => Init, SH => Shift, DIR => '1', D => B, Q => B_shifted);
					
	not_Init <= not Init;	  
	ACC: Latch8 port map (D => Result_adder, Clk => Add, Pre => '1', Clr => not_Init, Q => Result_ACC);
													   
	ACC_out: Latch8 port map (D => Result_ACC, Clk => Done_in, Pre => '1', Clr => not_Init, Q => Result);

	Adder: Adder8 port map (A => Result_ACC, B => B_shifted, Cin => Carrys, Cout => Carrys, Sum => Result_adder);

	STOP <= not (A_shifted(0) or A_shifted(1) or A_shifted(2) or A_shifted(3));
	LSB <= A_shifted(0);
					
	not_CLK <= not CLK;	   
	FSM_Controller: Controller port map (STB => STB, CLK => not_CLK, LSB => LSB, Stop => STOP, Init => Init, Shift => Shift, Add => Add, Done => Done_in);

	FFD_for_done_delay: DFF port map (Preset => '1', Clear => not_Init, Clock => Done_in, Data => '1', Q => Done, Qbar => dont_care);

end Multiplicador4;
