# Copyright (c) 2021 Alex Forencich
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

TOPLEVEL_LANG = verilog

SIM ?= icarus
WAVES ?= 0

COCOTB_HDL_TIMEUNIT = 1ns
COCOTB_HDL_TIMEPRECISION = 1ps

DUT      = eth_mac_phy_10g_fifo
TOPLEVEL = $(DUT)
MODULE   = test_$(DUT)
VERILOG_SOURCES += ../../rtl/$(DUT).v
VERILOG_SOURCES += ../../rtl/eth_mac_phy_10g.v
VERILOG_SOURCES += ../../rtl/eth_mac_phy_10g_rx.v
VERILOG_SOURCES += ../../rtl/eth_mac_phy_10g_tx.v
VERILOG_SOURCES += ../../rtl/eth_phy_10g_rx_if.v
VERILOG_SOURCES += ../../rtl/eth_phy_10g_rx_ber_mon.v
VERILOG_SOURCES += ../../rtl/eth_phy_10g_rx_frame_sync.v
VERILOG_SOURCES += ../../rtl/eth_phy_10g_rx_watchdog.v
VERILOG_SOURCES += ../../rtl/eth_phy_10g_tx_if.v
VERILOG_SOURCES += ../../rtl/axis_baser_rx_64.v
VERILOG_SOURCES += ../../rtl/axis_baser_tx_64.v
VERILOG_SOURCES += ../../rtl/lfsr.v
VERILOG_SOURCES += ../../rtl/ptp_clock_cdc.v
VERILOG_SOURCES += ../../lib/axis/rtl/axis_adapter.v
VERILOG_SOURCES += ../../lib/axis/rtl/axis_async_fifo.v
VERILOG_SOURCES += ../../lib/axis/rtl/axis_async_fifo_adapter.v

# module parameters
export PARAM_DATA_WIDTH ?= 64
export PARAM_HDR_WIDTH ?= 2
export PARAM_AXIS_DATA_WIDTH ?= $(PARAM_DATA_WIDTH)
export PARAM_AXIS_KEEP_ENABLE ?= $(shell expr $(PARAM_AXIS_DATA_WIDTH) \> 8 )
export PARAM_AXIS_KEEP_WIDTH ?= $(shell expr $(PARAM_AXIS_DATA_WIDTH) / 8 )
export PARAM_ENABLE_PADDING ?= 1
export PARAM_ENABLE_DIC ?= 1
export PARAM_MIN_FRAME_LENGTH ?= 64
export PARAM_TX_FIFO_DEPTH ?= 16384
export PARAM_TX_FIFO_PIPELINE_OUTPUT ?= 2
export PARAM_TX_FRAME_FIFO ?= 1
export PARAM_TX_DROP_OVERSIZE_FRAME ?= $(PARAM_TX_FRAME_FIFO)
export PARAM_TX_DROP_BAD_FRAME ?= $(PARAM_TX_DROP_OVERSIZE_FRAME)
export PARAM_TX_DROP_WHEN_FULL ?= 0
export PARAM_RX_FIFO_DEPTH ?= 16384
export PARAM_RX_FIFO_PIPELINE_OUTPUT ?= 2
export PARAM_RX_FRAME_FIFO ?= 1
export PARAM_RX_DROP_OVERSIZE_FRAME ?= $(PARAM_RX_FRAME_FIFO)
export PARAM_RX_DROP_BAD_FRAME ?= $(PARAM_RX_DROP_OVERSIZE_FRAME)
export PARAM_RX_DROP_WHEN_FULL ?= $(PARAM_RX_DROP_OVERSIZE_FRAME)
export PARAM_PTP_PERIOD_NS ?= 6
export PARAM_PTP_PERIOD_FNS ?= 26214
export PARAM_PTP_USE_SAMPLE_CLOCK ?= 0
export PARAM_TX_PTP_TS_ENABLE ?= 1
export PARAM_RX_PTP_TS_ENABLE ?= 1
export PARAM_TX_PTP_TS_FIFO_DEPTH ?= 64
export PARAM_PTP_TS_WIDTH ?= 96
export PARAM_TX_PTP_TAG_ENABLE ?= $(PARAM_TX_PTP_TS_ENABLE)
export PARAM_PTP_TAG_WIDTH ?= 16
export PARAM_TX_USER_WIDTH ?= $(if $(filter-out 1,$(PARAM_TX_PTP_TAG_ENABLE)),1,$(shell expr $(PARAM_PTP_TAG_WIDTH) + 1 ))
export PARAM_RX_USER_WIDTH ?= $(if $(filter-out 1,$(PARAM_RX_PTP_TS_ENABLE)),1,$(shell expr $(PARAM_PTP_TS_WIDTH) + 1 ))
export PARAM_BIT_REVERSE ?= 0
export PARAM_SCRAMBLER_DISABLE ?= 0
export PARAM_PRBS31_ENABLE ?= 1
export PARAM_TX_SERDES_PIPELINE ?= 2
export PARAM_RX_SERDES_PIPELINE ?= 2
export PARAM_BITSLIP_HIGH_CYCLES ?= 1
export PARAM_BITSLIP_LOW_CYCLES ?= 8
export PARAM_COUNT_125US ?= 195

