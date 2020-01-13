var express = require('express');
var router = express.Router();
var JCRPubs = require('../controllers/jcrpubs')

router.get('/', function(req, res) {
  JCRPubs.listarTypes()
          .then(dados => res.jsonp(dados))
          .catch(erro => res.status(500).jsonp(erro))
});

module.exports = router;
