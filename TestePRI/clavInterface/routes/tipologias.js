var express = require('express');
var router = express.Router();
var axios = require('axios')

const apiKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE1Nzg4NjAwNTQsImV4cCI6MTU4MTQ1MjA1NH0.HIlH4_Ao6504qaLhhbZ2_OtDzaZaG5FeYy-Yc2d9lwQ"

router.get('/', function(req, res, next) {
  axios.get(`http://clav-api.dglab.gov.pt/api/tipologias?apikey=${apiKey}`)
          .then(dados => {
                res.render('tipologias', { listaTipologias: dados.data});
          })
          .catch(erro => {
                res.render('error', {error: erro})
  })
});

/* GET users listing. */
router.get('/:id', async function(req, res, next) {
  var tipologia = ""
  var entidades = ""
  var donos = ""
  var flag = false
  var erro = ""
  await axios.get(`http://clav-api.dglab.gov.pt/api/tipologias/${req.params.id}?apikey=${apiKey}`)
          .then(dados => {
                tipologia = dados.data
                flag = true;
          })
          .catch(erro => {
                console.log(erro.message)
                erro = erro
                flag = false
  })

  await axios.get(`http://clav-api.dglab.gov.pt/api/tipologias/${req.params.id}/elementos?apikey=${apiKey}`)
          .then(dados => {
                entidades = dados.data
                flag = true
          })
          .catch(erro => {
              console.log(erro.message)
              erro = erro
              flag = false
  })

  await axios.get(`http://clav-api.dglab.gov.pt/api/tipologias/${req.params.id}/intervencao/dono?apikey=${apiKey}`)
          .then(dados => {
                donos = dados.data
                erro = erro
                flag = true
          })
          .catch(erro => {
              console.log(erro.message)
              erro = erro
              flag = false
  })

  if(flag) {
    res.render('tipologia-individual', { tipologia: tipologia, entidades: entidades, donos: donos})
  }
  else {
    res.render({ erro: erro })
  }
});

module.exports = router;
