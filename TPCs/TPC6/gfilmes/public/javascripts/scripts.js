function apagarFilme(ident) {
    console.log('Vou apagar o filme: ' + ident)
    axios.delete('/api/filmes/' + ident)
        .then(response => window.location.assign('/filmes'))
        .catch(error => console.log(error))
}

function verFilme(ident) {
    console.log('Vou ver o filme: ' + ident)
    axios.get('/api/filmes/' + ident)
        .then(response => window.location.assign('/filmes/' + ident))
        .catch(error => console.log(error))
}