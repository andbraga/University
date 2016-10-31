#include "monitor.h"

void configSocket()
{
	//int sockfd, server_addr_len;

	//struct sockaddr_un server_address;
	
	if( (sockfd = socket(AF_UNIX, SOCK_STREAM, 0)) < 0 )
	{
		printf("ERRO: Não foi possível criar o socket! \n");
		exit(1);
	}
	
	memset(&server_address, 0, sizeof(server_address));
	
	server_address.sun_family = AF_UNIX;
	strcpy(server_address.sun_path, SOCKET_PATH);
	
	server_addr_len = strlen(server_address.sun_path) + sizeof(server_address.sun_family);
		
	if(connect(sockfd, (struct sockaddr*) &server_address, server_addr_len) < 0)
	{
		printf("ERRO: Não foi possível ligar ao servidor! (simulador) \n");
		exit(1);
	}	
}

void sendMessage(char msg[100])
{
	write(sockfd, msg, sizeof(msg));
}

void readMessage(FILE *fplog)
{	
	while(1)
	{	
		int t, id_cliente, sexo, estatuto, acont, sala;
	
		char msg[30];	
		read(sockfd, msg, sizeof(msg));	
		sscanf(msg, "%d, %d, %d, %d, %d, %d", &t, &id_cliente, &sexo, &estatuto, &acont, &sala);
	
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
			
				clientes_totais_disco++;
				clientes_na_disco++;	
				break;
		
			case 2:		//cliente saiu da disco
			
				acont_s = "saiu da discoteca";	
			
				clientes_na_disco--;
				clientes_sairam_disco++;	
				break;		
		
			case 3:		//cliente chegou à fila da sala X
			
				acont_s = "chegou à fila da";
				
				if(sala == 1)	//sala A
				{	
					sala_s = "sala A";
					
					clientes_fila_A++;
					
					max_fila_A = MAX(max_fila_A, clientes_fila_A);
					tmin_sala_A = tmin_sala_A + t;
				}
				
				else if(sala == 2)	//sala B
				{	
					sala_s = "sala B";
					
					clientes_fila_B++;
					
					max_fila_B = MAX(max_fila_B, clientes_fila_B);
					tmin_sala_B = tmin_sala_B + t;
					
					if(estatuto == 1)	//cliente normal
					{
						normais_fila_B++;
					}
					else if(estatuto == 2)	//cliente vip
					{
						vips_fila_B++;
					}
				}
				
				else if(sala == 3)	//sala C
				{
					sala_s = "sala C";
					
					tmin_sala_C = tmin_sala_C + t;
					
					if(sexo == 1)	//homem
					{
						homens_fila_C++;
					}
					else if(sexo == 2)	//mulher
					{
						mulheres_fila_C++;				
					}
				}	
				break;
			
			case 4:		//cliente desistiu da fila da sala X
				
				acont_s = "desistiu da fila da";
				
				if(sala == 1)	//sala A
				{
					sala_s = " sala A";
					
					desistencias_fila_sala_A++;
					clientes_fila_A--;
					
					tmax_sala_A = tmax_sala_A + t;
				}
					
				break;
				
			case 5:		//cliente entrou na sala X
				
				acont_s = "entrou na";
				
				if(sala == 1)	//sala A
				{
					sala_s = "sala A";
					
					clientes_totais_sala_A++;
					clientes_sala_A++;
					clientes_fila_A--;
					
					max_sala_A = MAX(max_sala_A, clientes_sala_A);
					tmax_sala_A = tmax_sala_A + t;
				}
				
				else if(sala == 2)	//sala B
				{
					sala_s = "sala B";
					
					clientes_totais_sala_B++;
					clientes_sala_B++;
					clientes_fila_B--;
					
					max_sala_B = MAX(max_sala_B, clientes_sala_B);
					tmax_sala_B = tmax_sala_B + t;
					
					if(estatuto == 1)	//cliente normal
					{
						normais_totais_sala_B++;
						normais_sala_B++;
						normais_fila_B--;
					}
					else if(estatuto == 2)	//cliente vip
					{
						vips_totais_sala_B++;
						vips_sala_B++;
						vips_fila_B--;
					}
				}
				
				else if(sala == 3)	//sala C
				{
					sala_s = "sala C";
					
					clientes_totais_sala_C++;
					clientes_sala_C++;
					
					tmax_sala_C = tmax_sala_C + t;
					
					if(sexo == 1)	//homem
					{
						homens_totais_sala_C++;
						homens_sala_C++;
						homens_fila_C--;
					}
					else if(sexo == 2)	//mulher
					{
						mulheres_totais_sala_C++;
						mulheres_sala_C++;
						mulheres_fila_C--;				
					}
				}	
				break;
			
			case 6:		//cliente saiu da sala X
			
				acont_s = "saiu da";
			
				if(sala == 1)	//sala A
				{
					sala_s = "sala A";
					
					clientes_sala_A--;
				}
				
				else if(sala == 2)	//sala B
				{
					sala_s = "sala B";
					
					clientes_sala_B--;
					
					if(estatuto == 1)	//cliente normal
					{
						normais_sala_B--;
					}
					else if(estatuto == 2)	//cliente vip
					{
						vips_sala_B--;
					}
				}
				
				else if(sala == 3)	//sala C
				{
					sala_s = "sala C";
					
					clientes_sala_C--;
					
					if(sexo == 1)	//homem
					{
						homens_sala_C--;
					}
					else if(sexo == 2)	//mulher
					{
						mulheres_sala_C--;			
					}
				}	
				break;
				
			case 7:		//cliente encontrou fila cheia na sala X
			
				acont_s = "encontrou fila cheia na";
				
				if(sala == 1)	//sala A
				{
					sala_s = "sala A";
					
					clientes_fila_cheia_sala_A++;
				}
				else if(sala == 2)	//sala B
				{
					sala_s = "sala B";
					
					clientes_fila_cheia_sala_B++;
					
					if(estatuto == 1)	//cliente normal
					{
						normais_fila_cheia_sala_B++;
					}
					else if(estatuto == 2)	//cliente vip
					{
						vips_fila_cheia_sala_B++;
					}
				}
							
				break;
				
			case 99:		//pára de ler o socket
				return;	
				break;
		}
	
	
		//printf("%d - Cliente %d %c %c, %s %s \n", t, id_cliente, sexo_c, estatuto_c, acont_s, sala_s);
		fprintf(fplog, "%d - Cliente %d %c %c, %s %s \n", t, id_cliente, sexo_c, estatuto_c, acont_s, sala_s);
	
	}
}

