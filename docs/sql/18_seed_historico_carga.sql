INSERT INTO historico_carga (
    carga_quimica_id,
    status_carga_id,
    data_hora_status
)
SELECT
    id,
    status_carga_id,
    updated_at
FROM carga_quimica;