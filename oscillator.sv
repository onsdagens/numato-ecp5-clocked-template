module OSC_TOP (
    clk
);
  output clk;
  OSCG OSCinst0 (.OSC(clk));
  // 2.4MHz
  defparam OSCinst0.DIV = 128;
endmodule
