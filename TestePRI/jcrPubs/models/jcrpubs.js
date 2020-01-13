const mongoose = require('mongoose')

var jcrpubSchema = new mongoose.Schema({
    _id: String,
    type: String,
    authors: [String],
    title: String,
    booktitle: String,
    address: String,
    year: String,
    month: String,
    doi: String,
});

module.exports = mongoose.model('jcrpubs', jcrpubSchema);