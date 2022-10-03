<xsl:stylesheet version="2.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:epub="http://www.idpf.org/2007/ops"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xslt="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="chapter">
    <xsl:param name="chapter_num" />
    <xsl:variable name="book_id" select="preceding::book[1]/@code" />

    <xsl:result-document method="xhtml" href="content/chapters/{$book_id}{$chapter_num}.xhtml">
        <html xmlns="http://www.w3.org/1999/xhtml" xmlns:epub="http://www.idpf.org/2007/ops">
            <head>
                <title>
                    <xslt:value-of select="concat($metadata/data/title_vernacular, ' | ', preceding::para[@style='toc1'][1]), ' ', @number" />
                </title>
                <link rel="stylesheet" type="text/css" href="../aleph.css" media="screen" />
            </head>
            <body>
                <section id="chapter_content" epub:type="bodymatter chapter">
                    <h4 class="c"><xsl:value-of select="@number" /></h4>
                    <xsl:variable name="chapter_count" select="position()"/>

                    <xsl:if test="@number = 1">
                        <xsl:for-each select="/*/*[count(preceding-sibling::chapter)=$chapter_count]">
                            <xsl:if test="chapter">
                                <xsl:apply-templates select="$chapter_num" />
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:if>

                    <xsl:for-each select="/*/*[count(preceding-sibling::chapter)=$chapter_count]">
                        <xsl:if test="not(book|para[@style='toc1']|para[@style='toc2']|para[@style='toc3']|para[@style='mt']|para[@style='ip']|para[@style='iot']|para[@style='ip']|para[@style='imt']|para[@style='imt1'])">
                            <xsl:apply-templates select="node()" />
                        </xsl:if>
                    </xsl:for-each>
                    <section epub:type="endnotes" role="doc-endnotes">
                        <ol>
                            <xsl:apply-templates select="/*/*[count(preceding-sibling::chapter)=$chapter_count]/note" mode="footnote"/>
                        </ol>
                    </section>
                </section>
            </body>
        </html>
    </xsl:result-document>
</xsl:template>

    <xsl:template match="note">
        <xsl:variable name="footnote_number"><xsl:number level="any" count="note"/></xsl:variable>
        <a id="ref{$footnote_number}" href="#ft{$footnote_number}" role="doc-noteref" epub:type="noteref">
            <xsl:value-of select='@caller'/>
        </a>
    </xsl:template>

    <xsl:template match="note" mode="footnote">
        <xsl:variable name="chapter_number" select="preceding::chapter[1]/@number"/>
        <xsl:variable name="verse_number" select="preceding::verse[1]/@number"/>
        <xsl:variable name="footnote_number">
            <xsl:number level="any" count="note"/>
        </xsl:variable>

        <li id="ft{$footnote_number}" role="doc-endnote" epub:type="footnote">
            <xsl:if test="char[@fr = 'fr']">
                <a href="#ref{$footnote_number}" role="doc-backlink" title="Back to Reference">
                    <xsl:value-of select="char/@fr"/>
                </a>
            </xsl:if>
            <xsl:apply-templates />
        </li>
    </xsl:template>

    <!-- Fallback for general tags -->
    <xsl:template name="general_fallback" match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="char">
        <xsl:variable name="style" select="@style"/>
        <xsl:choose>
            <xsl:when test="@w">
                <span style="w" data-lemma="@lemma" class="{$style}">
                    <xsl:apply-templates select="@*|node()" />
                </span>
            </xsl:when>
            <xsl:otherwise>
                <span class="{$style}"><xsl:apply-templates select="string(.)" /></span>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- Ignore Chapters -->
    <xsl:template match="chapter|figure" />
    <xsl:template match="x" />

    <xsl:template match="verse">
        <xsl:variable name="chapter_number" select="preceding::chapter[1]/@number"/>
        <xsl:variable name="verse_number" select="@number"/>

        <sup id="c{$chapter_number}v{$verse_number}" class="v"><xsl:value-of select="@number"/></sup>
    </xsl:template>

    <xsl:template match="para">
        <p>
            <xsl:attribute name="class"><xsl:value-of select="@style" /></xsl:attribute>
            <xsl:apply-templates select="."/>
        </p>
    </xsl:template>

    <!-- Only add links to References that exist -->
    <xsl:template match="ref">
        <xsl:variable name="location" select="@loc"/>
        <xsl:variable name="book_id" select='replace($location, "([0-9|a-z|A-Z]{3}) .+", "$1")'/>
        <xsl:choose>
            <xsl:when test="boolean(/usx/book/@code = $book_id)">
                <span>
                    <xsl:apply-templates select="node()"/>
                </span>
            </xsl:when>
            <xsl:otherwise>
                <span>
                    <xsl:apply-templates select="node()"/>
                </span>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>
