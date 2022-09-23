-------------------------------------------------------------------------------
--
-- Title       : ejercicio1
-- Design      : taller_de_arqui
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\taller_de_arqui\taller_de_arqui\src\ejercicio1.vhd
-- Generated   : Fri Aug 26 10:10:04 2022
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
--{entity {ejercicio1} architecture {ejercicio1}}


entity Test_DFF is 
end;

architecture Driver of Test_DFF is 
	component DFF
	   port (Preset, Clear, Clock, Data: in Bit; Q, Qbar: out Bit);
	end component;
	signal Preset, Clear: Bit := '1';
	signal Clock, Data, Q, QBar: Bit;
begin
  UUT: DFF port map (Preset, Clear, Clock, Data, Q, Qbar);	  
  
  
  --reloj: Process(Clock)
--  	begin
--	  Clock <= not Clock after 2 ns;
--	end process;
  
  Stimulus: Process
  Begin		 
	  -- tiempo min de hold = 0.5 ps | cuando D 1 -> 0		   
	  -- tiempo min de hold = 0.5 ps | cuando D 0 -> 1
	  
	  Clear <= '1';
	  Preset <= '0' after  1ns, '1' after 2 ns; 
	  -- tiempo min set up = 0.51 ps = 510 fs cuando D 0->1	 
	  -- tiempo min set up = 1000.51 ps cuando D 1-> 0
	  Data <= '1';
	  wait for 2ns;
	  
	  Data <= '0' after 3999 ps, '1' after 5000.5 ps;	
	  Clock <= '1'after 5 ns;
	  wait for 5 ns;
	  --Clock <= '1' after 4 ns;
	  
	  --Clock <= '0';
--	  Clock <= '1' after 1001 ps;
	  
	  --Data <= '0';
	  
	 -- Clock <= '0';
--	  Clock <= '1' after 1001ps, '0' after 2002 ns;
	  
		-- chequeo de preset --y clear
--	  Preset <= '0'; wait for 5 ns; Preset <= '1'; wait for 5 ns;
--	  Clear <= '0'; wait for 5 ns; Clear <= '1'; wait for 5 ns;
--		-- interaccion de preset y clear
--	  Preset <= '0'; Clear <= '0'; wait for 5 ns;
--	  Preset <= '1'; Clear <= '1'; wait for 5 ns;
--		-- limpiar
--	  Clear <= '0', '1' after 5 ns; wait for 10 ns;
-- 	--chequeo de datos y clock			   
--	  Preset <= '1';
--	  Clear <= '1';
--	  Data <= '1' after 1 ns; Clock <= '0' after 1 ns, '1' after 5 ns; wait for 10 ns;
--	  Data <= '0' after 1 ns; Clock <= '0' after 1 ns, '1' after 5 ns; wait for 10 ns;
--	  -- limpiar	   
--	  wait for 10 ns;
--	  Clear <= '0', '1' after 5 ns; wait for 10 ns; 
--		--interaccion de preset y clock
--	  Data <= '0'; Preset <= '0', '1' after 10 ns;
--	  Clock <= '0', '1' after 5 ns; wait for 10 ns;
	  Wait;
	end process;
end;


---------------------------------------------------------------------------------
----
---- Title       : ejercicio1
---- Design      : taller_de_arqui
---- Author      : 
---- Company     : 
----
---------------------------------------------------------------------------------
----
---- File        : c:\My_Designs\taller_de_arqui\taller_de_arqui\src\ejercicio1.vhd
---- Generated   : Fri Aug 26 10:10:04 2022
---- From        : interface description file
---- By          : Itf2Vhdl ver. 1.22
----
---------------------------------------------------------------------------------
----
---- Description : 
----
---------------------------------------------------------------------------------
--
----{{ Section below this comment is automatically maintained
----   and may be overwritten
----{entity {ejercicio1} architecture {ejercicio1}}
--
--
--entity Test_DFF is 
--end;
--
--architecture Driver of Test_DFF is 
--	component DFF
--	   port (Preset, Clear, Clock, Data: in Bit; Q, Qbar: out Bit);
--	end component;
--	signal Preset, Clear: Bit := '1';
--	signal Clock, Data, Q, QBar: Bit;
--begin
--  UUT: DFF port map (Preset, Clear, Clock, Data, Q, Qbar);	  
--  --reloj: Process(Clock)
----  	begin
----	  Clock <= not Clock after 1 ns;
----	end process;
--  
--  Stimulus: Process
--  Begin		 
--	  
--	  
--	  Preset <= '1';
--	  Clear <= '0' after 1 ns, '1' after 2 ns; 
--	  
--	  Data <= '1';	
--	  wait for 5 ns;
--	  
--	  Clock <= '0';
--	  Clock <= '1' after 999 ps, '0' after 1888 ps;
--	  
--		-- chequeo de preset --y clear
----	  Preset <= '0'; wait for 5 ns; Preset <= '1'; wait for 5 ns;
----	  Clear <= '0'; wait for 5 ns; Clear <= '1'; wait for 5 ns;
----		-- interaccion de preset y clear
----	  Preset <= '0'; Clear <= '0'; wait for 5 ns;
----	  Preset <= '1'; Clear <= '1'; wait for 5 ns;
----		-- limpiar
----	  Clear <= '0', '1' after 5 ns; wait for 10 ns;
---- 	--chequeo de datos y clock			   
----	  Preset <= '1';
----	  Clear <= '1';
----	  Data <= '1' after 1 ns; Clock <= '0' after 1 ns, '1' after 5 ns; wait for 10 ns;
----	  Data <= '0' after 1 ns; Clock <= '0' after 1 ns, '1' after 5 ns; wait for 10 ns;
----	  -- limpiar	   
----	  wait for 10 ns;
----	  Clear <= '0', '1' after 5 ns; wait for 10 ns; 
----		--interaccion de preset y clock
----	  Data <= '0'; Preset <= '0', '1' after 10 ns;
----	  Clock <= '0', '1' after 5 ns; wait for 10 ns;
--	  Wait;
--	end process;
--end;


