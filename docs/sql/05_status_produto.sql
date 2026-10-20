CREATE TABLE status_produto (
    id BIGSERIAL PRIMARY KEY,
    descricao VARCHAR(20) NOT NULL UNIQUE
);

INSERT INTO status_produto (descricao)
VALUES
('ATIVO'),
('INATIVO');