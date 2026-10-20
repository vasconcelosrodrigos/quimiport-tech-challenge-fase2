CREATE TABLE status_documentacao (
    id BIGSERIAL PRIMARY KEY,
    descricao VARCHAR(10) NOT NULL UNIQUE
);

INSERT INTO status_documentacao (descricao)
VALUES
('OK'),
('NOK');