void *showState(void *arg)
{
	while(1)
	{
		printf("\033[2J\033[1;1H"); //limpa o ecran
	
		printf("Total de clientes que estiveram na discoteca: %d \n", clientes_totais_disco);
		printf("Clientes na discoteca: %d \n", clientes_na_disco);
		printf("Clientes que sairam da discoteca: %d \n", clientes_sairam_disco);
		printf("\n");
	
		printf("SALA A \n");
		printf("Total de entradas na sala: %d \n", clientes_totais_sala_A);
		printf("Clientes na sala: %d \n", clientes_sala_A);
		printf("Clientes na fila: %d \n", clientes_fila_A);
		printf("Desistências na fila: %d \n", desistencias_fila_sala_A);
		printf("Vezes que foi encontrada fila cheia: %d \n", clientes_fila_cheia_sala_A);
		printf("Máximo de clientes em simultâneo na sala: %d \n", max_sala_A);
		printf("Máximo de clientes em simultâneo na fila: %d \n", max_fila_A);
		printf("\n");
	
		printf("SALA B \n");
		printf("Total de entradas na sala: %d \n", clientes_totais_sala_B);
		printf("Total de entradas de clientes Normais na sala: %d \n", normais_totais_sala_B);
		printf("Total de entradas de clientes VIP na sala: %d \n", vips_totais_sala_B);
		printf("Clientes na sala: %d \n", clientes_sala_B);
		printf("Clientes Normais na sala: %d \n", normais_sala_B);
		printf("Clientes VIP na sala: %d \n", vips_sala_B);
		printf("Clientes Normais na: fila: %d \n", normais_fila_B);
		printf("Clientes VIP na fila: %d \n", vips_fila_B);
		printf("Vezes que foi encontrada fila cheia: %d \n", clientes_fila_cheia_sala_B);
		printf("Vezes que clientes Normais encontraram fila cheia: %d \n", normais_fila_cheia_sala_B);
		printf("Vezes que clientes VIP encontraram fila cheia: %d \n", vips_fila_cheia_sala_B);
		printf("Máximo de clientes em simultâneo na sala: %d \n", max_sala_B);
		printf("Máximo de clientes em simultâneo na fila: %d \n", max_fila_B);
		printf("\n");
	
		printf("SALA C \n");
		printf("Total de entradas na sala: %d \n", clientes_totais_sala_C);
		printf("Total de entradas de Homens na sala: %d \n", homens_totais_sala_C);
		printf("Total de entradas de Mulheres na sala: %d \n", mulheres_totais_sala_C);
		printf("Clientes na sala: %d \n", clientes_sala_C);
		printf("Homens na sala: %d \n", homens_sala_C);
		printf("Mulheres na sala: %d \n", mulheres_sala_C);
		printf("Homens na fila: %d \n", homens_fila_C);
		printf("Mulheres na fila: %d \n", mulheres_fila_C);
		
		usleep(10000);
	}
}

