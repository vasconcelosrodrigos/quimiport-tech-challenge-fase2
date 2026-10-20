CREATE TABLE carga_quimica (
    id BIGSERIAL PRIMARY KEY,

    codigo_carga BIGINT NOT NULL UNIQUE,

    produto_quimico_id BIGINT NOT NULL,

    responsavel_tecnico_id BIGINT NOT NULL,

    pais_origem_id BIGINT NOT NULL,

    pais_destino_id BIGINT NOT NULL,

    quantidade NUMERIC(12,2) NOT NULL
        CHECK (quantidade > 0),

    unidade_medida VARCHAR(20) NOT NULL,

    status_documentacao_id BIGINT NOT NULL,

    status_carga_id BIGINT NOT NULL,

    data_entrada TIMESTAMP NOT NULL,

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_carga_produto
        FOREIGN KEY (produto_quimico_id)
        REFERENCES produto_quimico(id),

    CONSTRAINT fk_carga_responsavel
        FOREIGN KEY (responsavel_tecnico_id)
        REFERENCES responsavel_tecnico(id),

    CONSTRAINT fk_carga_origem
        FOREIGN KEY (pais_origem_id)
        REFERENCES pais(id),

    CONSTRAINT fk_carga_destino
        FOREIGN KEY (pais_destino_id)
        REFERENCES pais(id),

    CONSTRAINT fk_carga_documentacao
        FOREIGN KEY (status_documentacao_id)
        REFERENCES status_documentacao(id),

    CONSTRAINT fk_carga_status
        FOREIGN KEY (status_carga_id)
        REFERENCES status_carga(id)
);