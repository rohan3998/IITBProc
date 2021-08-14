library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;	 
use ieee.std_logic_unsigned.all;

entity IFID is
	port( IP_in, IR_in: in std_logic_vector(15 downto 0);
			IR_out,IP_out: out std_logic_vector(15 downto 0);
			clk,IFID_en,rst: in std_logic);
end entity;

architecture arch of IFID is


signal IR_temp, IP_temp: std_logic_vector(15 downto 0);

	begin
	IR_out <= IR_temp;
	IP_out <= IP_temp;
	
	
	IFID_proc: process(clk,rst,IFID_en,IP_in,IR_in)
	
	variable next_IP_in_var,next_IR_in_var: std_logic_vector(15 downto 0);
	
	begin
	
	next_IP_in_var:=IP_in;
	next_IR_in_var:=IR_in;
	
	if(clk'event and clk='1') then
		if (rst='1') then
			IR_temp <= "0000000000000000";
			IP_temp <= "0000000000000000";
		
		elsif(IFID_en='1') then
			
			IR_temp <= next_IR_in_var;
			IP_temp <= next_IP_in_var;
			
		end if;
		
	end if;

	end process;
	end arch;
	
	