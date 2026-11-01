# QuimiPort - Sistema de Gestão de Cargas Químicas Portuárias

O **QuimiPort** é uma solução Full Stack desenvolvida para centralizar, monitorar e controlar todo o fluxo operacional relacionado ao gerenciamento de cargas químicas em ambiente portuário, inspirado nas operações logísticas do Porto de Santos. 

Esta é a primeira versão da API backend, entregue como o projeto **Tech Challenge 2 (TC2)** da pós-graduação **Pós Tech (FIAP)**. A aplicação automatiza validações críticas de segurança, controle documental e classificação de risco antes de qualquer movimentação física de substâncias químicas.

## 🚀 Tecnologias Utilizadas

*   **Runtime:** Node.js e Express
*   **Banco de Dados:** Banco de Dados Relacional PostgreSQL
*   **Containerização:** Docker & Docker Compose
*   **Versionamento:** Git & GitHub

---

## 📦 Estrutura e Estado Atual do Projeto

O projeto encontra-se com sua arquitetura backend estruturada e ambiente de infraestrutura containerizado pronto para execução.

```text
quimiport-tech-challange-fase2/
├── .env                         # Variáveis de ambiente da aplicação
├── .gitignore                   # Arquivos ignorados pelo Git
├── Dockerfile                   # Definição da imagem Docker da API Node.js
├── docker-compose.yml           # Orquestração da API e do Banco de Dados
├── package.json                 # Definição de dependências do projeto
├── README.md                    # Documentação do projeto
├── database/
│   ├── connection.js            # Inicialização e pool de conexão com o banco
│   └── init/
│       └── quimiport_v1.sql     # Script completo unificado de DDL e carga inicial
├── docs/
│   └── sql/                     # Scripts isolados de tabelas e seeds (Fase 1/2)
│       ├── 01_pais.sql
│       ├── 02_status_carga.sql
│       ├── ...
│       └── 18_seed_historico_carga.sql
├── http/                        # Arquivos de testes manuais de requisições HTTP
│   ├── cargas.http
│   └── produtos.http
└── src/
    ├── app.js                   # Configuração e middlewares do Express
    ├── server.js                # Inicialização do servidor HTTP
    ├── config/
    │   └── swagger.js           # Configuração e especificação do Swagger UI
    ├── controllers/             # Camada de controle (Carga e Produto)
    ├── models/                  # Definição dos modelos e mapeamento de dados
    └── routes/                  # Definição dos endpoints REST
```

---

## 🗄️ Banco de Dados e Modelagem

A persistência utiliza uma modelagem relacional robusta. O banco de dados é inicializado e populado automaticamente através do script unificado localizado em `database/init/quimiport_v1.sql`.

### Diagrama de Entidade e Relacionamento (ERD)

```mermaid
erDiagram
    PAIS {
        INT id PK
        VARCHAR nome
        VARCHAR codigo_iso
    }
    STATUS_PRODUTO {
        INT id PK
        VARCHAR descricao
    }
    CLASSE_RISCO {
        INT id PK
        VARCHAR codigo
        VARCHAR descricao
    }
    GRUPO_COMPATIBILIDADE {
        INT id PK
        VARCHAR codigo
        VARCHAR descricao
    }
    STATUS_DOCUMENTACAO {
        INT id PK
        VARCHAR descricao
    }
    STATUS_CARGA {
        INT id PK
        VARCHAR descricao
    }
    RESPONSAVEL_TECNICO {
        INT id PK
        VARCHAR nome
        VARCHAR registro_profissional
    }
    PRODUTO_QUIMICO {
        INT id PK
        VARCHAR nome
        VARCHAR numero_onu
        INT classe_risco_id FK
        INT grupo_compatibilidade_id FK
        INT status_produto_id FK
        TIMESTAMP data_criacao
        TIMESTAMP data_atualizacao
    }
    CARGA_QUIMICA {
        INT id PK
        VARCHAR codigo_carga
        INT produto_quimico_id FK
        DECIMAL quantidade
        VARCHAR unidade_medida
        INT origem_pais_id FK
        INT destino_pais_id FK
        INT responsavel_tecnico_id FK
        INT status_documentacao_id FK
        INT status_carga_id FK
        TIMESTAMP data_entrada
        TIMESTAMP data_criacao
        TIMESTAMP data_atualizacao
    }
    HISTORICO_CARGA {
        INT id PK
        INT carga_quimica_id FK
        INT status_anterior_id FK
        INT status_atual_id FK
        VARCHAR alterado_por
        TIMESTAMP data_mudanca
        TEXT observacao
    }

    PRODUTO_QUIMICO }o--|| CLASSE_RISCO : "possui"
    PRODUTO_QUIMICO }o--|| GRUPO_COMPATIBILIDADE : "pertence"
    PRODUTO_QUIMICO }o--|| STATUS_PRODUTO : "estado"

    CARGA_QUIMICA }o--|| PRODUTO_QUIMICO : "contem"
    CARGA_QUIMICA }o--|| RESPONSAVEL_TECNICO : "validada_por"
    CARGA_QUIMICA }o--|| STATUS_DOCUMENTACAO : "validacao"
    CARGA_QUIMICA }o--|| STATUS_CARGA : "estado_atual"
    CARGA_QUIMICA }o--|| PAIS : "origem"
    CARGA_QUIMICA }o--|| PAIS : "destino"

    HISTORICO_CARGA }o--|| CARGA_QUIMICA : "vinculado_a"
    HISTORICO_CARGA }o--|| STATUS_CARGA : "anterior"
    HISTORICO_CARGA }o--|| STATUS_CARGA : "atual"
```

