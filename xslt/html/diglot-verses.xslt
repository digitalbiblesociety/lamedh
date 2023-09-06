<xsl:stylesheet version="2.0" xmlns="http://www.w3.org/1999/xhtml"  xmlns:epub="http://www.idpf.org/2007/ops" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema">

    <xsl:param name="api_url" as="xs:string" required="yes" />
    <xsl:param name="bible_file_1_id" as="xs:string" required="yes" />
    <xsl:param name="bible_file_2_id" as="xs:string" required="yes" />

    <xsl:param name="metadata_1" select="document(concat($api_url,$bible_file_1_id,'?format=xml'))"/>
    <xsl:param name="metadata_2" select="document(concat($api_url,$bible_file_2_id,'?format=xml'))"/>

    <xsl:template match="/usx" name="chapter">
        <xsl:for-each select="chapter">
            <xsl:variable name="book_id" select="preceding::book[1]/@code"/>
            <xsl:result-document method="html" href="content/chapters/{$book_id}{@number}.html">

                <xsl:variable name="header_title">
                    <xsl:choose>
                        <xsl:when test="preceding::para[@style='h'][1]">
                            <xsl:value-of select="preceding::para[@style='h'][1]"/>
                        </xsl:when>
                        <xsl:when test="preceding::para[@style='mt'][1]">
                            <xsl:value-of select="preceding::para[@style='mt'][1]"/>
                        </xsl:when>
                        <xsl:when test="preceding::para[@style='toc1']">
                            <xsl:value-of select="preceding::para[@style='toc1'][1]"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="preceding::book[1]/@code"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>

                <html xmlns="http://www.w3.org/1999/xhtml" xmlns:epub="http://www.idpf.org/2007/ops">
                    <head>
                        <title>
                            <xsl:value-of select="$metadata_1/data/title_vernacular" />
                            <xsl:text> | </xsl:text>
                            <xsl:value-of select="$metadata_2/data/title_vernacular" />
                            <xsl:value-of select="$header_title" />
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="@number" />
                        </title>
                        <link rel="stylesheet" type="text/css" href="../aleph.css" media="screen" />
                    </head>
                    <body>
                        <section id="chapter_content" epub:type="bodymatter chapter">
                            <h4 class="c"><xsl:value-of select="@number" /></h4>
                            <xsl:variable name="chapter_count" select="position()"/>
                            <xsl:for-each select="/*/*[count(preceding-sibling::chapter)=$chapter_count]">
                                <xsl:if test="not(book|para[@style='toc1']|para[@style='toc2']|para[@style='toc3']|para[@style='mt']|para[@style='ip']|para[@style='iot']|para[@style='ip']|para[@style='imt']|para[@style='imt1'])">
                                    <xsl:apply-templates select="node()" />
                                </xsl:if>
                            </xsl:for-each>
                        </section>
                    </body>
                </html>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="note" mode="footnote">

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
    <xsl:template match="chapter">

    </xsl:template>

    <xsl:template match="verse">
        <xsl:variable name="chapter_number" select="preceding::chapter[1]/@number"/>
        <xsl:variable name="verse_number" select="@number"/>

        <sup id="c{$chapter_number}v{$verse_number}" class="v"><xsl:value-of select="@number"/></sup>
    </xsl:template>

</xsl:stylesheet>