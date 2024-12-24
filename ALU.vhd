library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU2 is
port( Clk	:	in    	std_logic;
    	A, B	:	in    	unsigned(7 downto 0);
    	OP    	:	in    	unsigned(15 downto 0);
    	R1    	:	out	unsigned(3 downto 0);
    	R2    	:	out	unsigned(3 downto 0);
    	Neg	:	out	std_logic);
end ALU2;

architecture calculation of ALU2 is
signal Reg1, Reg2, Result : unsigned(7 downto 0);
begin
Reg1 <= A;
Reg2 <= B;
process (Clk, OP)
	begin
	if(rising_edge (Clk)) THEN
    	case OP is
        	when "0000000000000001" =>   	 
                    	Result(0)<= Reg1(7);
                    	Result(1)<= Reg1(6);
                    	Result(2)<= Reg1(5);
                    	Result(3)<= Reg1(4);
                    	Result(4)<= Reg1(3);
                    	Result(5)<= Reg1(2);
                    	Result(6)<= Reg1(1);
                    	Result(7)<= Reg1(0);
        	when "0000000000000010" =>   	 
                    	Result(0)<= Reg1(4);
                    	Result(1)<= Reg1(5);
                    	Result(2)<= Reg1(6);
                    	Result(3)<= Reg1(7);
                    	Result(4)<= '1';
                    	Result(5)<= Reg1(1);
                    	Result(6)<= Reg1(2);
                    	Result(7)<= Reg1(3);
        	when "0000000000000100" =>   	 
                    	Result(7 downto 4) <= NOT Reg2(7 downto 4);
                    	Result(3 downto 0) <= Reg2(3 downto 0);
        	when "0000000000001000" =>
                	if (Reg2 > Reg1) then
                    	Result <= Reg1;
                	else
                    	Result <= (Reg2);
                	end if;
        	when "0000000000010000" => Result <= Reg1 + Reg2 + "00000100";
        	when "0000000000100000" => Result <= Reg1 + "00000011";
        	when "0000000001000000" =>	 
                    	Result(0)<= Reg1(0);
                    	Result(1)<= Reg2(1);
                    	Result(2)<= Reg2(2);
                    	Result(3)<= Reg2(3);
                    	Result(4)<= Reg2(4);
                    	Result(5)<= Reg2(5);
                    	Result(6)<= Reg2(6);
                    	Result(7)<= Reg2(7);
        	when "0000000010000000" => Result <= Reg1 XNOR Reg2;
        	WHEN OTHERS => Result <= "--------"; -- Don't care
        	end case;
    	end if;
	end process;
R1 <= Result (3 downto 0);
R2 <= Result (7 downto 4);
end calculation;

