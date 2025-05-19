module bus_sync (tx_data , clk1 , clk2 , rst1 , rst2 , EN , rx_data);
    parameter BUS_WIDTH = 8;
    input clk1 , clk2 , EN , rst1 , rst2 ;
    input [BUS_WIDTH-1:0] tx_data;
    output reg [BUS_WIDTH-1:0] rx_data;
    reg [BUS_WIDTH-1:0] tx_data_flopped , tx_data_flopped_mux;
    reg EN_flopped1 , EN_flopped2 , EN_flopped3;

    // first flops (data flop and enable flop) 
    always @(posedge clk1 , posedge rst1) begin
        if (rst1) begin
            tx_data_flopped <= 0;
            EN_flopped1 <= 0;
        end
        else begin
            tx_data_flopped <= tx_data;
            EN_flopped1 <= EN;
        end
    end

    // second double flops sync for enable signal
    always @(posedge clk2 , posedge rst2) begin
        if (rst2) begin
            EN_flopped2 <= 0;
            EN_flopped3 <= 0;
        end
        else begin
            EN_flopped2 <= EN_flopped1;
            EN_flopped3 <= EN_flopped2;
        end
    end

    // mux
    always @(*) begin
        if (EN_flopped3) begin
            tx_data_flopped_mux = tx_data_flopped;
        end
        else begin
            tx_data_flopped_mux = rx_data;
        end
    end

    // last flop for rx data
    always @(posedge clk2 , posedge rst2) begin
        if (rst2) begin
            rx_data <= 0;
        end
        else begin
            rx_data <= tx_data_flopped_mux;
        end
    end

endmodule