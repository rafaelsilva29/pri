var http = require('http');
var fs = require('fs');
var pug = require('pug');

var serverArqEvo = http.createServer(function (request, response) {

    console.log("REQUEST: " + request.method + " | URL: " + request.url)
    
    if(request.method == 'GET') {

        var pathAux = request.url.split('/');

        switch (request.url) { 
            case '/musica/error.png': 
            fs.readFile('error.png', (error,data) => {
                if(!error) {
                    response.writeHead(200);
                    response.write(data);
                }
                else {
                    response.writeHead(404);
                    response.write(error);
                }
                response.end();
            }); // callback para resposta ao pedido
            break;
            case '/error.png': 
                fs.readFile('error.png', (error,data) => {
                    if(!error) {
                        response.writeHead(200);
                        response.write(data);
                    }
                    else {
                        response.writeHead(404);
                        response.write(error);
                    }
                    response.end();
                }); // callback para resposta ao pedido
                break;
            case '/w3.css': 
                fs.readFile('w3.css', (error,data) => {
                    if(!error) {
                        response.writeHead(200, {
                            'Content-Type': 'text/css'
                        });
                        response.write(data);
                    }
                    else {
                        response.writeHead(404, {
                            'Content-Type': 'text/html'
                        });
                        response.write(error);
                    }
                    response.end();
                }); // callback para resposta ao pedido
                break;
            case '/musica/w3.css': 
                fs.readFile('w3.css', (error,data) => {
                    if(!error) {
                        response.writeHead(200, {
                            'Content-Type': 'text/css'
                        });
                        response.write(data);
                    }
                    else {
                        response.writeHead(404, {
                            'Content-Type': 'text/html'
                        });
                        response.write(error);
                    }
                    response.end();
                }); // callback para resposta ao pedido
                break;

            case '/musica/doc2html.xsl': 
                fs.readFile('doc2html.xsl', (error,data) => {
                    if(!error) {
                        response.writeHead(200, {
                            'Content-Type': 'text/xsl'
                        });
                        response.write(data);
                    }
                    else {
                        response.writeHead(404, {'Content-Type' : 'text/html; charset=utf-8'});
                        response.write(pug.renderFile('error.pug'));
                    }
                    response.end();
                }); // callback para resposta ao pedido
                break;

            case '/musica/' + pathAux[2] :
                if (fs.existsSync('data/doc' + pathAux[2] + '.xml')) {
                    fs.readFile('data/doc' + pathAux[2] + '.xml', (error,data) => {
                        if(!error) {
                            response.writeHead(200);
                            response.write(data);
                        }
                        else {
                            response.writeHead(404, {'Content-Type' : 'text/html; charset=utf-8'});
                            response.write(pug.renderFile('error.pug'));
                        }
                        response.end();
                    }); // callback para resposta ao pedido
                }
                else {
                    response.writeHead(404, {'Content-Type' : 'text/html; charset=utf-8'});
                    response.write(pug.renderFile('error.pug'));
                    response.end();
                } 
                break;

            default:  
                response.writeHead(404, {'Content-Type' : 'text/html; charset=utf-8'});
                response.write(pug.renderFile('error.pug'));
                response.end();
                break;
        }

    }  else {
        response.writeHead(404, {'Content-Type' : 'text/html; charset=utf-8'});
        response.write(pug.renderFile('error.pug'));
        response.end();
    }
});

serverArqEvo.listen(1234, () => {
    console.log('Server listen on port 1234...');
});
