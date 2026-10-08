# Full Adder SystemVerilog Verification

## 📌 Project Overview

This project implements and verifies a **1-bit Full Adder** using **SystemVerilog**.

A class-based SystemVerilog verification environment is developed to verify the Full Adder using separate verification components such as:

- Transaction
- Generator
- Driver
- Monitor
- Scoreboard
- Environment
- Test
- Interface
- Testbench Top

The testbench generates randomized input combinations and compares the DUT outputs against the expected results using a scoreboard.

---

## 🎯 Objectives

- Design a 1-bit Full Adder using SystemVerilog.
- Develop a modular class-based verification environment.
- Generate randomized input transactions.
- Drive stimulus to the DUT through a virtual interface.
- Monitor DUT inputs and outputs.
- Calculate expected outputs in the scoreboard.
- Compare expected and actual results automatically.
- Create a reusable and structured verification environment.

---

## 🧮 Design Under Test — Full Adder

The Full Adder has three inputs and two outputs.

### Inputs

| Signal | Description |
|---|---|
| `a` | First input |
| `b` | Second input |
| `cin` | Carry input |

### Outputs

| Signal | Description |
|---|---|
| `sum` | Sum output |
| `cout` | Carry output |

### Logic

```text
sum  = a ^ b ^ cin
cout = (a & b) | (b & cin) | (a & cin)
```

### Truth Table

| A | B | Cin | Sum | Cout |
|---|---|---|---|---|
| 0 | 0 | 0 | 0 | 0 |
| 0 | 0 | 1 | 1 | 0 |
| 0 | 1 | 0 | 1 | 0 |
| 0 | 1 | 1 | 0 | 1 |
| 1 | 0 | 0 | 1 | 0 |
| 1 | 0 | 1 | 0 | 1 |
| 1 | 1 | 0 | 0 | 1 |
| 1 | 1 | 1 | 1 | 1 |

---

## 🏗️ Verification Architecture

```text
                    ┌─────────────────┐
                    │      TEST       │
                    └────────┬────────┘
                             │
                             ▼
                    ┌─────────────────┐
                    │  ENVIRONMENT    │
                    └────────┬────────┘
                             │
              ┌──────────────┴──────────────┐
              │                             │
              ▼                             ▼
       ┌─────────────┐               ┌─────────────┐
       │  GENERATOR  │                       │   DRIVER    │
       └──────┬──────┘               └──────┬──────┘
              │                             │
              ▼                             ▼
       ┌─────────────┐             ┌─────────────┐
       │ TRANSACTION │                    │     DUT     │
       └─────────────┘               │ Full Adder  │
                                         └──────┬──────┘
                                            │
                                            ▼
                                     ┌─────────────┐
                                     │   MONITOR   │
                                     └──────┬──────┘
                                            │
                                            ▼
                                     ┌─────────────┐
                                     │ SCOREBOARD  │
                                     └─────────────┘
```

---

## 📂 Project Structure

```text
Full_Adder_SystemVerilog_Verification/
│
├── rtl/
│   └── full_adder.sv
│
├── tb/
│   ├── transaction.sv
│   ├── generator.sv
│   ├── driver.sv
│   ├── monitor.sv
│   ├── scoreboard.sv
│   ├── environment.sv
│   ├── interface.sv
│   ├── test.sv
│   └── tb_top.sv
│
└── README.md
```

---

## 🔍 Verification Components

### 1. Transaction

Defines the data exchanged between the verification components.

It contains the Full Adder input and output signals:

```text
a
b
cin
sum
cout
```

---

### 2. Generator

The Generator creates randomized transactions and sends them to the Driver.

```text
Generator
    │
    ▼
Randomized Transaction
```

This allows multiple input combinations to be tested automatically.

---

### 3. Driver

The Driver receives transactions from the Generator and drives the corresponding signals to the DUT through the SystemVerilog interface.

