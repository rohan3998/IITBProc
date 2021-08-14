library ieee;
use ieee.std_logic_1164.all;

entity CS5 is
   port (IW: in std_logic_vector(15 downto 12);r:in std_logic;MEM_DIN2_ctrl,MEM_A2_ctrl,MEM_WRBAR2,MMWB_en:out std_logic);
end entity;

architecture Behave of CS5 is
  
begin

  process(IW,r)
	variable MEM_DIN2_ctrl_var,MEM_A2_ctrl_var,MMWB_en_var,MEM_WRBAR2_var:std_logic;
	
	begin
	MEM_DIN2_ctrl_var:='0';
	MEM_A2_ctrl_var:='0';
	MMWB_en_var:='1';
	MEM_WRBAR2_var:='1';

	
	if(IW="0000") then
		MEM_DIN2_ctrl_var:='0';
		MEM_A2_ctrl_var:='0';
		MMWB_en_var:='1';
		MEM_WRBAR2_var:='1';
	end if;
	if(IW="0010") then
		MEM_DIN2_ctrl_var:='0';
		MEM_A2_ctrl_var:='0';
		MMWB_en_var:='1';
		MEM_WRBAR2_var:='1';
	end if;
	if(IW="0001") then
		MEM_DIN2_ctrl_var:='0';
		MEM_A2_ctrl_var:='0';
		MMWB_en_var:='1';
		MEM_WRBAR2_var:='1';
	end if;
	if(IW="0011") then
		MEM_DIN2_ctrl_var:='0';
		MEM_A2_ctrl_var:='0';
		MMWB_en_var:='1';
		MEM_WRBAR2_var:='1';
	end if;
	if(IW="1000") then
		MEM_DIN2_ctrl_var:='0';
		MEM_A2_ctrl_var:='0';
		MMWB_en_var:='1';
		MEM_WRBAR2_var:='1';
	end if;
	if(IW="1001") then
		MEM_DIN2_ctrl_var:='0';
		MEM_A2_ctrl_var:='0';
		MMWB_en_var:='1';
		MEM_WRBAR2_var:='1';
	end if;
	if(IW="1100") then
		MEM_DIN2_ctrl_var:='0';
		MEM_A2_ctrl_var:='0';
		MMWB_en_var:='1';
		MEM_WRBAR2_var:='1';
	end if;
	if(IW="0100") then
		MEM_DIN2_ctrl_var:='0';
		MEM_A2_ctrl_var:='1';
		MMWB_en_var:='1';
		MEM_WRBAR2_var:='1';
	end if;

	if(IW="0101") then
		MEM_DIN2_ctrl_var:='0';
		MEM_A2_ctrl_var:='1';
		MMWB_en_var:='1';
		MEM_WRBAR2_var:='0';
	end if;

	if(IW="0110") then
		MEM_DIN2_ctrl_var:='0';
		MEM_A2_ctrl_var:='0';
		MMWB_en_var:='1';
		MEM_WRBAR2_var:='1';
	end if;

	if(IW="0111") then
		MEM_DIN2_ctrl_var:='1';
		MEM_A2_ctrl_var:='0';
		MMWB_en_var:='1';
		MEM_WRBAR2_var:='0';
	end if;

    if(r = '1') then
	 	MEM_DIN2_ctrl<='0';
		MEM_A2_ctrl<='0';
		MMWB_en<='0';
		MEM_WRBAR2<='1';
	else
	  	MEM_DIN2_ctrl<=MEM_DIN2_ctrl_var;
		MEM_A2_ctrl<=MEM_A2_ctrl_var;
		MMWB_en<=MMWB_en_var;
		MEM_WRBAR2<=MEM_WRBAR2_var;
	end if;

  end process;
		
end Behave;

