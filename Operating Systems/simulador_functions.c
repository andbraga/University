#include "simulador.h"

void readConfigFile(int argc, char *execfilename, char *cfgfilename)
{
	FILE *fpconfig;

	if(argc < 2)
	{
		printf("ERRO: É necessário especificar um ficheiro de configuração! \n");
		printf("USO: %s <NOME DO FICHEIRO> \n", execfilename);

		exit(1);		
	}
	else if(argc > 2)
	{
		printf("ERRO: Apenas um ficheiro de configuração deve ser especificado! \n");
		printf("USO: %s <NOME DO FICHEIRO> \n", execfilename);

		exit(1);
	}
	else
	{
		if( (fpconfig = fopen(cfgfilename, "r"))  == NULL )
       	{
			printf("ERRO: O ficheiro %s não existe! \n", cfgfilename);

			exit(1);
		
		}
		else
		{
			printf("Ficheiro de configuração %s, carregado com sucesso! \n", cfgfilename);

			char line[100];

			while(fgets(line, sizeof(line), fpconfig) != NULL)
			{

				char parname[50] = {0};
				int value = 0;

				sscanf(line, "%s %d", parname, &value);

				if(strcmp(parname, "TEMPO_SIMULACAO:") == 0)
				{
					TEMPO_SIMULACAO = value;
					printf("%s %d \n", parname, TEMPO_SIMULACAO);
				}

				if(strcmp(parname, "TEMPO_MEDIO_CHEGADA_USERS:") == 0)
				{
					TEMPO_MEDIO_CHEGADA_USERS = value;
					printf("%s %d \n", parname, TEMPO_MEDIO_CHEGADA_USERS);

				}

				if(strcmp(parname, "TEMPO_MEDIO_PERMANENCIA_SALA:") == 0)
				{
					TEMPO_MEDIO_PERMANENCIA_SALA = value;
					printf("%s %d \n", parname, TEMPO_MEDIO_PERMANENCIA_SALA);

				}
				
				if(strcmp(parname, "NUM_MAXIMO_USERS_SALA_A:") == 0)
				{
					NUM_MAXIMO_USERS_SALA_A = value;
					printf("%s %d \n", parname, NUM_MAXIMO_USERS_SALA_A);
				}
				
				if(strcmp(parname, "NUM_MAXIMO_USERS_SALA_B:") == 0)
				{
					NUM_MAXIMO_USERS_SALA_B = value;
					printf("%s %d \n", parname, NUM_MAXIMO_USERS_SALA_B);
				}
				
				if(strcmp(parname, "TAMANHO_FILA_SALA_A:") == 0)
				{
					TAMANHO_FILA_SALA_A = value;
					printf("%s %d \n", parname, TAMANHO_FILA_SALA_A);
				}
				
				if(strcmp(parname, "TAMANHO_FILA_SALA_B:") == 0)
				{
					TAMANHO_FILA_SALA_B = value;
					printf("%s %d \n", parname, TAMANHO_FILA_SALA_B);
				}				
				
				if(strcmp(parname, "PROBABILIDADE_DESISTIR_FILA_A:") == 0)
				{
					PROBABILIDADE_DESISTIR_FILA_A = value;
					printf("%s %d \n", parname, PROBABILIDADE_DESISTIR_FILA_A);
				}
				
			}

			fclose(fpconfig);
		}
	}
}


void configSocket()
{
	//int sockfd, server_addr_len, newsockfd, client_addr_len;
	
	//struct sockaddr_un server_address, client_address;
	
	if( (sockfd = socket(AF_UNIX, SOCK_STREAM, 0)) < 0 )
	{
		printf("ERRO: Não foi possível criar o socket! \n");
		exit(1);
	}

	memset(&server_address, 0, sizeof(server_address));
	
	server_address.sun_family = AF_UNIX;
	strcpy(server_address.sun_path, SOCKET_PATH);
	
	server_addr_len = strlen(server_address.sun_path) + sizeof(server_address.sun_family);
	
	unlink(SOCKET_PATH);
	
	if(bind(sockfd, (struct sockaddr*) &server_address, server_addr_len) < 0)
	{
		printf("ERRO: Não foi possível atribuir nome ao socket! \n");
		exit(1);
	}
	
	listen(sockfd, 1);
	
	printf("A aguardar ligação do cliente (monitor)...\n");
	
	client_addr_len = sizeof(client_address);
	
	if( (newsockfd = accept(sockfd, (struct sockaddr*) &client_address, &client_addr_len)) < 0)
	{
		printf("ERRO: Não foi possível aceitar o cliente! \n");
		exit(1);
	}

}

void readMessage()
{
	char msg[100];
	read(newsockfd, msg, sizeof(msg));
	printf("%s", msg);
}

