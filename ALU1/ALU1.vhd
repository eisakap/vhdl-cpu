LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.all;

entity ALU1 is -- ALU unit includes Reg. 3
    port (
        clk, res : in std_logic;
        Reg1, Reg2 : in std_logic_vector(7 downto 0); -- 8-bit inputs A & B from Reg. 1 & Reg. 2
        opcode : in std_logic_vector(15 downto 0); -- 8-bit opcode from Decoder
        R1 : out std_logic_vector(3 downto 0);
		  R2 : out std_logic_vector(3 downto 0);
		  Sign2 : OUT STD_LOGIC;
		  Sign1 : OUT STD_LOGIC
    );
end ALU1;

architecture calculation of ALU1 is
	SIGNAL Result : STD_LOGIC_VECTOR(7 downto 0);
begin
    process (clk, res)
    begin
        if res = '1' then
            Result <= "00000000";
        elsif (clk'EVENT AND clk = '1') then
            case opcode is
                when "0000000000000010" =>
					 Result<= reg1+reg2;
                    -- Do addition for Reg1 and Reg2
                when "0000000000000100" =>
					 Result<=reg1-reg2;
                    -- Do subtraction for Reg1 and Reg2
                when "0000000000001000" =>
					 Result <=not reg1;
                    -- Do inverse
                when "0000000000010000" =>
					 Result<= not(reg1 and reg2);
                    -- Do Boolean NAND
                when "0000000001000000" =>
					 Result<= not(reg1 or reg2);
                    -- Do Boolean NOR
                when "0000000010000000" =>
					 Result<= (reg1 and reg2);
                    -- Do Boolean AND
                when "0000000100000000" =>
					 Result<=(reg1 xor reg2);
                    -- Do Boolean XOR
                when "0000001000000000" => 
					 Result<= (reg1 or reg2);
                    -- Do Boolean OR
                when others =>
					 Result <="--------"; 
                    -- Don't care, do nothing
            end case;

        end if;
		  		R1<= Result(3 downto 0);
				R2<=Result(7 downto 4);
				Sign2<=Result(7);
				Sign1<=Result(3);
    end process;
end calculation;
