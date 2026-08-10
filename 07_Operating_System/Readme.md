# 07 Operating System

To run serious application like Tetris we need the operating system JACK-OS, written in the high level language JACK. 

For every JACK-OS class we provide a skeleton file, with the signatures of functions and methods. In the dedicated test folder you find implementation details and test classes.

The folder `00_HACK` contains a simulation of HACK similar to the one in `06_IO_Devices/00_HACK` with the following differences:

* uses build in chips from `01_Boolean_Logic` to `03_Sequential_Logic` instead of going down to the nand gate level.
* has 64k words of instruction ROM preloaded with JACK-OS and applications
* is not uploadable to iCE40HX1K-EVB

## Simulation of JACK-OS classes

Use `00_HACK` of `07_Operating_System` to test your JACK-OS classes in simulation.

```
$ cd <test folder>
$ make
$ cd ../00_HACK
$ apio clean
$ apio sim
```

## Run JACK-OS in real hardware on iCE40HX1K-EVB

To test JACK-OS on real hardware iCE40HX1K-EVB use the design of HACK developed in `06_IO_Devices` with the bootloader of `05_GO`. Attach iCE40HX1K-EVB to your computer and run the following commands:

```
$ cd <test folder>
$ make
$ make upload
```

This will compile all classes in the test folder and upload the binary file to SPI flash rom starting at address 64k (0x010000), where the bootloader can find it.

**Attention:** All used classes must be linked to the folder in which you run the compiler. To add the class `<JACK-OS class>.jack` simply make a soft link in the working directory:

Finally you can run Tetris!