# VHDL CPU Design

This repository contains a CPU designed and implemented in **VHDL**, showcasing core digital system design concepts including finite state machines, arithmetic logic units, instruction decoding, and seven-segment display interfacing. The project was developed as part of **COE328 – Digital Systems Engineering** at Toronto Metropolitan University.

---

## 📖 Overview

The project integrates multiple digital subsystems into a functional CPU model:

- **Arithmetic Logic Units (ALUs):** Three versions developed to perform arithmetic, logic, and control operations.
- **Control Unit:** A finite state machine (FSM) manages sequencing, input gating, and reset logic.
- **Instruction Decoder:** A 4-to-16 decoder generates one-hot signals to select ALU operations.
- **Registers & Storage:** Input registers hold data before processing, and latches manage state.
- **Output System:** Results are displayed on dual seven-segment displays in signed BCD format.

This project provided hands-on experience in **RTL design, FPGA implementation, and hardware simulation workflows**, bridging theory with practical engineering.

---

## ⚙️ Features

### ALU1
- Addition, subtraction
- Bitwise operations: AND, OR, XOR, NOT
- Logical negations: NOT(A AND B), NOT(A OR B)

### ALU2
- Bit rotations and shifts
- Max comparator (MAX(A, B))
- Incremental operations (A+1, A–B+4)
- Nibble swapping (upper/lower 4 bits)

### ALU3
- Accepts a 4-bit StudentID input
- Evaluates parity condition
- Displays **Y** (yes) or **N** (no) on a seven-segment display

---

## 🛠️ Tools & Technologies

- **Language:** VHDL
- **Platform:** FPGA (Quartus II / ModelSim)
- **Core Concepts:** RTL design, finite state machines, instruction decoding, ALU design
- **Verification:** Simulation waveforms and block schematics

---

## 📊 Key Takeaways

- Designed and tested a **scalable CPU architecture** with modular subsystems.
- Implemented **FSM-driven control** to synchronize operations across components.
- Applied **hardware simulation and debugging** techniques to verify correctness.
- Gained practical experience in **digital system design workflows** relevant to ASIC/FPGA development.

---

## 👤 Author

**Eisa Kapadia**  
Computer Engineering @ Toronto Metropolitan University  
[LinkedIn](https://www.linkedin.com/in/eisa-kapadia-777a41239) | [GitHub](https://github.com/eisakap)


