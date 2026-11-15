<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    
    <xsl:template match="/releve">
        <html>
            <head>
                <title>Relevé Bancaire</title>
            </head>
            <body>
                <h2>Relevé de Compte Bancaire</h2>
                <ul>
                    <li>RIB : <xsl:value-of select="@RIB"/></li>
                    <li>Date du relevé : <xsl:value-of select="dateReleve"/></li>
                    <li>Solde actuel : <xsl:value-of select="solde"/> DH</li>
                    <li>Période : Du <xsl:value-of select="operations/@dateDebut"/> au <xsl:value-of select="operations/@dateFin"/></li>
                </ul>
                
                <table border="1">
                    <thead>
                        <tr>
                            <th>Date</th>
                            <th>Type</th>
                            <th>Description</th>
                            <th>Montant (DH)</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="operations/operation">
                            <tr>
                                <td><xsl:value-of select="@date"/></td>
                                <td><xsl:value-of select="@type"/></td>
                                <td><xsl:value-of select="@description"/></td>
                                <td><xsl:value-of select="@montant"/></td>
                            </tr>
                        </xsl:for-each>
                        <tr>
                            <td colspan="3">Total des opérations de CRÉDIT</td>
                            <td>
                                <xsl:value-of select="sum(operations/operation[@type='CREDIT']/@montant)"/> DH
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">Total des opérations de DÉBIT</td>
                            <td>
                                <xsl:value-of select="sum(operations/operation[@type='DEBIT']/@montant)"/> DH
                            </td>
                        </tr>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>