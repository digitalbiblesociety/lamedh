<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xsl:output indent="yes" use-character-maps="html-illegal-chars" />
    <xsl:strip-space elements="*"/>

    <xsl:param name="metadata" select="document(concat('http://aleph.test/api/bibles/',$bible_id,'?format=xml'))"/>
    <xsl:param name="bible_id" as="xs:string" required="yes" />

    <xsl:include href="./helpers/numerals.xslt" />
    <xsl:include href="html/character-map.xslt" />
    <xsl:include href="./helpers/book_codes.xslt" />



    <xsl:template match="/usx">
        <xsl:variable name="book_ids" select="document('./helpers/book_codes.xslt')/*/xsl:variable[@name='books']" />


        <xsl:variable name="parent" select="." />
        <xsl:for-each-group select="descendant::node()" group-starting-with="chapter[@number]">


            <xsl:variable name="usfm_id" select="preceding::book[1]/@code" />
            <xsl:variable name="usfm_id_prev" select="preceding::book[2]/@code" />
            <xsl:variable name="usfm_id_next" select="following::book[1]/@code" />

            <xsl:variable name="book_id" select="$book_ids/code[@usfm = $usfm_id]/@usfx" />

            <xsl:variable name="book_id_prev">
                <xsl:choose>
                    <xsl:when test="following::chapter[1]/@number = 2">
                        <xsl:value-of select="$book_ids/code[@usfm = $usfm_id_prev]/@usfx" />
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$book_id" />
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:value-of select="preceding-sibling::chapter[1]/@number" />
            </xsl:variable>

            <xsl:variable name="book_id_next">
                <xsl:choose>
                    <xsl:when test="following::chapter[1]/@number = 1">
                        <xsl:value-of select="$book_ids/code[@usfm = $usfm_id_next]/@usfx" />
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$book_id" />
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:value-of select="following::chapter[1]/@number" />
            </xsl:variable>


            <xsl:result-document method="html" href="{$book_id}{@number}.html">
                <html>
                <head>
                    <meta charset="utf-8" />
                    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
                    <link href="_/font.css" rel="stylesheet" />
                    <link href="_/mobile.css" rel="stylesheet" />
                    <title><xsl:value-of select="$metadata/data/title" /> <xsl:value-of select="$book_ids/code[@usfm = preceding::book[2]/@code]/@usfx" /></title>
                </head>
                <body dir="ltr" class="section-document">
            <xsl:choose>
                <xsl:when test="@number">
                    <div class="section chapter {$book_id} {$book_id}{@number}" dir="ltr" lang="en" data-id="{$book_id}{@number}">

                            <xsl:attribute name="data-previd">
                                <xsl:value-of select="$book_id_prev"/>
                            </xsl:attribute>
                            <xsl:attribute name="data-nextid">
                                <xsl:value-of select="$book_id_next"/>
                            </xsl:attribute>

                        <xsl:for-each select="$parent/node()[descendant-or-self::node() intersect current-group()]">
                            <xsl:choose>
                                <xsl:when test="@style = 'c'">
                                    <div class="c"><xsl:value-of select="@number" /></div>
                                </xsl:when>
                                <xsl:otherwise>
                                    <p class="{@style}">
                                        <xsl:choose>
                                            <xsl:when test="child::verse">
                                                <xsl:for-each select="child::*">
                                                    <xsl:if test="name(.) = 'verse' and @number">
                                                        <xsl:variable name="chapter_number" select="preceding::chapter[1]/@number" />
                                                        <xsl:variable name="verse_number" select="tokenize(@number, '-')" />

                                                        <xsl:variable name="current_usfm_id" select="preceding::book[1]/@code" />
                                                        <xsl:variable name="book_id" select="document('./helpers/book_codes.xslt')/*/xsl:variable[@name='books']/code[@usfm = $current_usfm_id]/@usfx" />

                                                        <xsl:variable name="ref" select="concat($book_id, $chapter_number,'_',$verse_number[1])" />
                                                        <xsl:variable name="end" select="following::verse[1]"/>

                                                        <span class="v-num v-{$verse_number[1]}"><xsl:value-of select="@number" /></span>

                                                        <span class="v {$ref}" data-id="{$ref}">
                                                            <xsl:for-each select="following-sibling::node()[$end and generate-id(following::verse[1]) = generate-id($end)]">
                                                                <xsl:apply-templates select="." />
                                                            </xsl:for-each>
                                                        </span>
                                                    </xsl:if>
                                                </xsl:for-each>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:apply-templates select="." />
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </p>

                                </xsl:otherwise>
                            </xsl:choose>

                        </xsl:for-each>


                    </div>
                </xsl:when>
            </xsl:choose>

                </body>
                </html>
            </xsl:result-document>
        </xsl:for-each-group>
    </xsl:template>

    <xsl:template match="chapter" />
    <xsl:template match="verse" />

    <xsl:template match="note" priority="2">

        <xsl:variable name="footnote_number">
            <xsl:number level="any" count="note"/>
        </xsl:variable>
        <span class="note" id="footnote-t{$footnote_number}">
            <a href="#note-t{$footnote_number}" class="key">†</a>
            <span class="text"><xsl:value-of select="node()" /></span>
        </span>

    </xsl:template>

    <xsl:template match="char" priority="1">
        <xsl:choose>
            <xsl:when test="@style = 'w'">
                <span style="w">
                    <xsl:attribute name="strong">
                        <xsl:value-of select="@strong" />
                    </xsl:attribute>
                    <xsl:apply-templates select="node()" />
                </span>
            </xsl:when>
            <xsl:when test="@style='xo'"></xsl:when>
            <xsl:when test="@style='xt'"></xsl:when>
            <xsl:otherwise>
                <em class="{@style}"><xsl:value-of select="node()" /></em>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template priority="10" match="para[@style='rem']|para[@style='ide']|verse[@eid]|optbreak|figure|para[@style='toc1']|para[@style='toc2']|para[@style='toc3']|para[@style='h']|book"/>

    <xsl:template name="general_fallback" match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="node()"/>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>
