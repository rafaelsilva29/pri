var express = require('express');
var router = express.Router();
const axios = require('axios')

/* GET lista de filmes */
router.get('/', function(req, res) {
  axios.get('http://localhost:3005/api/filmes')
          .then(dados => {
                res.render('lista-filmes', { lista: dados.data});
          })
          .catch(erro => {
                res.render('error', {error: erro})
  })
});

/* GET form filme para inserir */
router.get('/inserir', function(req,res){
  res.render('form-filme')
})

/* GET lista de filmes */
router.get('/:idFilme', function(req, res) {
  axios.get('http://localhost:3005/api/filmes/' + req.params.idFilme)
          .then(dados => {
                res.render('filme', { filme: dados.data});
          })
          .catch(erro => {
                res.render('error', {error: erro})
  })
});

/* POST insere um filme na BD */
router.post('/', function(req,res){
  axios.post('http://localhost:3005/api/filmes', req.body)
        .then(dados => {
              res.redirect('/')
        })
        .catch(erro => {
              res.render('error', {error: erro})
  })
})

/* DELTETE apaga um filme na BD */
router.delete('/:idFilme', function(req, res) {
  axios.delete('http://localhost:3005/api/filmes/' + req.params.idFilme)
          .then(dados => {
                res.redirect('/filmes')
          })
          .catch(erro => {
                res.render('error', {error: erro})
  })
});


module.exports = router;
