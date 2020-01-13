var express = require('express');
var router = express.Router();
var jsonfile = require('jsonfile');
var myBD = __dirname + "/../data/alunos.json";

router.get('/:idAluno', function(req, res, next) {
  var id = req.params.idAluno
  jsonfile.readFile(myBD, (erro, alunos) => {
      if(!erro) {
          var aluno = alunos.find(a => a.identificador == id)
          res.render('aluno', {aluno: aluno})
      }
  });
});

router.post('/:idAluno/nota', function(req, res) {
  var id = req.params.idAluno
  const registo = JSON.parse(JSON.stringify(req.body))
  jsonfile.readFile(myBD, (erro, alunos) => {
      if(!erro) {
          var aluno = alunos.find(a => a.identificador == id)
          var index = aluno.notas.findIndex(no => no.indicador == registo['indicador'])
          if(index <= -1) {
              aluno.notas.push(registo)
              jsonfile.writeFile(myBD, alunos, erro => {
                  if(erro) console.log(erro)
                  else console.log('Nota gravada com sucesso...')
              });
          }
          res.render('aluno', {aluno: aluno})
      }
  });
});

router.delete('/:idAluno/nota/:indicador', function(req, res, next) {
  var idAluno = req.params.idAluno
  var indicador = req.params.indicador
  jsonfile.readFile(myBD, (erro, alunos) => {
      if(!erro) {
          var aluno = alunos.find(a => a.identificador == idAluno) 
          var index = aluno.notas.findIndex(no => no.indicador == indicador)
          if(index > -1) {
              aluno.notas.splice(index, 1) // apagar a partir do index 1 elemento
              jsonfile.writeFile(myBD, alunos, erro => {
                  if(erro) console.log(erro)
                  else console.log('BD atualizada com sucesso !!!')
              })
          }
          res.render('aluno', {aluno: aluno})
      }
  });
});

module.exports = router;
