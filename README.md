Este repositório contém as atividades práticas da disciplina Segurança em Sistemas de Computação.
Cada atividade aborda um conceito fundamental da área, com foco em implementação prática usando ferramentas de linha de comando no Linux.

O repositório está organizado em dois diretórios:

---

## 1. Atividade 1 – Transferência Segura com Criptografia e Assinatura Digital

Esta atividade demonstra como duas entidades podem trocar arquivos com sigilo e autenticidade utilizando criptografia assimétrica.
O processo envolve:

* geração de pares de chaves RSA
* criptografia do arquivo com a chave pública do destinatário
* assinatura digital usando a chave privada do remetente
* verificação da assinatura
* descriptografia pelo destinatário

O diretório da atividade contém um README com instruções completas e os scripts utilizados.

---

## 2. Atividade 2 – Simulação de Prova de Trabalho (Proof of Work)

A segunda atividade simula o mecanismo básico utilizado em blockchains para validação de blocos.
O objetivo é encontrar um valor inteiro (nonce) que, ao ser concatenado a um arquivo, produz um hash SHA-256 com uma quantidade específica de zeros no início.

O diretório inclui:

* script de mineração
* exemplos de execução
* tabela com os tempos medidos para diferentes níveis de dificuldade

A atividade demonstra como a complexidade cresce rapidamente conforme se aumenta o número de zeros exigidos.

---

Ambas as atividades têm como objetivo reforçar o entendimento prático de técnicas de segurança amplamente utilizadas em sistemas modernos.
