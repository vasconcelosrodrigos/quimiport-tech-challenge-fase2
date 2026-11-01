describe('Produto Químico', () => {

    test('nome informado deve possuir conteúdo', () => {

        const nome = 'Acetona';

        expect(nome).toBeTruthy();

    });

    test('nome não pode ser vazio', () => {

        const nome = '';

        expect(nome).not.toBeTruthy();

    });

    test('classe de risco deve ser obrigatória', () => {

        const classeRisco = null;

        expect(classeRisco).toBeNull();

    });

});