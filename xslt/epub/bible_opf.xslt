<xsl:stylesheet version="2.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:epub="http://www.idpf.org/2007/ops" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema">

    <xsl:template name="bible_opf">
    <xsl:result-document method="xml" href="content/bible.opf">
        <package xmlns="http://www.idpf.org/2007/opf" version="3.0" unique-identifier="uid" xml:lang="en-US" prefix="cc: http://creativecommons.org/ns#">
            <metadata xmlns:dc="http://purl.org/dc/elements/1.1/">
                <dc:identifier id="uid">bibles.dbs.org.aleph.<xsl:value-of select="$bible_id"/></dc:identifier>
                <dc:language><xsl:value-of select="concat($metadata/data/iso, '-', $metadata/data/country_id)" /></dc:language>
                <dc:date><xsl:value-of select="$metadata/data/year"/></dc:date>

                <xsl:choose>
                    <xsl:when test="$metadata/data/title_vernacular != ''">
                        <dc:title id="vtitle"><xsl:value-of select="$metadata/data/title_vernacular" /></dc:title>
                        <meta refines="#vtitle" property="title-type">main</meta>
                        <dc:title id="etitle"><xsl:value-of select="$metadata/data/title" /></dc:title>
                        <meta refines="#etitle" property="title-type">subtitle</meta>
                    </xsl:when>
                    <xsl:otherwise>
                        <dc:title id="title"><xsl:value-of select="$metadata/data/title" /></dc:title>
                        <meta refines="#title" property="title-type">main</meta>
                    </xsl:otherwise>
                </xsl:choose>

                <dc:creator>Digital Bible Society</dc:creator>

                <meta property="dcterms:modified">
                    <xsl:value-of select="format-dateTime(current-dateTime(), '[Y0001]-[M01]-[D01]T[H01]:[m01]:[s01]Z')" />
                </meta>
                <meta content="{$bible_id}-frontcover.png" name="cover" />
                <!-- rights expressions for the work as a whole -->
                <dc:rights>This work is shared with the public using the Attribution-ShareAlike 3.0 Unported (CC BY-SA 3.0) license.</dc:rights>
                <link rel="cc:license" href="http://creativecommons.org/licenses/by-sa/3.0/"/>
                <meta property="cc:attributionURL">http://code.google.com/p/epub-samples/</meta>
                <!-- rights expression for the cover image -->
                <!-- <link rel="cc:license" refines="#cover" href="http://creativecommons.org/licenses/by-sa/3.0/" /> -->
                <!-- <link rel="cc:attributionURL" refines="#cover" href="http://en.wikipedia.org/wiki/Simon_Fieldhouse" /> -->
                <!-- cover meta element included for 2.0 reading system compatibility: -->
                <!-- <meta name="cover" content="cover"/> -->
            </metadata>
            <manifest>
                <!-- <item id="frontcover" href="{$bible_id}-frontcover.png" media-type="image/png" properties="cover-image"/> -->
                <item id="title_page" href="title_page.xhtml" media-type="application/xhtml+xml"/>
                <item id="nav" href="nav.xhtml" properties="nav" media-type="application/xhtml+xml" />
                <item id="ncx" href="nav.ncx" media-type="application/x-dtbncx+xml" />

                <!-- <item id="cover" href="cover.jpg" media-type="image/jpeg" properties="cover-image" /> -->
                <item id="css" href="aleph.css" media-type="text/css" />
                <!-- <item id="css-night" href="aleph-night.css" media-type="text/css" /> -->

                <xsl:for-each select="chapter">
                    <xsl:variable name="book_id" select="preceding::book[1]/@code"/>
                    <xsl:if test="@number">
                        <xsl:if test="@number = 1">
                            <item id="bk_{$book_id}" href="chapters/{$book_id}.xhtml" media-type="application/xhtml+xml" />
                        </xsl:if>
                        <item id="bk_{$book_id}{@number}" href="chapters/{$book_id}{@number}.xhtml" media-type="application/xhtml+xml" />
                    </xsl:if>
                </xsl:for-each>

            </manifest>
            <spine toc="ncx">
                <itemref idref="title_page" linear="yes" />
                <itemref idref="nav" linear="yes" />
                <xsl:for-each select="chapter">
                    <xsl:variable name="book_id" select="preceding::book[1]/@code"/>
                    <xsl:if test="@number">
                        <xsl:if test="@number = 1">
                            <itemref linear="yes" idref="bk_{$book_id}" />
                        </xsl:if>
                        <itemref linear="yes" idref="bk_{$book_id}{@number}" />
                    </xsl:if>
                </xsl:for-each>
            </spine>
        </package>
    </xsl:result-document>
    </xsl:template>


</xsl:stylesheet>
