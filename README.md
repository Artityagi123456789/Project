# UVM-Based Testbench Development for apb_sram

## Project Overview
This project demonstrates the development of a UVM-based testbench for verifying a complex IP core, specifically a multi-port memory controller. The verification environment was designed using modular and reusable UVM components to achieve high coverage and efficiency. 

### Highlights:
- Achieved **99% functional coverage**
- Ensured **100% test completeness** through assertions
- Reduced **verification time by 30%**
- Verified data reliability under **high-load multi-port access** scenarios
- Implemented **coverage-driven regression strategy**
- Integrated **TCL-based test automation** for repeatability
- Enhanced **debug productivity** using waveform dumping with Verdi

## Tools & Technologies
- **Language**: SystemVerilog
- **Methodology**: UVM (Universal Verification Methodology)
- **Simulator**: Synopsys VCS
- **Debugging**: Synopsys Verdi
- **Automation**: TCL Scripts

---

## Directory Structure
```
UVM_Complex_IP_Verification/
├── rtl/
│   └── mem_ctrl.sv                # DUT
├── tb/
│   ├── env/
│   │   ├── mem_env.sv
│   │   ├── mem_agent.sv
│   │   ├── mem_driver.sv
│   │   ├── mem_monitor.sv
│   │   └── mem_scoreboard.sv
│   ├── seq/
│   │   ├── mem_sequence.sv
│   │   └── mem_sequence_lib.sv
│   ├── test/
│   │   ├── base_test.sv
│   │   └── random_test.sv
│   ├── mem_interface.sv
│   └── top_tb.sv
├── scripts/
│   └── run.tcl                    # Simulation script
├── README.md
├── LICENSE
└── Makefile
```
