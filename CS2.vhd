library ieee ;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity CS2 is
	port(OP_IDRR: in std_logic_vector(3 downto 0);
	       rst,PE0: in std_logic;
			IDRR_en,PE_ctrl,PE_en: out std_logic);
end entity;

architecture arch of CS2 is

begin 


process(OP_IDRR,rst,PE0)
		variable IDRR_en_var,PE_ctrl_var,PE_en_var: std_logic;
	begin
    
	 
	IDRR_en_var := '1';
	PE_ctrl_var := not(PE0);
	PE_en_var := '0';
   
	case OP_IDRR is
     --add
	  when "0110" =>
	  PE_en_var := '1';
	  
	  when "0111" =>
	  PE_en_var := '1';
	  
	  when others => null;
	  end case;
	
		 
	if(rst='1') then
		
		IDRR_en <= '0';
		PE_ctrl <= '1';
		PE_en <= '0';

	else
		
		IDRR_en <= IDRR_en_var;
		PE_ctrl <= PE_ctrl_var;
		PE_en <= PE_en_var;

	end if;
end process;
end arch;

	