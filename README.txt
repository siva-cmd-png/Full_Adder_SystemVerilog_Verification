# Full Adder Verification using SystemVerilog

## 📌 Project Overview

This project implements a **class-based SystemVerilog verification environment** for a 1-bit Full Adder.

The verification environment is built using separate components such as:

- Transaction
- Generator
- Driver
- Monitor
- Scoreboard
- Environment
- Interface
- Test

The testbench generates randomized input combinations and verifies the Full Adder outputs using a scoreboard.

---

## 🔷 Full Adder

A Full Adder performs binary addition of three 1-bit inputs:

### Inputs
- `a` — First input
- `b` — Second input
- `c` — Carry input

### Outputs
- `sum` — Sum output
- `carry` — Carry output

### Logic

```text
Sum   = A ⊕ B ⊕ C

Carry = AB + BC + AC
```

---

## 🏗️ Verification Environment

The project follows a basic class-based verification architecture:

```text
             Generator
                 │
                 │ Transaction
                 ▼
              Driver
                 │
                 ▼
                DUT
                 │
                 ▼
              Monitor
                 │
                 │ Transaction
                 ▼
             Scoreboard
                 │
                 ▼
              PASS/FAIL
```

### Components

#### 1. Transaction

The `transaction` class contains the randomized inputs and output signals.

```text
a
b
c
↓
sum
carry
```

The inputs `a`, `b`, and `c` are declared as randomized variables.

---

#### 2. Generator

The generator creates randomized transactions and sends them to the driver using a mailbox.

```text
Generator
    ↓
Random Transaction
    ↓
Mailbox
```

The current implementation generates **10 transactions**.

---

#### 3. Driver

The driver receives transactions from the generator and applies the inputs to the DUT through the virtual interface.

```text
Transaction
     ↓
   Driver
     ↓
a, b, c → DUT
```

The current driver processes **5 transactions**.

---

#### 4. Monitor

The monitor observes the DUT inputs and outputs through the virtual interface.

It collects:

```text
a
b
c
sum
carry
```

and sends the collected transaction to the scoreboard through a mailbox.

---

#### 5. Scoreboard

The scoreboard independently calculates the expected Full Adder outputs and compares them with the outputs observed from the DUT.

Expected Sum:

```text
A ^ B ^ C
```

Expected Carry:

```text
(A & B) | (B & C) | (C & A)
```

If the expected and actual outputs match:

```text
VERIFICATION PASSED
```

Otherwise:

```text
VERIFICATION FAILED
```

---

#### 6. Environment

The environment creates and connects all the verification components.

It contains:

- Generator
- Driver
- Monitor
- Scoreboard
- Mailboxes

The environment starts the verification components using parallel execution.

---

#### 7. Interface

The interface provides a common connection between the DUT and the verification components.

Signals included:

```text
a
b
c
sum
carry
```

The virtual interface is passed to the driver and monitor.

---

#### 8. Test

The test class creates the verification environment and starts the simulation.

```text
Test
 ↓
Environment
 ↓
Generator + Driver + Monitor + Scoreboard
```

## 🔄 Verification Flow

The overall verification flow is:

```text
1. Test creates Environment
            ↓
2. Environment creates all components
            ↓
3. Generator creates randomized transactions
            ↓
4. Driver receives transactions
            ↓
5. Driver applies A, B and C to DUT
            ↓
6. Monitor observes DUT signals
            ↓
7. Monitor sends transaction to Scoreboard
            ↓
8. Scoreboard calculates expected outputs
            ↓
9. Actual and expected outputs are compared
            ↓
10. Verification PASS / FAIL
```

---

## 🧪 Verification Method

The project uses:

- Randomized stimulus
- Object-oriented SystemVerilog classes
- Mailboxes for communication
- Virtual interfaces
- Driver-based stimulus application
- Monitor-based signal observation
- Scoreboard-based checking

This demonstrates the fundamentals of a **SystemVerilog class-based verification environment**.

---

## 🛠️ Technologies Used

- **SystemVerilog**
- **EDA Playground**
- Class-based verification
- Mailbox communication
- Virtual Interface
- Randomization

---

## 📊 Verification Result

The scoreboard checks the Full Adder functionality using the following conditions:

```text
Expected Sum =
A ^ B ^ C
```

```text
Expected Carry =
(A & B) | (B & C) | (C & A)
```

The scoreboard reports:

```text
VERIFICATION PASSED
```

when the DUT output matches the expected result.

---

## 🎯 Learning Outcomes

Through this project, the following SystemVerilog verification concepts were practiced:

- SystemVerilog classes
- Randomization
- Transactions
- Mailboxes
- Virtual interfaces
- Generator
- Driver
- Monitor
- Scoreboard
- Environment
- Program block
- Basic constrained/random stimulus generation
- Functional result checking

---

## 🚀 Future Improvements

The verification environment can be extended by adding:

- Functional coverage
- SystemVerilog assertions
- Constraint-based randomization
- Pass/fail counters
- Complete 8-case Full Adder verification
- Improved synchronization between driver and monitor
- Clocking blocks
- UVM-based verification environment

---

## 👨‍💻 Author

**G.Siva Sankar Reddy**

B.Tech — Electronics and Communication Engineering

Interested in **VLSI Design and Verification**, SystemVerilog and UVM.
