library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;	 
use ieee.std_logic_unsigned.all;

entity IDRR is
	port(IR11_9_in, IR8_6_in, PE_in: in std_logic_vector(2 downto 0);
			IP_in, SE6_in, SE9_in, LS7_in: in std_logic_vector(15 downto 0);
			IR15_0_in: in std_logic_vector(15 downto 0);
			
			
			IR11_9_out, IR8_6_out, PE_out: out std_logic_vector(2 downto 0);
			IP_out, SE6_out, SE9_out, LS7_out: out std_logic_vector(15 downto 0);
			IR15_0_out: out std_logic_vector(15 downto 0);
			
			
			clk,IDRR_en,rst: in std_logic);
end entity;

architecture arch of IDRR is

signal IR11_9_temp, IR8_6_temp, PE_temp: std_logic_vector(2 downto 0);
signal IP_temp, SE6_temp, SE9_temp, LS7_temp: std_logic_vector(15 downto 0);
signal IR15_0_temp: std_logic_vector(15 downto 0);

	begin
	IR11_9_out <= IR11_9_temp;
	IR8_6_out <= IR8_6_temp;
	PE_out <= PE_temp;
	IP_out <= IP_temp;
	IR15_0_out <= IR15_0_temp;
	SE6_out <= SE6_temp;
	SE9_out <= SE9_temp;
	LS7_out <= LS7_temp;
	
	IDRR_proc: process(clk,rst,IDRR_en,IR11_9_in, IR8_6_in, PE_in,IP_in, SE6_in, SE9_in, LS7_in,IR15_0_in)
	
	variable next_IR11_9_var, next_IR8_6_var, next_PE_var: std_logic_vector(2 downto 0);
	variable next_IP_var, next_SE6_var, next_SE9_var, next_LS7_var: std_logic_vector(15 downto 0);
	variable next_IR15_0_var: std_logic_vector(15 downto 0);
	
	
	
	begin
	next_IR11_9_var:=IR11_9_in;
	next_IR8_6_var:=IR8_6_in;
	next_PE_var:=PE_in;
	next_IP_var:=IP_in;
	next_SE6_var:=SE6_in;
	next_SE9_var:=SE9_in;
	next_LS7_var:=LS7_in;
	next_IR15_0_var:=IR15_0_in;
	
	
	if(clk'event and clk='1') then
		if( rst ='1') then
			IR11_9_temp <= "000";
			IR8_6_temp <= "000";
			PE_temp <= "000";
			LS7_temp <= "0000000000000000";
			SE6_temp <= "0000000000000000";
			SE9_temp <= "0000000000000000";			
			IP_temp <= "0000000000000000";			
			IR15_0_temp <= "0000000000000000";
	
		elsif(IDRR_en='1') then		
			IR11_9_temp <= next_IR11_9_var;
			IR8_6_temp <= next_IR8_6_var;
			PE_temp <= next_PE_var;
			LS7_temp <= next_LS7_var;
			SE6_temp <= next_SE6_var;
			SE9_temp <= next_SE9_var;			
			IP_temp <= next_IP_var;			
			IR15_0_temp <= next_IR15_0_var;
		end if;
		
		
		end if; 
	end process;
	end arch;
	
	