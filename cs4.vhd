library ieee;
use ieee.std_logic_1164.all;

entity CS4 is
   port (IW: in std_logic_vector(3 downto 0);r:in std_logic;ALU_A_ctrl,ALU_en:out std_logic;ALU_B_ctrl:out std_logic_vector(1 downto 0);EXMM_en: out std_logic;lsb2:in std_logic_vector(1 downto 0);c_prev,z_prev:in std_logic);
end entity;

architecture Behave of CS4 is
  
begin

  process(IW,r,c_prev,z_prev,lsb2)
	variable ALU_en_var,ALU_A_ctrl_var,EXMM_en_var:std_logic;
	variable ALU_B_ctrl_var:std_logic_vector(1 downto 0);
	begin
	ALU_en_var:='0';
	ALU_A_ctrl_var:='0';
	ALU_B_ctrl_var:="00";
	EXMM_en_var:='0';

	if(IW="0000") then
		--ALU_en_var:='1';
		ALU_A_ctrl_var:='0';
		ALU_B_ctrl_var:="00";
		EXMM_en_var:='1';
		if (lsb2="00") then
			ALU_en_var := '1';
		elsif (lsb2="10" and c_prev ='1') then
			ALU_en_var := '1';
		elsif (lsb2="01" and z_prev ='1') then
			ALU_en_var := '1';
		else 
			ALU_en_var := '0';
		end if;		
	end if;
	
	if(IW="0011") then
		ALU_en_var:='0';
		ALU_A_ctrl_var:='0';
		ALU_B_ctrl_var:="00";
		EXMM_en_var:='1';
	end if;
   if(IW="1100") then
		ALU_en_var:='0';
		ALU_A_ctrl_var:='0';
		ALU_B_ctrl_var:="00";
		EXMM_en_var:='1';
	end if;

	if(IW="0010") then
		--ALU_en_var:='1';
		ALU_A_ctrl_var:='0';
		ALU_B_ctrl_var:="00";
		EXMM_en_var:='1';
		if (lsb2="00") then
			ALU_en_var := '1';
		elsif (lsb2="10" and c_prev ='1') then
			ALU_en_var := '1';
		elsif (lsb2="01" and z_prev ='1') then
			ALU_en_var := '1';
		else 
			ALU_en_var := '0';
		end if;	
	end if;

	if(IW="0001") then
		ALU_en_var:='1';
		ALU_A_ctrl_var:='0';
		ALU_B_ctrl_var:="01";
		EXMM_en_var:='1';
	end if;
   if(IW="0100") then
		ALU_en_var:='1';
		ALU_A_ctrl_var:='1';
		ALU_B_ctrl_var:="00";
		EXMM_en_var:='1';
	end if;
   if(IW="0101") then
		ALU_en_var:='0';
		ALU_A_ctrl_var:='1';
		ALU_B_ctrl_var:="00";
		EXMM_en_var:='1';
	end if;
   if(IW="1000") then
		ALU_en_var:='0';
		ALU_A_ctrl_var:='1';
		ALU_B_ctrl_var:="00";
		EXMM_en_var:='1';
	end if;
   if(IW="1001") then
		ALU_en_var:='0';
		ALU_A_ctrl_var:='1';
		ALU_B_ctrl_var:="00";
		EXMM_en_var:='1';
	end if;

    if(r = '1') then
	 	ALU_en<= '0';
		ALU_A_ctrl <= '0';
		ALU_B_ctrl <= "00";	
		EXMM_en<='0';
	else
	  	ALU_en <= ALU_en_var;
		ALU_A_ctrl <= ALU_A_ctrl_var;
		ALU_B_ctrl <= ALU_B_ctrl_var;	
		EXMM_en<=EXMM_en_var;
	end if;

  end process;
		
end Behave;

