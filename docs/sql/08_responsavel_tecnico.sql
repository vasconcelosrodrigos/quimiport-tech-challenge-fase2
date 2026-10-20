CREATE TABLE responsavel_tecnico (
    id BIGSERIAL PRIMARY KEY,

    nome VARCHAR(200) NOT NULL,

    registro_profissional VARCHAR(100) NOT NULL,

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);