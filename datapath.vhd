library ieee ;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity datapath is
port ( clk,rst: in std_logic);
end entity;

architecture arch of datapath is

component PE is
port(inp: in std_logic_vector(7 downto 0);
	 PE_en: in std_logic;
	 outp: out std_logic_vector(2 downto 0);
	 PE0: out std_logic;
     new_inp: out std_logic_vector(7 downto 0));
end component;

component sixteen_bit_nand  is
  port (A: in std_logic_vector(15 downto 0);
  	    B: in std_logic_vector(15 downto 0); 
  	    S: out std_logic_vector(15 downto 0));
end component;

component reg1 is
port(x : in std_logic; y :out std_logic; clk,en,rst: in std_logic);
end component;

component ALU is
port(ALU_A, ALU_B : in std_logic_vector(15 downto 0); 
	 ALU_C : out std_logic_vector(15 downto 0); 
	 clk,ALU_en :in std_logic; 
	 oprd :in std_logic_vector(3 downto 0); 
	 ALU_cr, ALU_z :out std_logic) ;
end component;

component mux3_2x1 is
 port(s:in std_logic;
 	  a,b:in std_logic_vector(2 downto 0);
 	  z:out std_logic_vector(2 downto 0));
end component;

component mux3_4x1 is
 port(s:in std_logic_vector(1 downto 0);
 	  a,b,c,d:in std_logic_vector(2 downto 0);
 	  z:out std_logic_vector(2 downto 0));
end component;

component se6 is
 port(a:in std_logic_vector(5 downto 0); 
 	   	  z:out std_logic_vector(15 downto 0));
end component;

component RF is
port (RF_A1,RF_A2,RF_A3: in std_logic_vector(2 downto 0);
      RF_D3: in std_logic_vector(15 downto 0);
	  RF_D1, RF_D2, R7: out std_logic_vector(15 downto 0);
	  RF_en, clk: in std_logic);
end component;

component sixteen_bit_adder  is
  port (A: in std_logic_vector(15 downto 0);
  	    B: in std_logic_vector(15 downto 0);  
  	    S: out std_logic_vector(15 downto 0); 
  	    Cout :out std_logic);
end component;

component IR is
port (Ir: in std_logic_vector(15 downto 0);
      Ir_en: in std_logic;
	  Ir11_9, Ir8_6,Ir5_3: out std_logic_vector(2 downto 0);
	  Ir8_0: out std_logic_vector(8 downto 0);
	  Ir5_0: out std_logic_vector(5 downto 0));
end component;

component Full_Adder  is
  port (A, B, Cin: in std_logic; 
  	    S, Cout: out std_logic);
end component;

component LS7 is
 port(a:in std_logic_vector(8 downto 0); 
 	  z:out std_logic_vector(15 downto 0));
end component;

component mem is
port (address_1,address_2,Mem_datain_2: in std_logic_vector(15 downto 0);
	  Mem_wrbar_2: in std_logic;
	  Mem_dataout_1,Mem_dataout_2: out std_logic_vector(15 downto 0));
end component;

component mux16_4x1 is
 port(s:in std_logic_vector(1 downto 0);
 	  a,b,c,d:in std_logic_vector(15 downto 0);
 	  z:out std_logic_vector(15 downto 0));
end component;

component IP is
port (address: in std_logic_vector(15 downto 0);
	  outp: out std_logic_vector(15 downto 0);
	  IP_en,clk,rst: in std_logic);
end component;
 
component comparator is
port(inp1,inp2: in std_logic_vector(15 downto 0);
	 comp_en: in std_logic;
	 output: out std_logic);
end component;

component mux16_9x1 is
 port(s:in std_logic_vector(3 downto 0);
 	  a,b,c,d,e,f,g:in std_logic_vector(15 downto 0);
 	  z:out std_logic_vector(15 downto 0));
end component;

component mux16_2x1 is
 port(s:in std_logic;
 	  a,b:in std_logic_vector(15 downto 0);
 	  z:out std_logic_vector(15 downto 0));
end component;

component RREX is
port(IR15_0_in,LS7_in,SE6_in,SE9_in: in std_logic_vector(15 downto 0);
	 
	 T1_in,T2_in,IP_in: in std_logic_vector(15 downto 0);

     
     IR15_0_out,LS7_out,SE6_out,SE9_out: out std_logic_vector(15 downto 0);
	 
	 T1_out,T2_out,IP_out: out std_logic_vector(15 downto 0);
	 
	 clk,RREX_en,rst: in std_logic);
