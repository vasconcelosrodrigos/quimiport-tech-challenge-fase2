require('dotenv').config();

const pool = require("../database/connection");
const app = require("./app");

const PORT = process.env.PORT || 3000;

app.get('/', async(requisicao, resposta) => {
    try{
        const result = await pool.query('SELECT NOW()');

        resposta.status(200).json({
            projeto: 'Quimiport',
            banco: 'PostgreSQL',
            dataHoraServidor: result.rows[0].now
        });
    } catch(error) {
        resposta.status(500).json({
            erro: error.message
        });
    }
});

app.listen(PORT, () => {
    console.log(`App rodando no endereço http://127.0.0.1:${PORT}`);
});