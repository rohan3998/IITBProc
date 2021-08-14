library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;	 
use ieee.std_logic_unsigned.all;

entity RREX is
	port(IR15_0_in, LS7_in, SE6_in, SE9_in : in std_logic_vector(15 downto 0);
			T1_in,T2_in,IP_in: in std_logic_vector(15 downto 0);
			
			IR15_0_out, LS7_out, SE6_out, SE9_out: out std_logic_vector(15 downto 0);
			T1_out,T2_out,IP_out: out std_logic_vector(15 downto 0);
			clk,RREX_en,rst: in std_logic);
end entity;

architecture arch of RREX is

signal IR15_0_temp, SE6_temp, LS7_temp, SE9_temp: std_logic_vector(15 downto 0);
signal T1_temp, T2_temp, IP_temp: std_logic_vector(15 downto 0);

	begin
	
	IR15_0_out <= IR15_0_temp;
	LS7_out <= LS7_temp;
	SE6_out <= SE6_temp;
	SE9_out <= SE9_temp;
	T1_out <= T1_temp;
	T2_out <= T2_temp;
	IP_out <= IP_temp;
	
	RREX_proc: process(clk,rst,RREX_en,IR15_0_in, LS7_in, SE6_in, SE9_in,T1_in,T2_in,IP_in)
	variable next_IR15_0_var, next_SE6_var, next_LS7_var, next_SE9_var: std_logic_vector(15 downto 0);
	variable next_T1_var, next_T2_var, next_IP_var: std_logic_vector(15 downto 0);
	
	begin
	
	next_IR15_0_var := IR15_0_in;
	next_SE6_var := SE6_in;
	next_LS7_var := LS7_in;
	next_SE9_var := SE9_in;
	next_T1_var := T1_in;
	next_T2_var := T2_in;
	next_IP_var := IP_in;
	
	
	if(clk'event and clk='1') then
	if( rst = '1') then
			IR15_0_temp <= "0000000000000000";
			LS7_temp <="0000000000000000";
			SE6_temp <= "0000000000000000";
			SE9_temp <= "0000000000000000";
			T1_temp<= "0000000000000000";
			T2_temp <= "0000000000000000";
			IP_temp <= "0000000000000000";
		
		elsif(RREX_en='1') then
			IR15_0_temp <= next_IR15_0_var;
			LS7_temp <= next_LS7_var;
			SE6_temp <= next_SE6_var;
			SE9_temp <= next_SE9_var;
			T1_temp<= next_T1_var;
			T2_temp <= next_T2_var;
			IP_temp <= next_IP_var;
			
		end if;
		
	end if;
	end process;
	end arch;
	
	