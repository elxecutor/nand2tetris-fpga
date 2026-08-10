# 04 Machine Language

### leds.asm

To test input and output capability of HACK we will write an endless loop, in which HACK reads the state of the buttons BUT[1:0] and writes the result to LED[1:0]. All devices for  input and output are mapped to memory addresses starting from 0x1000. The state of BUT[1:0] can be read at memory address 4097 and the two leds LED[1:0] can be switched on and of by writing to memory address 4096. The Assembler in `tools` already knows the following predefined symbols.

| symbol          | value       | function                                 |
| --------------- | ----------- | ---------------------------------------- |
| SP              | 0           | stack pointer of VM                      |
| LCL             | 1           | local segment of VM                      |
| ARG             | 2           | argument of function/method call         |
| THIS            | 3           | pointer to object in heap                |
| THAT            | 4           | pointer to object in heap                |
| R0--R15         | 0-15        | register 0-15                            |
| LED             | 4096        | 0 LED is off,1 LED is on                 |
| BUT             | 4097        | 0 BUT pushed down, 1 BUT released up     |
| UART_TX         | 4098        | send byte over UART                      |
| UART_RX         | 4099        | receive byte from UART                   |
| SPI             | 4100        | read/write to SPI flash rom              |
| SRAM_A          | 4101        | address of SRAM chip for next read/write |
| SRAM_D          | 4102        | read/write data from/to SRAM chip        |
| GO              | 4103        | switch from BOOT to RUN                  |
| LCD8            | 4104        | write 8bit to LCD                        |
| LCD16           | 4105        | write 16bit to LCD                       |
| RTP             | 4106        | read/write 8bit to RTP                   |
| DEBUG0 - DEBUG4 | 4107 - 4111 | reserved for debugging                   |

## mult.asm

To test the ALU of HACK we will write a little assembler program, that calculates the multiplication of two integers stored in R0 and R1. The result shoud be stored into R2.

To Test the result we have to load some test values into R0,R1 and R2. After the multiplication is finished we will check the result in R2. To show if the multiplication is correct, we use two strategies:

#### Use LED to debug

To test `mult.asm` in real hardware, we can use the LED[1:0] to display if the result is correct or wrong according to:

| LED[1:0] | output               |
| -------- | -------------------- |
| 00       | nothing happened yet |
| 01       | start multiplication |
| 10       | correct result       |
| 11       | wrong result         |

### Use DEBUG0-4 register

To test `mult.asm` in simulation, we can use the DEBUG registers. Every time we change the value of R0--R2 we store the new values also to the corresponding register DEBUG0--DEBUG2. This is done by replacing every instance of a code snippet that changes R1 (and R0,R2 accordingly):

```
@R1
M=<what so ever>
```

with the code that additionally writes the new value to the DEBUG1 register:

```
@R1
DM=<what so ever>
@DEBUG1
M=D
```

---

### Project

- Implement `leds.asm`  and `mult.asm`.

- Put your code in the skeleton file `<filename>.asm`. To build the `.hack` binary file, which can than be preloaded to the instruction ROM of HACK in `05_Computer_Architecture/04_HACK`, just type:
  
  ```
  $ make leds
  ```
  
  or
  
  ```
  $ make mult
  ```
  
  This will invoke the assembler and copy the produced binary file `ROM.hack` in the appropriate folder `05_Computer_Architecture/04_HACK`.

- To run the programms you first have to build a HACK computer. This is done in `05_Computer_Architecture`.
