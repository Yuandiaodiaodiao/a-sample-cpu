library verilog;
use verilog.vl_types.all;
entity cpu is
    port(
        pin_name1       : in     vl_logic;
        pin_name2       : in     vl_logic;
        pin_name3       : out    vl_logic
    );
end cpu;
