const express = require('express');

const swaggerUi = require('swagger-ui-express');
const swaggerSpec = require('./config/swagger');

const cargaRoutes =
    require('./routes/carga.routes');

const produtoRoutes =
    require('./routes/produto.routes');

const app = express();

app.use(express.json());

app.use(
    '/api-docs',
    swaggerUi.serve,
    swaggerUi.setup(swaggerSpec)
);

app.use(
    '/cargas-quimicas',
    cargaRoutes
);

app.use(
    '/produtos-quimicos',
    produtoRoutes
);

module.exports = app;