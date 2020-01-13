const mongoose = require('mongoose')

var obrasSchema = new mongoose.Schema({
    nome: String,
    desc: String,
    anoCriacao: String,
    periodo: String,
    compositor: String,
    duracao: String,
    _id: String 
});

module.exports = mongoose.model('obras', obrasSchema);
