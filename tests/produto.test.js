// tests/produto.test.js
const request = require('supertest');

jest.mock('../database/connection', () => ({
    query: jest.fn().mockResolvedValue({ rows: [] }),
    connect: jest.fn().mockResolvedValue(true)
}));

const app = require('../src/app');

describe('🧪 Testes de Integração - Cadastro de Produtos Químicos', () => {
    
    test('4. Deve bloquear o cadastro de produto químico sem nome', async () => {
        const response = await request(app)
            .post('/produtos-quimicos')
            .send({
                classe_risco_id: 3,
                numero_onu: 'UN1234'
            });

        expect(response.status).toBe(400);
    });

    test('5. Deve bloquear o cadastro de produto químico sem classe de risco', async () => {
        const response = await request(app)
            .post('/produtos-quimicos')
            .send({
                nome: 'Ácido Sulfúrico',
                numero_onu: 'UN1830'
            });

        expect(response.status).toBe(400);
    });
});