ifeq ($(SIM), icarus)
	PLUSARGS += -fst

	COMPILE_ARGS += -P $(TOPLEVEL).DATA_WIDTH=$(PARAM_DATA_WIDTH)
	COMPILE_ARGS += -P $(TOPLEVEL).HDR_WIDTH=$(PARAM_HDR_WIDTH)
	COMPILE_ARGS += -P $(TOPLEVEL).AXIS_DATA_WIDTH=$(PARAM_AXIS_DATA_WIDTH)
	COMPILE_ARGS += -P $(TOPLEVEL).AXIS_KEEP_ENABLE=$(PARAM_AXIS_KEEP_ENABLE)
	COMPILE_ARGS += -P $(TOPLEVEL).AXIS_KEEP_WIDTH=$(PARAM_AXIS_KEEP_WIDTH)
	COMPILE_ARGS += -P $(TOPLEVEL).ENABLE_PADDING=$(PARAM_ENABLE_PADDING)
	COMPILE_ARGS += -P $(TOPLEVEL).ENABLE_DIC=$(PARAM_ENABLE_DIC)
	COMPILE_ARGS += -P $(TOPLEVEL).MIN_FRAME_LENGTH=$(PARAM_MIN_FRAME_LENGTH)
	COMPILE_ARGS += -P $(TOPLEVEL).TX_FIFO_DEPTH=$(PARAM_TX_FIFO_DEPTH)
	COMPILE_ARGS += -P $(TOPLEVEL).TX_FIFO_PIPELINE_OUTPUT=$(PARAM_TX_FIFO_PIPELINE_OUTPUT)
	COMPILE_ARGS += -P $(TOPLEVEL).TX_FRAME_FIFO=$(PARAM_TX_FRAME_FIFO)
	COMPILE_ARGS += -P $(TOPLEVEL).TX_DROP_OVERSIZE_FRAME=$(PARAM_TX_DROP_OVERSIZE_FRAME)
	COMPILE_ARGS += -P $(TOPLEVEL).TX_DROP_BAD_FRAME=$(PARAM_TX_DROP_BAD_FRAME)
	COMPILE_ARGS += -P $(TOPLEVEL).TX_DROP_WHEN_FULL=$(PARAM_TX_DROP_WHEN_FULL)
	COMPILE_ARGS += -P $(TOPLEVEL).RX_FIFO_DEPTH=$(PARAM_RX_FIFO_DEPTH)
	COMPILE_ARGS += -P $(TOPLEVEL).RX_FIFO_PIPELINE_OUTPUT=$(PARAM_RX_FIFO_PIPELINE_OUTPUT)
	COMPILE_ARGS += -P $(TOPLEVEL).RX_FRAME_FIFO=$(PARAM_RX_FRAME_FIFO)
	COMPILE_ARGS += -P $(TOPLEVEL).RX_DROP_OVERSIZE_FRAME=$(PARAM_RX_DROP_OVERSIZE_FRAME)
	COMPILE_ARGS += -P $(TOPLEVEL).RX_DROP_BAD_FRAME=$(PARAM_RX_DROP_BAD_FRAME)
	COMPILE_ARGS += -P $(TOPLEVEL).RX_DROP_WHEN_FULL=$(PARAM_RX_DROP_WHEN_FULL)
	COMPILE_ARGS += -P $(TOPLEVEL).PTP_PERIOD_NS=$(PARAM_PTP_PERIOD_NS)
	COMPILE_ARGS += -P $(TOPLEVEL).PTP_PERIOD_FNS=$(PARAM_PTP_PERIOD_FNS)
	COMPILE_ARGS += -P $(TOPLEVEL).PTP_USE_SAMPLE_CLOCK=$(PARAM_PTP_USE_SAMPLE_CLOCK)
	COMPILE_ARGS += -P $(TOPLEVEL).TX_PTP_TS_ENABLE=$(PARAM_TX_PTP_TS_ENABLE)
	COMPILE_ARGS += -P $(TOPLEVEL).RX_PTP_TS_ENABLE=$(PARAM_RX_PTP_TS_ENABLE)
	COMPILE_ARGS += -P $(TOPLEVEL).TX_PTP_TS_FIFO_DEPTH=$(PARAM_TX_PTP_TS_FIFO_DEPTH)
	COMPILE_ARGS += -P $(TOPLEVEL).PTP_TS_WIDTH=$(PARAM_PTP_TS_WIDTH)
	COMPILE_ARGS += -P $(TOPLEVEL).TX_PTP_TAG_ENABLE=$(PARAM_TX_PTP_TAG_ENABLE)
	COMPILE_ARGS += -P $(TOPLEVEL).PTP_TAG_WIDTH=$(PARAM_PTP_TAG_WIDTH)
	COMPILE_ARGS += -P $(TOPLEVEL).TX_USER_WIDTH=$(PARAM_TX_USER_WIDTH)
	COMPILE_ARGS += -P $(TOPLEVEL).RX_USER_WIDTH=$(PARAM_RX_USER_WIDTH)
	COMPILE_ARGS += -P $(TOPLEVEL).BIT_REVERSE=$(PARAM_BIT_REVERSE)
	COMPILE_ARGS += -P $(TOPLEVEL).SCRAMBLER_DISABLE=$(PARAM_SCRAMBLER_DISABLE)
	COMPILE_ARGS += -P $(TOPLEVEL).PRBS31_ENABLE=$(PARAM_PRBS31_ENABLE)
	COMPILE_ARGS += -P $(TOPLEVEL).TX_SERDES_PIPELINE=$(PARAM_TX_SERDES_PIPELINE)
	COMPILE_ARGS += -P $(TOPLEVEL).RX_SERDES_PIPELINE=$(PARAM_RX_SERDES_PIPELINE)
	COMPILE_ARGS += -P $(TOPLEVEL).BITSLIP_HIGH_CYCLES=$(PARAM_BITSLIP_HIGH_CYCLES)
	COMPILE_ARGS += -P $(TOPLEVEL).BITSLIP_LOW_CYCLES=$(PARAM_BITSLIP_LOW_CYCLES)
	COMPILE_ARGS += -P $(TOPLEVEL).COUNT_125US=$(PARAM_COUNT_125US)

	ifeq ($(WAVES), 1)
		VERILOG_SOURCES += iverilog_dump.v
		COMPILE_ARGS += -s iverilog_dump
	endif
