<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!--
        Provides a base template for single file ebook outputs: epub, some pdfs and html.
    -->

    <xsl:template name="bible_body">
        <xsl:if test="periph[@id='title']">
            <div class="title-page">
                <xsl:for-each select="periph[@id='title']/*">
                    <div class="{@style}">
                        <xsl:value-of select="node()"/>
                    </div>
                </xsl:for-each>
            </div>
        </xsl:if>
        <div class="scripture-content">
            <xsl:variable name="parent" select="."/>
            <xsl:for-each-group select="descendant::node()" group-starting-with="chapter[@number]">
                <xsl:variable name="current_book" select="preceding::book[1]/@code"/>
                <xsl:if test="$book_list[@usfm = $current_book] or (name(.) = 'book') and ($current_book != '')">

                    <div id="{$current_book}_{@number}" class="chapter c{@number}" title="{@number}">

                        <!--
                        Effective but slow for handling an optional element
                        <xsl:if test="generate-id() = generate-id(preceding-sibling::text()[1]/following-sibling::lb[1])">
                            <br />
                        </xsl:if>
                        -->

                        <xsl:if test="@number = 1">
                            <xsl:variable name="bookNum" select="count(preceding-sibling::book)"/>
                            <div class="introduction">
                                <h1 class="book-title" id="{$current_book}"><xsl:value-of select="preceding::para[@style='h'][1]" disable-output-escaping="yes" /></h1>
                                <xsl:for-each select="preceding-sibling::*[count(preceding-sibling::book) = $bookNum]">
                                    <p class="{@style}"><xsl:value-of select="text()"/></p>
                                </xsl:for-each>
                            </div>
                        </xsl:if>

                        <xsl:apply-templates
                            select="$parent/node()[descendant-or-self::node() intersect current-group()]" />
                        <xsl:apply-templates select="para"/>

                    </div>

                </xsl:if>
            </xsl:for-each-group>
        </div>
    </xsl:template>

</xsl:stylesheet>
