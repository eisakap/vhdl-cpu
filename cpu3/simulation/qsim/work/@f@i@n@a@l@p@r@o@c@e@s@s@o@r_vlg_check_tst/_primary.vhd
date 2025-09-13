library verilog;
use verilog.vl_types.all;
entity FINALPROCESSOR_vlg_check_tst is
    port(
        oddeven         : in     vl_logic_vector(0 to 6);
        student         : in     vl_logic_vector(0 to 6);
        sampler_rx      : in     vl_logic
    );
end FINALPROCESSOR_vlg_check_tst;
