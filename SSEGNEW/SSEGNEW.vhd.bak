LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY SSEG IS
    PORT (
        bcd : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        Sign : IN STD_LOGIC;
        leds1 : OUT STD_LOGIC_VECTOR(0 TO 6);
        leds2 : OUT STD_LOGIC_VECTOR(0 TO 6)
    );
END SSEG;

ARCHITECTURE Behavior OF SSEG IS
BEGIN
    PROCESS (bcd)
    BEGIN
        CASE bcd IS
                                                -- abcdefg (reversed display)
            WHEN "0000" => leds1 <= "0000001";  -- 0 reversed
            WHEN "0001" => leds1 <= "1001111";  -- 1 reversed
            WHEN "0010" => leds1 <= "0010010";  -- 2 reversed
            WHEN "0011" => leds1 <= "0000110";  -- 3 reversed
            WHEN "0100" => leds1 <= "1001100";  -- 4 reversed
            WHEN "0101" => leds1 <= "0100100";  -- 5 reversed
            WHEN "0110" => leds1 <= "0100000";  -- 6 reversed
            WHEN "0111" => leds1 <= "0001111";  -- 7 reversed
				WHEN "1001" => leds1 <= "0001111";  -- -7 reversed
            WHEN "1000" => leds1 <= "0000000";  -- -8 reversed            
            WHEN "1010" => leds1 <= "0100000";  -- -6 reversed
            WHEN "1011" => leds1 <= "0100100";  -- -5 reversed
            WHEN "1100" => leds1 <= "1001100";  -- -4 reversed
            WHEN "1101" => leds1 <= "0000110";  -- -3 reversed
            WHEN "1110" => leds1 <= "0010010";  -- -2 reversed
            WHEN "1111" => leds1 <= "1001111";  -- -1 reversed
            WHEN OTHERS => leds1 <= "1111111";  -- Clear or turn off all segments (all 1s)
        END CASE;
    END PROCESS;

    PROCESS (Sign)
    BEGIN
        IF Sign = '1' THEN
            leds2 <= "1111110";  -- Reverse of "0000001" (all 1s except the last segment)
        ELSE
            leds2 <= "1111111";  -- All segments off in the reversed form (all 1s)
        END IF;
    END PROCESS;

END Behavior;


