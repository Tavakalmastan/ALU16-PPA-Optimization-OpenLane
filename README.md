🚀 PPA Characterization and Optimization of a 16-bit ALU using OpenLane (Sky130)
📌 Project Overview

This project demonstrates a complete RTL-to-GDSII ASIC physical design flow of an advanced 16-bit ALU using the open-source toolchain:

OpenLane

OpenROAD

Sky130 HD Standard Cell Library

The primary objective of this project was to:

🔍 Perform quantitative Power-Performance-Area (PPA) characterization and analyze trade-offs under different clock constraints and synthesis strategies.

The design was implemented, optimized, and analyzed across multiple timing targets to demonstrate real backend timing closure and optimization techniques.
🧠 ALU Architecture

The 16-bit ALU supports the following operations:

Opcode	Operation
0000	ADD
0001	SUB
0010	AND
0011	OR
0100	XOR
0101	MUL
0110	SHIFT LEFT
0111	SHIFT RIGHT
1000	LESS THAN

The inclusion of a 16-bit multiplier introduces deep combinational paths, making it ideal for timing optimization and PPA experimentation.

🛠 Tool Flow

The complete ASIC backend flow was executed using OpenLane:

RTL → Synthesis → Floorplan → Placement → CTS → Routing → RC Extraction → STA → Power Analysis → GDSII
Tools Used

Yosys (Synthesis)

OpenROAD (Placement, CTS, Routing)

OpenSTA (Signoff Static Timing Analysis)

Sky130A PDK

📊 PPA Characterization Experiments

Three major experiments were conducted:

🟢 Run 1 – Baseline (AREA Strategy, 12ns Clock)

Configuration:

CLOCK_PERIOD = 12ns

SYNTH_STRATEGY = AREA

Results:

Critical Path: 6.26 ns

WNS: 0.0 ns (Clean timing)

Core Area: 17,779 µm²

Total Cells: 2,751

Total Power: ~0.000744 W

✔ Clean timing
✔ Area optimized
✔ Lowest power consumption

🔴 Run 2 – Tightened Clock (AREA Strategy, 11ns Clock)

Configuration:

CLOCK_PERIOD = 11ns

SYNTH_STRATEGY = AREA

Results:

Critical Path: 6.21 ns

WNS: -0.59 ns (Setup violation)

Core Area: 17,779 µm²

Total Power: ~0.000819 W

⚠ Setup violation observed
⚠ Demonstrates performance limitation under area-focused synthesis

🔵 Run 3 – Performance Optimization (DELAY 2 Strategy, 11ns Clock)

Configuration:

CLOCK_PERIOD = 11ns

SYNTH_STRATEGY = DELAY 2

Results:

Critical Path: 4.42 ns

WNS: 0.0 ns (Timing closed)

Core Area: 26,950 µm²

Total Cells: 3,771

Total Power: ~0.00187 W

✔ Critical path reduced by 1.79 ns
✔ Timing successfully closed at 11ns
⚠ Area increased by ~51%
⚠ Power more than doubled

📈 PPA Comparison Summary
Clock	Strategy	Critical Path	WNS	Area (µm²)	Power (W)	Status
12ns	AREA	6.26ns	0	17,779	0.000744	PASS
11ns	AREA	6.21ns	-0.59	17,779	0.000819	FAIL
11ns	DELAY 2	4.42ns	0	26,950	0.00187	PASS
🔍 Key Technical Insights
1️⃣ Speed vs Area Tradeoff

Optimizing for delay required cell upsizing and buffering, increasing area by ~51%.

2️⃣ Speed vs Power Tradeoff

Higher performance increased switching activity and capacitance, doubling total power consumption.

3️⃣ Area Optimization Limitation

Area-focused synthesis limits achievable frequency due to smaller gate sizing and minimal buffering.

4️⃣ Real Timing Closure Behavior

Tightening the clock introduced setup violations, which were resolved by switching synthesis strategies and allowing more aggressive delay optimization.

🎯 Learning Outcomes

Through this project, I gained practical hands-on experience in:

RTL-to-GDSII backend flow

Static Timing Analysis (STA)

Setup violation debugging

Timing closure strategies

Synthesis optimization techniques

PPA trade-off analysis

Interpreting signoff timing and power reports

📁 Repository Structure
rtl/        → Verilog source code
config/     → OpenLane configuration
reports/    → PPA metrics and experiment documentation
images/     → Layout and floorplan snapshots
README.md   → Project documentation
🏁 Conclusion

This project demonstrates a realistic backend ASIC implementation workflow and quantitatively illustrates Power-Performance-Area trade-offs using an industry-style physical design flow.

The experiments clearly show how synthesis strategy and clock constraints directly impact timing closure, silicon area, and power consumption.

📬 Contact

If you're interested in backend physical design, STA, or PPA optimization discussions, feel free to connect.
