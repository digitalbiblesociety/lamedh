<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output indent="yes"/>
    <xsl:strip-space elements="*"/>

    <xsl:include href="md/md-elements.xslt" />

    <xsl:include href="md/md-introductions.xslt" />
    <xsl:include href="md/md-titles-and-headings.xslt" />
    <xsl:include href="md/md-paragraphs.xslt" />
    <xsl:include href="md/md-poetry.xslt" />
    <xsl:include href="md/md-lists.xslt" />
    <xsl:include href="md/md-note.xslt" />
    <!--
        <xsl:include href="md/md-char-special.xslt" />
        <xsl:include href="md/md-char-styles.xslt" />
        <xsl:include href="md/md-char-list.xslt" />
        <xsl:include href="md/md-char-link.xslt" />
        <xsl:include href="md/md-char-features.xslt" />
    -->

        <xsl:template match="/usx">
            <xsl:for-each select="book">
                <xsl:result-document method="text" href="{@code}.md">
                    <xsl:variable name="book_count" select="position()"/>
                    <xsl:apply-templates select="/*/*[count(preceding-sibling::book)=$book_count]"/>
                </xsl:result-document>
            </xsl:for-each>
        </xsl:template>

    <!--
    ========================================================================
                              Markdown Templates
    ========================================================================
    -->

    <xsl:template name="heading">
        <xsl:param name="content" />
        <xsl:param name="level" />
        <xsl:value-of select="$level" /><xsl:text> </xsl:text><xsl:value-of select="$content" /><xsl:text>&#xa;</xsl:text>
    </xsl:template>

    <xsl:template name="bold">
        <xsl:param name="content" />
        <xsl:text> **</xsl:text><xsl:value-of select="$content" /><xsl:text>**&#xa;</xsl:text>
    </xsl:template>

    <xsl:template name="italic">
        <xsl:param name="content" />
        <xsl:text> *</xsl:text><xsl:value-of select="$content" /><xsl:text>*&#xa;</xsl:text>
    </xsl:template>

    <xsl:template name="blockquote">
        <xsl:param name="content" />
        <xsl:text> > </xsl:text><xsl:value-of select="$content" /><xsl:text>&#xa;</xsl:text>
    </xsl:template>

    <xsl:template name="list">
        <xsl:param name="content" />
        <xsl:text>- </xsl:text><xsl:value-of select="$content" /><xsl:text>&#xa;</xsl:text>
    </xsl:template>

    <xsl:template name="hr">
        <xsl:text>&#xa;---&#xa;</xsl:text>
    </xsl:template>

    <xsl:template name="paragraph">
        <xsl:param name="content" />
        <xsl:text>&#xa;&#xa;</xsl:text><xsl:value-of select="$content" /><xsl:text>&#xa;</xsl:text>
    </xsl:template>

    <xsl:template name="char">
        <xsl:param name="content" />
        <xsl:value-of select="$content" />
    </xsl:template>

</xsl:stylesheet>
