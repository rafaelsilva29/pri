<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0">
    
    <xsl:output method="xhtml" indent="yes" encoding="UTF-8"/>
    
    <xsl:template match="/">
        
        <xsl:result-document href="website/index.html">
            <html>
                <head>
                    <title>Biblioteca de Arqueos Sitios</title>
                    <meta charset="UFT-8"/>
                </head>
                <body>
                    <h1>Biblioteca de Arqueos Sitios</h1>
                    <ol>
                        <xsl:apply-templates/>
                    </ol>
                </body>
            </html>
        </xsl:result-document>

        <xsl:apply-templates mode="concelAmares"/>
        <xsl:apply-templates mode="concelBarcelos"/>
        <xsl:apply-templates mode="concelBraga"/>
        <xsl:apply-templates mode="concelPovoaLanhoso"/>
        <xsl:apply-templates mode="concelVilaVerde"/>
        <xsl:apply-templates mode="concelTerrasBouro"/>
        <xsl:apply-templates mode="concelEsposende"/>
        <xsl:apply-templates mode="concelFafe"/>
        <xsl:apply-templates mode="concelChaves"/>
        <xsl:apply-templates mode="concelArcosValdevez"/>
        <xsl:apply-templates mode="concelSantoTirso"/>
        <xsl:apply-templates mode="concelMelgaco"/>
        <xsl:apply-templates mode="concelMontalegre"/>
        <xsl:apply-templates mode="concelPonteBarca"/>
               
        <xsl:apply-templates mode="individual"/>
        
    </xsl:template>
    
    <xsl:template match="ARQELEM" mode="individual">
        <xsl:result-document href="website/{normalize-space(CONCEL)}/pages/{generate-id()}.html">
            <html>
                <head>
                    <title>Arque Sitio : Pagina Individual</title>
                    <meta charset="UFT-8"/>
                </head>
                <body>
                    <h2><xsl:value-of select="IDENTI"/></h2>
                    <table border="1">
                        <xsl:if test=" (DESCRI != '') ">
                            <tr>
                                <th>Descrição: </th><td><xsl:value-of select="DESCRI"/></td>
                            </tr>
                        </xsl:if>
                        
                        <xsl:if test=" (LUGAR != '') ">
                            <tr>
                                <th>Lugar: </th><td><xsl:value-of select="LUGAR"/></td>
                            </tr>
                        </xsl:if>
                        
                        <xsl:if test=" (FREGUE != '') ">
                             <tr>
                                 <th>Freguesia: </th><td><xsl:value-of select="FREGUE"/></td>
                             </tr>
                        </xsl:if>
                        
                        <xsl:if test=" (CONCEL != '') ">
                           <tr>
                               <th>Concelho: </th><td><xsl:value-of select="CONCEL"/></td>
                           </tr>
                        </xsl:if>
                        <xsl:if test=" (CODADM != '') ">
                            <tr>
                                <th>CODADM: </th><td><xsl:value-of select="CODADM"/></td>
                            </tr>
                        </xsl:if>
                        <xsl:if test=" (LATITU != '') ">
                             <tr>
                                 <th>Latitude: </th><td><xsl:value-of select="LATITU"/></td>
                             </tr>
                        </xsl:if>
                        <xsl:if test=" (LONGIT != '') ">
                            <tr>
                                <th>Longitude: </th><td><xsl:value-of select="LONGIT"/></td>
                            </tr>
                        </xsl:if>
                        <xsl:if test=" (ALTITU != '') ">
                             <tr>
                                 <th>Altitude: </th><td><xsl:value-of select="ALTITU"/></td>
                             </tr>
                        </xsl:if>
                        <xsl:if test="ACESSO != ''">
                            <tr>
                                <th>Acesso: </th><td><xsl:value-of select="ACESSO"/></td>
                            </tr>
                        </xsl:if>
                    </table>
                    
                    <table width="50%">
                        <h3>Resumo</h3>
                        <tr>
                            <td><p><xsl:value-of select="QUADRO"/></p></td>
                        </tr>
                        <tr>
                            <td><p><xsl:value-of select="DESARQ"/></p></td>
                        </tr>
                    </table>
                    
                    <xsl:if test=" (DEPOSI != '') or (INTERP != '')">
                         <table width="50%">
                             <h3>Palavras Chave</h3>
                             <ul>
                                 <xsl:if test=" (INTERP != '') ">
                                    <li>
                                        <xsl:value-of select="INTERP"/>
                                    </li>
                                 </xsl:if>
                                 <xsl:if test=" (DEPOSI != '') ">
                                     <li>
                                           <xsl:value-of select="DEPOSI"/>
                                     </li>
                                 </xsl:if>
                             </ul>
                         </table>
                     </xsl:if>
                    
                    <xsl:if test=" (BIBLIO != '') ">
                         <table width="50%">
                             <h3>BiblioGrafia</h3>
                             <ul>
                                 <xsl:for-each-group select="BIBLIO" group-by=".">
                                      <li>
                                          <xsl:value-of select="."/>
                                      </li>
                                 </xsl:for-each-group>
                             </ul>
                         </table>
                    </xsl:if>
                    
                    <table>
                        <tr>
                            <th>Autor: </th><td><xsl:value-of select="AUTOR"/></td>
                        </tr>
                        <tr>
                            <th>Data: </th><td><xsl:value-of select="DATA"/></td>
                        </tr>

                    </table>
                    
                    <hr with="%40"/>
                    <address align="center">
                        <a href="{generate-id()}.html">Página anterior</a>
                        <a href="{generate-id()}.html">Página a seguir</a>
                    </address>
                    <address>
                        <a href="../index.html#{generate-id()}">Voltar ao indice !!!</a>
                    </address>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="ARQSITS" mode="concelAmares">
        <xsl:result-document href="website/Amares/index.html">
            <html>
                <head>
                    <title>Amares</title>
                    <meta charset="UFT-8"/>
                </head>
                <body>
                    <h2>Arque Sitios de Amares</h2>
                    <ol>
                        <xsl:for-each-group select="ARQELEM" group-by=".">
                            <xsl:if test=" (normalize-space(CONCEL) = 'Amares') ">
                                <li id="{generate-id()}">
                                    <a href="pages/{generate-id()}.html"><xsl:apply-templates select="IDENTI"/></a>
                                </li>
                             </xsl:if>
                        </xsl:for-each-group>
                    </ol>
                    <hr with="%40"/>
                    <address>
                        <a href="../index.html#{generate-id()}">Voltar ao indice !!!</a>
                    </address>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="ARQSITS" mode="concelBarcelos">
        <xsl:result-document href="website/Barcelos/index.html">
            <html>
                <head>
                    <title>Barcelos</title>
                    <meta charset="UFT-8"/>
                </head>
                <body>
                    <h2>Arque Sitios de Barcelos</h2>
                    <ol>
                        <xsl:for-each-group select="ARQELEM" group-by=".">
                            <xsl:if test=" (normalize-space(CONCEL) = 'Barcelos') ">
                                <li id="{generate-id()}">
                                    <a href="pages/{generate-id()}.html"><xsl:apply-templates select="IDENTI"/></a>
                                </li>
                            </xsl:if>
                        </xsl:for-each-group>
                    </ol>
                    <hr with="%40"/>
                    <address>
                        <a href="../index.html#{generate-id()}">Voltar ao indice !!!</a>
                    </address>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="ARQSITS" mode="concelBraga">
        <xsl:result-document href="website/Braga/index.html">
            <html>
                <head>
                    <title>Braga</title>
                    <meta charset="UFT-8"/>
                </head>
                <body>
                    <h2>Arque Sitios de Braga</h2>
                    <ol>
                        <xsl:for-each-group select="ARQELEM" group-by=".">
                            <xsl:if test=" (normalize-space(CONCEL) = 'Braga') ">
                                <li id="{generate-id()}">
                                    <a href="pages/{generate-id()}.html"><xsl:apply-templates select="IDENTI"/></a>
                                </li>
                            </xsl:if>
                        </xsl:for-each-group>
                    </ol>
                    <hr with="%40"/>
                    <address>
                        <a href="../index.html#{generate-id()}">Voltar ao indice !!!</a>
                    </address>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="ARQSITS" mode="concelPovoaLanhoso">
        <xsl:result-document href="website/P%C3%B3voa%20de%20Lanhoso/index.html">
            <html>
                <head>
                    <title>Póvoa de Lanhoso</title>
                    <meta charset="UFT-8"/>
                </head>
                <body>
                    <h2>Arque Sitios de Póvoa de Lanhoso</h2>
                    <ol>
                        <xsl:for-each-group select="ARQELEM" group-by=".">
                            <xsl:if test=" (normalize-space(CONCEL) = 'Póvoa de Lanhoso') ">
                                <li id="{generate-id()}">
                                    <a href="pages/{generate-id()}.html"><xsl:apply-templates select="IDENTI"/></a>
                                </li>
                            </xsl:if>
                        </xsl:for-each-group>
                    </ol>
                    <hr with="%40"/>
                    <address>
                        <a href="../index.html#{generate-id()}">Voltar ao indice !!!</a>
                    </address>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="ARQSITS" mode="concelVilaVerde">
        <xsl:result-document href="website/Vila%20Verde/index.html">
            <html>
                <head>
                    <title>Vila Verde</title>
                    <meta charset="UFT-8"/>
                </head>
                <body>
                    <h2>Arque Sitios de Vila Verde</h2>
                    <ol>
                        <xsl:for-each-group select="ARQELEM" group-by=".">
                            <xsl:if test=" (normalize-space(CONCEL) = 'Vila Verde') ">
                                <li id="{generate-id()}">
                                    <a href="pages/{generate-id()}.html"><xsl:apply-templates select="IDENTI"/></a>
                                </li>
                            </xsl:if>
                        </xsl:for-each-group>
                    </ol>
                    <hr with="%40"/>
                    <address>
                        <a href="../index.html#{generate-id()}">Voltar ao indice !!!</a>
                    </address>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="ARQSITS" mode="concelTerrasBouro">
        <xsl:result-document href="website/Terras%20de%20Bouro/index.html">
            <html>
                <head>
                    <title>Terras de Bouro</title>
                    <meta charset="UFT-8"/>
                </head>
                <body>
                    <h2>Arque Sitios de Terras de Bouro</h2>
                    <ol>
                        <xsl:for-each-group select="ARQELEM" group-by=".">
                            <xsl:if test=" (normalize-space(CONCEL) = 'Terras de Bouro') ">
                                <li id="{generate-id()}">
                                    <a href="pages/{generate-id()}.html"><xsl:apply-templates select="IDENTI"/></a>
                                </li>
                            </xsl:if>
                        </xsl:for-each-group>
                    </ol>
                    <hr with="%40"/>
                    <address>
                        <a href="../index.html#{generate-id()}">Voltar ao indice !!!</a>
                    </address>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="ARQSITS" mode="concelEsposende">
        <xsl:result-document href="website/Esposende/index.html">
            <html>
                <head>
                    <title>Esposende</title>
                    <meta charset="UFT-8"/>
                </head>
                <body>
                    <h2>Arque Sitios de Esposende</h2>
                    <ol>
                        <xsl:for-each-group select="ARQELEM" group-by=".">
                            <xsl:if test=" (normalize-space(CONCEL) = 'Esposende') ">
                                <li id="{generate-id()}">
                                    <a href="pages/{generate-id()}.html"><xsl:apply-templates select="IDENTI"/></a>
                                </li>
                            </xsl:if>
                        </xsl:for-each-group>
                    </ol>
                    <hr with="%40"/>
                    <address>
                        <a href="../index.html#{generate-id()}">Voltar ao indice !!!</a>
                    </address>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="ARQSITS" mode="concelFafe">
        <xsl:result-document href="website/Fafe/index.html">
            <html>
                <head>
                    <title>Fafe</title>
                    <meta charset="UFT-8"/>
                </head>
                <body>
                    <h2>Arque Sitios de Fafe</h2>
                    <ol>
                        <xsl:for-each-group select="ARQELEM" group-by=".">
                            <xsl:if test=" (normalize-space(CONCEL) = 'Fafe') ">
                                <li id="{generate-id()}">
                                    <a href="pages/{generate-id()}.html"><xsl:apply-templates select="IDENTI"/></a>
                                </li>
                            </xsl:if>
                        </xsl:for-each-group>
                    </ol>
                    <hr with="%40"/>
                    <address>
                        <a href="../index.html#{generate-id()}">Voltar ao indice !!!</a>
                    </address>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="ARQSITS" mode="concelChaves">
        <xsl:result-document href="website/Chaves/index.html">
            <html>
                <head>
                    <title>Chaves</title>
                    <meta charset="UFT-8"/>
                </head>
                <body>
                    <h2>Arque Sitios de Chaves</h2>
                    <ol>
                        <xsl:for-each-group select="ARQELEM" group-by=".">
                            <xsl:if test=" (normalize-space(CONCEL) = 'Chaves') ">
                                <li id="{generate-id()}">
                                    <a href="pages/{generate-id()}.html"><xsl:apply-templates select="IDENTI"/></a>
                                </li>
                            </xsl:if>
                        </xsl:for-each-group>
                    </ol>
                    <hr with="%40"/>
                    <address>
                        <a href="../index.html#{generate-id()}">Voltar ao indice !!!</a>
                    </address>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="ARQSITS" mode="concelArcosValdevez">
        <xsl:result-document href="website/Arcos%20de%20Valdevez/index.html">
            <html>
                <head>
                    <title>Arcos de Valdevez</title>
                    <meta charset="UFT-8"/>
                </head>
                <body>
                    <h2>Arque Sitios de Arcos de Valdevez</h2>
                    <ol>
                        <xsl:for-each-group select="ARQELEM" group-by=".">
                            <xsl:if test=" (normalize-space(CONCEL) = 'Arcos de Valdevez') ">
                                <li id="{generate-id()}">
                                    <a href="pages/{generate-id()}.html"><xsl:apply-templates select="IDENTI"/></a>
                                </li>
                            </xsl:if>
                        </xsl:for-each-group>
                    </ol>
                    <hr with="%40"/>
                    <address>
                        <a href="../index.html#{generate-id()}">Voltar ao indice !!!</a>
                    </address>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="ARQSITS" mode="concelSantoTirso">
        <xsl:result-document href="website/Santo%20Tirso/index.html">
            <html>
                <head>
                    <title>Santo Tirso</title>
                    <meta charset="UFT-8"/>
                </head>
                <body>
                    <h2>Arque Sitios de Santo Tirso</h2>
                    <ol>
                        <xsl:for-each-group select="ARQELEM" group-by=".">
                            <xsl:if test=" (normalize-space(CONCEL) = 'Santo Tirso') ">
                                <li id="{generate-id()}">
                                    <a href="pages/{generate-id()}.html"><xsl:apply-templates select="IDENTI"/></a>
                                </li>
                            </xsl:if>
                        </xsl:for-each-group>
                    </ol>
                    <hr with="%40"/>
                    <address>
                        <a href="../index.html#{generate-id()}">Voltar ao indice !!!</a>
                    </address>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="ARQSITS" mode="concelMelgaco">
        <xsl:result-document href="website/Melga%C3%A7o/index.html">
            <html>
                <head>
                    <title>Melgaço</title>
                    <meta charset="UFT-8"/>
                </head>
                <body>
                    <h2>Arque Sitios de Melgaço</h2>
                    <ol>
                        <xsl:for-each-group select="ARQELEM" group-by=".">
                            <xsl:if test=" (normalize-space(CONCEL) = 'Melgaço') ">
                                <li id="{generate-id()}">
                                    <a href="pages/{generate-id()}.html"><xsl:apply-templates select="IDENTI"/></a>
                                </li>
                            </xsl:if>
                        </xsl:for-each-group>
                    </ol>
                    <hr with="%40"/>
                    <address>
                        <a href="../index.html#{generate-id()}">Voltar ao indice !!!</a>
                    </address>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="ARQSITS" mode="concelMontalegre">
        <xsl:result-document href="website/Montalegre/index.html">
            <html>
                <head>
                    <title>Montalegre</title>
                    <meta charset="UFT-8"/>
                </head>
                <body>
                    <h2>Arque Sitios de Montalegre</h2>
                    <ol>
                        <xsl:for-each-group select="ARQELEM" group-by=".">
                            <xsl:if test=" (normalize-space(CONCEL) = 'Montalegre') ">
                                <li id="{generate-id()}">
                                    <a href="pages/{generate-id()}.html"><xsl:apply-templates select="IDENTI"/></a>
                                </li>
                            </xsl:if>
                        </xsl:for-each-group>
                    </ol>
                    <hr with="%40"/>
                    <address>
                        <a href="../index.html#{generate-id()}">Voltar ao indice !!!</a>
                    </address>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="ARQSITS" mode="concelPonteBarca">
        <xsl:result-document href="website/Ponte%20da%20Barca/index.html">
            <html>
                <head>
                    <title>Ponte da Barca</title>
                    <meta charset="UFT-8"/>
                </head>
                <body>
                    <h2>Arque Sitios de Ponte da Barca</h2>
                    <ol>
                        <xsl:for-each-group select="ARQELEM" group-by=".">
                            <xsl:if test=" (normalize-space(CONCEL) = 'Ponte da Barca') ">
                                <li id="{generate-id()}">
                                    <a href="pages/{generate-id()}.html"><xsl:apply-templates select="IDENTI"/></a>
                                </li>
                            </xsl:if>
                        </xsl:for-each-group>
                    </ol>
                    <hr with="%40"/>
                    <address>
                        <a href="../index.html#{generate-id()}">Voltar ao indice !!!</a>
                    </address>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="ARQELEM">
        <li id="{generate-id()}">
            <a href="pages/{generate-id()}.html"><xsl:apply-templates select="IDENTI"/></a>
        </li>
    </xsl:template>
    
    <xsl:template match="/*">
        <xsl:for-each-group select="*/normalize-space(CONCEL)" group-by=".">
            <li id="{normalize-space(.)}">
                <a href="{normalize-space(.)}/index.html"><xsl:sequence select="."/></a>
            </li>
        </xsl:for-each-group>
    </xsl:template>
    
</xsl:stylesheet>