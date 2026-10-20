INSERT INTO carga_quimica (
    codigo_carga,
    produto_quimico_id,
    responsavel_tecnico_id,
    pais_origem_id,
    pais_destino_id,
    quantidade,
    unidade_medida,
    status_documentacao_id,
    status_carga_id,
    data_entrada
)
VALUES
(1001, 1 , 1 , 30, 55, 100.00, 'KG', 1, 1, CURRENT_TIMESTAMP),
(1002, 2 , 2 , 30, 40, 250.00, 'KG', 1, 2, CURRENT_TIMESTAMP),
(1003, 3 , 3 , 30, 32, 500.00, 'L' , 1, 3, CURRENT_TIMESTAMP),
(1004, 4 , 4 , 55, 30, 150.00, 'KG', 1, 4, CURRENT_TIMESTAMP),
(1005, 5 , 5 , 40, 30, 300.00, 'KG', 2, 1, CURRENT_TIMESTAMP),
(1006, 6 , 6 , 32, 55, 450.00, 'L' , 2, 5, CURRENT_TIMESTAMP),
(1007, 7 , 7 , 30, 20, 800.00, 'KG', 1, 6, CURRENT_TIMESTAMP),
(1008, 8 , 8 , 20, 30, 120.00, 'L' , 1, 7, CURRENT_TIMESTAMP),
(1009, 9 , 9 , 55, 40, 600.00, 'KG', 2, 8, CURRENT_TIMESTAMP),
(1010, 10,10 , 40, 55, 200.00, 'L' , 1, 1, CURRENT_TIMESTAMP);