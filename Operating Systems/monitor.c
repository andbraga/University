#include "monitor.h"

int main(void)
{
	
	printf("\n");	
	printf("*****BEM VINDO AO SIMULADOR DE UMA DISCOTECA***** \n");
	printf("\n");
	printf("(Não de esqueça de executar primeiro o simulador) \n");
	printf("\n");
	printf("Pressione a tecla Enter para iniciar a simulação. \n");
	
	system("stty -echo");	//impede inputs do teclado de aparecerem no termimal
	while ( getchar_unlocked() != '\n');
	system("stty echo");
						
	configSocket();
	
	FILE *fplog;
	fplog = fopen(FILE_NAME_LOG, "a");	//abrir ficheiro de log
	
	fprintf(fplog, "************************************************* \n");
	fprintf(fplog, "\n");
	
	pthread_t thread;
	
	if(pthread_create(&thread, NULL, showState, NULL) < 0)	//thread que vai se dedicar a mostar o estado da simulaçao
	{
		printf("ERRO: Não foi possível criar tarefa! \n");
		exit(1);
	}

	readMessage(fplog);			//ler as mensagens do socket

	pthread_cancel(thread);		//cancela a thread que mostra o estado da simulaçao
	
	finalResults();
	
	close(sockfd); //fechar socket
	fclose(fplog);	//fechar ficheiro de log
	
	return 0;
}
