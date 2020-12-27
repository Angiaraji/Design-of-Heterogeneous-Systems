This repository is the design of an 8 bit ALU capable of calculating several arithmetic, logic and rotation operations.
It has following sub components
- The AL8 module processing arithmetic or logic instructions
- The RT8 module for the rotation operation
- The BUFT8 module which joins the AL8 and RT8 module to the common output port
- A decoder logic to decide the logic to be used - AL8/RT8

The overall schematic of the design is shown below.


