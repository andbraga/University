#include <stdio.h>
#include <stdlib.h>
#include <sys/socket.h>
#include <sys/un.h>
#include <sys/types.h>
#include <string.h>
#include <pthread.h>

#define MAX(x, y) (((x) > (y)) ? (x) : (y))
#define FILE_NAME_FINAL_LOG "logFinal.txt"
#define FILE_NAME_LOG "log.txt"

#define SOCKET_PATH "/tmp/s.unixstr"

//VARIAVEIS SOCKETS

int sockfd, server_addr_len;

struct sockaddr_un server_address;

//VARIAVEIS GLOBAIS

int clientes_totais_disco;
int clientes_na_disco;
int clientes_sairam_disco;

int clientes_totais_sala_A;
int clientes_sala_A;
int clientes_fila_A;
int desistencias_fila_sala_A;
int clientes_fila_cheia_sala_A;

int clientes_totais_sala_B;
int normais_totais_sala_B;
int vips_totais_sala_B;
int clientes_sala_B;
int normais_sala_B;
int normais_fila_B;
int vips_sala_B;
int vips_fila_B;
int clientes_fila_cheia_sala_B;
int normais_fila_cheia_sala_B;
int vips_fila_cheia_sala_B;
int clientes_fila_B;

int clientes_totais_sala_C;
int homens_totais_sala_C;
int mulheres_totais_sala_C;
int clientes_sala_C;
int homens_sala_C;
int homens_fila_C;
int mulheres_sala_C;
int mulheres_fila_C;

int max_sala_A;
int max_sala_B;

int max_fila_A;
int max_fila_B;

//variaveis para estatisticas
int tmax_sala_A;
int tmin_sala_A;

int tmax_sala_B;
int tmin_sala_B;

int tmax_sala_C;
int tmin_sala_C;

	
//FUNÇOES

void writeFinalLog(int media_espera_sala_A, int media_espera_sala_B, int media_espera_sala_C);
void configSocket();
void readMessage(FILE *fplog);
void sendMessage(char msg[100]);
void *showState(void *arg);
void finalResults();
