## StdIO.jack

A library of functions for text based input and output over UART.

***

### Project

* Implement `StdIO.jack`.

* Run `StdIO_Test` in real hardware on iCE40HX1K-EVB using a terminal program connected to UART.

* Compare your terminal output with:
  
  ```
  StdIO test:
  Please press the number '3': 
  ok
  readLine test:
  (Verify echo and usage of 'backspace')
  Please type 'JACK' and press enter: JACK
  ok
  readInt test:
  (Verify echo and usage of 'backspace')
  Please type '-32123' and press enter: -32123
  ok
  
  Test completed successfully
  ```