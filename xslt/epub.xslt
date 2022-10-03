<xsl:stylesheet version="2.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xsl:output indent="yes" use-character-maps="html-illegal-chars" />
    <xsl:strip-space elements="*"/>

    <xsl:param name="api_url" as="xs:string" required="yes" />
    <xsl:param name="bible_id" as="xs:string" required="yes" />
    <xsl:param name="metadata" select="document(concat($api_url,$bible_id,'?format=xml'))"/>

    <xsl:include href="epub/bible_opf.xslt"/>
    <xsl:include href="epub/nav-xhtml.xslt"/>
    <xsl:include href="epub/nav-ncx.xslt"/>
    <xsl:include href="epub/title_page.xslt" />
    <xsl:include href="epub/book_navigation.xslt"/>
    <xsl:include href="epub/chapter.xslt"/>

    <xsl:variable name="portion" select="bible" />
    <xsl:variable name="book_list" select="document('helpers/book_list.xslt')/*/xsl:variable[@name='book_list']/code[$portion=(@section, @section_group, @testament, @canon)]" />

    <xsl:include href="html/character-map.xslt" />
    <xsl:include href="html/elements.xslt" />
    <xsl:include href="helpers/ignored_tags.xslt" />

    <xsl:template match="/usx">

        <xsl:call-template name="bible_opf"/>
        <xsl:call-template name="nav-xhtml"/>
        <xsl:call-template name="nav-ncx"/>
        <xsl:call-template name="title_page"/>

        <xsl:for-each select="book">
            <xsl:variable name="book_id" select="@code" />
            <xsl:call-template name="book_navigation">
                <xsl:with-param name="book_id" select="$book_id" />
            </xsl:call-template>
        </xsl:for-each>

        <xsl:for-each select="chapter">
            <xsl:variable name="chapter_num" select="@number" />
            <xsl:if test="$chapter_num">
            <xsl:call-template name="chapter">
                <xsl:with-param name="chapter_num" select="$chapter_num" />
            </xsl:call-template>
            </xsl:if>
        </xsl:for-each>

        <xsl:result-document method="text" href="mimetype" encoding="ascii">application/epub+zip</xsl:result-document>
        <xsl:result-document method="xml" href="META-INF/container.xml" encoding="utf-8">
            <container xmlns="urn:oasis:names:tc:opendocument:xmlns:container" version="1.0">
                <rootfiles>
                    <rootfile full-path="content/bible.opf" media-type="application/oebps-package+xml"/>
                </rootfiles>
            </container>
        </xsl:result-document>
    </xsl:template>

</xsl:stylesheet>
