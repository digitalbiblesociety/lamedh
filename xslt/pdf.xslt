<xsl:stylesheet version="2.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:include href="html/character-map.xslt" />
    <xsl:strip-space elements="*"/>

    <xsl:output indent="yes" use-character-maps="html-illegal-chars" method="html" encoding="UTF-8" />

    <xsl:include href="pdf/bible.xslt" />

    <xsl:template name="main">
        <xsl:call-template name="bible" />
    </xsl:template>
</xsl:stylesheet>
