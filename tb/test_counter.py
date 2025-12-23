import cocotb
from cocotb.triggers import RisingEdge, Timer
from cocotb.clock import Clock

@cocotb.test()
async def test_counter_reset(dut):
    # Test the rest sets count to 0

    # Start clock with 10 ns period (100 MHz)
    clock = Clock(dut.clk, 10, unit="ns")
    cocotb.start_soon(clock.start())

    # Initialize values
    dut.enable.value = 0
    dut.reset.value = 1

    # Wait for two clock cycle
    await RisingEdge(dut.clk)
    await RisingEdge(dut.clk)

    dut.reset.value = 0
    await RisingEdge(dut.clk)

    # Assert reset
    assert dut.count.value == 0 , f"Reset Failed :  count is not 0 but {dut.count.value}"
    dut._log.info("Reset Passed : count is 0")

