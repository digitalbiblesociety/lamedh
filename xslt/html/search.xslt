<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/usx" name="search">
        <xsl:result-document method="html" href="search.html">
            <html>
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
                <link rel="stylesheet" type="text/css" href="_/print.css" media="print" />
                <link rel="stylesheet" type="text/css" href="_/aleph.css" media="screen" />
                <meta name="viewport" content="width=device-width, initial-scale=1" />
            </head>
            <body>
            <section role="search">
                <div id="search-box">
                    <input id="search-query" type="search" autofocus="" placeholder="Search" />
                    <button id="search-button" type="submit" title="Search this website now">Submit</button>
                </div>
                <div class="filters">
                    <label>Chronological <input id="chronological" type="radio" name="sort_type[]" checked="true" /></label>
                    <label>Relevance <input id="relevance" type="radio" name="sort_type[]" /></label>
                </div>
                <fieldset class="sf-books">
                    <label>Old Testament <input type="radio" name="books[]" value="OT" /> </label>
                    <label>New Testament <input type="radio" name="books[]" value="NT" /> </label>
                    <xsl:for-each select="book">
                        <xsl:variable name="book_title">
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
                        <label><xsl:value-of select="$book_title" />
                            <input class="sf-book" type="checkbox" name="books[]" value="{@code}" />
                        </label>
                    </xsl:for-each>
                </fieldset>
            </section>

            <section id="search-bars" role="complementary"></section>
            <section id="search-results" role="main"></section>

            <script src="_/bible.js"></script>
            <script src="_/concordance.js"></script>
            <script src="_/books.js"></script>
            <script src="_/search.js"></script>

            </body>
            </html>
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>
