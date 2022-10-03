<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="header_styles">
    <link href="/Users/jon/Sites/lamedh/css/reset.css" rel="stylesheet" type="text/css" />
    <link href="/Users/jon/Sites/lamedh/css/print.css" rel="stylesheet" type="text/css" />
    <link href="/Users/jon/Sites/lamedh/css/print/toc.css" rel="stylesheet" type="text/css" />
    <link href="/Users/jon/Sites/lamedh/css/print/introduction.css" rel="stylesheet" type="text/css" />
    <link href="/Users/jon/Sites/lamedh/css/print/chapters-verses.css" rel="stylesheet" type="text/css" />
    <link href="/Users/jon/Sites/lamedh/css/print/titles-headings-labels.css" rel="stylesheet" type="text/css" />
    <link href="/Users/jon/Sites/lamedh/css/print/paragraphs.css" rel="stylesheet" type="text/css" />
    <link href="/Users/jon/Sites/lamedh/css/print/poetry.css" rel="stylesheet" type="text/css" />
    <link href="/Users/jon/Sites/lamedh/css/print/characters.css" rel="stylesheet" type="text/css" />
    <link href="/Users/jon/Sites/lamedh/css/print/lists.css" rel="stylesheet" type="text/css" />
    <link href="/Users/jon/Sites/lamedh/css/print/note.css" rel="stylesheet" type="text/css" />
    <link href="/Users/jon/Sites/lamedh/css/print/page.css" rel="stylesheet" type="text/css" />
    <meta name="page_count" content="{$page_count}" />
    <style>
        @page {
            size: <xsl:value-of select="($dimensions/@total_width)" />mm <xsl:value-of select="$dimensions/@total_height" />mm;
            @top-right {
                font-family: '<xsl:value-of select="$metadata/data/pod/font_bold" />';
                font-weight: bold;
            }
            @top-left {
                font-family: '<xsl:value-of select="$metadata/data/pod/font_bold" />';
                font-weight: bold;
            }
            @bottom {
                font-family: '<xsl:value-of select="$metadata/data/pod/font" />';
            }
            @left {
            margin-top: <xsl:value-of select="$dimensions/@border + 1" />mm;
            margin-outside: <xsl:value-of select="$dimensions/@border" />mm;
            <xsl:choose>
                <xsl:when test="($page_count &gt; 60) and ($page_count &lt; 149)">
                    margin-right: 19mm!important;
                </xsl:when>
                <xsl:when test="($page_count &gt; 150) and ($page_count &lt; 399)">
                    margin-right: 29mm!important;
                </xsl:when>
                <xsl:when test="($page_count &gt; 400) and ($page_count &lt; 599)">
                    margin-right: 32mm!important;
                </xsl:when>
                <xsl:when test="($page_count &gt; 600)">
                    margin-right: 35mm!important;
                </xsl:when>
                <xsl:otherwise>
                    margin-right: <xsl:value-of select="$dimensions/@border + 3" />mm;
                </xsl:otherwise>
            </xsl:choose>
            }
            @right {
            margin-top: <xsl:value-of select="$dimensions/@border + 1" />mm;
            margin-outside: <xsl:value-of select="$dimensions/@border" />mm;
            <xsl:choose>
                <xsl:when test="($page_count &gt; 60) and ($page_count &lt; 149)">
                    margin-left: 19mm!important;
                </xsl:when>
                <xsl:when test="($page_count &gt; 150) and ($page_count &lt; 399)">
                    margin-left: 29mm!important;
                </xsl:when>
                <xsl:when test="($page_count &gt; 400) and ($page_count &lt; 599)">
                    margin-left: 32mm!important;
                </xsl:when>
                <xsl:when test="($page_count &gt; 600)">
                    margin-left: 35mm!important;
                </xsl:when>
                <xsl:otherwise>
                    margin-left: <xsl:value-of select="$dimensions/@border + 3" />mm;
                </xsl:otherwise>
            </xsl:choose>
            }
        }
        .scripture-content {
        <xsl:if test="$metadata/data/pod/line_height">
            line-height: <xsl:value-of select="$metadata/data/pod/line_height" />!important;
        </xsl:if>
        <xsl:if test="$metadata/data/pod/columns = 1">
            columns: 1!important;
        </xsl:if>
        <xsl:if test="$metadata/data/pod/orphans">
            orphans:<xsl:value-of select="$metadata/data/pod/orphans" />!important;
        </xsl:if>
        <xsl:if test="$metadata/data/pod/widows">
            widows:<xsl:value-of select="$metadata/data/pod/widows" />!important;
        </xsl:if>
        }
        .chapter {
        <xsl:choose>
            <xsl:when test="$metadata/data/pod/font_size">
                font-size: <xsl:value-of select="$metadata/data/pod/font_size" />pt!important;
            </xsl:when>
            <xsl:otherwise>
                font-size: 12pt!important;
            </xsl:otherwise>
        </xsl:choose>
        }
        <xsl:value-of select="$metadata/data/pod/custom_styles" />
    </style>
    <meta name="font_value" content="{$metadata/data/pod/font}" />
    <xsl:choose>
        <xsl:when test="$metadata/data/pod/font">
            <meta name="custom_font" content="{$metadata/data/pod/font}" />
            <style>
                @font-face {
                    font-family: "<xsl:value-of select="$metadata/data/pod/font" />";
                    src: url("../../../../assets/fonts/<xsl:value-of select="$metadata/data/pod/font" />") format("<xsl:value-of select="$metadata/data/pod/font_format" />");
                }
                @font-face {
                    font-family: "<xsl:value-of select="$metadata/data/pod/font_bold" />";
                    src: url("../../../../assets/fonts/<xsl:value-of select="$metadata/data/pod/font_bold" />") format("<xsl:value-of select="$metadata/data/pod/font_format" />");
                    font-weight: bold;
                }

                * {
                    font-family: '<xsl:value-of select="$metadata/data/pod/font" />', serif;
                }
            </style>
        </xsl:when>
        <xsl:otherwise>
            <meta name="default_font" content="Charis-SIL" />
            <style>
                @font-face {
                    font-family: "CharisSIL-R";
                    src: url("../../../../assets/fonts/CharisSIL-R.ttf") format("truetype");
                }

                * {
                    font-family: 'CharisSIL-R', serif;
                }
            </style>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>
</xsl:stylesheet>
