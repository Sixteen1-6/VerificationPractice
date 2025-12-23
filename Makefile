SIM ?= icarus
TOPLEVEL_LANG ?= verilog

VERILOG_SOURCES = $(PWD)/rtl/counter.v
TOPLEVEL = counter
MODULE = tb.test_counter

include $(shell cocotb-config --makefiles)/Makefile.sim

clean ::
	rm -rf __pycache__ *.vcd *.log build/ tb/__pycache__
	```


