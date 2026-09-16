# Maroon Group - Verilog ALU Project

## Step 1: Basic Logic Gates and Shifter

### Requirements

**Step 1** focuses on designing and testing fundamental logic modules:

1. **Separate Logic Gate Modules**
   - NOT gate (`not_gate.v`)
   - NAND gate (`nand_gate.v`)
   - NOR gate (`nor_gate.v`)

2. **4-bit Shift Module**
   - 4-bit shift operator (`shift4.v`)

3. **Separate Testbenches**
   - Dedicated testbench for each module
   - Truth table verification
   - Comprehensive test coverage

4. **Waveform Results**
   - Simulation waveforms saved in `Waveforms/` directory
   - Visual verification of module behavior

5. **Project Report**
   - PDF report in `Report/` directory
   - Circuit descriptions and schematics
   - Testbench methodology
   - Waveform analysis and results

### Directory Structure

```
3339-Project/
├── Verilog/
│   ├── not_gate.v
│   ├── not_gate_tb.v
│   ├── nand_gate.v
│   ├── nand_gate_tb.v
│   ├── nor_gate.v
│   ├── nor_gate_tb.v
│   ├── shift4.v
│   └── shift4_tb.v
├── Waveforms/
│   └── README.md
├── Report/
│   └── README.md
└── README.md
```

### Team

Maroon Group (3-person team)

### Work Division

* Theo Kliewer: NOT and NAND modules, testbenches, and waveforms
* Juan Liscano: NOR and 4-bit shift modules, testbenches, and waveforms
* Teammate 2 (name pending): report assembly, final organization, and submission preparation

### Getting Started

1. Implement the logic modules in `Verilog/`
2. Write comprehensive testbenches
3. Run simulations and generate waveforms
4. Document results in the project report
