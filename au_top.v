module au_top(
    input clk,
    input rst_n,
    output[7:0] led,
    output led_blue,
    output led_white,
    input usb_rx,
    output usb_tx
    );

    wire rst;
    
    reg[31:0] cnt;
    
    reset_conditioner reset_conditioner(.clk(clk), .in(!rst_n), .out(rst));
    
    clk_wiz_0 clk_wiz_0(
    // Clock out ports
    .clk_out1(clk2),
    // Status and control signals
    .reset(rst),
    .locked(locked),
    // Clock in ports
    .clk_in1(clk)
    );
        
    initial begin
        cnt <= 32'h00000000;
    end
    
    always @(posedge clk2) begin
        cnt <= cnt+1;
    end
    
    assign led[7] = cnt[24];
    assign led[6] = cnt[23];
    assign led[5] = cnt[22];
    assign led_blue = cnt[22];
    assign led_white = cnt[23];
        
    assign usb_tx = usb_rx;
    
endmodule