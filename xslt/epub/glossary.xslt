<xsl:stylesheet version="2.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:epub="http://www.idpf.org/2007/ops" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/usx/book[@code='GLO']" name="nav-ncx">
        <dl epub:type="glossary">
            <xsl:variable name="glossary_position" select="position()"/>
            <xsl:apply-templates select="/*/*[count(preceding-sibling::book)=$glossary_position]" />
        </dl>
    </xsl:template>

</xsl:stylesheet>
