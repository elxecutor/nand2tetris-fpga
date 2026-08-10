# 06 IO Devices

Build the following special function register to connect HACK to I/O-devices: `UART_TX`, `UART_RX`, `SPI`, `SRAM`, `GO`, `LCD` and `RTP`. For every special function register we provide a folder with implementation details and a testbench. The special function register must be memory mapped, so HACK can read/write data from/to the IO-device.

| address | I/O dev   | function                                           |
| ------- | --------- | -------------------------------------------------- |
| 4096    | LED       | 0 = led off, 1 = led on                            |
| 4097    | BUT       | 0 = button pressed "down", 1 = button released     |
| 4098    | UART_TX   | transmit byte to UART with 115200 baud 8N1         |
| 4099    | UART_RX   | receive byte from UART with 115200 baud 8N1        |
| 4100    | SPI       | read/write spi flash memory chip                   |
| 4101    | SRAM_ADDR | address of external SRAM chip                      |
| 4102    | SRAM_DATA | read/write data from/to external SRAM chip         |
| 4103    | GO        | Start execution of instructions from external SRAM |
| 4104    | LCD8      | write 8bit command/data to LCD screen              |
| 4105    | LCD16     | write 16bit data to LCD screen                     |
| 4106    | RTP       | read/write byte from/to resistive touch panel      |
| 4107    | DEBUG0    | used for debugging                                 |
| 4108    | DEBUG1    | used for debugging                                 |
| 4109    | DEBUG2    | used for debugging                                 |
| 4110    | DEBUG3    | used for debugging                                 |
| 4111    | DEBUG4    | used for debugging                                 |

For every special function register we will need the appropriate software to talk to the device. The simpler device drivers (UART, SPI, SRAM and GO) can be implemented in assembler. After completing the devices UART, SPI, SRAM and GO we will be able to fill the SRAM chip with up to 64K words (16bit) of HACK code. This will enable us to run JACK-OS and applications on HACK. The more sofisticated device drivers for LCD and RTP will be implemented in JACK language.

### Proposed implementation

![](/home/micha/gitlab/nand2tetris-fpga/06_IO_Devices/00_HACK/HACK.png)

***

### Project

+ Copy `HACK.v` from `05_Computer_Architecture` into `06_IO_Devices` and add one IO-Device at time at the designated memory mapped address. Implement the corresponding special function register and run the test bench.
  
  ```shell
  $ cd 0X_device
  $ apio clean
  $ apio sim
  ```

+ Implement the designated assembler program, install the binary into `00_HACK` and run the testbench:
  
  ```shell
  $ cd 0X_device
  $ make
  $ cd ../00_HACK
  $ apio clean
  $ apio sim
  ```
* Run `HACK` in real hardware on iCE40HX1K-EVB with the device attached as real device.
  
  ```shell
  $ cd 00_HACK
  $ apio clean
  $ apio upload
  ```

* Check if attached IO-Device is working accorging to the uploaded software.