var express = require('express');
var router = express.Router();
var axios = require('axios')

const apiKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE1Nzg4NjAwNTQsImV4cCI6MTU4MTQ1MjA1NH0.HIlH4_Ao6504qaLhhbZ2_OtDzaZaG5FeYy-Yc2d9lwQ"

router.get('/', function(req, res, next) {
  axios.get(`http://clav-api.dglab.gov.pt/api/entidades?apikey=${apiKey}`)
          .then(dados => {
                res.render('entidades', { listaEntidades: dados.data});
          })
          .catch(erro => {
                res.render('error', {error: erro})
  })
});

router.get('/:id', async function(req, res, next) {
  var entidade = ""
  var tipologias = ""
  var erro = ""
  var flag = false
  await axios.get(`http://clav-api.dglab.gov.pt/api/entidades/${req.params.id}?apikey=${apiKey}`)
          .then(dados => {
                entidade = dados.data
                flag = true
          })
          .catch(erro => {
                flag = false
                erro = erro
  })

  await axios.get(`http://clav-api.dglab.gov.pt/api/entidades/${req.params.id}/tipologias?apikey=${apiKey}`)
          .then(dados => {
                flag = true
                tipologias = dados.data
          })
          .catch(erro => {
                flag = false
                erro = erro
  })

  if(flag) {
    res.render('entidade-individual', { entidade: entidade, tipologias: tipologias });
  } else {
    res.render('error', {error: erro})
  }
});

module.exports = router;
