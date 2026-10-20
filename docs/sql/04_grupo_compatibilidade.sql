CREATE TABLE grupo_compatibilidade (
    id BIGSERIAL PRIMARY KEY,
    descricao VARCHAR(10) NOT NULL UNIQUE
);

INSERT INTO grupo_compatibilidade (descricao)
VALUES
('A'),
('B'),
('C'),
('D'),
('E'),
('F'),
('G'),
('H'),
('J'),
('K'),
('L'),
('N'),
('S');