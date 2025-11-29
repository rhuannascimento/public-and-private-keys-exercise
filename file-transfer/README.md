## Transferência Segura de Arquivos com Criptografia e Assinatura Digital

Este projeto demonstra como duas entidades (A e B) podem transferir arquivos com segurança usando criptografia assimétrica e assinatura digital com OpenSSL.

O objetivo é garantir:

* Sigilo: apenas o destinatário consegue ler o arquivo.
* Autenticação: o destinatário consegue verificar quem enviou.
* Integridade: o arquivo não foi modificado.

---

## 1. Estrutura

Criam-se duas pastas representando duas entidades:

```
pessoaA/
pessoaB/
```

Cada entidade terá uma chave privada e uma chave pública.

---

## 2. Geração das chaves

### Na pessoa A:

```
openssl genrsa -out privateA.pem 2048
openssl rsa -in privateA.pem -pubout -out publicA.pem
```

### Na pessoa B:

```
openssl genrsa -out privateB.pem 2048
openssl rsa -in privateB.pem -pubout -out publicB.pem
```

---

## 3. Troca de chaves públicas

A precisa da chave pública da B, e B precisa da chave pública da A.

Simulado copiando os arquivos:

```
cp pessoaB/publicB.pem pessoaA/
cp pessoaA/publicA.pem pessoaB/
```

---

## 4. Criptografia do arquivo para envio

Na pessoa A, crie um arquivo:

```
echo "arquivo confidencial para pessoa B" > segredo.txt
```

A criptografa com a chave pública da B:

```
openssl rsautl -encrypt -inkey publicB.pem -pubin -in segredo.txt -out segredo.enc
```

Isso garante que só a pessoa B pode descriptografar.

---

## 5. Assinatura digital

A assina o arquivo original com sua chave privada:

```
openssl dgst -sha256 -sign privateA.pem -out assinatura.bin segredo.txt
```

Isso permite que B confirme que o conteúdo veio da A.

---

## 6. Envio do arquivo

Os arquivos enviados são:

* segredo.enc (arquivo criptografado)
* assinatura.bin (assinatura digital)

Simulado com:

```
mv segredo.enc assinatura.bin pessoaB/
```

---

## 7. Descriptografia pelo destinatário (B)

Na pessoa B:

```
openssl rsautl -decrypt -inkey privateB.pem -in segredo.enc -out segredo_decriptado.txt
```

Agora B tem o conteúdo original.

---

## 8. Verificação da assinatura

B usa a chave pública da A:

```
openssl dgst -sha256 -verify publicA.pem -signature assinatura.bin segredo_decriptado.txt
```

Se estiver tudo correto, a saída será:

```
Verified OK
```

---

## Conclusão

O processo mostrou:

* Geração de chaves RSA
* Criptografia com chave pública do destinatário
* Assinatura com chave privada do remetente
* Verificação da assinatura
* Descriptografia pelo destinatário

Esse fluxo garante sigilo, autenticidade e integridade do arquivo durante a transferência.
