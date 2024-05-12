clear

if [[ $1 == '' || $2 == '' || $3 == '' ]]
then
	echo "Coloque os dois parometros!"
	echo "EX: $0 asm1.s asm.o asm"
	echo "asm1.s => Arquivo que tem o Codigo ASM"
	echo "asm.o  => Nome do Arquivo que será Compilado (vai criar)"
	echo "asm    => Nome do \"Executavel\""
	exit
fi

as $1 -o $2
gcc -o $3 $2 -nostdlib -no-pie
./$3