end component;

component EXMM is
port(IR15_0_in,LS7_in: in std_logic_vector(15 downto 0);
	 
	 T1_in,T2_in,T3_in,IP_in: in std_logic_vector(15 downto 0);
	 
	 Z_in,Cr_in, Z_en: in std_logic;

	 IR15_0_out,LS7_out: out std_logic_vector(15 downto 0);
	 
	 T1_out,T2_out,T3_out,IP_out: out std_logic_vector(15 downto 0);
	 
	 Z_out, Cr_out, Z_en_out: out std_logic;

	 clk,EXMM_en,rst: in std_logic);
end component;

component MMWB is
port( IR_in,T3_in,LS7_in,T4_in,IP_in: in std_logic_vector(15 downto 0);

	  Z_in,Cr_in, Z_en_in: in std_logic;

	  IR_out,T3_out,LS7_out,T4_out,IP_out: out std_logic_vector(15 downto 0);
	  
	  Z_out, Cr_out, Z_en_out: out std_logic;

	  clk,MMWB_en,rst: in std_logic);
end component;


component IDRR is
port( IR11_9_in, IR8_6_in, PE_in: in std_logic_vector(2 downto 0);
      
      IR15_0_in,IP_in, SE9_in, SE6_in, LS7_in: in std_logic_vector(15 downto 0);
--IR8_0_in:in std_logic_vector(8 downto 0);
--IR5_0_in: in std_logic_vector(5 downto 0);
      IR11_9_out, IR8_6_out, PE_out: out std_logic_vector(2 downto 0);
	  IR15_0_out,IP_out, SE9_out, SE6_out, LS7_out: out std_logic_vector(15 downto 0);
--IR8_0_out:out std_logic_vector(8 downto 0);
--IR5_0_out: out std_logic_vector(5 downto 0);

	  clk,IDRR_en,rst: in std_logic);
end component;

component IFID is
port( IP_in, IR_in: in std_logic_vector(15 downto 0);

	  IR_out,IP_out: out std_logic_vector(15 downto 0);

	  clk,rst,IFID_en: in std_logic);
end component;



component se9 is
 port(a:in std_logic_vector(8 downto 0); 
 	  
 	  z:out std_logic_vector(15 downto 0));
end component;

component mux8_2x1 is
 port(s:in std_logic;
 	  a,b:in std_logic_vector(7 downto 0);
 	  z:out std_logic_vector(7 downto 0));
end component;

component reg is
port(x : in std_logic_vector(7 downto 0); 
	 y :out std_logic_vector(7 downto 0); 
	 clk,en: in std_logic);
end component;


component CS1 is
	port(OP_IFID, OP_IDRR, OP_RREX, OP_EXMM: in std_logic_vector(3 downto 0);
	     rst,comp_out : in std_logic;
	     IP_inp: out std_logic_vector(1 downto 0);
		 IP_en, NOP_ctrl, IFID_en: out std_logic);
end component;

component forwarding is
   port (RF_a1,RF_a2: in std_logic_vector(2 downto 0); 
   		 ip_ex,ip_mem,ip_wb: in std_logic_vector(15 downto 0); 
   		 forward_out_1,forward_out_2: out std_logic_vector(3 downto 0) ; 
   		 Zen_ex,Zen_mem,Zen_wb,rst: in std_logic);
end component;



component CS2 is
	port(OP_IDRR: in std_logic_vector(3 downto 0);
	     rst,PE0: in std_logic;
		IDRR_en,PE_ctrl,PE_en: out std_logic);
end component;

component CS4 is
   port (IW: in std_logic_vector(15 downto 12);
   		 r:in std_logic;
   		 ALU_A_ctrl,ALU_en:out std_logic;
   		 ALU_B_ctrl:out std_logic_vector(1 downto 0);
   		 EXMM_en: out std_logic;
			 lsb2:in std_logic_vector(1 downto 0);
			 c_prev,z_prev:in std_logic);
end component;



component CS3 is
port (IW: in std_logic_vector(15 downto 12);
	  r, PE0:in std_logic;
	  A2_ctrl, imm_addr_mux_ctrl, RREX_en, comp_en, reg16_mux_ctrl :out std_logic);
end component;

