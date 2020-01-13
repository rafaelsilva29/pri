<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.0">
    
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>
    
    <xsl:template match="doc">
        <html>
            <head>
                <title>Arquivo Sonoro : Pagina Individual</title>
                <meta charset="UFT-8"/>
                <link rel="stylesheet" type="text/css" href="w3.css"/>
            </head>
            <body>
                <div class="w3-container">
                    <div class="w3-card">
                        <div class="w3-container w3-dark-grey">
                            <h1 align='center'><xsl:value-of select="tit"/></h1>
                        </div>
                        <div class="w3-container">
                            <table class="w3-table-all" align="center">
                                <thead>
                                    <tr class="w3-light-grey">
                                        <th>Província</th>
                                        <th>Local</th>
                                        <th>Músico</th>
                                        <th>Duração</th>
                                    </tr>
                                </thead>
                                 <tr>
                                    <td><xsl:value-of select="prov"/></td>
                                    <td><xsl:value-of select="local"/></td>
                                    <td><xsl:value-of select="musico"/></td>
                                    <td><xsl:value-of select="duracao"/></td>
                                 </tr>
                             </table>
                        </div>
                        <hr with="%50"/>
                        <div class="w3-container w3-dark-grey">
                             <address align="center">
                                 Gerado por Gestão de Arquivos Música:
                                 <a href="">Música anterior</a>
                                 -
                                 <a href="">Música seguinte</a>
                             </address>
                        </div>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>
    
</xsl:stylesheet>