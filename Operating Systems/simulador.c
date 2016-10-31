#include "simulador.h"

int main(int argc, char* argv[])
{	
	srand(time(NULL));
	
	readConfigFile(argc, argv[0], argv[1]);
	
	configSocket();
	
	inicio_simulacao = time(0);

	acabou = 0;
	thcounter = 0;
	
	pthread_mutex_init(&trinco_thcounter, NULL);
	
	pthread_mutex_init(&trinco_salaA, NULL);
	sem_init(&sem_salaA, 0, NUM_MAXIMO_USERS_SALA_A);
	lugares_fila_salaA = TAMANHO_FILA_SALA_A;
	
	pthread_mutex_init(&trinco_salaB, NULL);
	sem_init(&sem_vip_salaB, 0, 0);
	sem_init(&sem_norm_salaB, 0, 0);
	vips_espera_entrar_salaB = 0;
	norm_espera_entrar_salaB = 0;
	lugares_ocupados_salaB = 0;	
	lugares_fila_salaB = TAMANHO_FILA_SALA_B;
	
	pthread_mutex_init(&trinco_salaC, NULL);
	sem_init(&sem_homem_salaC, 0, 0);
	sem_init(&sem_mulher_salaC, 0, 0);	
	homens_espera_entrar_salaC = 0;
	mulheres_espera_entrar_salaC = 0;
		
	threadGenerator();
	
	int i, j;
	pthread_mutex_lock(&trinco_salaC);
	acabou = 1;
	if(mulheres_espera_entrar_salaC > 0)
	{
		for (i = 0; i < mulheres_espera_entrar_salaC; i++) 
		{
			sem_post(&sem_mulher_salaC);
		}
	}
	else
	{
		if(homens_espera_entrar_salaC > 0)
		{
			for(j = 0; j < homens_espera_entrar_salaC; j++)
			{
				sem_post(&sem_homem_salaC);
			}
		}
	}
	pthread_mutex_unlock(&trinco_salaC);
	
	while(thcounter != 0)
	{
		usleep(1000000);
	}
	
	//usleep(5000000);
	sendMessage(0, 0, 0, 99, 0); // mensagem para o socket parar de ser lido
	
	printf("***FIM DA SIMULAÇÃO*** \n");
	
	pthread_mutex_destroy(&trinco_thcounter);
	pthread_mutex_destroy(&trinco_salaA);
	pthread_mutex_destroy(&trinco_salaB);
	pthread_mutex_destroy(&trinco_salaC);
	sem_destroy(&sem_salaA);
	sem_destroy(&sem_vip_salaB);
	sem_destroy(&sem_norm_salaB);
	sem_destroy(&sem_homem_salaC);
	sem_destroy(&sem_mulher_salaC);	
	close(sockfd); //fechar socket
		
	return 0;
}
