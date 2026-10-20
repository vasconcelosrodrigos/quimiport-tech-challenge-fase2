const express = require('express');

const cargaRoutes =
    require('./routes/carga.routes');

const produtoRoutes =
    require('./routes/produto.routes');

const app = express();

app.use(express.json());

app.use(
    '/cargas-quimicas',
    cargaRoutes
);

app.use(
    '/produtos-quimicos',
    produtoRoutes
);

module.exports = app;