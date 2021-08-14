library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;	 
use ieee.std_logic_unsigned.all;

entity IP is
	port (address: in std_logic_vector(15 downto 0);
			outp: out std_logic_vector(15 downto 0);
			clk,IP_en,rst: in std_logic);
end entity; 

architecture arch of IP is
signal temp: std_logic_vector(15 downto 0);

begin
	outp <= temp;
	process(address,IP_en,temp,rst,clk)
	variable next_temp_var: std_logic_vector(15 downto 0);
			begin
			next_temp_var := address;
				
			if(clk'event and clk='1') then
			
				if (rst ='1') then
				temp <= "0000000000000000";
				
				
				elsif(IP_en ='1') then
				temp <= next_temp_var;
				end if;
				
				
				
			end if;
end process;
end arch;