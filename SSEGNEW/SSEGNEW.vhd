LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY SSEGNEW IS
    PORT (
        bcd : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        leds1 : OUT STD_LOGIC_VECTOR(0 TO 6)
    );
END SSEGNEW;

ARCHITECTURE Behavior OF SSEGNEW IS
BEGIN
    PROCESS (bcd)
    BEGIN
        CASE bcd IS
                                                -- abcdefg (reversed display)
            WHEN "1111" => leds1 <= "1000100";  -- y  odd reversed
            WHEN "0000" => leds1 <= "0001001";  -- -n even reversed
            WHEN OTHERS => leds1 <= "1111111";  -- Clear or turn off all segments (all 1s)
        END CASE;
    END PROCESS;



END Behavior;


