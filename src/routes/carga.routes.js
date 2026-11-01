const express = require('express');

const controller =
    require('../controllers/carga.controller');

const router = express.Router();




/**
 * @swagger
 * /cargas-quimicas:
 *   get:
 *     summary: Lista todas as cargas químicas
 *     tags:
 *       - Cargas Químicas
 *     responses:
 *       200:
 *         description: Lista de cargas químicas
 */



router.get(
    '/',
    controller.listar
);


/**
 * @swagger
 * /cargas-quimicas/{id}:
 *   get:
 *     summary: Busca uma carga química pelo código
 *     tags:
 *       - Cargas Químicas
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *         description: Código da carga química
 *     responses:
 *       200:
 *         description: Carga encontrada
 *       404:
 *         description: Carga não encontrada
 */


router.get(
    '/:id',
    controller.buscarPorId
);

/**
 * @swagger
 * /cargas-quimicas:
 *   post:
 *     summary: Cadastra uma nova carga química
 *     tags:
 *       - Cargas Químicas
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *     responses:
 *       201:
 *         description: Carga criada com sucesso
 *       400:
 *         description: Dados inválidos
 */


router.post(
    '/',
    controller.criar
);


/**
 * @swagger
 * /cargas-quimicas/{id}/status:
 *   patch:
 *     summary: Atualiza o status de uma carga química
 *     tags:
 *       - Cargas Químicas
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *         description: Código da carga química
 *     responses:
 *       200:
 *         description: Status atualizado com sucesso
 *       400:
 *         description: Transição inválida
 */


router.patch(
    '/:id/status',
    controller.atualizarStatus
);

module.exports = router;