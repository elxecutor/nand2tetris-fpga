## 05 GO

The instrucition memory ROM of HACK is limited to 256 words. In order to run bigger programs written in JACK (e.g. tetris) we will store the program to SRAM and use the SRAM memory chip as instruction memory. For this we need:

1. A bootloader program written in assembler (which is stored in the 256 words of ROM), that reads a (bigger) hack binary program previously stored on SPI memory chip starting at address 0x010000 and stores it to SRAM.

2. A multiplexer, that switches instruction memory from ROM to SRAM.

### Chip specification

When load=1 `GO` switches HACK operation from boot mode to run mode. In boot mode instruction=ROM_data and SRAM_ADDR=sram_a. In run mode instruction=sram_data and SRAM_ADDR=pc.

### Memory map

The special function register `GO` is memory mapped to address 4103

| addr | R/W | function                                                                                                    |
| ---- | --- | ----------------------------------------------------------------------------------------------------------- |
| 4103 | W   | a write resets the HACK CPU and switches instrucion memory from ROM (bootloader) to SRAM (JACK application) |

### boot.asm

bootloader that reads 64k words from SPI flash memory starting from address 0x010000 and writes them to SRAM. FInally it resets the CPU and starts program execution from SRAM.

To run the testbench it's sufficient to read only the first 6 words. The SPI in the testbench is preloaded with the following 6 assembler instructions of the program `leds.asm` translated into HACK machine language:

```
@BUT
D=M
@LED
M=D
@0
0;JMP
```

***

### Project

* Implement `boot.asm` (read only the first 6 words) and run the testbench:
  
  ```
  $ cd 05_GO
  $ make
  $ cd ../00_HACK
  $ apio
  $ apio sim
  ```
  
  ![](go.png)



* Check, if HACK reads 6 instrucions from SPI and writes them to SRAM.

* Check, if HACK can switch from instruction memory ROM (bootloader= to instruction memory SRAM (application) when loadGO=1.

* Check, if HACK runs `leds.asm` after switching from boot to run.

### Run in real hardware

* preload SPI flash rom with the hack programm `leds.asm.`
  
  ```
  $ cd ../../04_Machine_Language
  $ make leds
  $ make upload
  ```

* upload HACK with bootloader to iCE40HX1K-EVB
  
  ```
  $ cd 05_GO
  $ make
  $ cd ../00HACK
  $ apio clean
  $ apio upload
  ```

* Check if iCE40HX1K-EVB runs the bootloader, which loads `leds.asm` from SPI and starts execution of leds.asm.

If  `leds.asm` is working, you are ready to start implementing the operating system JACK-OS. Proceed to project `07_Operating_System`  and come back later to implement the last to IO-Devices `LCD` and `RTP`  to connect the screen with resitive touch panel MOD-LCD2.8RTP.