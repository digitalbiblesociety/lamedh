<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xsl:output method="text" indent="no" />
    <xsl:strip-space elements="*" />
    <xsl:param name="bible_id" as="xs:string" required="yes" />

    <xsl:template match="/usx">
[
        <xsl:for-each select="chapter">
            <xsl:value-of select="preceding::book[1]/@code" />_<xsl:value-of select="preceding::chapter[1]/@number" />": [
                <xsl:apply-templates />
            ]
        </xsl:for-each>
]
    </xsl:template>

    <xsl:template name="verses" match="verse">
        <xsl:variable name="number_start" select="substring-before(concat(@number,'-'), '-')" />
        <xsl:variable name="text" select="following-sibling::text()" />
        "<xsl:value-of select="$number_start" />": {
           "<xsl:if test="substring-before(concat(following::verse[1]/@number,'-'), '-')"><xsl:value-of select="substring-before(concat(following::verse[1]/@number,'-'), '-')" /></xsl:if><xsl:if test="not(substring-before(concat(following::verse[1]/@number,'-'), '-'))"><xsl:value-of select="@number" /></xsl:if>",
           "<xsl:for-each select="$text"><xsl:value-of select="translate(., '\&quot;', '')" /></xsl:for-each>"
        }<xsl:choose><xsl:when test="following::chapter[1]/@number = 1 and following::verse[1]/@number = 1 or count(following::verse) = 0"></xsl:when><xsl:otherwise>,</xsl:otherwise></xsl:choose>
    </xsl:template>
    <xsl:template match="text()" />
</xsl:stylesheet>
