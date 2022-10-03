<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template priority="2" match="w">
        <char style="w">
            <xsl:attribute name="strong">
                <xsl:for-each select="tokenize(@lemma, 'strong:')">
                    <xsl:value-of select="replace(.,'\s+$','')" />
                    <xsl:if test="position() != last() and position() != 1">,</xsl:if>
                </xsl:for-each>
            </xsl:attribute>
            <xsl:value-of select="concat(' ',text(), ' ')" />
        </char><xsl:text> </xsl:text>
    </xsl:template>

</xsl:stylesheet>
