LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY signsseg IS
PORT (bcd : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
	Sign: IN STD_LOGIC;
	leds, leds2: OUT STD_LOGIC_VECTOR (1 TO 7));
END signsseg;

ARCHITECTURE Behavior OF signsseg IS
BEGIN
	PROCESS (bcd)
	BEGIN
		CASE bcd IS
			WHEN "0000" => leds <= "0000001";
			leds2 <= "1111111";
			WHEN "0001" => leds <= "1001111";
								leds2 <= "1111111";
			WHEN "0010" => leds <= "0010010";
								leds2 <= "1111111";
			WHEN "0011" => leds <= "0000110";
								leds2 <= "1111111";
			WHEN "0100" => leds <= "1001100";
								leds2 <= "1111111";
			WHEN "0101" => leds <= "0100100";
								leds2 <= "1111111";
			WHEN "0110" => leds <= "0100000";
								leds2 <= "1111111";
			WHEN "0111" => leds <= "0001111";
								leds2 <= "1111111";
			WHEN "1000" => leds <= "0000000";
								leds2 <= "1111111";
			WHEN "1001" => leds <= "1001111";
								leds2 <= "1111110";
			WHEN "1010" => leds <= "0010010"; 
								leds2 <= "1111110";
			WHEN "1011" => leds <= "0000110";
								leds2 <= "1111110";
			WHEN "1100" => leds <= "1001100";
								leds2 <= "1111110";
			WHEN "1101" => leds <= "0100100";
								leds2 <= "1111110";
			WHEN "1110" => leds <= "0100000";
								leds2 <= "1111110";
			WHEN "1111" => leds <= "0001111";
								leds2 <= "1111110";
			WHEN OTHERS => leds <= "1111111";
		END CASE;
	END PROCESS;
END Behavior;
