# App Suporte WhatsApp

## Sobre o Projeto

O App Suporte WhatsApp é uma aplicação desenvolvida em Flutter para auxiliar equipes de suporte técnico no gerenciamento de clientes, aparelhos e atendimentos.

O sistema permite registrar clientes, associar aparelhos a cada cliente e manter um histórico completo de atendimentos realizados, facilitando o acompanhamento de chamados e a organização das informações do suporte.

O banco de dados é armazenado utilizando SQLite através da biblioteca `sqflite_common_ffi`, possibilitando o compartilhamento dos dados em rede local por meio de um arquivo `.db` centralizado.

---

## Funcionalidades

### Clientes

* Cadastro de clientes
* Visualização da lista de clientes
* Armazenamento de:

  * Nome
  * WhatsApp
  * Empresa

### Aparelhos

* Cadastro de aparelhos vinculados a um cliente
* Edição de aparelhos
* Exclusão de aparelhos
* Controle por número de série único

### Atendimentos

* Cadastro de atendimentos para cada aparelho
* Histórico completo de atendimentos
* Edição de atendimentos
* Exclusão de atendimentos
* Registro de:

  * Problema informado
  * Observações
  * Status
  * Solução aplicada
  * Data e horário do contato

### Dashboard

* Total de clientes cadastrados
* Total de aparelhos cadastrados
* Total de atendimentos registrados

---

## Tecnologias Utilizadas

### Frontend

* Flutter
* Dart

### Banco de Dados

* SQLite
* sqflite_common_ffi

### Bibliotecas

* flutter/material.dart
* sqflite_common_ffi
* intl

---

## Estrutura do Banco de Dados

### Tabela: clientes

| Campo      | Tipo     |
| ---------- | -------- |
| id         | INTEGER  |
| nome       | TEXT     |
| whatsapp   | TEXT     |
| empresa    | TEXT     |
| created_at | DATETIME |

### Tabela: aparelhos

| Campo        | Tipo     |
| ------------ | -------- |
| id           | INTEGER  |
| cliente_id   | INTEGER  |
| numero_serie | TEXT     |
| created_at   | DATETIME |

Relacionamento:

* Um cliente pode possuir vários aparelhos.

### Tabela: atendimentos

| Campo        | Tipo     |
| ------------ | -------- |
| id           | INTEGER  |
| aparelho_id  | INTEGER  |
| problema     | TEXT     |
| observacoes  | TEXT     |
| status       | TEXT     |
| solucao      | TEXT     |
| data_contato | DATETIME |

Relacionamento:

* Um aparelho pode possuir vários atendimentos.

---

## Status dos Atendimentos

O sistema utiliza os seguintes status:

* Em atendimento
* Aguardando cliente
* Aguardando técnico
* Resolvido
* Encerrado

---

## Estrutura do Projeto

```text
lib/
│
├── database/
│   └── database_helper.dart
│
├── models/
│   ├── aparelho.dart
│   ├── atendimento.dart
│   └── cliente.dart
│
├── pages/
│   ├── clientes_page.dart
│   ├── cliente_detalhes_page.dart
│   ├── historico_atendimentos_page.dart
│   ├── home_page.dart
│   ├── novo_cliente_page.dart
│   └── novo_atendimento_page.dart
│
├── widgets/
│   ├── card_aparelhos.dart
│   ├── card_atendimento.dart
│   ├── card_cliente.dart
│   ├── dialog_excluir_aparelho.dart
│   ├── dialog_excluir_atendimento.dart
│   ├── dialog_excluir_cliente.dart
│   ├── dialog_novo_aparelho.dart
│   ├── dialog_novo_atendimento.dart
│   └── dialog_novo_cliente.dart
│
└── main.dart
```

---

## Estrutura do Sistema

```text
Cliente
│
├── Nome
├── WhatsApp
└── Empresa
     │
     ▼
Aparelho
│
├── Número de Série
└── Data de Cadastro
     │
     ▼
Atendimento
│
├── Problema
├── Observações
├── Status
├── Solução
└── Data de Contato
```

---

## Como Executar o Projeto

### Clonar o repositório

```bash
git clone https://github.com/seu-usuario/app-suporte-whatsapp.git
```

### Entrar na pasta

```bash
cd app-suporte-whatsapp
```

### Instalar dependências

```bash
flutter pub get
```

### Executar

```bash
flutter run
```

---

## Melhorias Futuras

* Sistema de pesquisa de clientes
* Filtros por status
* Relatórios em PDF
* Exportação para Excel
* Controle de usuários
* Login e autenticação
* Backup automático do banco de dados
* Integração com WhatsApp
* Upload de anexos e imagens dos atendimentos

---

## Objetivo

Este projeto foi desenvolvido com o objetivo de otimizar o controle de atendimentos realizados pela equipe de suporte técnico, centralizando informações de clientes, equipamentos e históricos de atendimento em uma única aplicação.
