## 00 Requirement

### FPGA-Board

In this project we will implement the HACK computer of the nand2tetris course in real hardware. This is done with a development board featuring a so called field programmable array (FPGA). The fpga chip is a small piece of silicon holding lots of logic cells (LC) and block ram (BRAM), which can be routed programmatically.

In this tutorial we use the FPGA-board iCE40HX1K-EVB from Olimex Ltd., which has the nice property of being completely open source. The whole project uses only FOSS free and open source hard- and software, so everybody can build their own HACK following this instructions.

![](fpga.png)

On iCE40HX1K-EVB board you will find:

* FPGA-chip iCE40HX1K: holds 1280 logic cells and 64Kbits block ram, which can be routed programmatically
* Serial flash memory W25Q16BV (16MBit): holds the bitstream data, which is a binary representation of the circuits, you want to implement on the FPGA. At startup the FPGA loads the bitstream from serial flash memory and configures its logic cells to become the machine you want the FPGA to be.
* LED, BUT: The development board come with two leds and two buttons. This are user programmable and can be used to enter data or for debugging.
* SRAM (256k x 16 bit): iCE40HX1K-EVB has a static RAM chip on board. This is usefull, because more memory is needed than available with blockram inside FPGA. We will use the SRAM chip as instruction memory ROM to run serious application like tetris or pong on on HACK.
* GPIO1 34 pin connector: the board come with a lot of general purpose in-/output pins. This pins can be used to connect external hardware. We will use this pins to connect an LCD screen with Touchpanel MOD-LCD2.8RTP.

To communicate to the iCE40HX1K-EVB we need an arduino like board, which can be connected to iCE40HX1K over the 10 pin UEXT connector . We will use Olimexino 32u4 board, wich has two modes:

* programmer: used to upload the bitstream file to serial flash memory.
* UART bridge: used to communicate to HACK at runtime.

### Tools

The chips of our HACK computer (ALU, CPU, Register, Memory, IO-Devices) are implemented in verilog, an industrial standard hardware description language similar to HDL from nand2tetris. So we need tools to translate Verilog-code to the so called bitstream, which is a binary representation of all the wires between the logic cells we want to activate. Finally we need tools to upload the bitstream file to the fpga board.

We will use iCE40-FPGA from Lattice Semiconductors, because they have the nice property that there exists a complete free and open source toolchain [Project Icestorm](http://www.clifford.at/icestorm/) for programming:

* YoSYS: Syntesize the verilog code
* nextpnr: place and route tool
* iceprogduino: programmer
* gtkwave: tool to simulate and visualize signals in fpga circuits

![](toolchain.png)

To run HACK we also need some software written for HACK. The simpler projects like a blinking LED can be programmed direcly in Assembler. Harder tasks like the driver for the LCD-screen are programmed in Jack, translated for the virtual machine and finally compiled to HACK code.

***

## Get started

### Buy the hardware ...

To build projects 1-5 any FPGA board will work. If you want to run serious application like Pong or Tetris on top of the Jack-OS you need an FPGA-board with more memory and connect to I/O-Devices like a screen and a touchpanel. The project has been tested with the following devices:

* iCE40 Board: [iCE40HX1K-EVB](https://www.olimex.com/Products/FPGA/iCE40/)
* Programmer: [Olimexino-32u4](https://www.olimex.com/Products/Duino/AVR/OLIMEXINO-32U4/open-source-hardware)
* 2.8 Inch LCD color screen with resistive touch panel: [MOD-LCD2.8RTP](https://www.olimex.com/Products/Modules/LCD/MOD-LCD2-8RTP)

Check the bill of material and consider to buy at Olimex Ltd., the company with the highest number of registered OSHW-projects.

![](BOM.png)

## ... install the tools ...

### apio

Apio (pronounced [ˈa.pjo]) is a multiplatform toolbox, with static pre-built packages, project configuration tools and easy command interface to verify, synthesize, simulate and upload your verilog designs.

 Visit [apio](https://github.com/FPGAwars/apio) and follow the install instruction. This will automatically install the whole toolchain consisting of:

* iCE40 tools: [Project Icestorm](http://www.clifford.at/icestorm/)
* Signal visualizer: [gtkwave](http://gtkwave.sourceforge.net/)

```
$ pip install -U apio
```

 To learn usage of apio do the example projects provided by apio.

```
$ apio install oss-cad-suite
$ apio install gtkwave
$ apio install examples
$ apio examples -d iCE40-HX1K-EVB/leds
$ cd iCE40-HX1K-EVB/leds
$ apio sim
$ apio build
$ apio upload
```

### programmer Olimexino-32u4

If you go with Olimex boards you additionally have to install the programmer software [iceprogduino](https://github.com/OLIMEX/iCE40HX1K-EVB/tree/master/programmer/olimexino-32u4%20firmware). The firmware has to be flashed on olimexino-32u4 with the Arduino development platform. Additionally you have to install the programm iceprogduino on your computer:

```
$ git clone https://github.com/OLIMEX/iCE40HX1K-EVB.git
$ cd iCE40HX1K-EVB/programmer/iceprogduino
$ make
$ sudo make install
```

Test the programmer with the test project provided by Olimex.

**Tipp:** Connect the solder jumper 3.3V_E1 on iCE40HX1K-EVB to power the fpga board iCE40HX1K-EVB over the IDC10 cable connected to Olimexino 32u4 over UEXT. This supersedes the need of the external 3.3V DC power supply.

 ![](ICE40PGM.jpg)

![](jumper3V.png)

### JACK-HACK-tools

JACK-HACK-Tools: JackCompiler, VirtualMachine Translator and Assembler vor Hack should be developed by yourself. Follow guidelines at [nand2tetris](https://www.nand2tetris.org/). If you don't have  your own JACK-HACK-tools yet, you can use the compiled python version the JACK-HACK-toolchain provided in the folder [tools](../tools).

### ... and do some verilog examples

There is no need to learn much verilog. Just dig into the example `Xor` and learn how to "translate" your HDL-files from nand2tetris into verilog.

If you like to have some verilog-background I recommend to do the tutorial of Juan González-Gomez (Obijuan), which starts at absolute beginners level [open-fpga-verilog-tutorial](https://github.com/Obijuan/open-fpga-verilog-tutorial/), best tutorial!
