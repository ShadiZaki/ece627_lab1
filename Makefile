iverilog:
	iverilog mac.v dut_tb.v
	./a.out
	gtkwave lab1.vcd

modelsim:	
	vsim -do lab1.tcl

