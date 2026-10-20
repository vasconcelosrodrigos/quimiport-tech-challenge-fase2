# QuimiPort - Tech Challenge Fase 2

Sistema para gerenciamento de cargas químicas em ambiente portuário desenvolvido para o Tech Challenge da Pós Tech - Full Stack Development.

## Sobre o Projeto

O QuimiPort controla o ciclo de vida de cargas químicas, garantindo rastreabilidade, integridade operacional e conformidade com regras de negócio relacionadas ao transporte e movimentação de produtos químicos.

## Tecnologias Utilizadas

### Backend
- Node.js
- Express

### Banco de Dados
- PostgreSQL 17

### Infraestrutura
- Docker
- Docker Compose
- WSL2

### Ferramentas
- VS Code
- REST Client
- DBeaver
- Git
- GitHub

## Estrutura do Projeto

```text
quimiport-tech-challenge-fase2
│
├── database
├── docs
├── http
├── src
├── package.json
├── package-lock.json
├── docker-compose.yml
└── README.md
```

## Modelo de Dados

### Produto Químico
- ID
- Nome
- Descrição
- Número ONU
- Classe de Risco
- Grupo de Compatibilidade
- Status
- Data de Criação
- Data de Atualização

### Responsável Técnico
- ID
- Nome
- Registro Profissional

### Carga Química
- Código da Carga
- Produto Químico
- Responsável Técnico
- Origem
- Destino
- Quantidade
- Unidade de Medida
- Status da Documentação
- Status da Carga
- Data de Entrada

### Histórico da Carga
- Carga
- Status
- Data/Hora da Movimentação

## Máquina de Estados

Fluxo principal:

```text
REGISTRADA
    ↓
EM_ANALISE
    ↓
EM_INSPECAO
    ↓
LIBERADA
    ↓
EM_MOVIMENTACAO
    ↓
FINALIZADA
```

Fluxos alternativos:

```text
REGISTRADA → CANCELADA
EM_ANALISE → CANCELADA
EM_INSPECAO → BLOQUEADA
EM_INSPECAO → CANCELADA
LIBERADA → CANCELADA
BLOQUEADA → CANCELADA
```

## Endpoints Implementados

### Produtos Químicos
- GET /produtos-quimicos
- GET /produtos-quimicos/:id
- POST /produtos-quimicos
- PUT /produtos-quimicos/:id
- PATCH /produtos-quimicos/:id/inativar

### Cargas Químicas
- GET /cargas-quimicas
- GET /cargas-quimicas/:id
- POST /cargas-quimicas
- PATCH /cargas-quimicas/:id/status

## Regras de Negócio Implementadas

- Produto químico não pode ser cadastrado sem nome.
- Produto químico não pode ser cadastrado sem classe de risco.
- Produto inativo não pode ser utilizado em novas cargas.
- Toda carga deve possuir produto químico.
- Toda carga deve possuir responsável técnico.
- Quantidade deve ser maior que zero.
- Histórico é criado automaticamente.
- Transições inválidas são bloqueadas.
- Carga não pode ser liberada sem documentação válida.

## Evidências Coletadas

- Figura 01 – DER do banco
- Figura 02 – Base populada
- Figura 03 – GET cargas
- Figura 04 – GET produtos
- Figura 05 – Status via histórico
- Figura 06 – GET produto por ID
- Figura 07 – POST produto
- Figura 08 – Nome obrigatório
- Figura 09 – Classe de risco obrigatória
- Figura 10 – Inativação de produto
- Figura 11 – Validação da inativação
- Figura 12 – PUT produto
- Figura 13 – GET carga por ID
- Figura 14 – POST carga
- Figura 15 – Histórico automático
- Figura 16 – Produto inativo bloqueado
- Figura 17 – PATCH status da carga
- Figura 18 – Histórico registrando mudança
- Figura 19 – Consulta usando histórico
- Figura 20 – Transição válida
- Figura 21 – Transição inválida bloqueada
- Figura 22 – Produto INATIVO persistido no banco
- Figura 23 – Liberação bloqueada por documentação NOK

## Status Atual

### Concluído

- CRUD completo de Produtos Químicos
- CRUD básico de Cargas Químicas
- PostgreSQL integrado à API
- Histórico automático
- Máquina de estados
- Validações obrigatórias do domínio

### Próximos Passos

- Swagger/OpenAPI
- Testes automatizados
- GitHub Actions
- Inclusão das imagens na documentação
- Vídeo demonstrativo

## Autor

Rodrigo Sampaio Vasconcelos

Pós Tech - Full Stack Development

Tech Challenge - Fase 2
