<xsl:stylesheet version="2.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xsl:output indent="yes"/>
    <xsl:strip-space elements="*"/>

    <xsl:param name="api_url" as="xs:string" required="yes" />
    <xsl:param name="bible_id" as="xs:string" required="yes" />
    <xsl:param name="trim" as="xs:string" required="yes" />
    <xsl:param name="metadata" select="document(concat($api_url,$bible_id,'?format=xml&amp;trim='$trim))"/>

    <xsl:include href="pdf/books.xslt" />

    <xsl:template name="main">
        <!-- Generates a XHTML file for the Each Book -->
        <xsl:call-template name="books" />
    </xsl:template>
</xsl:stylesheet>
