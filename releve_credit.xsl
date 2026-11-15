<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    
    <xsl:template match="/releve">
        <html>
            <head>
                <title>Opérations de Crédit</title>
            </head>
            <body>
                <h2>Opérations de Crédit - RIB : <xsl:value-of select="@RIB"/></h2>
                <p>Période du <xsl:value-of select="operations/@dateDebut"/> au <xsl:value-of select="operations/@dateFin"/></p>
                
                <table border="1">
                    <thead>
                        <tr>
                            <th>Date</th>
                            <th>Description</th>
                            <th>Montant Crédit (DH)</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="operations/operation[@type='CREDIT']">
                            <tr>
                                <td><xsl:value-of select="@date"/></td>
                                <td><xsl:value-of select="@description"/></td>
                                <td><xsl:value-of select="@montant"/></td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>