void sendMessage(int id_cliente, int sexo, int estatuto, int acont, int sala)
{
	int t = (int)(time(0) - inicio_simulacao);
	char msg[30];
	sprintf(msg, "%d, %d, %d, %d, %d, %d", t, id_cliente, sexo, estatuto, acont, sala);
	write(newsockfd, msg, sizeof(msg));
	printSim(t, id_cliente, sexo, estatuto, acont, sala);
}

void sleepTempoMedio(int tempo_medio)
{
	int tempo_extra;	//tempo extra desviado do tempo medio
	int sum_or_sub;		//variavel que determina se o tempo extra vai ser somado ou subtraido ao tempo medio
	int tempo_sleep;	//tempo de suspensão final
	
	sum_or_sub = rand() % 2;		//valor varia entre 0 e 1 (soma ou subtração)
	tempo_extra = rand() % 3;		//valor varia entre 0 e 2
		
	if(sum_or_sub == 0)				//é aqui determinado se o valor do tempo extra será somado ou subtraído, alterando o seu sinal
	{
		tempo_extra = 0 - tempo_extra;
	}
		
	tempo_extra = tempo_extra * 1000000;					//multiplicamos por 1000000 pois a funçao usleep usa valores em microsegundos. 1 segundo = 1000000 microsegundos
	tempo_sleep = (tempo_medio * 1000000) + tempo_extra;	//tempo de suspensão igual ao tempo médio mais o tempo extra
		
	if( tempo_sleep < 0 )	//no caso da constante de tempo medio ser 1, há possibilidade de obter valores negativos no tempo_sleep, esta verificação impede essa situação
	{
		tempo_sleep = 0;
	}
		
	usleep(tempo_sleep);
}


void threadGenerator()
{
	
	int id = 1;			//id a atribuir aos clientes
	
	while((int)(time(0) - inicio_simulacao) < TEMPO_SIMULACAO)		//enquanto não for atingido o tempo de simulação definido
	{
	
		pthread_t * thread = (pthread_t *)malloc(sizeof(pthread_t));
		
		if(pthread_create(thread, NULL, createClient, (void *)((long)id)) < 0)
		{
			printf("ERRO: Não foi possível criar tarefa! \n");
			exit(1);
		}	
		id++;
		free(thread);		
		pthread_mutex_lock(&trinco_thcounter);
		thcounter++;
		pthread_mutex_unlock(&trinco_thcounter);
		sleepTempoMedio(TEMPO_MEDIO_CHEGADA_USERS);
	}

}

void *createClient(void *arg)
{	
	int id = (long) arg;
	int estatuto = (rand() % 2) + 1;	
	int sexo = (rand() % 2) + 1;
	
	sendMessage(id, sexo, estatuto, 1, 0);
	
	selectSala(id, estatuto, sexo);	
}

void selectSala(int id, int estatuto, int sexo)
{
	int sala = (rand() % 3) + 1;
	
	switch(sala)
	{
		case 1:
			enterSalaA(id, estatuto, sexo);
			break;
		
		case 2:
			enterSalaB(id, estatuto, sexo);
			break;
		
		case 3:
			if(sexo == 1)	//Homem
			{
				enterSalaC_homem(id, estatuto, sexo);
			}
			else 			//Mulher
			{
				enterSalaC_mulher(id, estatuto, sexo);
			}			
			break;
	}
}

void enterSalaA(int id, int estatuto, int sexo)
{	
	int sala = 1;
	int valor = (rand() % 100) + 1;
	
	pthread_mutex_lock(&trinco_salaA);
	if(lugares_fila_salaA > 0)
	{
		lugares_fila_salaA--;
		sendMessage(id, sexo, estatuto, 3, sala);
		pthread_mutex_unlock(&trinco_salaA);
		//printf("está fora, id %d \n", id);
		sem_wait(&sem_salaA);
		
		pthread_mutex_lock(&trinco_salaA);
		if(valor <= PROBABILIDADE_DESISTIR_FILA_A)
		{
			//printf("desistiu da fila, id %d \n", id);
			sem_post(&sem_salaA);
			sendMessage(id, sexo, estatuto, 4, sala);
			lugares_fila_salaA++;
			pthread_mutex_unlock(&trinco_salaA);
			leaveOrSelectSala(id, estatuto, sexo);
		}
		
		//printf("entrou, id %d \n", id);				
		//pthread_mutex_lock(&trinco_salaA);
		sendMessage(id, sexo, estatuto, 5, sala);
		lugares_fila_salaA++;
		pthread_mutex_unlock(&trinco_salaA);
	
		sleepTempoMedio(TEMPO_MEDIO_PERMANENCIA_SALA);	//dançar

		pthread_mutex_lock(&trinco_salaA);
		sem_post(&sem_salaA);
		//printf("saiu id %d \n", id);
		sendMessage(id, sexo, estatuto, 6, sala);
		pthread_mutex_unlock(&trinco_salaA);
		
		leaveOrSelectSala(id, estatuto, sexo);
		
	}
	else
	{
		sendMessage(id, sexo, estatuto, 7, sala);
		pthread_mutex_unlock(&trinco_salaA);
		//printf("fila cheia %d \n", id);
		leaveOrSelectSala(id, estatuto, sexo);
	}

}

