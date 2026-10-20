const pool = require('../../database/connection');


async function atualizar(id, produto) {

    const sql = `
        UPDATE produto_quimico
        SET
            nome = $1,
            descricao = $2,
            numero_onu = $3,
            classe_risco_id = $4,
            grupo_compatibilidade_id = $5,
            updated_at = CURRENT_TIMESTAMP
        WHERE id = $6
        RETURNING id;
    `;

    const valores = [
        produto.nome,
        produto.descricao,
        produto.numero_onu,
        produto.classe_risco_id,
        produto.grupo_compatibilidade_id,
        id
    ];

    const { rows } = await pool.query(sql, valores);

    return rows[0];
}

async function inativar(id) {

    const sql = `
        UPDATE produto_quimico
        SET
            status_produto_id = 2,
            updated_at = CURRENT_TIMESTAMP
        WHERE id = $1
        RETURNING id;
    `;

    const { rows } = await pool.query(sql, [id]);

    return rows[0];
}

async function criar(produto) {

    const sql = `
        INSERT INTO produto_quimico (
            nome,
            descricao,
            numero_onu,
            classe_risco_id,
            grupo_compatibilidade_id,
            status_produto_id
        )
        VALUES (
            $1,
            $2,
            $3,
            $4,
            $5,
            $6
        )
        RETURNING id;
    `;

    const valores = [
        produto.nome,
        produto.descricao,
        produto.numero_onu,
        produto.classe_risco_id,
        produto.grupo_compatibilidade_id,
        produto.status_produto_id
    ];

    const { rows } = await pool.query(sql, valores);

    return rows[0];
}

async function buscarPorId(id) {

    const sql = `
        SELECT
            pq.id,

            pq.nome,

            pq.descricao,

            pq.numero_onu,

            cr.descricao AS classe_risco,

            gc.descricao AS grupo_compatibilidade,

            sp.descricao AS status,

            pq.created_at,

            pq.updated_at

        FROM produto_quimico pq

        INNER JOIN classe_risco cr
            ON cr.id = pq.classe_risco_id

        INNER JOIN grupo_compatibilidade gc
            ON gc.id = pq.grupo_compatibilidade_id

        INNER JOIN status_produto sp
            ON sp.id = pq.status_produto_id

        WHERE pq.id = $1;
    `;

    const { rows } = await pool.query(sql, [id]);

    return rows[0];
}

async function listarProdutos() {

    const sql = `
        SELECT
            pq.id,

            pq.nome,

            pq.descricao,

            pq.numero_onu,

            cr.descricao AS classe_risco,

            gc.descricao AS grupo_compatibilidade,

            sp.descricao AS status,

            pq.created_at,

            pq.updated_at

        FROM produto_quimico pq

        INNER JOIN classe_risco cr
            ON cr.id = pq.classe_risco_id

        INNER JOIN grupo_compatibilidade gc
            ON gc.id = pq.grupo_compatibilidade_id

        INNER JOIN status_produto sp
            ON sp.id = pq.status_produto_id

        ORDER BY pq.nome;
    `;

    const { rows } = await pool.query(sql);

    return rows;
}

module.exports = {
    listarProdutos,
    buscarPorId,
    criar,
    inativar,
    atualizar
};