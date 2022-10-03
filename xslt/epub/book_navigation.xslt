<xsl:stylesheet version="2.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template name="book_navigation">
    <xsl:param name="book_id" />

            <xsl:result-document method="xhtml" href="content/chapters/{$book_id}.xhtml">
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

                <html xmlns="http://www.w3.org/1999/xhtml" xmlns:epub="http://www.idpf.org/2007/ops">
                    <head>
                        <title>
                            <xsl:value-of select="concat($metadata/data/title_vernacular, ' | ', $header_title, ' ', @number)" />
                        </title>
                        <link rel="stylesheet" type="text/css" href="../aleph.css" media="screen" />
                        <style>
                            .landmarks h1 {
                                text-align:center;
                            }

                            .chapter-link {
                                float:left;
                                line-height:25px;
                                display:block;
                                width:25px;
                                height:25px;
                                margin:15px;
                                text-align:center;
                                color:#222;
                                font-size:1em;
                                border:thin solid #ddd;
                                text-decoration: none;
                                box-sizing: border-box;
                            }
                        </style>
                    </head>
                    <body>
                        <nav class="landmarks" epub:type="landmarks">
                            <h1><xsl:value-of select="$header_title" /></h1>
                            <xsl:for-each select="/*/chapter[count(preceding-sibling::book)=$playOrder]">
                                <xsl:if test="@number">
                                    <a class="chapter-link" href="{$book_id}{@number}.xhtml">
                                        <xsl:value-of select="@number" />
                                    </a>
                                </xsl:if>
                            </xsl:for-each>
                        </nav>
                    </body>
                </html>

            </xsl:result-document>

    </xsl:template>
</xsl:stylesheet>
