const model = require('../models/carga.model');

const transicoesPermitidas = {

    // REGISTRADA
    1: [2, 8],

    // EM_ANALISE
    2: [3, 8],

    // EM_INSPECAO
    3: [4, 5, 8],

    // LIBERADA
    4: [6, 8],

    // BLOQUEADA
    5: [8],

    // EM_MOVIMENTACAO
    6: [7],

    // FINALIZADA
    7: [],

    // CANCELADA
    8: []

};

async function atualizarStatus(req, res) {

    try {

        const { id } = req.params;

        const { status_carga_id } = req.body;

        const carga =
            await model.buscarCargaPorCodigo(id);

        if (!carga) {

            return res.status(404).json({
                erro: 'Carga não encontrada'
            });

        }

        const statusAtual =
            await model.buscarStatusAtual(id);

        const permitidos =
            transicoesPermitidas[
                statusAtual.status_carga_id
            ] || [];

        if (!permitidos.includes(status_carga_id)) {

            return res.status(400).json({
                erro: 'Transição de status não permitida'
            });

        }

        const documentacao =
            await model.buscarDocumentacao(id);

        if (
            status_carga_id === 4 &&
            documentacao.status_documentacao_id !== 1
        ) {

            return res.status(400).json({
                erro: 'Carga não pode ser liberada sem documentação válida'
            });

        }

        await model.atualizarStatus(
            id,
            status_carga_id
        );

        await model.criarHistorico(
            carga.id,
            status_carga_id
        );

        return res.status(200).json({
            mensagem: 'Status atualizado com sucesso'
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
            codigo_carga,
            produto_quimico_id,
            responsavel_tecnico_id,
            pais_origem_id,
            pais_destino_id,
            quantidade,
            unidade_medida,
            status_documentacao_id,
            data_entrada
        } = req.body;

        if (!produto_quimico_id) {

            return res.status(400).json({
                erro: 'Produto químico é obrigatório'
            });

        }

        if (!responsavel_tecnico_id) {

            return res.status(400).json({
                erro: 'Responsável técnico é obrigatório'
            });

        }

        if (!quantidade || quantidade <= 0) {

            return res.status(400).json({
                erro: 'Quantidade deve ser maior que zero'
            });

        }

        const produto =
            await model.buscarProduto(
                produto_quimico_id
            );

        if (!produto) {

            return res.status(404).json({
                erro: 'Produto químico não encontrado'
            });

        }

        if (produto.status === 'INATIVO') {

            return res.status(400).json({
                erro: 'Produto inativo não pode ser utilizado em novas cargas'
            });

        }

        const novaCarga =
            await model.criar({

                codigo_carga,

                produto_quimico_id,

                responsavel_tecnico_id,

                pais_origem_id,

                pais_destino_id,

                quantidade,

                unidade_medida,

                status_documentacao_id,

                // REGISTRADA
                status_carga_id: 1,

                data_entrada

            });

        await model.criarHistorico(
            novaCarga.id,
            1
        );

        return res.status(201).json({
            mensagem: 'Carga criada com sucesso',
            id: novaCarga.id
        });

    } catch (error) {

        return res.status(500).json({
            erro: error.message
        });

    }
}

async function listar(req, res) {

    try {

        const cargas =
            await model.listarCargas();

        return res.status(200).json(cargas);

    } catch (error) {

        return res.status(500).json({
            erro: error.message
        });

    }
}

async function buscarPorId(req, res) {

    try {

        const { id } = req.params;

        const carga =
            await model.buscarPorId(id);

        if (!carga) {

            return res.status(404).json({
                erro: 'Carga não encontrada'
            });

        }

        return res.status(200).json(carga);

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
    atualizarStatus
};