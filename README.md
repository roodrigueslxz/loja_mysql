# Banco de Dados - Loja

## Sobre o projeto

Este projeto consiste na criação de um banco de dados para uma loja fictícia, desenvolvido utilizando SQL (MySQL), com o objetivo de simular o gerenciamento de clientes, produtos e vendas.

O sistema permite armazenar informações, realizar consultas e analisar dados relacionados às operações de uma loja.

## Estrutura do banco de dados
O banco de dados é composto por 3 tabelas principais:

### Clientes
Armazena informações dos clientes:
* ID
* Nome
* Email
* Telefone
* Endereço
* Data de cadastro

### Produtos
Contém os produtos disponíveis na loja:
* ID
* Nome
* Descrição
* Valor unitário
* Quantidade em estoque
* Categoria
* Data de cadastro

### Vendas
Registra as vendas realizadas:
* ID da venda
* Cliente (relacionado)
* Produto (relacionado)
* Quantidade
* Valor unitário
* Valor total
* Data da venda

## Relacionamentos

* A tabela **vendas** possui relacionamento com:
  * **clientes** (id_cliente)
  * **produtos** (id_produto)
Esses relacionamentos são feitos através de **chaves estrangeiras (foreign keys)**.

## Funcionalidades

* Criação do banco de dados
* Criação de tabelas com relacionamentos
* Inserção de dados (clientes, produtos e vendas)
* Consultas SQL para:
  * Listar produtos
  * Listar clientes
  * Visualizar vendas
  * Relacionar vendas com clientes e produtos
   
## Tecnologias utilizadas
* SQL
* MySQL

## Como executar

1. Abra o MySQL Workbench (ou outro SGBD compatível)
2. Execute o arquivo `loja_bd_260326.sql`
3. O banco de dados será criado automaticamente
4. Utilize os comandos SELECT disponíveis para visualizar os dados

## Objetivo
Este projeto foi desenvolvido com fins educacionais, com foco no aprendizado de:
* Modelagem de banco de dados
* Relacionamentos entre tabelas
* Manipulação de dados com SQL
  
### Projeto desenvolvido para prática acadêmica.
