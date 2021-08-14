library ieee;
use ieee.std_logic_1164.all;

entity forwarding is
   port (RF_A1,RF_A2: in std_logic_vector(2 downto 0); ip_ex,ip_mem,ip_wb: in std_logic_vector(15 downto 0); forward_out_1,forward_out_2: out std_logic_vector(3 downto 0) ; Zen_ex,Zen_mem,Zen_wb,rst: in std_logic);
end entity;

architecture Behave of forwarding is
  
begin

  process(ip_ex,ip_mem,ip_wb,RF_A1,RF_A2,rst,Zen_ex,Zen_mem,Zen_wb)
	variable forward_out_2_var,forward_out_1_var: std_logic_vector(3 downto 0);       
	begin
          forward_out_1_var := "0000";
			 forward_out_2_var := "0000";
-- forward_out_1
     case ip_ex(15 downto 12) is
--add
	  when "0000" =>
			if (Zen_ex = '1') then
          if (ip_ex(5 downto 3) = RF_A1) then 
             forward_out_1_var := "0001";
          end if;

			 end if;
				
--ndu
       when "0010" =>
          if (Zen_ex = '1') then
			 if (ip_ex(5 downto 3) = RF_A1) then 
             forward_out_1_var := "0001";
          end if;
	
			 end if;
			 
--adi
       when "0001" =>
          if (ip_ex(8 downto 6) = RF_A1) then 
             forward_out_1_var := "0001";
          end if;
	
--jal or jlr	
--	when ("1000" or "1001")  =>
  --        if (ip_ex(11 downto 9) = RF_A1) then 
    --         forward_out_1_var := "0011";
      --    end if;
	
--lhi	
	when "0011"  =>
          if (ip_ex(11 downto 9) = RF_A1) then 
             forward_out_1_var := "0010";
          end if;
	

       when others => null;
     end case;

	
	
	if(forward_out_1_var = "0000") then	
     case ip_mem(15 downto 12) is
--add
		
	  when "0000" =>
			if (Zen_mem = '1') then
		if (ip_mem(5 downto 3) = RF_A1) then 
             forward_out_1_var := "0011";
          end if;
			 end if;
--ndu
		
       when "0010" =>
			if (Zen_mem = '1') then
		if (ip_mem(5 downto 3) = RF_A1) then 
             forward_out_1_var := "0011";
          end if;
			 end if ;
--adi
       when "0001" =>
          if (ip_mem(8 downto 6) = RF_A1) then 
             forward_out_1_var := "0011";
          end if;
--jal or jlr	
--	when ("1000" or "1001") =>
 --         if (ip_mem(11 downto 9) = RF_A1) then 
   --          forward_out_1_var := "0100";
     --     end if;
--lhi	
	when "0011"  =>
          if (ip_mem(11 downto 9) = RF_A1) then 
             forward_out_1_var := "0100";
          end if;
--lw	
	when "0100" =>
          if (ip_mem(11 downto 9) = RF_A1) then 
             forward_out_1_var := "0101";
          end if;
       when others => null;
     end case;
	end if;
	

	if(forward_out_1_var = "0000") then	
     case ip_wb(15 downto 12) is
--add    
	 when "0000" =>
		if(Zen_wb = '1') then
          if (ip_wb(5 downto 3) = RF_A1) then 
             forward_out_1_var := "0110";
          end if;
			 end if;
		
--ndu		

       when "0010" =>
		 if(Zen_wb = '1') then
          if (ip_wb(5 downto 3) = RF_A1) then 
             forward_out_1_var := "0110";
          end if;
			 end if;
--adi			 
       when "0001" =>
          if (ip_wb(8 downto 6) = RF_A1) then 
             forward_out_1_var := "0110";
          end if;
--jal or jlr 	
	when ("1000" or "1001") =>
          if (ip_wb(11 downto 9) = RF_A1) then 
             forward_out_1_var := "0110";
          end if;
