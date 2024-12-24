library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU1 is
port( Clk	:	in    	std_logic;
    	A, B	:	in    	unsigned(7 downto 0);
    	OP    	:	in    	unsigned(15 downto 0);
    	R1    	:	out	unsigned(3 downto 0);
    	R2    	:	out	unsigned(3 downto 0);
    	Neg	:	out	std_logic);
end ALU1;

architecture calculation of ALU1 is
signal Reg1, Reg2, Result : unsigned(7 downto 0);
begin
Reg1 <= A;
Reg2 <= B;
process (Clk, OP)
	begin
	if(rising_edge (Clk)) THEN
    	case OP is
        	when "0000000000000001" => Result <= (Reg1 + Reg2);
        	when "0000000000000010" =>
                	if (Reg2 > Reg1) then
                    	Result <= (Reg1+(NOT Reg2 + 1));
                    	Neg <= '1';
                	else
                    	Result <= (Reg1-Reg2);
                 	Neg <= '0';
                	end if;
        	when "0000000000000100" => Result <= (NOT Reg1);
        	when "0000000000001000" => Result <= (Reg1 NAND Reg2);
        	when "0000000000010000" => Result <= (Reg1 NOR Reg2);
        	when "0000000000100000" => Result <= (Reg1 AND Reg2);
        	when "0000000001000000" => Result <= (Reg1 XOR Reg2);
        	when "0000000010000000" => Result <= (Reg1 OR Reg2);
        	WHEN OTHERS => Result <= "--------";
        	end case;
    	end if;
	end process;
R1 <= Result (3 downto 0);
R2 <= Result (7 downto 4);
end calculation;
