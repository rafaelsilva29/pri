var Obra = require('../models/obras')

// Devolve a lista de obras
module.exports.listar = () => {
    return Obra
            .find()
            .exec()
}

module.exports.consultar = id => {
    return Obra
            .findOne({_id: id})
            .exec()
}

module.exports.consultarPeriodo = periodo => {
    return Obra
            .find({periodo: periodo })
            .exec()
}

module.exports.consultarAnoCriacao = anoCriacao => {
    return Obra
            .find({anoCriacao: anoCriacao })
            .exec()
}

module.exports.consultarCompositor = compositor => {
    return Obra
            .find({compositor: compositor })
            .exec()
}

module.exports.listarCompositores = () => {
    return Obra
            .aggregate([{$unwind: "$compositor"}, {$group: {_id: "$compositor", numObras: {"$sum": 1}, 
                obras: {$push: {nome: "$nome", desc: "$desc", anoCriacao: "$anoCriacao", periodo: "$periodo", 
                duracao: "$duracao"}}}}])
            .exec()
}