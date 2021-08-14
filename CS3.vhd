library ieee;
use ieee.std_logic_1164.all;

entity CS3 is
   port (IW: in std_logic_vector(15 downto 12);r, PE0:in std_logic;A2_ctrl, imm_addr_mux_ctrl, RREX_en, comp_en, reg16_mux_ctrl:out std_logic);
end entity;

architecture struct of CS3 is
 begin
 
	process(IW, r, PE0)
	
	variable comp_en_var, A2_ctrl_var,  imm_addr_mux_ctrl_var, RREX_en_var, reg16_mux_ctrl_var: std_logic;
	
	begin
	case IW(15 downto 12) is 
	--add
		when "0000" =>
			A2_ctrl_var := '0';
			imm_addr_mux_ctrl_var :='0';
			RREX_en_var := '1';
			comp_en_var := '0';
			reg16_mux_ctrl_var := '0';
			
	--ndu
		when "0010" =>
			A2_ctrl_var := '0';
			imm_addr_mux_ctrl_var :='0';
			RREX_en_var := '1';
			comp_en_var := '0';
			reg16_mux_ctrl_var := '0';
	--adi
		when "0001" =>
			A2_ctrl_var := '0';
			imm_addr_mux_ctrl_var :='0';
			RREX_en_var := '1';
			comp_en_var := '0';
			reg16_mux_ctrl_var := '0';
	--jal
		when "1000" =>
			A2_ctrl_var := '0';
			imm_addr_mux_ctrl_var :='1';
			RREX_en_var := '1';
			comp_en_var := '0';
			reg16_mux_ctrl_var := '0';
		when "1001" =>
			A2_ctrl_var := '0';
			imm_addr_mux_ctrl_var :='0';
			RREX_en_var := '1';
			comp_en_var := '0';
			reg16_mux_ctrl_var := '0';
	--lw
		when "0100" =>
			A2_ctrl_var := '0';
			imm_addr_mux_ctrl_var :='0';
			RREX_en_var := '1';
			comp_en_var := '0';
			reg16_mux_ctrl_var := '0';
		
	--lhi
		when "0011" =>
			A2_ctrl_var := '0';
			imm_addr_mux_ctrl_var :='0';
			RREX_en_var := '1';
			comp_en_var := '0';
			reg16_mux_ctrl_var := '0';
	--sw 
		when "0101" =>
			A2_ctrl_var := '0';
			imm_addr_mux_ctrl_var :='0';
			RREX_en_var := '1';
			comp_en_var := '0';
			reg16_mux_ctrl_var := '0';
	--beq
		when "1100" =>
			A2_ctrl_var := '0';
			imm_addr_mux_ctrl_var :='0';
			RREX_en_var := '1';
			comp_en_var := '1';
			reg16_mux_ctrl_var := '1';
	--lm
		when "0110" =>
			if( PE0 ='0') then
			A2_ctrl_var := '0';
			else
			A2_ctrl_var :='1';
			end if;
			
			imm_addr_mux_ctrl_var :='0';
			RREX_en_var := '1';
			comp_en_var := '0';
			reg16_mux_ctrl_var := '0';
	--sm
		when "0111" =>
			if( PE0 ='0') then
			A2_ctrl_var := '0';
			else
			A2_ctrl_var :='1';
			end if;
			
			imm_addr_mux_ctrl_var :='0';
			RREX_en_var := '1';
			comp_en_var := '0';
			reg16_mux_ctrl_var := '0';
	--
	when others =>
	       A2_ctrl_var :='0';
			 imm_addr_mux_ctrl_var :='0';
			RREX_en_var := '0';
			comp_en_var := '0';
			reg16_mux_ctrl_var := '0';
	end case;
	if(r = '1') then
		A2_ctrl <= '0';
		imm_addr_mux_ctrl <= '0';
		RREX_en <= '1';
	comp_en<= '0';	
	reg16_mux_ctrl <= '0';
	else
		A2_ctrl <= A2_ctrl_var;
		imm_addr_mux_ctrl <= imm_addr_mux_ctrl_var;
		RREX_en <= RREX_en_var;
	   comp_en <= comp_en_var;
		reg16_mux_ctrl <= reg16_mux_ctrl_var;
		
	end if;

  end process;
		
end struct;