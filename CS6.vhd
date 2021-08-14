library ieee;
use ieee.std_logic_1164.all;

entity CS6 is
   port (IW: in std_logic_vector(3 downto 0);r, PE0, c_prev, z_prev:in std_logic;A3_ctrl, D3_ctrl:out std_logic_vector(1 downto 0); RF_en:out std_logic;lsb2: in std_logic_vector(1 downto 0));
end entity;

architecture struct of CS6 is		
 begin
 
	process(IW, r, PE0, lsb2,c_prev,z_prev)
	
	variable A3_ctrl_var, D3_ctrl_var: std_logic_vector(1 downto 0);
	variable RF_en_var: std_logic;
	
	begin
	case IW(3 downto 0) is 
	--add
		when "0000" =>
			A3_ctrl_var := "01";
			D3_ctrl_var := "11";
			if (lsb2="00") then
			RF_en_var := '1';
			elsif (lsb2="10" and c_prev ='1') then
			RF_en_var := '1';
			elsif (lsb2="01" and z_prev ='1') then
			RF_en_var := '1';
			else 
			RF_en_var := '0';
			end if;			 
										
	--ndu
		when "0010" =>
			A3_ctrl_var := "01";
			D3_ctrl_var := "11";
			if (lsb2="00") then
			RF_en_var := '1';
			elsif (lsb2="10" and c_prev ='1') then
			RF_en_var := '1';
			elsif (lsb2="01" and z_prev ='1') then
			RF_en_var := '1';
			else 
			RF_en_var := '0';
			end if;	
	--adi
		when "0001" =>
			A3_ctrl_var := "10";
			D3_ctrl_var := "11";
			RF_en_var := '1';
			
	--jal
		when "1000" =>
			A3_ctrl_var := "11";
			D3_ctrl_var := "00";
			RF_en_var := '1';
			
	--lw
		when "0100" =>
			A3_ctrl_var := "11";
			D3_ctrl_var := "10";
			RF_en_var := '1';
		
	--sw 
		when "0101" =>
			A3_ctrl_var := "00";
			D3_ctrl_var := "00";
			RF_en_var := '0';
			
	--beq
		when "1100" =>
			A3_ctrl_var := "00";
			D3_ctrl_var := "00";
			RF_en_var := '0';
			
	--lm
		when "0110" =>
			A3_ctrl_var :="00";
			D3_ctrl_var := "10";
			RF_en_var := '1';
			
	--sm
		when "0111" =>
			A3_ctrl_var :="00";
			D3_ctrl_var := "00";
			RF_en_var := '0';
			
	--lhi
		when "0011" =>
			A3_ctrl_var :="11";
			D3_ctrl_var := "01";
			RF_en_var := '1';
	-- 
	   when "1001" =>
			A3_ctrl_var :="11";
			D3_ctrl_var := "00";
			RF_en_var := '1';
		
	when others =>
	       A3_ctrl_var :="00";
			D3_ctrl_var := "00";
			RF_en_var := '0';
	end case;
	if(r = '1') then
		A3_ctrl <= "00";
		D3_ctrl <= "11";
		RF_en <= '0';	
	else
		A3_ctrl <= A3_ctrl_var;
		D3_ctrl <= D3_ctrl_var;
		RF_en <= RF_en_var;
	
		
	end if;

  end process;
		
end struct;