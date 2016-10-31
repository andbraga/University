all: simulador monitor

simulador: simulador.o simulador_functions.o
	gcc -g simulador.o simulador_functions.o -o simulador -pthread
simulador.o: simulador.c simulador.h
	gcc -g -c simulador.c
simulador_functions.o: simulador_functions.c simulador.h
	gcc -g -c simulador_functions.c


monitor: monitor.o monitor_functions.o
	gcc -g monitor.o monitor_functions.o -o monitor -pthread
monitor.o: monitor.c monitor.h
	gcc -g -c monitor.c
monitor_functions.o: monitor_functions.c monitor.h
	gcc -g -c monitor_functions.c

clean:
	rm *.o