component CS6 is
   port (IW: in std_logic_vector(15 downto 12);
   	     r, PE0, c_prev, z_prev:in std_logic;
   	     A3_ctrl, D3_ctrl:out std_logic_vector(1 downto 0); 
   	     RF_en:out std_logic;
			  lsb2: in std_logic_vector (1 downto 0));
end component;

component CS5 is
   port (IW: in std_logic_vector(15 downto 12);
   		 r:in std_logic;
   		 MEM_DIN2_ctrl,MEM_A2_ctrl,MEM_WRBAR2,MMWB_en:out std_logic);
end component;

component reg16 is
   port (x : in std_logic_vector(15 downto 0); y :out std_logic_vector(15 downto 0); clk: in std_logic);
	end component;

-- Connecting signals in IF stage
signal R7, Addr_out, IP_in, IFID_IP_in, IP_out: std_logic_vector(15 downto 0);

signal Addr_dummy_0, Addr_dummy_1, IFID_en, IP_en, NOP_ctrl : std_logic;

signal IP_inp: std_logic_vector(1 downto 0);

-- Connecting signals in ID stage
--signal IR11_9_in, IR8_6_in: std_logic_vector(2 downto 0);

--signal IR5_0: std_logic_vector(5 downto 0);

--signal IR8_0: std_logic_vector(8 downto 0);

--signal IR15_12_in: std_logic_vector(3 downto 0);

--signal IR1_0_in: std_logic_vector(1 downto 0);

signal SE6_in, SE9_in, IFID_IP_out, IFID_IR_out, LS7_in: std_logic_vector(15 downto 0);

signal PE_inp, new_inp, new_input: std_logic_vector(7 downto 0);

signal PE_in: std_logic_vector(2 downto 0);

signal PE0, PE_reg_en, PE_ctrl: std_logic;

signal PE_en,  IDRR_en : std_logic;

-- Connecting signals in RR stage
signal IR11_9_out, IR8_6_out,PE_out: std_logic_vector(2 downto 0);

signal IDRR_SE6_out, IDRR_SE9_out, IDRR_LS7_out, IDRR_IP_out, T1_in, T2_in,imm_adder_in,imm_adder_out,IDRR_IR_out, RREX_IR_out, reg16_mux_out: std_logic_vector(15 downto 0);



signal A2, A3: std_logic_vector(2 downto 0);

signal D1, D2, D3, reg16_out: std_logic_vector(15 downto 0);

signal A2_ctrl, RF_en, imm_adder_mux_ctrl,comp_en,comp_out,EXMM_Zen_out, MMWB_Z_en_out, reg16_mux_ctrl: std_logic;

signal A3_ctrl, D3_ctrl: std_logic_vector(1 downto 0);

signal D2_ctrl, D1_ctrl: std_logic_vector(3 downto 0);

--Connecting signals in EX stage
signal RREX_T1_out,RREX_T2_out,RREX_SE6_out,RREX_LS7_out,RREX_SE9_out,RREX_IP_out, ALU_A_in,ALU_B_in,T3_in,EXMM_IR_out: std_logic_vector(15 downto 0);


signal ALU_A_ctrl, C_in,Z_in, RREX_en: std_logic;

signal ALU_B_ctrl: std_logic_vector(1 downto 0);

signal ALU_en: std_logic;

-- Connecting signals in MM stage

signal EXMM_T3_out, EXMM_T1_out, EXMM_IP_out, EXMM_T2_out,EXMM_LS7_out : std_logic_vector(15 downto 0);

signal EXMM_Z_out, EXMM_C_out, EXMM_en : std_logic;

signal MEM_A2_ctrl, MEM_wrbar_2, MEM_DIN_2_ctrl :std_logic;

signal MEM_A2, MEM_DIN_2, MEM_DOUT_1, MEM_DOUT_2 : std_logic_vector(15 downto 0);


-- Connecting signals in WR stage
signal MMWB_IR_out,MMWB_T4_out, MMWB_IP_out,MMWB_T3_out,MMWB_LS7_out : std_logic_vector(15 downto 0);

signal MMWB_en, MMWB_Z_Out, MMWB_c_out : std_logic;





--------------------------------------------------------------------------------------------------------
-----------------------These pins will come from forwarding---------------------------------------------
--------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------
begin


--IF stage component mapping
mux16_4x1_1: mux16_4x1 port map (s => IP_inp, 
								 a => R7, 
								 b => Addr_out,
								 c =>reg16_mux_out, 
								 d=>RREX_T2_out, 
								 z => IP_in);


