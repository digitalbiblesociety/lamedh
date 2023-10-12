<xsl:stylesheet version="2.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:epub="http://www.idpf.org/2007/ops" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema">
<xsl:template name="nav-ncx">
<xsl:result-document method="xml" href="content/nav.ncx">
    <ncx xmlns:ncx="http://www.daisy.org/z3986/2005/ncx/" xmlns="http://www.daisy.org/z3986/2005/ncx/" version="2005-1" xml:lang="en">
        <head>
            <meta name="dtb:uid" content="bibles.dbs.org.aleph.{$bible_id}"/>
        </head>
        <docTitle>
            <text><xsl:value-of select="$metadata/data/title_vernacular" /></text>
        </docTitle>
        <navMap>
            <xsl:for-each select="/usx/book">
                <xsl:variable name="playOrder" select="position()"/>
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
                <xsl:variable name="book_id" select="@code"/>

                <navPoint id="bk_{$book_id}" playOrder="{$playOrder + count(preceding::chapter[not(@eid)])}">
                <navLabel>
                    <text><xsl:value-of select="concat($header_title,' ')"/></text>
                </navLabel>
                <content src="chapters/{$book_id}.xhtml" />

                    <xsl:for-each select="/*/chapter[not(@eid) and count(preceding-sibling::book)=$playOrder]">
                        <xsl:variable name="playOrderSubNav" select="count(preceding::chapter[not(@eid)]) + 1" />

                        <xsl:if test="@number">
                            <navPoint id="bk_{$book_id}{@number}" playOrder="{$playOrderSubNav + $playOrder}">
                                <navLabel>
                                    <text><xsl:value-of select="concat($header_title,' ')"/><xsl:value-of select="@number"/></text>
                                </navLabel>
                                <content src="chapters/{$book_id}{@number}.xhtml"/>
                            </navPoint>
                        </xsl:if>
                    </xsl:for-each>
                </navPoint>

            </xsl:for-each>
        </navMap>
    </ncx>
</xsl:result-document>
</xsl:template>
</xsl:stylesheet>
