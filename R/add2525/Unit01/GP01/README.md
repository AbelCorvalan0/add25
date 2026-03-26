# Verilog concepts

## When do I define a signal as `wire` or `reg` in Verilog?

The rule is **not** about combinational vs sequential logic.

The rule is about **how the signal is assigned**.

---

### 🔹 Use `wire` when:

The signal is driven by:

- A continuous assignment (`assign`)
- The output of a module instance
- A primitive gate output

#### Example: Continuous assignment
```verilog
wire y;
assign y = a & b;
```

#### Example: Module output
```verilog
wire y;

my_module u1 (
    .out(y)
);
```

#### Key idea

`wire` represents a **physical connection** (a net).

It:
- Is continuously driven
- Cannot be assigned inside an `always` or `initial` block

---

### 🔹 Use `reg` when:

The signal is assigned inside:

- `always` block
- `initial` block

#### Example: Combinational procedural block
```verilog
reg y;

always @(*) begin
    y = a & b;
end
```

Even though this is combinational logic, `y` must be `reg`
because it is assigned inside a procedural block.

---

### 🔹 When does it become a flip-flop?

If the `reg` is assigned inside a clocked block:

```verilog
reg q;

always @(posedge clk) begin
    q <= d;
end
```

Now synthesis infers a **D flip-flop**.

Important:
`reg` does NOT automatically mean hardware register.
It only means "assigned procedurally".

---

### 🔹 Quick Decision Rule

Ask:

Is the signal assigned using `assign`?
→ Use `wire`

Is the signal assigned inside `always` or `initial`?
→ Use `reg`

---

### 🔹 Comparison Example

#### Using `wire`
```verilog
wire y;
assign y = a & b;
```

#### Using `reg`
```verilog
reg y;

always @(*) begin
    y = a & b;
end
```

Both synthesize to the same AND gate.

The difference is the modeling style.

---

### 🔹 Common Errors

Procedural assignment to a wire:
```verilog
wire y;

always @(*) begin
    y = a & b;   // ERROR
end
```

Continuous assignment to a reg:
```verilog
reg y;
assign y = a & b;  // ERROR
```

---

### 🔹 Modern SystemVerilog Note

In SystemVerilog you can use:

```systemverilog
logic y;
```

`logic` replaces most uses of `reg` and avoids confusion.