### Detalhes das Entidades Principais e Regras:
*   **Produtos Químicos:** Cadastro simplificado focado em metadados de risco fundamentais (Número ONU, Classe de Risco e Compatibilidade). Possui validação lógica de status ativo/inativo para novos registros de entrada.
*   **Cargas Químicas:** Vincula a movimentação portuária à origem, ao destino, à documentação legal, à auditoria do técnico responsável e ao estado da esteira logística.
*   **Histórico da Carga (Auditoria):** Tabela crítica integrada à máquina de estados. Monitora o ciclo de vida da carga persistindo quem alterou, quando alterou, o status de origem e o novo status assumido no fluxo.

---

## ⚙️ Como Executar o Projeto com Docker

Certifique-se de ter o **Docker** e o **Docker Compose** instalados em sua máquina de desenvolvimento.

### 1. Configurar as Variáveis de Ambiente
Verifique ou ajuste as credenciais de acesso e portas configuradas no arquivo `.env` localizado na raiz do projeto.

### 2. Inicializar o Ambiente Containerizado
Na raiz do projeto (onde está o arquivo `docker-compose.yml`), execute os comandos abaixo no terminal:

```bash
docker compose down -v
```

```bash
docker compose build --no-cache
```

```bash
docker compose up -d
```

Este comando irá:
1. Construir a imagem Docker da API Node.js a partir do `Dockerfile`.
2. Subir o contêiner do Banco de Dados Relacional PostgreSQL.
3. Executar automaticamente o script `database/init/quimiport_v1.sql` criando todas as tabelas, relacionamentos e inserindo a massa de dados inicial (seeds).
4. Expor os serviços localmente prontos para receber conexões.

---

## 🧪 Executando os Testes Automatizados (Jest)

A suíte de testes valida as regras de negócio críticas e a segurança da máquina de estados de forma isolada e performática. Para executar a cobertura de testes dentro do contêiner da aplicação, utilize o comando abaixo:

```bash
docker compose exec api npm test
```

---

## 📖 Documentação da API (Swagger)

Com a aplicação rodando localmente através do Docker, a documentação viva e interativa dos endpoints contendo payloads de exemplo e testes de requisição pode ser acessada pelo link:

👉 [http://localhost:3000/api-docs/](http://localhost:3000/api-docs/)

### Principais Endpoints Mapeados:
*   `POST /produtos-quimicos` - Cadastra um novo produto químico
*   `GET /produtos-quimicos` - Lista todos os produtos cadastrados
*   `PATCH /produtos-quimicos/:id/inativar` - Altera logicamente o status do produto para inativo
*   `POST /cargas-quimicas` - Registra uma nova carga portuária
*   `PATCH /cargas-quimicas/:id/status` - Atualiza a transição de status da carga validando regras de segurança portuária

---

## 👥 Integrantes do Grupo
*   **Rodrigo Sampaio Vasconcelos**
