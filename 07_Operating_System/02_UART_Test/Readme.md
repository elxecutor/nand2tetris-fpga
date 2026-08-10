## UART.jack

Library that provides character based access to `UART_TX` and `UART_RX`.

### UART_Test

In the Testfolder `02_UART_Test` you find a minimal version of `Sys.jack` containing the init function `Sys.init()`, which is called after starting JACK-OS. `Sys.init()` is the JACK-OS version of `echo.asm`, which reads the bytes received at `UART_RX` and writes the values to `UART_TX` in an endless loop:

```
class Sys {

    function void init() {
        do UART.init(4098);
        while (true){
            do UART.write(UART.read());
        }        
        return;
    }
}
```

***

### Project

* Implement `UART.jack`

* Test in simulation:
  
  ```
  $ cd 02_UARTTest
  $ make
  $ cd ../00_HACK
  $ apio clean
  $ apio sim
  ```
  
  The test bench will simulate the transmission of "RX" to UART_RX. Check if HACK echoes to `UART_TX`.
  
  ![](uart.png)

* run in real hardware with HACK build at `06_IO_Devices/05_GO` (together with the bootloader). Build and upload the UART_Test to iCE40HX1K-EVB with:
  
  ```
  $ cd 02_UART_Test
  $ make
  $ make upload
  ```

* Connect HACK with your computer over UART, open a terminal program and type some chars. Check if HACK can echo them.
  
  ```
  $ tio /dev/ttyACM0
  ```