IP0: IP port map (address => IP_in, 
				  IP_en => IP_en, 
				  outp => IP_out,clk=>clk,rst=>rst);

addr0: sixteen_bit_adder port map (A => IP_out, 
								   B => "0000000000000001", 
								   S=> Addr_out, 
								   Cout => Addr_dummy_0);

ifid0: IFID port map(IP_in => IFID_IP_in, 
					 IR_in => MEM_DOUT_1, 
					 clk=>clk, rst=>rst,
					 IFID_en => IFID_en, 
					 IR_out => IFID_IR_out, 
					 IP_out=> IFID_IP_out);

nop_mux16_2x1 : mux16_2x1 port map(s=> NOP_ctrl, 
								   a => IP_out, 
								   b=> "1111000000000000", 
								   z=> IFID_IP_in); 

cs_if0: CS1 port map (OP_IFID=>IFID_IR_out(15 downto 12), 
	                  OP_IDRR=> IDRR_IR_out(15 downto 12), 
	                  OP_RREX=> RREX_IR_out(15 downto 12), 
							OP_EXMM => EXMM_IR_out(15 downto 12),
	                  rst=>rst, 
	                  comp_out=>comp_out, 
	                  IP_inp=>IP_inp,
	                  IP_en=> IP_en, 
	                  NOP_ctrl=> NOP_ctrl, 
	                  IFID_en=> IFID_en);

--ID stage component mapping
SE60: se6 port map(a => IFID_IR_out(5 downto 0),  
				   z => SE6_in);

SE90: se9 port map(a => IFID_IR_out(8 downto 0), 
				   z => SE9_in);

LS70: LS7 port map(a => IFID_IR_out(8 downto 0), 
				   z=> LS7_in);

PE1:  PE  port map(inp => new_input, 
	               PE_en => PE_en, 
	               outp => PE_in, 
	               PE0 => PE0, 
	               new_inp => new_inp);

idrr0: IDRR port map(IR11_9_in => IFID_IR_out(11 downto 9), 
	 				 IR8_6_in => IFID_IR_out(8 downto 6), 
	 				 PE_in => PE_in, 
	 				 IR15_0_in=>IFID_IR_out,
                     IP_in => IFID_IP_out, 
                     SE9_in => SE9_in, 
                     SE6_in => SE6_in, 
                     LS7_in => LS7_in,
					 IR11_9_out => IR11_9_out, 
					 IR8_6_out => IR8_6_out, 
					 PE_out => PE_out, 
					 IR15_0_out=>IDRR_IR_out,
                     IP_out => IDRR_IP_out, 
                     SE9_out => IDRR_SE9_out, 
                     SE6_out => IDRR_SE6_out, 
                     LS7_out => IDRR_LS7_out,
					 clk => clk, rst=>rst,
					 IDRR_en => IDRR_en);

mux8_2x1_1: mux8_2x1 port map ( a=> new_inp, 
							    b=> IFID_IR_out(7 downto 0),
							    s =>PE_ctrl,z=>PE_inp);
PE_reg1:reg port map (x=>PE_inp,
							y=>new_input,
							clk=>clk,
							en=>PE_reg_en);

--PE_reg1: reg port map ( x=> new_inp, 
--						y => new_input, 
--						clk => clk, 
--						en=> PE_reg_en);

cs_id0 : CS2 port map( OP_IDRR => IFID_IR_out(15 downto 12),
					   rst=>rst, 
					   PE0=>PE0, 
					   IDRR_en => IDRR_en, 
					   PE_ctrl=>PE_ctrl, 
					   PE_en=>PE_en); 


--RR stage components mapping
mux3_2x1_1: mux3_2x1 port map( a=> IR8_6_out, 
	 						   b=> PE_out, 
	 						   s=> A2_ctrl,
	 						   z=> A2);




rf0: RF port map( RF_A1=> IR11_9_out, 
				  RF_A2=> A2, 
				  RF_A3=> A3, 
				  RF_d1=> D1, 
				  RF_D2=>D2, 
				  RF_D3=>D3, 
				  R7=>R7, 
				  RF_en=> RF_en,
				  clk=>clk);

--mux16_4x1_2: mux16_4x1 port map( a=> IDRR_IP_out, 
	--							 b=>IDRR_LS7_out, 
		--						 c=>MMWB_T4_out, 
			--					 d=>MMWB_T3_out, 
				--				 s=> D3_ctrl, 
					--			 z=> D3);

