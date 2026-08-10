#!/bin/sh
for filename in ../*/*.v
do
	sed -i '1,/Put your code here:/!d' ${filename}
	echo "\nendmodule" >> ${filename}
done
sed -i '1,/endmodule/!d' ../01_Boolean_Logic/Nand.v
sed -i '1,/endmodule/!d' ../03_Sequential_Logic/DFF.v
sed -i '1,/endmodule/!d' ../03_Sequential_Logic/RAM256.v
sed -i '1,/endmodule/!d' ../05_Computer_Architecture/ROM.v
sed -i '1,/endmodule/!d' ../06_IO_Devices/InOut.v

sed -i '/[\t]/d' ../07_Operating_System/*.jack

sed -i '/[\t]/d' ../04_Machine_Language/*.asm
for filename in ../06_IO_Devices/*/*.asm
do
	sed -i '1,/Put your code here:/!d' ${filename}
done
sed -i '/REMOVE CODE/d' ../07_Operating_System/12_Tetris/Main.jack
#rm -r ../tools/Assembler/src
#rm -r ../tools/VMTranslator/src
#rm -r ../tools/JackCompiler/src
