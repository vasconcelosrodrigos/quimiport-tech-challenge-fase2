const produtoModel =
    require('../models/produto.model');

async function atualizar(req, res) {

    try {

        const { id } = req.params;

        const {
            nome,
            descricao,
            numero_onu,
            classe_risco_id,
            grupo_compatibilidade_id
        } = req.body;

        const produto =
            await produtoModel.buscarPorId(id);

        if (!produto) {

            return res.status(404).json({
                erro: 'Produto não encontrado'
            });

        }

        if (!nome) {

            return res.status(400).json({
                erro: 'Nome do produto é obrigatório'
            });

        }

        if (!classe_risco_id) {

            return res.status(400).json({
                erro: 'Classe de risco é obrigatória'
            });

        }

        await produtoModel.atualizar(
            id,
            {
                nome,
                descricao,
                numero_onu,
                classe_risco_id,
                grupo_compatibilidade_id
            }
        );

        return res.status(200).json({
            mensagem: 'Produto atualizado com sucesso'
        });

    } catch (error) {

        return res.status(500).json({
            erro: error.message
        });

    }
}

async function inativar(req, res) {

    try {

        const { id } = req.params;

        const produto =
            await produtoModel.buscarPorId(id);

        if (!produto) {

            return res.status(404).json({
                erro: 'Produto não encontrado'
            });

        }

        await produtoModel.inativar(id);

        return res.status(200).json({
            mensagem: 'Produto inativado com sucesso'
        });

    } catch (error) {

        return res.status(500).json({
            erro: error.message
        });

    }
}

async function criar(req, res) {

    try {

        const {
            nome,
            descricao,
            numero_onu,
            classe_risco_id,
            grupo_compatibilidade_id
        } = req.body;

        if (!nome) {

            return res.status(400).json({
                erro: 'Nome do produto é obrigatório'
            });

        }

        if (!classe_risco_id) {

            return res.status(400).json({
                erro: 'Classe de risco é obrigatória'
            });

        }

        const novoProduto =
            await produtoModel.criar({

                nome,
                descricao,
                numero_onu,

                classe_risco_id,

                grupo_compatibilidade_id,

                // ATIVO
                status_produto_id: 1

            });

        return res.status(201).json({
            mensagem: 'Produto criado com sucesso',
            id: novoProduto.id
        });

    } catch (error) {

        return res.status(500).json({
            erro: error.message
        });

    }
}

async function buscarPorId(req, res) {

    try {

        const { id } = req.params;

        const produto =
            await produtoModel.buscarPorId(id);

        if (!produto) {

            return res.status(404).json({
                erro: 'Produto não encontrado'
            });

        }

        return res.status(200).json(produto);

    } catch (error) {

        return res.status(500).json({
            erro: error.message
        });

    }
}

async function listar(req, res) {

    try {

        const produtos =
            await produtoModel.listarProdutos();

        return res.status(200).json(produtos);

    } catch (error) {

        return res.status(500).json({
            erro: error.message
        });

    }
}

module.exports = {
    listar,
    buscarPorId,
    criar,
    inativar,
    atualizar
};
