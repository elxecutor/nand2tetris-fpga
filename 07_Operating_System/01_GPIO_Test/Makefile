PYTHON = /bin/python3.11

all: jack vm asm bin sim

jack:
	$(PYTHON) ../../tools/JackCompiler/JackCompiler.pyc ./
vm:
	$(PYTHON) ../../tools/VMTranslator/VMTranslator.pyc ./
asm:
	$(PYTHON) ../../tools/Assembler/assembler.pyc out.asm
bin:
	$(PYTHON) ../../tools/AsciiToBin.py out.hack
sim:
	cp out.hack ../00_HACK/ROM.hack
upload:
	iceprogduino -o 64k -w out.bin
clean:
	rm -f *.vm *.asm *.hack *.bin *~

.PHONY: all clean