void enterSalaB(int id, int estatuto, int sexo)
{
	int sala = 2;
	
	//entrar sala
	pthread_mutex_lock(&trinco_salaB);
	if(lugares_fila_salaB > 0)
	{
		sendMessage(id, sexo, estatuto, 3, sala);
		lugares_fila_salaB--;
		
		if(lugares_ocupados_salaB == NUM_MAXIMO_USERS_SALA_B)
		{
			
			if(estatuto == 2)	//Cliente VIP
			{
				vips_espera_entrar_salaB++;
				//printf("está fora VIP, id %d, est %d \n", id, estatuto);
				pthread_mutex_unlock(&trinco_salaB);
				sem_wait(&sem_vip_salaB);
			}
			else 				//Cliente Normal
			{
				if(estatuto == 1)
				{
					norm_espera_entrar_salaB++;
					//printf("está fora NORM, id %d, est %d \n", id, estatuto);
					pthread_mutex_unlock(&trinco_salaB);
					sem_wait(&sem_norm_salaB);
				}
			}
			
			pthread_mutex_lock(&trinco_salaB);
			sendMessage(id, sexo, estatuto, 5, sala);
			lugares_fila_salaB++;
			//lugares_ocupados_salaB++;
			//printf("entrou, id %d est %d \n", id, estatuto);
			//printf("lugares ocupados %d id %d \n", lugares_ocupados_salaB, id);
			pthread_mutex_unlock(&trinco_salaB);
		}
		else
		{
			sendMessage(id, sexo, estatuto, 5, sala);
			lugares_fila_salaB++;
			lugares_ocupados_salaB++;
			//printf("entrou, id %d est %d \n", id, estatuto);
			//printf("lugares ocupados %d id %d  est %d \n", lugares_ocupados_salaB, id, estatuto);
			pthread_mutex_unlock(&trinco_salaB);
		}

		//printf("DANÇAR id %d \n", id);
		sleepTempoMedio(TEMPO_MEDIO_PERMANENCIA_SALA);	//dançar
	
		//sair sala
		pthread_mutex_lock(&trinco_salaB);
		if(lugares_ocupados_salaB == NUM_MAXIMO_USERS_SALA_B)
		{
			
			if(vips_espera_entrar_salaB > 0)
			{
				//pthread_mutex_unlock(&trinco_salaB);
				sem_post(&sem_vip_salaB);
				vips_espera_entrar_salaB--;
			}
			else
			{
				if(norm_espera_entrar_salaB > 0)
				{
					//pthread_mutex_unlock(&trinco_salaB);
					sem_post(&sem_norm_salaB);
					norm_espera_entrar_salaB--;
				}
				else
				{
					lugares_ocupados_salaB--;
				}
			}
			
			sendMessage(id, sexo, estatuto, 6, sala);
			//lugares_ocupados_salaB--;
			//printf("saiu id %d est %d \n", id, estatuto);
		
			//printf("lugares ocupados %d id %d \n", lugares_ocupados_salaB, id);
		}
		else
		{
			sendMessage(id, sexo, estatuto, 6, sala);
			lugares_ocupados_salaB--;
			//printf("saiu id %d est %d \n", id, estatuto);
			//printf("lugares ocupados %d id %d \n", lugares_ocupados_salaB, id);
		}
		pthread_mutex_unlock(&trinco_salaB);
		leaveOrSelectSala(id, estatuto, sexo);
	}
	else
	{
		//printf("fila cheia %d est %d \n", id, estatuto);
		sendMessage(id, sexo, estatuto, 7, sala);
		pthread_mutex_unlock(&trinco_salaB);
		leaveOrSelectSala(id, estatuto, sexo);
	}
}

void leaveOrSelectSala(int id, int estatuto, int sexo)
{
	int a = rand() % 2;
	
	switch(a)
	{
		case 0:
			selectSala(id, estatuto, sexo);
			break;
		
		case 1:
			sendMessage(id, sexo, estatuto, 2, 0);
			pthread_mutex_lock(&trinco_thcounter);
			thcounter--;
			pthread_mutex_unlock(&trinco_thcounter);
			pthread_exit(NULL);
			break;
	}
}

