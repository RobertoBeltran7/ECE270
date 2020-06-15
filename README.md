# **ECE 270: Introduction to Digital System Design**

**Course Description:**
An introduction to digital system design and hardware engineering, with an emphasis on practical design techniques and circuit implementation. Topics include number systems, Boolean algebra, theory of logic functions, mapping techniques and function minimization, logic equivalent circuits and symbol transformations, CMOS logic gate implementations, gate electrical and timing characteristics, critical path assessment and propagation delay measurement, analysis and synthesis of combinational circuits, programmable logic devices, hardware description languages, signed number notations and arithmetic, binary arithmetic logic circuits, theory of sequential circuits, state transition and timing diagrams, analysis and synthesis of sequential circuits, Mealy and Moore models of sequential circuits, register design, clock generation circuits, metastability and reliability considerations, and design of a simple computer.

### **List of Lab Assignments**

- **Lab6: Introduction to PLDs, Verilog, and ispLEVER**<br/>
This experiment introduces the Verilog hardware description language, PLDs to program in Verilog and ispLEVER along with a Universal Programmer to synthesize Verilog modules and "burn" them into a PLD. This lab uses the GAL22V10C PLD along with a DIP switch to turn on a few LEDs in a specified sequence based on the switches that are turned on/off.

- **Lab7: 7-Segment Display PLD Exercises**<br/>
This experiment uses the GAL22V10C PLD along with a DIP switch to turn on LED segments on a display. The display is separated into 7 different segments and each is mapped to an input from the DIP switch. The experiment also implements an alphabetic display decoder that displays alphabetic characters in order, a hexadecimal display decoder that displays the hex characters from 0-F, and an alarm system that displays how many "sensors" have been tripped or if the alarm is "armed/unarmed".

- **Lab8: Introduction to Sequential Circuits**<br/>
This experiment introduces building and testing of simple feedback sequential circuits. It also demonstrates the functionality of edge-triggered D flip-flops and measuring their propogation delay.

- **Lab9: Introduction to ispMACH 4256ZE Development Board**<br/>
This experiment introduces implementation of state machines on CPLDs. The CPLD is used to implement up/down counters, ring counters and show varying text on the 7-segment displays.

- **Lab10: Scrolling 7-Segment LED Display**<br/>
This experiment introduces implementation of sequence generators with CPLDs. The CPLD is used to realize a 7-bit wide, 4-word "left shift" register and a Johnson counter to implement a scrolling display on the 7-segment displays. 

- **Lab11: Digital Combinational Lock with Pseudo-Random Combination**<br/>
This experiment implements a sequence recognizer. The ispMACH 4256ZE Development Board is used to implement a 7-bit linear feedback shift-register to generate a pseudo-random sequence. The CPLD is also used to realize a 3-bit synchronously resettable binary up counter with a 3:8 decoder.

- **Lab12: The “Non-Elite Academic Exercise” Game -or- The Radix Price is Right!**<br/>
This experiment uses the ispMACH 4256ZE Development Board to implement a game using arithmetic circuits. This experiment implements a linear feedback shift register, a 4-bit adder/subtractor, a magnitude comparator, a 4-bit binary "round counter", a BCD full-adder, and a two-digit BCD adder.
