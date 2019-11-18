function verCompositor(ident) {
    console.log('Vou ver o compositor: ' + ident)
    axios.get('/api/compositores/' + ident)
        .then(response => window.location.assign('/compositores/' + ident))
        .catch(error => console.log(error))
}