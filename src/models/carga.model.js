const pool = require('../../database/connection');

async function buscarDocumentacao(codigoCarga) {

    const sql = `
        SELECT
            status_documentacao_id
        FROM carga_quimica
        WHERE codigo_carga = $1
    `;

    const { rows } = await pool.query(
        sql,
        [codigoCarga]
    );

    return rows[0] || null;
}

async function buscarStatusAtual(codigoCarga) {

    const sql = `
        SELECT
            hc.status_carga_id
        FROM historico_carga hc

        INNER JOIN carga_quimica cq
            ON cq.id = hc.carga_quimica_id

        WHERE cq.codigo_carga = $1

        ORDER BY
            hc.data_hora_status DESC

        LIMIT 1
    `;

    const { rows } = await pool.query(
        sql,
        [codigoCarga]
    );

    return rows[0] || null;
}

async function atualizarStatus(
    codigoCarga,
    statusCargaId
) {

    const sql = `
        UPDATE carga_quimica
        SET
            status_carga_id = $1,
            updated_at = CURRENT_TIMESTAMP
        WHERE codigo_carga = $2
        RETURNING id;
    `;

    const { rows } = await pool.query(
        sql,
        [
            statusCargaId,
            codigoCarga
        ]
    );

    return rows[0];
}

async function buscarCargaPorCodigo(
    codigoCarga
) {

    const sql = `
        SELECT
            id,
            codigo_carga
        FROM carga_quimica
        WHERE codigo_carga = $1
    `;

    const { rows } =
        await pool.query(
            sql,
            [codigoCarga]
        );

    return rows[0] || null;
}

async function criarHistorico(
    cargaId,
    statusCargaId
) {

    const sql = `
        INSERT INTO historico_carga (
            carga_quimica_id,
            status_carga_id,
            data_hora_status
        )
        VALUES (
            $1,
            $2,
            CURRENT_TIMESTAMP
        );
    `;

    await pool.query(
        sql,
        [
            cargaId,
            statusCargaId
        ]
    );
}

async function buscarProduto(id) {

    const sql = `
        SELECT
            pq.id,
            sp.descricao AS status
        FROM produto_quimico pq

        INNER JOIN status_produto sp
            ON sp.id = pq.status_produto_id

        WHERE pq.id = $1
    `;

    const { rows } =
        await pool.query(
            sql,
            [id]
        );

    return rows[0] || null;
}

async function criar(carga) {

    const sql = `
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
        VALUES (
            $1,$2,$3,$4,$5,
            $6,$7,$8,$9,$10
        )
        RETURNING id;
    `;

    const valores = [
        carga.codigo_carga,
        carga.produto_quimico_id,
        carga.responsavel_tecnico_id,
        carga.pais_origem_id,
        carga.pais_destino_id,
        carga.quantidade,
        carga.unidade_medida,
        carga.status_documentacao_id,
        carga.status_carga_id,
        carga.data_entrada
    ];

    const { rows } =
        await pool.query(
            sql,
            valores
        );

    return rows[0];
}

async function buscarPorId(idCarga) {

    const sql = `
        SELECT
            cq.codigo_carga AS id_carga,

            pq.nome AS produto,

            rt.nome AS responsavel,

            po.nome AS origem,

            pd.nome AS destino,

            cq.quantidade,

            cq.unidade_medida AS unidade,

            sd.descricao AS docum,

            sc.descricao AS status,

            hc.data_hora_status AS ultima_movimentacao

        FROM carga_quimica cq

        INNER JOIN produto_quimico pq
            ON pq.id = cq.produto_quimico_id

        INNER JOIN responsavel_tecnico rt
            ON rt.id = cq.responsavel_tecnico_id

        INNER JOIN pais po
            ON po.id = cq.pais_origem_id

        INNER JOIN pais pd
            ON pd.id = cq.pais_destino_id

        INNER JOIN status_documentacao sd
            ON sd.id = cq.status_documentacao_id

        INNER JOIN (
            SELECT DISTINCT ON (carga_quimica_id)
                carga_quimica_id,
                status_carga_id,
                data_hora_status
            FROM historico_carga
            ORDER BY
                carga_quimica_id,
                data_hora_status DESC
        ) hc
            ON hc.carga_quimica_id = cq.id

        INNER JOIN status_carga sc
            ON sc.id = hc.status_carga_id

        WHERE cq.codigo_carga = $1;
    `;

    const { rows } =
        await pool.query(
            sql,
            [idCarga]
        );

    return rows[0] || null;
}

async function listarCargas() {

    const sql = `
        SELECT
            cq.codigo_carga AS id_carga,

            pq.nome AS produto,

            rt.nome AS responsavel,

            po.nome AS origem,

            pd.nome AS destino,

            cq.quantidade,

            cq.unidade_medida AS unidade,

            sd.descricao AS docum,

            sc.descricao AS status,

            hc.data_hora_status AS ultima_movimentacao

        FROM carga_quimica cq

        INNER JOIN produto_quimico pq
            ON pq.id = cq.produto_quimico_id

        INNER JOIN responsavel_tecnico rt
            ON rt.id = cq.responsavel_tecnico_id

        INNER JOIN pais po
            ON po.id = cq.pais_origem_id

        INNER JOIN pais pd
            ON pd.id = cq.pais_destino_id

        INNER JOIN status_documentacao sd
            ON sd.id = cq.status_documentacao_id

        INNER JOIN (
            SELECT DISTINCT ON (carga_quimica_id)
                carga_quimica_id,
                status_carga_id,
                data_hora_status
            FROM historico_carga
            ORDER BY
                carga_quimica_id,
                data_hora_status DESC
        ) hc
            ON hc.carga_quimica_id = cq.id

        INNER JOIN status_carga sc
            ON sc.id = hc.status_carga_id

        ORDER BY cq.codigo_carga;
    `;

    const { rows } =
        await pool.query(sql);

    return rows;
}

module.exports = {
    listarCargas,
    buscarPorId,
    buscarProduto,
    criar,
    criarHistorico,
    atualizarStatus,
    buscarCargaPorCodigo,
    buscarStatusAtual,
    buscarDocumentacao
};