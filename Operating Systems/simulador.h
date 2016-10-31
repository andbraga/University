#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <sys/socket.h>
#include <sys/un.h>
#include <sys/types.h>
#include <pthread.h>
#include <semaphore.h>
#include <time.h>

#define SOCKET_PATH "/tmp/s.unixstr"

//VARIAVEIS SOCKETS

int sockfd, server_addr_len, newsockfd, client_addr_len;

struct sockaddr_un server_address, client_address;

//SEMAFOROS E TRINCOS

pthread_mutex_t trinco_thcounter;

sem_t sem_salaA;
pthread_mutex_t trinco_salaA;

sem_t sem_vip_salaB;
sem_t sem_norm_salaB;
pthread_mutex_t trinco_salaB;

sem_t sem_homem_salaC;
sem_t sem_mulher_salaC;
pthread_mutex_t trinco_salaC;

//PARAMETROS DE CONFIGURAÇAO (LIDOS DO FICHEIRO DE CONFIGURAÇAO)

int TEMPO_SIMULACAO;
int TEMPO_MEDIO_CHEGADA_USERS;
int TEMPO_MEDIO_PERMANENCIA_SALA;
int NUM_MAXIMO_USERS_SALA_A;
int NUM_MAXIMO_USERS_SALA_B;
int TAMANHO_FILA_SALA_A;
int TAMANHO_FILA_SALA_B;
int PROBABILIDADE_DESISTIR_FILA_A;

//VARIAVEIS GLOBAIS

time_t inicio_simulacao;		//tempo em que a simulaçao começou

int thcounter;					//numero total de threads criadas
int acabou;						//varaivel que diz se o tempo de simulação acabou (0 nao , 1 sim)

int lugares_fila_salaA;			//lugares disponiveis na fila para a sala A

int lugares_ocupados_salaB;		//numero de lugares ocupados na sala B
int vips_espera_entrar_salaB;	//numero de clientes vips a espera pa entrar na sala B
int norm_espera_entrar_salaB;	//numero de clientes normais a espera pa entrar na sala B
int lugares_fila_salaB;			//lugares disponiveis na fila para a sala B

int homens_espera_entrar_salaC;		//numero de homens a espera para entrar na sala B
int mulheres_espera_entrar_salaC;	//numero de mulheres a espera para entrar na sala B

//FUNÇOES

void readConfigFile(int argc, char *execfilename, char *filename);
void configSocket();
void readMessage();
void sendMessage(int id_cliente, int sexo, int estatuto, int acont, int sala);
void sleepTempoMedio(int tempo_medio);
void threadGenerator();
void *createClient(void *arg);
void selectSala(int id, int estatuto, int sexo);
void enterSalaA(int id, int estatuto, int sexo);
void enterSalaB(int id, int estatuto, int sexo);
void enterSalaC_homem(int id, int estatuto, int sexo);
void enterSalaC_mulher(int id, int estatuto, int sexo);
void leaveOrSelectSala(int id, int estatuto, int sexo);
void printSim(int t, int id_cliente, int sexo, int estatuto, int acont, int sala);
