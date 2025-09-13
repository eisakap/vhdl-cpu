LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.all;

entity ALU2 is -- ALU unit includes Reg. 3
    port (
        clk, res : in std_logic;
        Reg1, Reg2 : in std_logic_vector(7 downto 0); -- 8-bit inputs A & B from Reg. 1 & Reg. 2
        opcode : in std_logic_vector(15 downto 0); -- 8-bit opcode from Decoder
        R1 : out std_logic_vector(3 downto 0);
        R2 : out std_logic_vector(3 downto 0);
        Sign2 : OUT STD_LOGIC;
        Sign1 : OUT STD_LOGIC
    );
end ALU2;

architecture calculation of ALU2 is
    SIGNAL Result : STD_LOGIC_VECTOR(7 downto 0);
begin
    process (clk, res)
    begin
        if res = '1' then
            Result <= "00000000";
        elsif (clk'EVENT AND clk = '1') then
            case opcode is
                -- Function 1: Shift A to right by 2 bits, input bit = 1 (SHR)
                when "0000000000000001" =>
                    Result(7 downto 2) <= Reg1(5 downto 0);
                    Result(1 downto 0) <= "11"; -- Input bit = 1

                -- Function 2: Produce the difference of A and B, then increment by 4
                when "0000000000000010" =>
                    Result <= std_logic_vector(signed(Reg1) - signed(Reg2) + 4);

                -- Function 3: Find the greater value of A and B
                when "0000000000000100" =>
                    if Reg1 > Reg2 then
                        Result <= Reg1;
                    else
                        Result <= Reg2;
                    end if;

                -- Function 4: Swap upper 4 bits of A with lower 4 bits of B
                when "0000000000001000" =>
                    Result(7 downto 4) <= Reg2(3 downto 0);
                    Result(3 downto 0) <= Reg1(7 downto 4);

                -- Function 5: Increment A by 1
                when "0000000000010000" =>
                    Result <= Reg1 + 1;

                -- Function 6: Produce the result of ANDing A and B
                when "0000000000100000" =>
                    Result <= Reg1 AND Reg2;

                -- Function 7: Invert the upper 4 bits of A
                when "0000000001000000" =>
                    Result(7 downto 4) <= NOT Reg1(7 downto 4);
                    Result(3 downto 0) <= Reg1(3 downto 0);

                -- Function 8: Rotate B to the left by 3 bits (ROL)
                when "0000000010000000" =>
                    Result(7 downto 3) <= Reg2(4 downto 0);
                    Result(2 downto 0) <= Reg2(7 downto 5);

                -- Default case: Do nothing
                when others =>
                    Result <= (others => '-');
            end case;
        end if;
    end process;

    R1 <= Result(3 downto 0);
    R2 <= Result(7 downto 4);
    Sign2 <= Result(7);
    Sign1 <= Result(3);
end calculation;
