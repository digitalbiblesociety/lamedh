<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema">

    <xsl:param name="bible_id" as="xs:string" required="yes" />
    <xsl:strip-space elements="*"/>
    <xsl:output indent="yes" method="text" />

    <xsl:template name="main" match="stylesheet">
<xsl:text>/* -------- General Test -------- */</xsl:text>
<xsl:for-each select='style'>
/* <xsl:value-of select="description/text()" /> */
.<xsl:value-of select="@id" /> {<xsl:for-each select="property"><xsl:value-of select="concat(@name, ':', text(), @unit, ';')" /></xsl:for-each>}
</xsl:for-each>

    </xsl:template>


    <xsl:template name="general_fallback" match="@*|node()"></xsl:template>

</xsl:stylesheet>
