var express = require('express');
var router = express.Router();
const axios = require('axios')


router.get('/', function(req, res, next) {
  axios.get('http://localhost:3011/api/compositores')
      .then(dados => {
        res.render('lista-compositores', { lista: dados.data});
    })
    .catch(erro => {
        res.render('error', {error: erro})
    })
});

router.get('/:nome', function(req, res, next) {
  axios.get('http://localhost:3011/api/compositores/' + req.params.nome)
      .then(dados => {
        res.render('compositor', { compositor: dados.data});
    })
    .catch(erro => {
        res.render('error', {error: erro})
    })
});

module.exports = router;
