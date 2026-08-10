PYTHON = /bin/python3.11

leds:
	$(PYTHON) ../tools/Assembler/assembler.pyc leds.asm
	cp leds.hack ../05_Computer_Architecture/04_HACK/ROM.hack
mult:
	$(PYTHON) ../tools/Assembler/assembler.pyc mult.asm
	cp mult.hack ../05_Computer_Architecture/04_HACK/ROM.hack
upload:
	$(PYTHON) ../tools/Assembler/assembler.pyc leds.asm
	$(PYTHON) ../tools/AsciiToBin.py leds.hack
	iceprogduino -o 64k -w leds.bin
clean:
	rm -f *.hack *~ *.bin

.PHONY: clean
