#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
  char nome[50];
  char cpf[12];
} Proprietario;

typedef struct {
  char marca[20];
  char cor[20];
  char modelo[20];
  int ano;
  char placa[15];
  char dono[12];
} Veiculo;

void cadastro_proprietario_veiculo() {
  Proprietario novo_proprietario;
  printf("\nDigite o nome do proprietario: ");
  scanf(" %s", novo_proprietario.nome);
  printf("Digite o CPF do proprietario (apenas numeros): ");
  scanf(" %s", novo_proprietario.cpf);

  FILE *proprietarios;
  proprietarios = fopen("bdp.bin", "a");
  fwrite(&novo_proprietario, sizeof(Proprietario), 1, proprietarios);
  fclose(proprietarios);

  int num_veiculos, i;
  printf("\nDigite o numero de veiculos que %s possui: ",
         novo_proprietario.nome);
  scanf("%d", &num_veiculos);

  FILE *automoveis;
  automoveis = fopen("bda.bin", "a");

  for (i = 0; i < num_veiculos; i++) {
    Veiculo novo_veiculo;
    printf("Veiculo %d:\n", i + 1);
    printf("Digite a marca do veiculo: ");
    scanf("%s", novo_veiculo.marca);
    printf("Digite a cor do veiculo: ");
    scanf("%s", novo_veiculo.cor);
    printf("Digite o modelo do veiculo: ");
    scanf("%s", novo_veiculo.modelo);
    printf("Digite o ano do veiculo: ");
    scanf("%d", &novo_veiculo.ano);
    printf("Digite a placa do veiculo (com letras maiusculas e sem tracos): ");
    scanf("%s", novo_veiculo.placa);
    strcpy(novo_veiculo.dono, novo_proprietario.cpf);

    fwrite(&novo_veiculo, sizeof(Veiculo), 1, automoveis);
  }
  fclose(automoveis);
  printf("\nProprietario e veiculo(s) cadastrado(s) com sucesso!\n\n");
}

void imprime_cadastro(char *cpf) {

  FILE *busca_p = fopen("bdp.bin", "r");
  Proprietario busca_proprietario;

  int verificacao = 0;

  while (fread(&busca_proprietario, sizeof(Proprietario), 1, busca_p)) {
    if (strcmp(cpf, busca_proprietario.cpf) == 0) {
      verificacao++;
      printf("\nProprietario: %s\nCpf: %s\n\n\n", busca_proprietario.nome,
             busca_proprietario.cpf);
    }
  }

  if (verificacao == 0) {
    printf("\nNao ha registro de proprietario para o cpf infomado!\n");
  }

  FILE *busca = fopen("bda.bin", "r");
  Veiculo busca_veiculo;

  while (fread(&busca_veiculo, sizeof(Veiculo), 1, busca)) {
    if (strcmp(cpf, busca_veiculo.dono) == 0) {
      printf("marca:%s\ncor:%s\nmodelo:%s\nano:%d\nplaca:%s\n\n",
             busca_veiculo.marca, busca_veiculo.cor, busca_veiculo.modelo,
             busca_veiculo.ano, busca_veiculo.placa);
    }
  }
}

int main() {

  for (;;) {
    int escolha;
    printf("\nEscolha uma das opcoes abaixo:\n");
    printf("(1) - Cadastrar novo proprietario e seu(s) veiculo(s).\n");
    printf("(2) - Listar proprietario e seu(s) veiculo(s).\n");
    printf("(3) - Sair.\n\n");

    printf("Opcao de selecao: ");
    scanf("%d", &escolha);
    printf("\n");

    char busca_proprietario[12];
    switch (escolha) {
    case 1:
      cadastro_proprietario_veiculo();
      break;

    case 2:
      printf("Informe o cpf para busca: ");
      scanf("%s", busca_proprietario);

      imprime_cadastro(busca_proprietario);
      break;

    case 3:
      return 0;
    }
  }
}
