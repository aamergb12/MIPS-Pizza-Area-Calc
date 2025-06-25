# MIPS-Pizza-Area-Calc

A MIPS assembly program that calculates total square footage of pizzas sold and compares it to an estimated value.

## 📥 Inputs
- Number of 8-inch round pizzas
- Number of 12-inch square pizzas
- Estimated total pizza area in square feet

## 📤 Outputs
- Total pizza area (ft²)
- Area from round pizzas
- Area from square pizzas
- Message: `"Woosh!"` if actual area ≥ estimate, otherwise `"Bummer!"`

## 🧠 Logic
- Round pizza area = π × r² → converted from in² to ft²
- Square pizza area = side² → converted from in² to ft²
- Total = round area + square area
- Compares total against estimate

## 💻 Run Instructions
Use MARS or SPIM MIPS simulator:
1. Load the program
2. Assemble and run
3. Enter input values when prompted
