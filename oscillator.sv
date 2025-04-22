module OSC_TOP (
    clk
);
  output clk;
  OSCG OSCinst0 (.OSC(clk));
  // 2.4MHz (http://www.latticesemi.com/view_document?document_id=50465 page 26)
  // valid divider values 2 (~155.0MHz) - 128 (~2.4MHz)
  defparam OSCinst0.DIV = 128;
endmodule
