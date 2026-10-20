CREATE TABLE produto_quimico (
    id BIGSERIAL PRIMARY KEY,

    nome VARCHAR(200) NOT NULL,

    descricao TEXT,

    numero_onu VARCHAR(20) NOT NULL,

    classe_risco_id BIGINT NOT NULL,

    grupo_compatibilidade_id BIGINT NOT NULL,

    status_produto_id BIGINT NOT NULL,

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_produto_classe_risco
        FOREIGN KEY (classe_risco_id)
        REFERENCES classe_risco(id),

    CONSTRAINT fk_produto_grupo
        FOREIGN KEY (grupo_compatibilidade_id)
        REFERENCES grupo_compatibilidade(id),

    CONSTRAINT fk_produto_status
        FOREIGN KEY (status_produto_id)
        REFERENCES status_produto(id)
);