void enterSalaC_homem(int id, int estatuto, int sexo)
{
	int sala = 3;
	
	//entrar
	pthread_mutex_lock(&trinco_salaC);
	sendMessage(id, sexo, estatuto, 3, sala);
	if(acabou == 0)
	{
		if(mulheres_espera_entrar_salaC == 0)
		{
			//printf("está fora HOMEM, id %d, sexo %d \n", id, sexo);
			homens_espera_entrar_salaC++;
			pthread_mutex_unlock(&trinco_salaC);
			sem_wait(&sem_homem_salaC);
		}
		else
		{
			if(mulheres_espera_entrar_salaC > 0)
			{
				sem_post(&sem_mulher_salaC);
				mulheres_espera_entrar_salaC--;
				pthread_mutex_unlock(&trinco_salaC);
			}
		}
	}
	else
	{
		pthread_mutex_unlock(&trinco_salaC);
	}
	usleep(1000000);		//para a mudança de valores no monitor ser perceptivel	
	pthread_mutex_lock(&trinco_salaC);
	sendMessage(id, sexo, estatuto, 5, sala);
	pthread_mutex_unlock(&trinco_salaC);
	
	//printf("entrou, id %d sexo %d \n", id, sexo);
	sleepTempoMedio(TEMPO_MEDIO_PERMANENCIA_SALA);	//dançar
	//printf("saiu id %d sexo %d \n", id, sexo);
	
	//sair
	pthread_mutex_lock(&trinco_salaC);
	sendMessage(id, sexo, estatuto, 6, sala);
	pthread_mutex_unlock(&trinco_salaC);
	leaveOrSelectSala(id, estatuto, sexo);
}

void enterSalaC_mulher(int id, int estatuto, int sexo)
{
	int sala = 3;
	
	//entrar
	pthread_mutex_lock(&trinco_salaC);
	sendMessage(id, sexo, estatuto, 3, sala);
	if(acabou == 0)
	{
		if(homens_espera_entrar_salaC == 0)
		{
			//printf("está fora MULHER, id %d, sexo %d \n", id, sexo);
			mulheres_espera_entrar_salaC++;
			pthread_mutex_unlock(&trinco_salaC);
			sem_wait(&sem_mulher_salaC);
		}
		else
		{
			if(homens_espera_entrar_salaC > 0)
			{
				sem_post(&sem_homem_salaC);
				homens_espera_entrar_salaC--;
				pthread_mutex_unlock(&trinco_salaC);
			}
		}
	}
	else
	{
		pthread_mutex_unlock(&trinco_salaC);
	}
	usleep(1000000);		//para a mudança de valores no monitor ser perceptivel	
	pthread_mutex_lock(&trinco_salaC);
	sendMessage(id, sexo, estatuto, 5, sala);
	pthread_mutex_unlock(&trinco_salaC);
	
	//sair
	//printf("entrou, id %d sexo %d \n", id, sexo);
	sleepTempoMedio(TEMPO_MEDIO_PERMANENCIA_SALA);	//dançar
	//printf("saiu id %d sexo %d \n", id, sexo);
	
	pthread_mutex_lock(&trinco_salaC);
	sendMessage(id, sexo, estatuto, 6, sala);	
	pthread_mutex_unlock(&trinco_salaC);
	leaveOrSelectSala(id, estatuto, sexo);
}

void printSim(int t, int id_cliente, int sexo, int estatuto, int acont, int sala)
{
	char *acont_s = "";
	char *sala_s = "";
	char sexo_c = ' ';
	char estatuto_c = ' ';
		
	if(sexo == 1)
	{
		sexo_c = 'H';
	}
	else
	{
		if(sexo ==2)
		{
			sexo_c = 'M';
		}
	}
	
	if(estatuto == 1)
	{
		estatuto_c = 'N';
	}
	else
	{
		if(estatuto == 2)
		{
			estatuto_c = 'V';
		}
	}
		
	switch(acont)
	{
		case 1:		//cliente chegou à disco		
			acont_s = "chegou à discoteca";				
			break;
		
		case 2:		//cliente saiu da disco			
			acont_s = "saiu da discoteca";		
			break;		
		
		case 3:		//cliente chegou à fila da sala X			
			acont_s = "chegou à fila da";
			break;
			
		case 4:		//cliente desistiu da fila da sala X				
			acont_s = "desistiu da fila da";
			break;
				
		case 5:		//cliente entrou na sala X				
			acont_s = "entrou na";
			break;
			
		case 6:		//cliente saiu da sala X			
			acont_s = "saiu da";
			break;
				
		case 7:		//cliente encontrou fila cheia na sala X			
			acont_s = "encontrou fila cheia na";
			break;
	}
	
	switch(sala)
	{
		case 1:
			sala_s = "sala A";
			break;
		case 2:
			sala_s = "sala B";
			break;
		case 3:
			sala_s = "sala C";
			break;		
	}
	
	printf("%d - Cliente %d %c %c, %s %s \n", t, id_cliente, sexo_c, estatuto_c, acont_s, sala_s);
}