else ifeq ($(SIM), verilator)
	COMPILE_ARGS += -Wno-SELRANGE -Wno-WIDTH

	COMPILE_ARGS += -GDATA_WIDTH=$(PARAM_DATA_WIDTH)
	COMPILE_ARGS += -GHDR_WIDTH=$(PARAM_HDR_WIDTH)
	COMPILE_ARGS += -GAXIS_DATA_WIDTH=$(PARAM_AXIS_DATA_WIDTH)
	COMPILE_ARGS += -GAXIS_KEEP_ENABLE=$(PARAM_AXIS_KEEP_ENABLE)
	COMPILE_ARGS += -GAXIS_KEEP_WIDTH=$(PARAM_AXIS_KEEP_WIDTH)
	COMPILE_ARGS += -GENABLE_PADDING=$(PARAM_ENABLE_PADDING)
	COMPILE_ARGS += -GENABLE_DIC=$(PARAM_ENABLE_DIC)
	COMPILE_ARGS += -GMIN_FRAME_LENGTH=$(PARAM_MIN_FRAME_LENGTH)
	COMPILE_ARGS += -GTX_FIFO_DEPTH=$(PARAM_TX_FIFO_DEPTH)
	COMPILE_ARGS += -GTX_FIFO_PIPELINE_OUTPUT=$(PARAM_TX_FIFO_PIPELINE_OUTPUT)
	COMPILE_ARGS += -GTX_FRAME_FIFO=$(PARAM_TX_FRAME_FIFO)
	COMPILE_ARGS += -GTX_DROP_OVERSIZE_FRAME=$(PARAM_TX_DROP_OVERSIZE_FRAME)
	COMPILE_ARGS += -GTX_DROP_BAD_FRAME=$(PARAM_TX_DROP_BAD_FRAME)
	COMPILE_ARGS += -GTX_DROP_WHEN_FULL=$(PARAM_TX_DROP_WHEN_FULL)
	COMPILE_ARGS += -GRX_FIFO_DEPTH=$(PARAM_RX_FIFO_DEPTH)
	COMPILE_ARGS += -GRX_FIFO_PIPELINE_OUTPUT=$(PARAM_RX_FIFO_PIPELINE_OUTPUT)
	COMPILE_ARGS += -GRX_FRAME_FIFO=$(PARAM_RX_FRAME_FIFO)
	COMPILE_ARGS += -GRX_DROP_OVERSIZE_FRAME=$(PARAM_RX_DROP_OVERSIZE_FRAME)
	COMPILE_ARGS += -GRX_DROP_BAD_FRAME=$(PARAM_RX_DROP_BAD_FRAME)
	COMPILE_ARGS += -GRX_DROP_WHEN_FULL=$(PARAM_RX_DROP_WHEN_FULL)
	COMPILE_ARGS += -GPTP_PERIOD_NS=$(PARAM_PTP_PERIOD_NS)
	COMPILE_ARGS += -GPTP_PERIOD_FNS=$(PARAM_PTP_PERIOD_FNS)
	COMPILE_ARGS += -GPTP_USE_SAMPLE_CLOCK=$(PARAM_PTP_USE_SAMPLE_CLOCK)
	COMPILE_ARGS += -GTX_PTP_TS_ENABLE=$(PARAM_TX_PTP_TS_ENABLE)
	COMPILE_ARGS += -GRX_PTP_TS_ENABLE=$(PARAM_RX_PTP_TS_ENABLE)
	COMPILE_ARGS += -GTX_PTP_TS_FIFO_DEPTH=$(PARAM_TX_PTP_TS_FIFO_DEPTH)
	COMPILE_ARGS += -GPTP_TS_WIDTH=$(PARAM_PTP_TS_WIDTH)
	COMPILE_ARGS += -GTX_PTP_TAG_ENABLE=$(PARAM_TX_PTP_TAG_ENABLE)
	COMPILE_ARGS += -GPTP_TAG_WIDTH=$(PARAM_PTP_TAG_WIDTH)
	COMPILE_ARGS += -GTX_USER_WIDTH=$(PARAM_TX_USER_WIDTH)
	COMPILE_ARGS += -GRX_USER_WIDTH=$(PARAM_RX_USER_WIDTH)
	COMPILE_ARGS += -GBIT_REVERSE=$(PARAM_BIT_REVERSE)
	COMPILE_ARGS += -GSCRAMBLER_DISABLE=$(PARAM_SCRAMBLER_DISABLE)
	COMPILE_ARGS += -GPRBS31_ENABLE=$(PARAM_PRBS31_ENABLE)
	COMPILE_ARGS += -GTX_SERDES_PIPELINE=$(PARAM_TX_SERDES_PIPELINE)
	COMPILE_ARGS += -GRX_SERDES_PIPELINE=$(PARAM_RX_SERDES_PIPELINE)
	COMPILE_ARGS += -GBITSLIP_HIGH_CYCLES=$(PARAM_BITSLIP_HIGH_CYCLES)
	COMPILE_ARGS += -GBITSLIP_LOW_CYCLES=$(PARAM_BITSLIP_LOW_CYCLES)
	COMPILE_ARGS += -GCOUNT_125US=$(PARAM_COUNT_125US)

	ifeq ($(WAVES), 1)
		COMPILE_ARGS += --trace-fst
	endif
endif

include $(shell cocotb-config --makefiles)/Makefile.sim

iverilog_dump.v:
	echo 'module iverilog_dump();' > $@
	echo 'initial begin' >> $@
	echo '    $$dumpfile("$(TOPLEVEL).fst");' >> $@
	echo '    $$dumpvars(0, $(TOPLEVEL));' >> $@
	echo 'end' >> $@
	echo 'endmodule' >> $@

clean::
	@rm -rf iverilog_dump.v
	@rm -rf dump.fst $(TOPLEVEL).fst
