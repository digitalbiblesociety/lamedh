<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xsl:output indent="yes" use-character-maps="html-illegal-chars" />
    <xsl:strip-space elements="*"/>

    <!-- API URL -->
    <!-- Returns an xml response with needed metadata for the bible -->
    <xsl:param name="api_url" as="xs:string" required="yes" />

    <!-- The Bible ID -->
    <!-- Expected to be a combination of the iso code and the version abbreviation -->
    <xsl:param name="bible_id" as="xs:string" required="yes" />

    <!-- Analytics Options -->
    <!-- Generate HTML for Analytics, disabled by default -->
    <xsl:param name="include_analytics" as="xs:string" required="true" />
    <xsl:param name="hashes" as="xs:string" />
    <xsl:param name="log_url" as="xs:string" />
    <xsl:param name="utm_source" as="xs:string" />
    <xsl:param name="utm_campaign" as="xs:string" />

    <xsl:include href="helpers/numerals.xslt" />
    <xsl:include href="html/character-map.xslt" />
    <xsl:include href="html/nav.xslt" />
    <xsl:include href="html/title-page.xslt" />
    <xsl:include href="html/search.xslt" />

    <xsl:variable name="tokenized_hashes" select="tokenize($hashes, ':::')" />
    <xsl:param name="metadata" select="document(concat($api_url,$bible_id,'?format=xml'))"/>

    <xsl:template match="/usx">

        <xsl:call-template name="title_page" />
        <xsl:call-template name="search" />
        <xsl:for-each select="book">

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

            <xsl:result-document method="html" href="books/{@code}.html">
                <xsl:variable name="current_book_id" select="@code" />
                <html>
                    <head>
                        <meta content="utf-8"/>
                        <meta name="generator" content="Aleph 1.0" />
                        <link rel="stylesheet" type="text/css" href="../_/print.css" media="print" />
                        <link rel="stylesheet" type="text/css" href="../_/aleph.css" media="screen" />
                        <meta name="viewport" content="width=device-width, initial-scale=1" />
                        <title><xsl:value-of select="$header_title"/></title>
                        <xsl:if test="$metadata/data/pod[1]">
                            <xsl:variable name="font" select="replace($metadata/data/pod[1]/font,'.ttf','')"/>
                            <style>
                                @font-face {
                                    font-family: "<xsl:value-of select="$font" />";
                                    src: url("../_/<xsl:value-of select="$font" />.woff2") format("woff2"),
                                    url("../_/<xsl:value-of select="$font" />.woff") format("woff"),
                                    url("../_/<xsl:value-of select="$font" />.ttf") format("truetype");
                                }

                                * {
                                    font-family: '<xsl:value-of select="$font" />'!important;
                                }
                            </style>
                        </xsl:if>
                    </head>

                    <body class="scripture-styles b-{$current_book_id}">
                        <div id="wrapper">
                            <xsl:call-template name="menu">
                                <xsl:with-param name="current_book" select = "$current_book_id" />
                            </xsl:call-template>

                            <main class="m{$current_book_id}">
                                <xsl:variable name="book_count" select="position()"/>
                                <xsl:apply-templates select="/*/*[count(preceding-sibling::book)=$book_count]"/>
                            </main>

                            <xsl:if test="$include_analytics">
                            <xsl:for-each select="$tokenized_hashes">
                                <xsl:variable name="token" select="." />
                                <xsl:if test="contains($token, $current_book_id)">
                                    <img>
                                        <xsl:attribute name="src"><xsl:value-of select="$log_url" />?utm_content=<xsl:value-of select="substring($token,4)" />&amp;utm_source=<xsl:value-of select="$utm_source" />&amp;utm_campaign=<xsl:value-of select="$utm_campaign" /></xsl:attribute>
                                        <xsl:attribute name="onerror">this.style.display='none'</xsl:attribute>
                                    </img>
                                </xsl:if>
                            </xsl:for-each>
                            </xsl:if>

                        </div>
                    </body>
                </html>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="char">
        <xsl:choose>
            <xsl:when test="@style = 'w'">
                <span style="w">
                    <xsl:attribute name="strong">
                        <xsl:value-of select="@strong" />
                    </xsl:attribute>
                    <xsl:apply-templates select="node()" />
                </span>
            </xsl:when>
            <xsl:otherwise>
                <em class="{@style}"><xsl:apply-templates select="string(.)" /></em>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="chapter">
        <xsl:call-template name="numerals">
            <xsl:with-param name="number" select="@number" />
            <xsl:with-param name="numeral_system" select="$bible_id" />
        </xsl:call-template>
        <b id="c{@number}" class="c"><xsl:value-of select="@number"/></b>
    </xsl:template>

    <xsl:template match="verse">
        <xsl:variable name="book" select="preceding::book[1]/@code" />
        <xsl:variable name="chapter_number" select="preceding::chapter[1]/@number" />
        <xsl:variable name="verse_number" select="@number" />

        <sup data-id="{$book}_{$chapter_number}_{$verse_number}" class="v"><xsl:value-of select="@number" /></sup>
    </xsl:template>

    <xsl:template match="para" priority="1">
        <p>
            <xsl:attribute name="class"><xsl:value-of select="@style" /></xsl:attribute>
            <xsl:apply-templates select="node()"/>
        </p>
    </xsl:template>

    <!-- Only add links to References that exist -->
    <!-- This is pretty expensive in regards to the processing time, but worth it -->
    <xsl:template match="ref">
        <xsl:variable name="location" select="@loc"/>
        <xsl:variable name="book_id" select='replace($location, "([0-9|a-z|A-Z]{3}) .+", "$1")'/>
        <xsl:choose>
            <xsl:when test="boolean(/usx/book/@code = $book_id)">
                <a>
                    <xsl:attribute name="href">
                        <xsl:value-of select='replace($location, "([0-9|a-z|A-Z]{3}) (\d+):(\d+).+", "$1.html#c$2v$3")'/>
                    </xsl:attribute>
                    <xsl:apply-templates select="node()"/>
                </a>
            </xsl:when>
            <xsl:otherwise>
                <em>
                    <xsl:apply-templates select="node()"/>
                </em>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="note">
        <xsl:variable name="chapter_number" select="preceding::chapter[1]/@number"/>
        <xsl:variable name="verse_number" select="preceding::verse[1]/@number"/>
        <xsl:variable name="footnote_number">
            <xsl:number level="any" count="note"/>
        </xsl:variable>
        <span id="ft{$footnote_number}" class="tooltip">+
            <span><xsl:apply-templates /></span>
        </span>
    </xsl:template>

    <!-- Tags to ignore -->
    <xsl:template name="ignored_tags" priority="10" match="para[@style='rem']|para[@style='ide']|verse[@eid]|optbreak|figure|para[@style='toc1']|para[@style='toc2']|para[@style='toc3']|para[@style='h']|book"/>

    <!-- Fallback for general tags -->
    <xsl:template name="general_fallback" match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="node()"/>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>
