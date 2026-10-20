const express = require('express');

const controller =
    require('../controllers/produto.controller');

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
    '/:id/inativar',
    controller.inativar
);

router.put(
    '/:id',
    controller.atualizar
);

module.exports = router;