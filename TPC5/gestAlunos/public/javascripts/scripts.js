function apagarAluno(ident) {
    console.log('Vou apagar o aluno: ' + ident)
    axios.delete('/alunos/' + ident)
        .then(response => window.location.assign('/alunos'))
        .catch(error => console.log(error))
}

function verAluno(ident) {
    console.log('Vou ver o aluno: ' + ident)
    axios.get('/aluno/' + ident)
        .then(response => window.location.assign('/aluno/' + ident))
        .catch(error => console.log(error))
}

function apagarNota(ident) {
    var params = ident.split("|")
    var indicador = params[0];
    var idAluno = params[1];
    console.log("Vou apagar uma nota do indicador:" + indicador + "ao aluno: " + idAluno)
    axios.delete('/aluno/' + idAluno + "/nota/" + indicador)
        .then(response => window.location.assign('/aluno/' + idAluno))
        .catch(error => console.log(error))
}