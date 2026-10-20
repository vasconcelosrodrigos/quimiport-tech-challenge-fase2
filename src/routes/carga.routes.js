const express = require('express');

const controller =
    require('../controllers/carga.controller');

const router = express.Router();

router.get(
    '/',
    controller.listar
);

router.get(
    '/:id',
    controller.buscarPorId
);

router.post(
    '/',
    controller.criar
);

router.patch(
    '/:id/status',
    controller.atualizarStatus
);

module.exports = router;