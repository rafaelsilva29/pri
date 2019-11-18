<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0">
    
    <xsl:output method="xhtml" indent="yes" encoding="UTF-8"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title><xsl:value-of select="pr/meta/title"/></title>
                <meta charset="UFT-8"/>
            </head>
            <body>
                <h1 align="center">Project Record</h1>
                <h3 align="center"><xsl:value-of select="pr/meta/title"/></h3>
                <table border="1" align="center">
                    <xsl:apply-templates/>
                </table>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="meta">
        <td width="50%">
            <ul>
                <xsl:apply-templates/>
            </ul>
        </td>
    </xsl:template>
    
    <xsl:template match="keyname">
        <li>
            <b>Key Name: </b><xsl:value-of select="."/>
        </li>
    </xsl:template>
    
    <xsl:template match="title">

    </xsl:template>
    
    <xsl:template match="subtitle">
        <li>
            <b>Subtitle: </b><xsl:value-of select="."/>
        </li>
    </xsl:template>
    
    <xsl:template match="bdate">
        <li> 
            <b>Begin Date: </b><xsl:value-of select="."/>
        </li>
    </xsl:template>
    
    <xsl:template match="edate">
        <li> 
            <b>Final Date: </b><xsl:value-of select="."/>
        </li>
    </xsl:template>
    
    <xsl:template match="supervisor">
        <li>
            <b>Supervisor:</b>
            <ul>
                <li>Name: <a href="{homepage}"><xsl:value-of select="name"/></a></li>
                <li>Email: <a href="mailto:{email}"><xsl:value-of select="email"/> d</a></li>
            </ul>

        </li>
    </xsl:template>
    
    <xsl:template match="workteam">
        <td width="50%">
            <b>Members</b>
            <table>
                <xsl:apply-templates/>
            </table>
        </td>
    </xsl:template>
    
    <xsl:template match="member">
        <tr>
            <ul>
                <ul align="center">
                    <img width="20%">
                        <xsl:attribute name="src">
                            <xsl:value-of select="photo/@path"/>
                        </xsl:attribute>
                    </img>
                </ul>
                
                <li><b>Name: </b><xsl:value-of select="name"/></li>
                <li><b>Identifier: </b><xsl:value-of select="identifier"/></li>
                <li><b>Email:</b> <a href="mailto:{email}"><xsl:value-of select="email"/></a></li>
            </ul>
        </tr>
    </xsl:template>
    
    <xsl:template match="abstract">
        <table border="1" align="center">
            <td width="51%">
                <h3><u>Resume</u></h3>
                <xsl:apply-templates/>
            </td>
        </table>
    </xsl:template>
    
    <xsl:template match="p">
        <ul style="list-style-type:none">
            <li>
                <p><xsl:apply-templates/></p>
            </li>
        </ul>
    </xsl:template>
    
    <xsl:template match="i">
        <i><xsl:value-of select="."/></i>
    </xsl:template>
    
    <xsl:template match="b">
        <b><xsl:value-of select="."/></b>
    </xsl:template>
    
    <xsl:template match="u">
        <b><xsl:value-of select="."/></b>
    </xsl:template>
    
    <xsl:template match="xref">
        <a>
            <xsl:attribute name="href">
                <xsl:value-of select="@url"/>
            </xsl:attribute>
            <xsl:value-of select="."/>
        </a>
    </xsl:template>
    
    <xsl:template match="deliverables">
        <table border="1" align="center">
            <td width="50%">
                <h3><u>Deliverables</u></h3>
                <li style="list-style-type:none">
                    <xsl:apply-templates/>
                </li>
            </td>
        </table>
    </xsl:template>
    
    <xsl:template match="deliverable">  
        <li>
          <a>
            <xsl:attribute name="href">
                <xsl:value-of select="@path"/>
            </xsl:attribute>
            <xsl:value-of select="."/>
          </a>
        </li> 
    </xsl:template>
    
</xsl:stylesheet>