<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs">
    <xsl:output indent="no" />
    <xsl:strip-space elements="*" />
    <xsl:param name="bible_id" as="xs:string" required="yes" />

    <xsl:template match="/usx">
        <xsl:for-each select="book">
            <xsl:result-document method="text" href="{@code}_strongs.sql">
                INSERT INTO `<xsl:value-of select="$bible_id" />_strongs` (`book_id`, `chapter`, `verse_start`, `verse_end`, `strongs`)
VALUES
                <xsl:apply-templates select="//verse" />
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="verse">
        <xsl:variable name="number_start" select="replace(@number, '([0-9]+).*?[\-,][0-9]+\w?', '$1')" />
        <xsl:variable name="number_end" select="replace(@number, '[0-9]+.*?[\-,]([0-9]+)\w?', '$1')" />
        <xsl:variable name="strongs" select="string-join(following-sibling::char[generate-id(preceding-sibling::verse[1]) = generate-id(current())]/@strong, ', ')" />

        ('<xsl:value-of select="preceding::book[1]/@code" />', '<xsl:value-of select="preceding::chapter[1]/@number" />', '<xsl:value-of select="$number_start" />', '<xsl:value-of select="$number_end" />', '<xsl:value-of select="$strongs" />')<xsl:if test="not(position() = last())">,</xsl:if>
    </xsl:template>

    <xsl:template match="text()" />
</xsl:stylesheet>