mux16_9x1_D1: mux16_9x1 port map ( 
								   a=>D1, 
								   b=> T3_in,     
								   c=> RREX_LS7_out,
								   d=> EXMM_T3_out,
								   e=>EXMM_LS7_out, 
								   f=> MEM_DOUT_2,
								   g=>D3,  
								   s=> D1_ctrl, 
								   z=> T1_in);

mux16_9x1_D2: mux16_9x1 port map ( a=> D2, 
								   b=>T3_in, 
								   c=> RREX_LS7_out,     
								   d=>EXMM_T3_out, 
								   e=> EXMM_LS7_out, 
								   f=> MEM_DOUT_2,
								   g=>D3, 
								   s=> D2_ctrl, 
								   z=> T2_in);

rrex0 : RREX port map(IR15_0_in => IDRR_IR_out,
					  LS7_in=>IDRR_LS7_out, 
					  SE6_in=>IDRR_SE6_out,
					  SE9_in=>IDRR_SE9_out,
					  T1_in => T1_in, 
					  T2_in => T2_in, 
					  IP_in => IDRR_IP_out, 
					  IR15_0_out=>RREX_IR_out, 
					  LS7_out=>RREX_LS7_out,
					  SE6_out=>RREX_SE6_out,
					  SE9_out=>RREX_SE9_out,
					  T1_out => RREX_T1_out,
					  T2_out => RREX_T2_out, 
					  IP_out => RREX_IP_out, 
					  clk => clk,rst=>rst, 
					  RREX_en => RREX_en);

comp1:comparator port map( inp1=>T1_in,
						   inp2=>T2_in,
						   comp_en=>comp_en,
						   output=> comp_out);

addr1: sixteen_bit_adder port map( A=> IDRR_IP_out, 
								   B=> imm_adder_in, 
								   S => imm_adder_out, 
								   Cout => Addr_dummy_1);
regi16 : reg16 port map(x=>imm_adder_out, y=> reg16_out, clk=> clk);

mux16_2x1_imm: mux16_2x1 port map ( a=> IDRR_SE6_out, 
									b=> IDRR_SE9_out, 
									s=> imm_adder_mux_ctrl, 
									z=> imm_adder_in);

forw : forwarding port map( RF_a1 => IR11_9_out, 
							RF_a2=> A2, 
							ip_ex=> RREX_IR_out, 
							ip_mem=> EXMM_IR_out, 
							ip_wb=> MMWB_IR_out,
							rst=>rst, 
							forward_out_1 => D1_ctrl, 
							forward_out_2 => D2_ctrl, 
							Zen_ex=> ALU_en, 
							Zen_mem => EXMM_Zen_out, 
							Zen_wb => MMWB_Z_en_out);

cs_rr0 : CS3 port map( IW=> IDRR_IR_out(15 downto 12), 
	                   r=>rst, 
	                   PE0=>PE0, 
	                   A2_ctrl=>A2_ctrl,
							comp_en => comp_en, 
	                   imm_addr_mux_ctrl=>imm_adder_mux_ctrl,
							reg16_mux_ctrl => reg16_mux_ctrl, 
	                   RREX_en=>RREX_en);

reg16_mux16_2x1_imm: mux16_2x1 port map ( a=> reg16_out, 
									b=> imm_adder_out, 
									s=> reg16_mux_ctrl, 
									z=> reg16_mux_out);
--EX stage components mapping
mux16_2x1_ALUA: mux16_2x1 port map( a=>RREX_T1_out,
									b=>RREX_SE6_out,
									s=>ALU_A_ctrl,
									z=>ALU_A_in);

mux16_4x1_ALUB: mux16_4x1 port map( a=>RREX_T2_out,
									b=>RREX_SE6_out,
									c=>RREX_SE9_out,
									d=>"XXXXXXXXXXXXXXXX",
									s=>ALU_B_ctrl,
									z=>ALU_B_in);

ALU1: ALU port map( ALU_A => ALU_A_in, 
					ALU_B => ALU_B_in, 
					ALU_C => T3_in, 
					clk => clk, 
					ALU_en=> ALU_en, 
					oprd => RREX_IR_out(15 downto 12),
					ALU_cr => C_in, 
					ALU_z => Z_in);

