<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:strip-space elements="*"/>
    <xsl:output method="xml" omit-xml-declaration="no" indent="yes"/>

    <!-- Helpers -->
    <xsl:include href="osis2usx/book_codes.xslt"/>

    <!-- Elements -->
    <xsl:include href="osis2usx/elements.xslt"/>
    <xsl:include href="osis2usx/para_title.xslt" />
    <xsl:include href="osis2usx/char_w.xslt"/>

    <!-- Note -->
    <xsl:include href="osis2usx/note.xslt"/>


    <xsl:template match='/osis'>
        <usx version="3.0">
        <xsl:for-each select='osisText/div/div[@type="book"]'>
            <xsl:variable name="current_osis_id" select="@osisID" />
            <xsl:variable name="book_id" select="document('osis2usx/book_codes.xslt')/*/xsl:variable[@name='books']/code[@osis = $current_osis_id]/@usfm" />
                <xsl:element name="book">
                    <xsl:attribute name="code" select="$book_id" />
                    <xsl:attribute name="style" select='"id"' />
                </xsl:element>
                <xsl:apply-templates select='*'>
                    <xsl:with-param name="book_id" select="$book_id" />
                </xsl:apply-templates>
        </xsl:for-each>
        </usx>

    </xsl:template>

    <!-- Fallback for general tags -->
<xsl:template match="node()"><xsl:copy><span><xsl:attribute name="class"><xsl:value-of select="name(.)" /></xsl:attribute><xsl:apply-templates select="@*|node()"/></span></xsl:copy></xsl:template>


</xsl:stylesheet>
