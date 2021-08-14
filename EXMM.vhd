library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;	 
use ieee.std_logic_unsigned.all;

entity EXMM is
	port(IR15_0_in: in std_logic_vector(15 downto 0);
			T1_in,T2_in,T3_in,IP_in, LS7_in: in std_logic_vector(15 downto 0);
			Z_in,Cr_in,Z_en: in std_logic;
			
			IR15_0_out: out std_logic_vector(15 downto 0);
			T1_out,T2_out,T3_out,IP_out, LS7_out: out std_logic_vector(15 downto 0);
			Z_out, Cr_out, Z_en_out: out std_logic;
			
			clk,EXMM_en,rst: in std_logic);
end entity;

architecture arch of EXMM is

signal IR15_0_temp: std_logic_vector(15 downto 0);
signal T1_temp, T2_temp,T3_temp, IP_temp, LS7_temp: std_logic_vector(15 downto 0);
signal Cr_temp, Z_temp, Z_en_temp: std_logic;
	begin
	
	IR15_0_out <= IR15_0_temp;
	LS7_out <= LS7_temp;
	T1_out <= T1_temp;
	T2_out <= T2_temp;
	T3_out <= T3_temp;
	IP_out <= IP_temp;
	Cr_out <= Cr_temp;
	Z_out <= Z_temp;
	Z_en_out <= Z_en_temp;
	
	EXMM_proc: process(clk,rst,EXMM_en,IR15_0_in,T1_in,T2_in,T3_in,IP_in, LS7_in,Z_in,Cr_in,Z_en)
	variable next_IR15_0_var: std_logic_vector(15 downto 0);
	variable next_T1_var, next_T2_var,next_T3_var, next_IP_var, next_LS7_var: std_logic_vector(15 downto 0);
	variable next_Cr_var, next_Z_var, next_Z_en_var: std_logic;
	
	begin
	
	next_IR15_0_var := IR15_0_in;
	next_T1_var := T1_in;
	next_T2_var := T2_in;
	next_T3_var := T3_in;
	next_IP_var := IP_in;
	next_LS7_var := LS7_in;
	next_Cr_var := Cr_in;
	next_Z_var := Z_in;
	next_Z_en_var := Z_en;
	
	if(clk'event and clk='1') then
	if (rst ='1') then
		
			IR15_0_temp <= "0000000000000000";
			T1_temp <= "0000000000000000";
			LS7_temp <= "0000000000000000";
			T2_temp <= "0000000000000000";
			T3_temp <= "0000000000000000";
			IP_temp <= "0000000000000000";
			Z_temp <= '0';
			Cr_temp <= '0';
			Z_en_temp <= '0';
			
		elsif(EXMM_en='1') then
			IR15_0_temp <= next_IR15_0_var;
			T1_temp <= next_T1_var;
			LS7_temp <= next_LS7_var;
			T2_temp <= next_T2_var;
			T3_temp <= next_T3_var;
			IP_temp <= next_IP_var;
			Z_temp <= next_Z_var;
			Cr_temp <= next_Cr_var;
			Z_en_temp <= next_Z_en_var;
		end if;
		
		
			
	end if;
	end process;
	end arch;
	
	