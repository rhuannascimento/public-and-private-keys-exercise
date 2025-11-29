## Objetivo

Este projeto demonstra uma simulação simplificada do mecanismo de prova de trabalho utilizado em blockchains.
A tarefa consiste em encontrar um valor inteiro (nonce) que, quando concatenado a um arquivo, gera um hash SHA-256 com um número específico de zeros no início.

Aumentar o número de zeros aumenta a dificuldade da busca.

---

## Arquivo base

O experimento utiliza um arquivo simples chamado:

```
segredo.txt
```

Ele pode ser qualquer arquivo de texto.

---

## Script de mineração

O script chamado `mine.sh` recebe dois parâmetros:

```
./mine.sh arquivo numero_de_zeros
```

Ele testa nonces incrementalmente até encontrar um hash SHA-256 que comece com a quantidade de zeros especificada.

Exemplo de uso:

```
./mine.sh segredo.txt 2
./mine.sh segredo.txt 3
```

---

## Processo de mineração

Para medir o tempo gasto, usa-se o comando `time`:

```
time ./mine.sh segredo.txt 2
time ./mine.sh segredo.txt 3
```

O script imprime:

* O nonce encontrado
* O hash correspondente
* O tempo total consumido (via comando time)

---

## Resultados obtidos

Foram realizadas múltiplas execuções para 2 e 3 zeros.

### Hash com 3 zeros no início

| Execução | Nonce | Tempo real (s) |
| -------- | ----- | -------------- |
| 1        | 10488 | 29.448         |
| 2        | 10488 | 29.814         |
| 3        | 10488 | 29.273         |
| 4        | 10488 | 29.414         |
| 5        | 10488 | 29.074         |

Média aproximada: **29,4 segundos**

### Hash com 2 zeros no início

| Execução | Nonce | Tempo real (s) |
| -------- | ----- | -------------- |
| 1        | 1624  | 4.401          |
| 2        | 1624  | 4.491          |
| 3        | 1624  | 4.450          |
| 4        | 1624  | 4.449          |
| 5        | 1624  | 4.727          |

Média aproximada: **4,5 segundos**

---

## Conclusão

O experimento demonstra que:

* A dificuldade cresce de forma exponencial quando se aumenta o número de zeros exigido.
* O tempo médio para encontrar um hash com 3 zeros é aproximadamente **6,5 vezes maior** do que para 2 zeros.
* O aumento da dificuldade está diretamente relacionado ao número de tentativas necessárias até que o hash desejado seja encontrado.

Essa diferença de tempo ilustra o princípio básico de prova de trabalho, onde aumentar a dificuldade implica aumentar o esforço computacional necessário.
