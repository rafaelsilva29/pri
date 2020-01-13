var express = require('express');
var router = express.Router();
const axios = require('axios')

router.get('/', function(req, res, next) {
  if(req.query.periodo) {
    axios.get('http://localhost:3011/api/obras', {params: {periodo: req.query.periodo}})
      .then(dados => {
        res.render('lista-obras', { lista: dados.data});
    })
    .catch(erro => {
        res.render('error', {error: erro})
    })

  } else if(req.query.anoCriacao) {
    axios.get('http://localhost:3011/api/obras', {params: {anoCriacao: req.query.anoCriacao}})
      .then(dados => {
        res.render('lista-obras', { lista: dados.data});
    })
    .catch(erro => {
        res.render('error', {error: erro})
    })

  } else if(req.query.compositor) {
    axios.get('http://localhost:3011/api/obras', {params: {compositor: req.query.compositor}})
      .then(dados => {
        res.render('lista-obras', { lista: dados.data});
    })
    .catch(erro => {
        res.render('error', {error: erro})
    })

  } else {
    axios.get('http://localhost:3011/api/obras')
      .then(dados => {
        res.render('lista-obras', { lista: dados.data});
    })
    .catch(erro => {
        res.render('error', {error: erro})
    })
  }
});

router.get('/?periodo', function(req, res, next) {
  axios.get('http://localhost:3011/api/obras')
    .then(dados => {
      res.render('lista-obras', { lista: dados.data});
  })
  .catch(erro => {
      res.render('error', {error: erro})
  })
});


module.exports = router;
