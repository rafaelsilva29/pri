var JCRPubs = require('../models/jcrpubs')

module.exports.listar = () => {
    return JCRPubs
            .find({},{ typebooktitle: 0, authors: 0, address: 0, address:0, month: 0, doi: 0, booktitle: 0 })
            .exec()
}

module.exports.consultarType = type => {
    return JCRPubs
            .find({ type: type})
            .exec()
}

module.exports.consultarTypeYear = (type,year) => {
    return JCRPubs
            .find({ type: type, year: {$gt: year} })
            .exec()
}

module.exports.consultarAutor = author => {
    return JCRPubs
            .find({ authors: author })
            .exec()
}

module.exports.consultar = id => {
    return JCRPubs
            .findOne({ _id: id})
            .exec()
}

module.exports.listarTypes = () => {
    return JCRPubs
            .aggregate([{$unwind: "$type"}, {$group: {_id: "$type"}}])
            .exec()
}

module.exports.listarAutores = () => {
    return JCRPubs
            .aggregate([{$unwind: "$authors"}, {$group: {_id: "$authors"}}])
            .sort({_id: 1})
            .exec()
}