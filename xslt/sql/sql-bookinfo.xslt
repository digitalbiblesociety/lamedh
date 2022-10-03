<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs">
    <xsl:output indent="no" />
    <xsl:strip-space elements="*" />
    <xsl:param name="bible_id" as="xs:string" required="yes" />

    <xsl:template match="/usx">
        <xsl:for-each select="book">
            <xsl:result-document method="text" href="{$bible_id}_book.sql">
                <xsl:variable name="book_id" select="position()" />
                INSERT INTO `book_titles` (`bible_id`, `book_id`, `header`, `toc1`, `toc2`, `toc3`, `chapters`)
                VALUES
                <xsl:for-each select="/*/*[count(preceding::book)=$book_id]">
                    <xsl:variable name="book_code" select="preceding::book[1]/@code" />
                    <xsl:variable name="h" select="preceding::para[@style='h'][1]"/>
                    <xsl:variable name="toc1" select="preceding::para[@style='toc1'][1]"/>
                    <xsl:variable name="toc2" select="preceding::para[@style='toc2'][1]"/>
                    <xsl:variable name="toc3" select="preceding::para[@style='toc3'][1]"/>
                    <xsl:variable name="chapters" select="following::chapter/@number" />
                    ('<xsl:value-of select="$bible_id" />','<xsl:value-of select="$book_code" />', '<xsl:value-of select="$h" />', '<xsl:value-of select="$toc1" />', '<xsl:value-of select="$toc2" />', '<xsl:value-of select="$toc3" />','<xsl:value-of select="$chapters" />'),
                </xsl:for-each>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