EXMM1:EXMM port map( IR15_0_in=> RREX_IR_out,
					 LS7_in=>RREX_LS7_out, 
					 T2_in => RREX_T2_out, 
					 T3_in=>T3_in,
					 clk=>clk,rst=>rst,
					 T1_in=>RREX_T1_out,
					 IP_in=>RREX_IP_out,
					 Z_in=>Z_in,
					 Cr_in=>C_in, 
					 Z_en => ALU_en,  
					 IR15_0_out=>EXMM_IR_out,
					 LS7_out=>EXMM_LS7_out,
					 T3_out=>EXMM_T3_out,
					 T2_out=>EXMM_T2_out,
					 T1_out=>EXMM_T1_out,
					 IP_out=> EXMM_IP_out,
					 Z_out=>EXMM_Z_out,
					 Cr_out=>EXMM_C_out,
					 EXMM_en=>EXMM_en, 
					 Z_en_out => EXMM_Zen_out);

cs_ex0 : CS4 port map( IW=>RREX_IR_out(15 downto 12), 
					   r=>rst, 
					   ALU_A_ctrl => ALU_A_ctrl, 
					   ALU_en=>ALU_en, 
					   ALU_B_ctrl => ALU_B_ctrl, 
					   EXMM_en => EXMM_en,
						lsb2=>RREX_IR_out(1 downto 0),
						c_prev=>C_in,z_prev=>Z_in);

--MM stage components mapping
mux16_2x1_mm: mux16_2x1 port map( a=>EXMM_T1_out,
								  b=>EXMM_T3_out,
								  s=>MEM_A2_ctrl,
								  z=>MEM_A2);

Memory: mem port map( address_1=>IFID_IP_in,
					  address_2=>MEM_A2,
					  Mem_datain_2=>MEM_DIN_2, 
					  Mem_wrbar_2=>MEM_wrbar_2,
					  Mem_dataout_1=>MEM_DOUT_1,
					  Mem_dataout_2=>MEM_DOUT_2);

mux16_2x1_md: mux16_2x1 port map( a=>EXMM_T2_out,
								  b=>EXMM_T1_out,
								  s=>MEM_DIN_2_ctrl,
								  z=>MEM_DIN_2);

cs_mm0 : CS5 port map( IW=> EXMM_IR_out(15 downto 12), 
					   r=>rst, 
					   MEM_DIN2_ctrl => MEM_DIN_2_ctrl, 
					   MEM_A2_ctrl => MEM_A2_ctrl, 
					   MEM_WRBAR2 => MEM_wrbar_2, 
					   MMWB_en => MMWB_en);

-- WB stage components mapping
MMWB1: MMWB port map( T3_in=>EXMM_T3_out,
						IR_in => EXMM_IR_out,
					  LS7_in=>EXMM_LS7_out,
					  T4_in=>MEM_DOUT_2,
					  IP_in=>EXMM_IP_out,
					  Z_en_in=> EXMM_Zen_out,
					  Z_in=>EXMM_Z_out,
					  Cr_in=>EXMM_C_out,
					  T3_out=>MMWB_T3_out, 
					  LS7_out=>MMWB_LS7_out, 
					  Z_en_out => MMWB_Z_en_out,
					  T4_out=>MMWB_T4_out,
					  IP_out=>MMWB_IP_out,
					  Z_out=>MMWB_Z_out, 
					  Cr_out=>MMWB_C_out,
					  clk=>clk,rst=>rst,
					  MMWB_en=>MMWB_en,
					  IR_out => MMWB_IR_out); 


mux16_4x1_WB : mux16_4x1 port map( s => D3_ctrl, 
								   d=>MMWB_T3_out, 
								   c=> MMWB_T4_out, 
								   b=> MMWB_LS7_out, 
								   a=> MMWB_IP_out, --MMWB_IP_out original;
								   z=> D3);

mux3_4x1_1: mux3_4x1 port map( a=> PE_out, 
							   b=>MMWB_IR_out(5 downto 3), 
							   c=>MMWB_IR_out(8 downto 6), 
							   d=>MMWB_IR_out(11 downto 9), 
							   s=> A3_ctrl, 
							   z=>A3);								
									
cs_wb0 : CS6 port map( IW=>MMWB_IR_out(15 downto 12), 
					   r=>rst, 
					   PE0=>PE0, 
					   A3_ctrl=> A3_ctrl, 
					   D3_ctrl=>D3_ctrl, 
					   RF_en=>RF_en,
						lsb2 => MMWB_IR_out(1 downto 0),
						c_prev => MMWB_C_out,
						z_prev => MMWB_Z_out);


end arch;
