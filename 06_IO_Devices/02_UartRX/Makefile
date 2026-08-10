PYTHON = /bin/python3.11

NAME = echo

all: asm install

asm:
	$(PYTHON) ../../tools/Assembler/assembler.pyc $(NAME).asm
install:
	cp $(NAME).hack ../00_HACK/ROM.hack
clean:
	rm -f *.hack *~

.PHONY: all clean