void finalResults()
{
	int media_espera_sala_A;
	int media_espera_sala_B;
	int media_espera_sala_C;
	
	media_espera_sala_A = (tmax_sala_A - tmin_sala_A) / clientes_totais_sala_A;
	media_espera_sala_B = (tmax_sala_B - tmin_sala_B) / clientes_totais_sala_B;
	media_espera_sala_C = (tmax_sala_C - tmin_sala_C) / clientes_totais_sala_C;
	
	printf("\n");
	printf("Tempo médio de espera para entrar na sala A: %d segundos \n", media_espera_sala_A);
	printf("Tempo médio de espera para entrar na sala B: %d segundos \n", media_espera_sala_B);
	printf("Tempo médio de espera para entrar na sala C: %d segundos \n", media_espera_sala_C);
	printf("\n");
	
	printf("***FIM DA SIMULAÇÃO*** \n");
	
	writeFinalLog(media_espera_sala_A, media_espera_sala_B, media_espera_sala_C);
}

void  writeFinalLog(int media_espera_sala_A, int media_espera_sala_B, int media_espera_sala_C)
{
	FILE *fpflog;

	fpflog = fopen(FILE_NAME_FINAL_LOG, "a");
		
	fprintf(fpflog, "Total de clientes que estiveram na discoteca: %d \n", clientes_totais_disco);
	fprintf(fpflog, "Clientes que sairam da discoteca: %d \n", clientes_sairam_disco);
	fprintf(fpflog, "\n");
	
	fprintf(fpflog, "SALA A \n");
	fprintf(fpflog, "Total de entradas na sala: %d \n", clientes_totais_sala_A);
	fprintf(fpflog, "Desistências na fila: %d \n", desistencias_fila_sala_A);
	fprintf(fpflog, "Vezes que foi encontrada fila cheia: %d \n", clientes_fila_cheia_sala_A);
	fprintf(fpflog, "Máximo de clientes em simultâneo na sala: %d \n", max_sala_A);
	fprintf(fpflog, "Máximo de clientes em simultâneo na fila: %d \n", max_fila_A);
	fprintf(fpflog, "\n");
	
	fprintf(fpflog, "SALA B \n");	
	fprintf(fpflog, "Total de entradas na sala: %d \n", clientes_totais_sala_B);
	fprintf(fpflog, "Total de entradas de clientes Normais na sala: %d \n", normais_totais_sala_B);
	fprintf(fpflog, "Total de entradas de clientes VIP na sala: %d \n", vips_totais_sala_B);
	fprintf(fpflog, "Vezes que foi encontrada fila cheia: %d \n", clientes_fila_cheia_sala_B);
	fprintf(fpflog, "Vezes que clientes Normais encontraram fila cheia: %d \n", normais_fila_cheia_sala_B);
	fprintf(fpflog, "Vezes que clientes VIP encontraram fila cheia: %d \n", vips_fila_cheia_sala_B);
	fprintf(fpflog, "Máximo de clientes em simultâneo na sala: %d \n", max_sala_B);
	fprintf(fpflog, "Máximo de clientes em simultâneo na fila: %d \n", max_fila_B);
	fprintf(fpflog, "\n");
	
	fprintf(fpflog, "SALA C \n");
	fprintf(fpflog, "Total de entradas na sala: %d \n", clientes_totais_sala_C);
	fprintf(fpflog, "Total de entradas de Homens na sala: %d \n", homens_totais_sala_C);
	fprintf(fpflog, "Total de entradas de Mulheres na sala: %d \n", mulheres_totais_sala_C);
	fprintf(fpflog, "\n");
	
	fprintf(fpflog, "Tempo médio de espera para entrar na sala A: %d segundos \n", media_espera_sala_A);
	fprintf(fpflog, "Tempo médio de espera para entrar na sala B: %d segundos \n", media_espera_sala_B);
	fprintf(fpflog, "Tempo médio de espera para entrar na sala C: %d segundos \n", media_espera_sala_C);
	fprintf(fpflog, "\n");
	
	fprintf(fpflog, "************************************************* \n");
	fprintf(fpflog, "\n");
	
	fclose(fpflog);
}
