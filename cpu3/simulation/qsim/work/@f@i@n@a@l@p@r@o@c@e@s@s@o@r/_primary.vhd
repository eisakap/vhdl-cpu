library verilog;
use verilog.vl_types.all;
entity FINALPROCESSOR is
    port(
        oddeven         : out    vl_logic_vector(0 to 6);
        clk             : in     vl_logic;
        enable          : in     vl_logic;
        datain          : in     vl_logic;
        reset           : in     vl_logic;
        A               : in     vl_logic_vector(7 downto 0);
        B               : in     vl_logic_vector(7 downto 0);
        student         : out    vl_logic_vector(0 to 6)
    );
end FINALPROCESSOR;
