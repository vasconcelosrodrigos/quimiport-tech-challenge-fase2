const express = require('express');

const controller =
    require('../controllers/produto.controller');

const router = express.Router();

/**
 * @swagger
 * /produtos-quimicos:
 *   get:
 *     summary: Lista todos os produtos químicos
 *     tags:
 *       - Produtos Químicos
 *     responses:
 *       200:
 *         description: Lista de produtos químicos
 */

router.get(
    '/',
    controller.listar
);


/**
 * @swagger
 * /produtos-quimicos/{id}:
 *   get:
 *     summary: Busca um produto químico pelo ID
 *     tags:
 *       - Produtos Químicos
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *         description: ID do produto químico
 *     responses:
 *       200:
 *         description: Produto encontrado
 *       404:
 *         description: Produto não encontrado
 */


router.get(
    '/:id',
    controller.buscarPorId
);


/**
 * @swagger
 * /produtos-quimicos:
 *   post:
 *     summary: Cadastra um novo produto químico
 *     tags:
 *       - Produtos Químicos
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               nome:
 *                 type: string
 *               descricao:
 *                 type: string
 *               numero_onu:
 *                 type: string
 *               classe_risco_id:
 *                 type: integer
 *               grupo_compatibilidade_id:
 *                 type: integer
 *     responses:
 *       201:
 *         description: Produto criado com sucesso
 *       400:
 *         description: Dados inválidos
 */

router.post(
    '/',
    controller.criar
);


/**
 * @swagger
 * /produtos-quimicos/{id}/inativar:
 *   patch:
 *     summary: Inativa um produto químico
 *     tags:
 *       - Produtos Químicos
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *         description: ID do produto químico
 *     responses:
 *       200:
 *         description: Produto inativado com sucesso
 *       404:
 *         description: Produto não encontrado
 */



router.patch(
    '/:id/inativar',
    controller.inativar
);

/**
 * @swagger
 * /produtos-quimicos/{id}:
 *   put:
 *     summary: Atualiza um produto químico
 *     tags:
 *       - Produtos Químicos
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *         description: ID do produto químico
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               nome:
 *                 type: string
 *               descricao:
 *                 type: string
 *               numero_onu:
 *                 type: string
 *               classe_risco_id:
 *                 type: integer
 *               grupo_compatibilidade_id:
 *                 type: integer
 *     responses:
 *       200:
 *         description: Produto atualizado com sucesso
 *       404:
 *         description: Produto não encontrado
 */


router.put(
    '/:id',
    controller.atualizar
);

module.exports = router;