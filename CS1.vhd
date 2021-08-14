library ieee ;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity CS1 is
	port(OP_IFID, OP_IDRR, OP_RREX, OP_EXMM: in std_logic_vector(3 downto 0);
	       rst,comp_out : in std_logic;
			IP_inp: out std_logic_vector(1 downto 0);
			IP_en, NOP_ctrl, IFID_en: out std_logic);
end entity;

architecture arch of CS1 is

begin 


process(OP_IFID, OP_IDRR, OP_RREX, OP_EXMM,rst, comp_out)
		variable IP_inp_var:std_logic_vector(1 downto 0);
		variable IP_en_var, NOP_ctrl_var, IFID_en_var: std_logic;
	begin

	IP_inp_var := "01";
	IP_en_var := '1';
	IFID_en_var := '1';
	NOP_ctrl_var := '0';
    
	 
	 if(OP_IFID = "1100") or (OP_IFID = "1000") or (OP_IFID = "1001") then
		  NOP_ctrl_var := '1';
		  IP_inp_var := "01" ;
		  IP_en_var := '0';
		  end if;
		 
	--lw/beq/jal/jlr
	
	if((OP_IDRR = "0100") or (OP_IDRR = "1100") or (OP_IDRR = "1000") or (OP_IDRR = "1001") or (OP_IDRR="1111")) then
		  NOP_ctrl_var := '1';
		  IP_en_var := '0';
		  IP_inp_var := "01";
	end if;

	--jal
   if(OP_EXMM = "1100") or (OP_EXMM = "1000") or (OP_EXMM = "1001") then
		  NOP_ctrl_var := '0';
		  IP_inp_var := "01" ;
		  IP_en_var := '1';
		 --end if ;
	elsif(OP_RREX = "1000") then
		  NOP_ctrl_var := '1';
		  IP_inp_var := "10" ;
		  IP_en_var := '1';
		 --end if ;
	elsif(OP_RREX = "1000") then
		  NOP_ctrl_var := '1';
		  IP_inp_var := "10" ;
		  IP_en_var := '1';
		 --end if ;
	---jlr
	elsif(OP_RREX = "1001") then
		  NOP_ctrl_var := '0';
		  IP_inp_var := "11" ;
		  IP_en_var := '1';
		 --end if ;
	--beq
	elsif(OP_RREX = "0100") then
	     NOP_ctrl_var := '0';
		  IP_inp_var := "01" ;
		  IP_en_var := '1';
	elsif(OP_IDRR = "1100") then
			 if(comp_out = '1') then
				NOP_ctrl_var := '0';
				IP_inp_var := "10" ;
				IP_en_var := '1';
				else
				NOP_ctrl_var := '0';
				IP_inp_var := "01" ;
				IP_en_var := '1';
			end if; 

	elsif(OP_RREX = "1100") then
			 if(comp_out = '1') then
				NOP_ctrl_var := '0';
				IP_inp_var := "10" ;
				IP_en_var := '1';
				else
				NOP_ctrl_var := '0';
				IP_inp_var := "01" ;
				IP_en_var := '1';
			end if; 
	end if;
		 
				  
	if(rst='1') then
		IP_inp <= "01";
		IP_en <= '0';
		IFID_en <= '0';
		NOP_ctrl <= '0';

	else
		IP_inp <= IP_inp_var;
		IP_en <= IP_en_var;
		IFID_en <= IFID_en_var;
		NOP_ctrl <= NOP_ctrl_var;
	end if;
end process;
end arch;

	