O programa tem 8 ficheiros:

makefile
sim.cfg

simulador.c
simulador_functions.c
simulador.h

monitor.c
monitor_functions.c
monitor.h

O ficheiros tem de estar todos no mesmo diretório.

Para executar a simulação:

1º - Escrever "make" no terminal para compilar (é possível apagar os ficheiros do tipo .o com "make clean")

2º - Iniciar o simulador com o comando "./simulador sim.cfg" 
Para usar outro ficheiro de configuração utilizar o comando "./simulador <NOME DO FICHEIRO>" e substituir
<NOME DO FICHEIRO> pelo nome do ficheiro pretendido (recomenda-se a utilização do ficheiro sim.cfg)

3º - Noutra janela do terminal, iniciar o monitor com o comando "./monitor"

4º - Na janela do monitor pressione a tecla Enter para iniciar a simulação

No final da simulação, no mesmo diretório serão criados dois ficheiros log.txt e logFinal.txt

O ficheiro log.txt contém os logs das simulações
O ficheiro logFinal.txt contém os resultados finais das simulações

Ambos os ficheiros podem ser apagados sem qualquer problema