var express = require('express');
var router = express.Router();
var jsonfile = require('jsonfile');
var myBD = __dirname + "/../data/alunos.json";

/* GET home page. /alunos */
router.get('/', function(req, res, next) {
    jsonfile.readFile(myBD, (erro,dados) => {
        if(!erro) {
            res.render('alunos', {lista: dados})
        }
        else {
            res.render('error', {error: erro})
        }
    })
});

router.post('/', function(req, res) {
    var registo = req.body
    registo['notas'] = []
    jsonfile.readFile(myBD, (erro, alunos) => {
        if(!erro) {
            var index = alunos.findIndex(a => a.identificador == registo['identificador'])
            if(index <= -1) {
                alunos.push(registo)
                jsonfile.writeFile(myBD, alunos, erro => {
                    if(erro) console.log(erro)
                    else console.log('Registo gravado com sucesso...')
                });
            }
        }
        res.render('alunos', {lista: alunos})
    });
});

router.delete('/:idAluno', function(req, res) {
    var id = req.params.idAluno
    jsonfile.readFile(myBD, (erro, alunos) => {
        if(!erro) {
            var index = alunos.findIndex(a => a.identificador == id)
            if(index > -1) {
                alunos.splice(index, 1) // apagar a partir do index 1 elemento
                jsonfile.writeFile(myBD, alunos, erro => {
                    if(erro) console.log(erro)
                    else console.log('BD atualizada com sucesso !!!')
                })
            }
        }
        res.render('alunos', {lista: alunos})
    });
});

module.exports = router;