--lhi 
  when "0011"  =>
          if (ip_wb(11 downto 9) = RF_A1) then 
             forward_out_1_var := "0110";
          end if;

--lw	
	when "0100" =>
          if (ip_wb(11 downto 9) = RF_A1) then 
             forward_out_1_var := "0110";
          end if;


       when others => null;
     end case;
	end if;

--forward_out_2
     case ip_ex(15 downto 12) is
--add
	  when "0000" =>
			if (Zen_ex = '1') then
          if (ip_ex(5 downto 3) = RF_A2) then 
             forward_out_2_var := "0001";
          end if;

			 end if;
				
--ndu
       when "0010" =>
          if (Zen_ex = '1') then
			 if (ip_ex(5 downto 3) = RF_A2) then 
             forward_out_2_var := "0001";
          end if;
	
			 end if;
			 
--adi
       when "0001" =>
          if (ip_ex(8 downto 6) = RF_A2) then 
             forward_out_2_var := "0001";
          end if;
	
--jal or jlr	
	--when ("1000" or "1001")  =>
    --     if (ip_ex(11 downto 9) = RF_A2) then 
      --       forward_out_2_var := "0011";
        --  end if;
	
--lhi	
	when "0011"  =>
          if (ip_ex(11 downto 9) = RF_A2) then 
             forward_out_2_var := "0010";
          end if;
	

       when others => null;
     end case;

	
	
	if(forward_out_2_var = "0000") then	
     case ip_mem(15 downto 12) is
--add
		
	  when "0000" =>
			if (Zen_mem = '1') then
		if (ip_mem(5 downto 3) = RF_A2) then 
             forward_out_2_var := "0011";
          end if;
			 end if;
--ndu
		
       when "0010" =>
			if (Zen_mem = '1') then
		if (ip_mem(5 downto 3) = RF_A2) then 
             forward_out_2_var := "0011";
          end if;
			 end if ;
--adi
       when "0001" =>
          if (ip_mem(8 downto 6) = RF_A2) then 
             forward_out_2_var := "0011";
          end if;
--jal or jlr	
	--when ("1000" or "1001") =>
   --      if (ip_mem(11 downto 9) = RF_A2) then 
    --         forward_out_2_var := "0100";
      --    end if;
--lhi	
	when "0011"  =>
          if (ip_mem(11 downto 9) = RF_A2) then 
             forward_out_2_var := "0100";
          end if;
--lw	
	when "0100" =>
          if (ip_mem(11 downto 9) = RF_A2) then 
             forward_out_2_var := "0101";
          end if;
       when others => null;
     end case;
	end if;
	

	if(forward_out_2_var = "0000") then	
     case ip_wb(15 downto 12) is
--add    
	 when "0000" =>
		if(Zen_wb = '1') then
          if (ip_wb(5 downto 3) = RF_A2) then 
             forward_out_2_var := "0110";
          end if;
			 end if;
		
--ndu		

       when "0010" =>
		 if(Zen_wb = '1') then
          if (ip_wb(5 downto 3) = RF_A2) then 
             forward_out_2_var := "0110";
          end if;
			 end if;
--adi			 
       when "0001" =>
          if (ip_wb(8 downto 6) = RF_A2) then 
             forward_out_2_var := "0110";
          end if;
--jal or jlr 
	when ("1000" or "1001") =>
          if (ip_wb(11 downto 9) = RF_A2) then 
             forward_out_2_var := "0110";
          end if;


--lhi 
  when "0011"  =>
          if (ip_wb(11 downto 9) = RF_A2) then 
             forward_out_1_var := "0110";
          end if;

--lw	
	when "0100" =>
          if (ip_wb(11 downto 9) = RF_A2) then 
             forward_out_2_var := "0110";
          end if;


       when others => null;
     end case;
	end if;
	
          if(rst = '1') then
		forward_out_1 <= "0000";
		forward_out_2 <= "0000";
	else
		forward_out_1 <= forward_out_1_var;
		forward_out_2 <= forward_out_2_var;
	end if;

  end process;
		
end Behave;

