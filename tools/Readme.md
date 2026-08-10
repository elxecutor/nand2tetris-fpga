# tools

This folder contains the toolchain for Hack/Jack development.

## vim

vim configuration file to highlight syntax of jack/hack-files, when editing with vim. Copy the content of the subfolders into the appropriate vim configuration directory situated in your home directory  `~/.vim`.

```
$ cp vim/syntax/* ~/.vim/syntax/
$ cp vim/ftdetect/* ~/.vim/ftdetect/
```

## Assembler

Assembler translates Hack-Assembly-files to Machnine-code. Outputs the machine code to filename.hack.

`usage: ./Assembler/assembler.pyc [filename.asm]`

## JackCompiler

Compiles Jack classes (single file or all *.jack files in directory) to virtualmachine code.

`usage: ./JackCompiler/JackCompiler.pyc [filename.jack] or [dir]`

## VMTranslator

Translates vm code (single file or all files with ending *.vm in directory)to Assembler.

`usage: ./VMTranslator/VMTranslator.pyc [filename.vm] or [dir]`

## AsciiToBin.py

Translates .hack files to binary files that can be uploaded with iecprogduino.

`usage: ./AsciiToBin.py [filename.hack]`

## iceprogduino

iceprogduino is the programmer to upload bitstream files to iCE40 boards of olimex over olimexino-32u4 (arduino like board).

For this you first have to upload firmware to olimexino-32u4.

iceprogduino is supportes from apio (fpgawars)

connect:

1. ice40-HX1/8K-EVB to olimexino-32u4 (over UEXT)
2. olimexino-32u4 (with installed firmware) to PC over USB.

## olimexino-32u4-firmware

Firmware to run olimexino-32u4 as programmer/UART bridge.

# 
