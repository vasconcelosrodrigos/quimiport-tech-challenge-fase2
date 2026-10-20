CREATE TABLE classe_risco (
    id BIGSERIAL PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL UNIQUE
);

INSERT INTO classe_risco (descricao)
VALUES
('Explosivos'),
('Gases'),
('Líquidos Inflamáveis'),
('Sólidos Inflamáveis'),
('Oxidantes'),
('Tóxicos'),
('Radioativos'),
('Corrosivos'),
('Perigos Diversos');