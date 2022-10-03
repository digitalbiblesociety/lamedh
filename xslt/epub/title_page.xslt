<xsl:stylesheet version="2.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template name="title_page">
        <xsl:result-document method="xhtml" href="content/title_page.xhtml">
            <html xmlns="http://www.w3.org/1999/xhtml">
                <head>
                    <title><xsl:value-of select="$metadata/data/title" /></title>
                    <link rel="stylesheet" type="text/css" href="aleph.css" media="screen" />
                </head>
                <body class="title-page">
                    <h1>
                        <xsl:value-of select="$metadata/data/title_vernacular" />
                        <small><xsl:value-of select="$metadata/data/title" /></small>
                    </h1>
                    <p class="description"><xsl:value-of select="$metadata/data/description" /></p>
                    <p class="copyright"><xsl:value-of select="$metadata/data/copyright" /></p>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>
