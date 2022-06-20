<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="para"><xsl:variable name="current_book" select="preceding::book[1]/@code" /><xsl:if test="$book_list[@usfm = $current_book]"><p><xsl:attribute name="class"><xsl:value-of select="@style"/></xsl:attribute><xsl:apply-templates /></p></xsl:if></xsl:template>

<xsl:template match="optbreak"><lb /></xsl:template>

<xsl:template match="char"><em class="{@style}"><xsl:apply-templates select="node()"/></em></xsl:template>

<xsl:template match="verse">
    <xsl:variable name="book" select="preceding::para[@style = 'h'][1]"/>
    <xsl:variable name="chapter_number" select="preceding::chapter[1]/@number"/>
    <xsl:variable name="verse_number" select="tokenize(@number, '-')" />

<xsl:if test="$verse_number[1] = '1'">
    <xsl:variable name="chapter_pubnumber" select="preceding::chapter[1]/@pubnumber"/>
    <b class="c c{$chapter_number}">
        <xsl:attribute name="title">
            <xsl:choose><xsl:when test="$chapter_pubnumber"><xsl:value-of select="$chapter_pubnumber" /></xsl:when><xsl:otherwise><xsl:value-of select="$chapter_number"/></xsl:otherwise></xsl:choose>
        </xsl:attribute>
        <xsl:choose><xsl:when test="$chapter_pubnumber"><xsl:value-of select="$chapter_pubnumber" /></xsl:when><xsl:otherwise><xsl:value-of select="$chapter_number"/></xsl:otherwise></xsl:choose>
    </b>
</xsl:if>
<sup class="v v{@number}" data-verse="{@number}"><xsl:attribute name="data-sid"><xsl:value-of select="preceding::book[1]/@code" /><xsl:value-of select="$chapter_number" /></xsl:attribute><xsl:attribute name="title"><xsl:value-of select="concat($book, ' ')" /><xsl:choose><xsl:when test="preceding::chapter[1]/@pubnumber"><xsl:value-of select="preceding::chapter[1]/@pubnumber" /></xsl:when><xsl:otherwise><xsl:value-of select="preceding::chapter[1]/@number"/></xsl:otherwise></xsl:choose>&#8203;:&#8203;<xsl:choose><xsl:when test="@pubnumber"><xsl:value-of select="@pubnumber" /></xsl:when><xsl:otherwise><xsl:value-of select="@number"/></xsl:otherwise></xsl:choose></xsl:attribute><xsl:choose><xsl:when test="@pubnumber"><xsl:value-of select="@pubnumber" /></xsl:when><xsl:otherwise><xsl:value-of select="@number"/></xsl:otherwise></xsl:choose></sup><xsl:text disable-output-escaping="yes">&#160;</xsl:text></xsl:template>

<xsl:template match="ref"><span class="ref" data-loc="@loc"><xsl:value-of select="." /></span></xsl:template>

<xsl:template match="book"></xsl:template>

<!--
    <xsl:template match="text()"><xsl:value-of select="replace(., '^\s+', '')"/></xsl:template>
-->
    <!-- Fallback for general tags -->
<xsl:template match="node()"><xsl:copy><span><xsl:attribute name="class"><xsl:value-of select="name(.)" /></xsl:attribute><xsl:apply-templates select="@*|node()"/></span></xsl:copy></xsl:template>

</xsl:stylesheet>
