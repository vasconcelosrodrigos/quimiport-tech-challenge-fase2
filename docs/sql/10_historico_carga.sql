CREATE TABLE historico_carga (
    id BIGSERIAL PRIMARY KEY,

    carga_quimica_id BIGINT NOT NULL,

    status_carga_id BIGINT NOT NULL,

    data_hora_status TIMESTAMP NOT NULL,

    CONSTRAINT fk_historico_carga
        FOREIGN KEY (carga_quimica_id)
        REFERENCES carga_quimica(id),

    CONSTRAINT fk_historico_status
        FOREIGN KEY (status_carga_id)
        REFERENCES status_carga(id)
);