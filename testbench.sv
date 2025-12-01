`timescale 1ns/1ps
module testbench;
  import parameters::*;
  wire SDA, SCL;
    logic clk = 0;
  always #(halfPeriod) clk =~clk; //250kHz
  
    I2C_generic i2c(.SDA (SDA), .SCL (SCL), .clk(clk));
    I2C_driver i2c_driv(.SDA(SDA), .SCL(SCL), .clk(clk));
  
    initial begin
    $dumpfile("dump.vcd");
      $dumpvars(0,testbench);
      #10000
      $finish(0);
    end   
  
endmodule