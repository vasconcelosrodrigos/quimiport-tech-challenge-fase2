const request = require('supertest');
const app = require('../src/app');
const pool = require('../database/connection');

describe('API QuimiPort', () => {

    test('GET /produtos-quimicos deve responder', async () => {

        const response =
            await request(app)
                .get('/produtos-quimicos');

        expect(response.statusCode).toBe(200);

    });

    afterAll(async () => {

        await pool.end();

    });

});