var express = require('express');
var router = express.Router();
const axios = require('axios')

/* GET home page. */
router.get('/', function(req, res, next) {
  axios.get('http://localhost:3005/api/filmes/contar')
          .then(dados => {
                res.render('index', {total: dados.data});
          })
          .catch(erro => {
                res.render('error', {error: erro})
  })
});

module.exports = router;
