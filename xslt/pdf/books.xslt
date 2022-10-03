<xsl:stylesheet version="2.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xsl:output indent="yes"/>
    <xsl:strip-space elements="*"/>

    <xsl:template match="/usx" name="books">
        <xsl:for-each select="book">
            <xsl:result-document method="xhtml" href="{@code}.xhtml">
                <html xmlns="http://www.w3.org/1999/xhtml">
                    <head>
                        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
                    </head>
                    <body class="scripture-styles">
                        <xsl:variable name="book_id" select="preceding::book[1]/@code"/>
                        <main class="m{$book_id}">
                            <xsl:variable name="book_count" select="position()"/>
                            <xsl:apply-templates select="/*/*[count(preceding-sibling::book)=$book_count]"/>
                        </main>
                    </body>
                </html>
            </xsl:result-document>
        </xsl:for-each>

    </xsl:template>

    <xsl:template name="menu">
        <xsl:variable name="book_numbers" select="count(/usx/book)" />
        <xsl:choose>
            <xsl:when test="$book_numbers > 1">
                    <div class="books">
                        <xsl:for-each select="/usx/book">
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
                            <xsl:value-of select="$header_title"/>
                        </xsl:for-each>
                    </div>
            </xsl:when>
            <xsl:otherwise></xsl:otherwise>
        </xsl:choose>
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
                <em class="{$style}"><xsl:apply-templates select="string(.)" /></em>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="verse">
        <xsl:variable name="book" select="preceding::para[@style = 'h'][1]"/>
        <xsl:variable name="chapter_number" select="preceding::chapter[1]/@number"/>
        <sup class="v" title="{$book}&#160;{$chapter_number}:{@number}"><xsl:value-of select="@number"/>&#160;</sup>
    </xsl:template>

    <xsl:template match="para">
        <p>
            <xsl:attribute name="class"><xsl:value-of select="@style" /></xsl:attribute>
            <xsl:apply-templates select="node()"/>
        </p>
    </xsl:template>

    <xsl:template match="note">
        <xsl:variable name="footnote_number"><xsl:number level="any" count="note"/></xsl:variable>
        <sup id="ftr{$footnote_number}">
            <a class="notelink" href="#ft{$footnote_number}"><xsl:value-of select='@caller'/></a>
        </sup>
    </xsl:template>

    <xsl:template match="note" mode="footnote">
        <xsl:variable name="chapter_number" select="preceding::chapter[1]/@number"/>
        <xsl:variable name="verse_number" select="preceding::verse[1]/@number"/>
        <xsl:variable name="footnote_number">
            <xsl:number level="any" count="note"/>
        </xsl:variable>
        <li id="ft{$footnote_number}">
            <a>
                <xsl:attribute name="caller">
                    <xsl:text>footnote</xsl:text>
                    <xsl:number level="any" count="note" format="1"/>
                </xsl:attribute>
                <xsl:attribute name="href">
                    <xsl:text>#ftr</xsl:text>
                    <xsl:number level="any" count="note" format="1"/>
                </xsl:attribute>
                <xsl:apply-templates />
            </a>
        </li>
    </xsl:template>
    <!-- Tags to ignore -->
    <xsl:template name="ignored_tags" match="para[@style='rem']|para[@style='ide']|verse[@eid]|optbreak|figure|para[@style='toc1']|para[@style='toc2']|para[@style='toc3']|para[@style='h']|book"/>

    <!-- Fallback for general tags -->
    <xsl:template name="general_fallback" match="@*|node()"><xsl:copy><xsl:apply-templates select="node()"/></xsl:copy></xsl:template>

</xsl:stylesheet>
