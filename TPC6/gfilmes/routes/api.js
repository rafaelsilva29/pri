var express = require('express');
var router = express.Router();

var Filmes = require('../controllers/filmes')

/* GET lista de filmes */
router.get('/filmes', function(req, res) {
  Filmes.listar()
        .then(dados => res.jsonp(dados))
        .catch(erro => res.status(500).jsonp(erro))
});

/* GET lista de filmes */
router.get('/filmes/contar', function(req, res) {
  Filmes.contar()
        .then(dados => res.jsonp(dados))
        .catch(erro => res.status(500).jsonp(erro))
});

/* GET recupera a infomação de um filme */
router.get('/filmes/:idFilme', function(req, res) {
  Filmes.consultar(req.params.idFilme)
        .then(dados => res.jsonp(dados))
        .catch(erro => res.status(500).jsonp(erro))
});

/* POST inserir um filme */ 
router.post('/filmes', function(req, res) {
  console.log(req.body)
  var cast = req.body.cast.split(',')
  var genres = req.body.genres.split(',')
  req.body.cast = cast
  req.body.genres = genres
  Filmes.inserir(req.body)
        .then(dados => res.jsonp(dados))
        .catch(erro => res.status(500).jsonp(erro))
});

/* DELETE apaga um filme da BD */
router.delete('/filmes/:idFilme', function(req, res) {
  Filmes.apagar(req.params.idFilme)
        .then(dados => res.jsonp(dados))
        .catch(erro => res.status(500).jsonp(erro))
});

module.exports = router;
