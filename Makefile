PROJ=counter
BUILD_DIR=build
SRC_DIR=src
all: build flash

flash: build
	openocd -f numato.cfg -c "transport select jtag; init; svf $(BUILD_DIR)/$(PROJ).svf; exit"

build: dir $(PROJ).svf
# This feels sucky but i don't know how to do it better...
dir: 
	mkdir -p $(BUILD_DIR)

clean:
	rm -rf build .build dependencies bool_and.f ./src/*.sv ./src/*.sv.map

.PHONY: flash build dir all clean

%.sv: ./$(SRC_DIR)/${PROJ}.veryl
	veryl build

%.json: ./$(SRC_DIR)/%.sv
	yosys -p "read_verilog -sv $(shell cat counter.f) oscillator.sv; synth_ecp5 -json $(BUILD_DIR)/$@"

%.cfg: %.json
	nextpnr-ecp5 --json $(BUILD_DIR)/$< --textcfg $(BUILD_DIR)/$@ --45k --package CABGA256 --lpf numato.lpf

%.svf: %.cfg
	ecppack --svf $(BUILD_DIR)/$@ --input $(BUILD_DIR)/$< 