```text
Generator
    │
    ▼
Driver
    │
    ▼
Interface
    │
    ▼
DUT
```

---

### 4. Monitor

The Monitor observes the DUT signals through the interface and captures the actual DUT behavior.

It forwards the observed transaction to the Scoreboard.

---

### 5. Scoreboard

The Scoreboard calculates the expected Full Adder output and compares it with the actual DUT output.

```text
Expected Output
      │
      ├──────► SCOREBOARD ◄────── Actual Output
      │
      ▼
   Compare
      │
   ┌──┴──┐
   │     │
 PASS   FAIL
```

---

### 6. Environment

The Environment connects the major verification components together.

```text
Environment
│
├── Generator
├── Driver
├── Monitor
└── Scoreboard
```

---

### 7. Test

The Test controls the overall verification flow and starts the Environment.

---

### 8. Interface

The SystemVerilog interface provides a common connection between the DUT and verification components.

It allows the Driver and Monitor to communicate with the DUT using a virtual interface.

---

### 9. Testbench Top

The `tb_top.sv` file acts as the top-level testbench.

It connects:

```text
Testbench
    │
    ├── Interface
    │
    ├── DUT
    │
    └── Test
```

---

## 🔄 Verification Flow

```text
1. Test starts
       ↓
2. Environment is created
       ↓
3. Generator creates randomized transaction
       ↓
4. Driver receives transaction
       ↓
5. Driver drives inputs to DUT
       ↓
6. DUT calculates Sum and Carry
       ↓
7. Monitor observes DUT outputs
       ↓
8. Scoreboard calculates expected output
       ↓
9. Expected output is compared with actual output
       ↓
10. PASS / FAIL result is reported
```

---

## 🧪 Test Strategy

The verification environment uses randomized input combinations for:

```text
A   = 0 / 1
B   = 0 / 1
Cin = 0 / 1
```

The complete input space of a 1-bit Full Adder consists of **8 possible combinations**.

The scoreboard independently calculates:

```text
Expected Sum  = A ^ B ^ Cin

Expected Cout = (A & B) |
                (B & Cin) |
                (A & Cin)
```

The calculated result is compared with the DUT output.

---

## 🛠️ Technologies Used

- **SystemVerilog**
- Class-based Verification
- Randomization
- Virtual Interface
- Object-Oriented Programming
- Functional Verification
- Scoreboard-based checking
- EDA Playground

---

## 💻 Simulation

The project can be simulated using a SystemVerilog-compatible simulator such as:

- Questa/ModelSim
- VCS
- Xcelium
- Icarus Verilog with appropriate SystemVerilog support
- EDA Playground

---

## 📊 Expected Result

A successful simulation should report that the generated Full Adder transactions match the expected results.

Example:

```text
--------------------------------
 Full Adder Verification
--------------------------------

Transaction 1 : PASS
Transaction 2 : PASS
Transaction 3 : PASS
Transaction 4 : PASS
Transaction 5 : PASS
Transaction 6 : PASS
Transaction 7 : PASS
Transaction 8 : PASS

--------------------------------
 Verification Completed
--------------------------------
```

---

## 🚀 Future Improvements

This project can be extended with:

- Functional coverage
- Code coverage
- Assertions
- Clocking blocks
- Mailboxes
- Interfaces and modports
- Constraint-based randomization
- UVM-based verification
- Coverage-driven verification
- Additional corner-case testing

---

## 📚 Learning Outcomes

Through this project, the following SystemVerilog verification concepts are demonstrated:

- Classes and objects
- Randomization
- Transactions
- Interfaces
- Virtual interfaces
- Generator-driver communication
- Monitor-based observation
- Scoreboard-based checking
- Modular testbench architecture
- Object-oriented verification

---

## 👨‍💻 Author

**G.Siva Sankar Reddy**

B.Tech — Electronics and Communication Engineering

Interested in:

- VLSI Design
- Digital Design

