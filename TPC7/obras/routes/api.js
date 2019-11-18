var express = require('express');
var router = express.Router();

var Obras = require('../controllers/obras')

router.get('/obras', function(req, res, next) {
  if(req.query.periodo) {
    Obras.consultarPeriodo(req.query.periodo)
        .then(dados => res.jsonp(dados))
        .catch(erro => res.status(500).jsonp(erro))
  } else if(req.query.anoCriacao) {
    Obras.consultarAnoCriacao(req.query.anoCriacao)
        .then(dados => res.jsonp(dados))
        .catch(erro => res.status(500).jsonp(erro))
  } else if(req.query.compositor) {
    Obras.consultarCompositor(req.query.compositor)
        .then(dados => res.jsonp(dados))
        .catch(erro => res.status(500).jsonp(erro))
  }
  else {
    Obras.listar()
        .then(dados => res.jsonp(dados))
        .catch(erro => res.status(500).jsonp(erro))
  }
});

router.get('/compositores', function(req, res, next) {
    Obras.listarCompositores()
        .then(dados => res.jsonp(dados))
        .catch(erro => res.status(500).jsonp(erro))
});

router.get('/compositores/:nome', function(req, res, next) {
  Obras.consultarCompositor(req.params.nome)
      .then(dados => res.jsonp(dados))
      .catch(erro => res.status(500).jsonp(erro))
});

module.exports = router;
