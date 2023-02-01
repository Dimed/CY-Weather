Cy-Weather : Main.o 
	gcc -o Cy-Weather Main.o 

Main.o : ./Source/Main.c
	gcc -o Main.o -c ./Source/C/Main.c


