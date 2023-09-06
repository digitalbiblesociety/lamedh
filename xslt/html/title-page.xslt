<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema">

    <xsl:template name="title_page">
        <xsl:result-document method="html" href="index.html">
        <html>
            <head>
                <meta content="utf-8"/>
                <title><xsl:value-of select="/usx/periph/para" /></title>
                <meta name="description" content="" />
                <meta name="generator" content="Aletheia 1.0" />
                <link rel="stylesheet" type="text/css" href="_/print.css" media="print" />
                <link rel="stylesheet" type="text/css" href="_/aleph.css" media="screen" />
                <xsl:if test="$metadata/data/pod[1]">
                    <xsl:variable name="font" select="replace($metadata/data/pod[1]/font[1],'.ttf','')"/>
                    <style>
                        @font-face {
                            font-family: "<xsl:value-of select="$font" />";
                            src: url("_/<xsl:value-of select="$font" />.woff2") format("woff2"),
                            url("_/<xsl:value-of select="$font" />.woff") format("woff"),
                            url("_/<xsl:value-of select="$font" />.ttf") format("truetype");
                        }

                        * {
                            font-family: '<xsl:value-of select="$font" />', serif;
                        }
                    </style>
                </xsl:if>
            </head>
            <body class="title-page">
                <h1><xsl:value-of select="/usx/periph/para" /></h1>
                <ul>
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
                        <li>
                            <a>
                                <xsl:attribute name="href">books/<xsl:value-of select="@code" />.html</xsl:attribute>
                                <xsl:value-of select="$header_title"/>
                            </a>
                        </li>
                    </xsl:for-each>
                </ul>
            </body>
        </html>
        </xsl:result-document>
    </xsl:template>

</xsl:stylesheet>
