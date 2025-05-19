module bus_sync_tb ();
    // signal declaration
    parameter BUS_WIDTH = 8;
    reg clk1 , clk2 , EN , rst1 , rst2 ;
    reg [BUS_WIDTH-1:0] tx_data;
    wire [BUS_WIDTH-1:0] rx_data;
    // module instantiation
    bus_sync #(BUS_WIDTH) bus_sync_DUT(tx_data , clk1 , clk2 , rst1 , rst2 , EN , rx_data);

    // clock generation
    initial begin
        clk1 = 0;
        forever begin
            #10 clk1 = ~clk1;
        end
    end

    initial begin
        clk2 = 0;
        forever begin
            #5 clk2 = ~clk2;
        end
    end
    initial begin
        // initialize design
        rst1 = 1;
        rst2 = 1;
        tx_data = 8'b10101111;
        EN = 1;
        #6
        rst1 = 0;
        rst2 = 0;
        EN = 1;
        tx_data = 8'b10011001;
        #20;
        EN = 0;
        #20;
        EN = 1;
        tx_data = 8'b11111111;
        #20
        EN = 0;
        #20
        EN = 1;
        tx_data = 8'b10011000;
        #20
        EN = 0;
        #20
        tx_data = 8'b11001100;
        #40
        EN = 1;
        tx_data = 8'b00001111;
        #40
        $stop;
    end
endmodule