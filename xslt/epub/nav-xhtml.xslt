<xsl:stylesheet version="2.0" xmlns="http://www.w3.org/1999/xhtml"  xmlns:epub="http://www.idpf.org/2007/ops" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema">

<xsl:include href="../helpers/book_category.xslt" />

<xsl:template name="nav-xhtml">

<xsl:result-document method="xhtml" href="content/nav.xhtml">
    <html xmlns="http://www.w3.org/1999/xhtml" xmlns:epub="http://www.idpf.org/2007/ops">
        <head>
            <title>ToC</title>
            <link rel="stylesheet" type="text/css" href="aleph.css" media="screen" />
        </head>
        <body>
            <nav epub:type="toc" id="toc">
                <ol>
                    <xsl:for-each select="/usx/book">
                        <xsl:variable name="book_count" select="position()"/>
                        <xsl:variable name="book_id" select="@code" />

                        <xsl:variable name="book_category">
                            <xsl:call-template name="book_category">
                                <xsl:with-param name="code" select="@code" />
                            </xsl:call-template>
                        </xsl:variable>

                        <li><a href="chapters/{$book_id}1.xhtml" class="book-title">
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
                        </a>
                            <ol class="chapters">
                            <xsl:for-each select="/*/chapter[count(preceding-sibling::book)=$book_count]">
                                <xsl:if test="@number">
                                    <li class="{$book_category}"><a href="chapters/{$book_id}{@number}.xhtml"><xsl:value-of select="@number"/></a></li>
                                </xsl:if>
                            </xsl:for-each>
                            </ol>
                        </li>
                    </xsl:for-each>
                </ol>
            </nav>
            <!--
            <nav epub:type="landmarks">
                <ol>
                    <li><a epub:type="frontmatter" href="wasteland-content.xhtml#frontmatter">frontmatter</a></li>
                    <li><a epub:type="bodymatter" href="wasteland-content.xhtml#bodymatter">bodymatter</a></li>
                    <li><a epub:type="backmatter" href="wasteland-content.xhtml#backmatter">backmatter</a></li>
                </ol>
            </nav>
            -->
        </body>
    </html>
</xsl:result-document>
</xsl:template>
</xsl:stylesheet>
