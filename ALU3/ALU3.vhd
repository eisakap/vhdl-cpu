LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.all;

entity ALU3 is -- ALU unit includes Reg. 3
    port (
        clk, res : in std_logic;
        Reg1, Reg2 : in std_logic_vector(7 downto 0); -- 8-bit inputs A & B from Reg. 1 & Reg. 2
        opcode : in std_logic_vector(15 downto 0); -- 8-bit opcode from Decoder
        studentidin : in std_logic_vector(3 downto 0); -- 4-bit input for parity check
        R1 : out std_logic_vector(3 downto 0) -- 4-bit output
    );
end ALU3;

architecture calculation of ALU3 is
    -- Function to calculate even parity
    function even_parity(signal_in : std_logic_vector) return boolean is
        variable count : integer := 0;
    begin
        for i in signal_in'range loop
            if signal_in(i) = '1' then
                count := count + 1;
            end if;
        end loop;
        return (count mod 2 = 0); -- Return true for even parity, false otherwise
    end function;
begin
    process (clk, res)
    begin
        if res = '1' then
            R1 <= "----"; -- Undefined state on reset
        elsif (clk'EVENT AND clk = '1') then
            if opcode /= "0000000000000000" then
                if even_parity(studentidin) then
                    R1 <= "1111"; -- Even parity
                else
                    R1 <= "0000"; -- Odd parity
                end if;
            else
                R1 <= "----"; -- Don't care for opcode = 0
            end if;
        end if;
    end process;
end calculation;
