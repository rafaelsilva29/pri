var express = require('express');
var router = express.Router();
var JCRPubs = require('../controllers/jcrpubs')

router.get('/', function(req, res) {
  if(req.query.type && req.query.year) {
    JCRPubs.consultarTypeYear(req.query.type,req.query.year)
      .then(dados => res.jsonp(dados))
      .catch(erro => res.status(500).jsonp(erro))
  } else if(req.query.type) {
    JCRPubs.consultarType(req.query.type)
        .then(dados => res.jsonp(dados))
        .catch(erro => res.status(500).jsonp(erro))
  } else if(req.query.autor) {
    JCRPubs.consultarAutor(req.query.autor)
        .then(dados => res.jsonp(dados))
        .catch(erro => res.status(500).jsonp(erro))
  }
  else {
    JCRPubs.listar()
            .then(dados => res.jsonp(dados))
            .catch(erro => res.status(500).jsonp(erro))
  }
});

router.get('/:id', function(req, res) {
  JCRPubs.consultar(req.params.id)
          .then(dados => res.jsonp(dados))
          .catch(erro => res.status(500).jsonp(erro))
});


module.exports = router;
