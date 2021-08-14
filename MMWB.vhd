library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;	 
use ieee.std_logic_unsigned.all;


-- Missing IR, PE and resets
entity MMWB is
	port( IR_in, LS7_in, T3_in, T4_in,IP_in: in std_logic_vector(15 downto 0);
			Z_in,Cr_in, Z_en_in: in std_logic;
			
			IR_out,LS7_out, T3_out, T4_out, IP_out: out std_logic_vector(15 downto 0);
			Z_out, Cr_out, Z_en_out: out std_logic;
			
			clk,MMWB_en,rst: in std_logic);
end entity;

architecture arch of MMWB is


signal IR_temp, LS7_temp, T3_temp, T4_temp, IP_temp: std_logic_vector(15 downto 0);
signal Cr_temp, Z_temp,Z_en_temp: std_logic;
	begin
	
	LS7_out <= LS7_temp;
	T3_out <= T3_temp;
	T4_out <= T4_temp;
	IP_out <= IP_temp;
	Cr_out <= Cr_temp;
	Z_out <= Z_temp;
	Z_en_out <= Z_en_temp;
	IR_out <= IR_temp;
	
	MMWB_proc: process(clk,rst,MMWB_en,LS7_in, T3_in, T4_in,IP_in,Z_in,Cr_in, Z_en_in, IR_in)
	variable next_IR_var,next_LS7_var, next_T3_var, next_T4_var, next_IP_var: std_logic_vector(15 downto 0);
	variable next_Cr_var, next_Z_var,next_Z_en_var: std_logic;
	
	
	
	
	begin
	
	next_LS7_var:= LS7_in;
	next_T3_var := T3_in;
	next_T4_var := T4_in;
	next_IP_var := IP_in;
	next_Cr_var := Cr_in;
	next_Z_var := Z_in;
	next_Z_en_var := Z_en_in;
	next_IR_var := IR_in;
	
	
	
	if(clk'event and clk='1') then
		if (rst ='1') then
		
			LS7_temp <= "0000000000000000";
			T3_temp <= "0000000000000000";
			T4_temp <= "0000000000000000";
			IP_temp <= "0000000000000000";
			Z_temp <= '0';
			Cr_temp <= '0';
			Z_en_temp <= '0';
			IR_temp <= "0000000000000000";
		elsif(MMWB_en='1') then
			LS7_temp <= next_LS7_var;
			T3_temp <= next_T3_var;
			T4_temp <= next_T4_var;
			IP_temp <= next_IP_var;
			 Z_temp <= next_Z_var;
			Cr_temp <= next_Cr_var;
			Z_en_temp <= next_Z_en_var;
			IR_temp <= next_IR_var;
		end if;
		
	end if;
	end process;
	end arch;
	
	
