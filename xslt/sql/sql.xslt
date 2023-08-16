<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs">
<xsl:output indent="no" />
<xsl:strip-space elements="*" />
<xsl:param name="bible_id" as="xs:string" required="yes" />

<xsl:template match="/usx">
<xsl:for-each select="book">

    <xsl:variable name="header_title">
        <xsl:choose>
            <xsl:when test="following::para[@style='h'][1]">
                <xsl:value-of select="following::para[@style='h'][1]"/>
            </xsl:when>
            <xsl:when test="following::para[@style='mt'][1]">
                <xsl:value-of select="following::para[@style='mt'][1]"/>
            </xsl:when>
            <xsl:when test="following::para[@style='toc1'][1]">
                <xsl:value-of select="following::para[@style='toc1'][1]"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="@code"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>

<xsl:result-document method="text" href="{@code}.sql">
<xsl:variable name="book_id" select="position()" />
INSERT INTO `<xsl:value-of select="$bible_id" />` (`book_id`, `book_name`, `chapter`, `verse_start`, `verse_end`, `verse_text`)
VALUES
<xsl:for-each select="/*/*[count(preceding::book)=$book_id]">
    <xsl:apply-templates>
        <xsl:with-param name="header_title" select="$header_title" />
    </xsl:apply-templates>
</xsl:for-each>
</xsl:result-document>
</xsl:for-each>
</xsl:template>

<xsl:template match="verse">
<xsl:param name="header_title" />
<xsl:variable name="end" select="following::verse[1]"/>
<xsl:variable name="number_start" select="replace(@number, '([0-9]+).*?[\-,][0-9]+\w?', '$1')" />
<xsl:variable name="number_end" select="replace(@number, '[0-9]+.*?[\-,]([0-9]+)\w?', '$1')" />
<xsl:variable name="verse_text" select="following::text()[$end and generate-id(following::verse[1]) = generate-id($end)]" />


<xsl:if test="$number_start != ''">
('<xsl:value-of select="preceding::book[1]/@code" />', '<xsl:value-of select="$header_title" />', '<xsl:value-of select="preceding::chapter[1]/@number" />', '<xsl:value-of select="$number_start" />', '<xsl:value-of select="$number_end" />','<xsl:value-of select="$verse_text" />'),
</xsl:if>
</xsl:template>

<xsl:template match="text()" />

</xsl:stylesheet>
