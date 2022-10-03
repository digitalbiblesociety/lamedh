<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- Chapter -->
    <xsl:template priority="2" match="chapter">
        <xsl:param name="book_id" />

        <chapter style="c">
            <xsl:attribute name="sid">
                <xsl:analyze-string select="@osisID" regex="(.*)\.(\d+)">
                    <xsl:matching-substring>
                        <xsl:value-of select="concat($book_id, ' ', regex-group(2))" />
                    </xsl:matching-substring>
                    <xsl:non-matching-substring></xsl:non-matching-substring>
                </xsl:analyze-string>
            </xsl:attribute>
        </chapter>

        <para style="p">
        <xsl:for-each select="*">
                <xsl:choose>
                    <xsl:when test="name() = 'title'">
                        <xsl:apply-templates select='current()' />
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:apply-templates select='current()'>
                            <xsl:with-param name="book_id" select="$book_id" />
                        </xsl:apply-templates>
                    </xsl:otherwise>
                </xsl:choose>
        </xsl:for-each>
        </para>

        <chapter>
            <xsl:attribute name="eid">
                <xsl:analyze-string select="@osisID" regex="(.*)\.(\d+)">
                    <xsl:matching-substring>
                        <xsl:value-of select="concat($book_id, ' ', regex-group(2))" />
                    </xsl:matching-substring>
                    <xsl:non-matching-substring></xsl:non-matching-substring>
                </xsl:analyze-string>
            </xsl:attribute>
        </chapter>
    </xsl:template>


    <!-- Verse -->
    <xsl:template priority="3" match="verse">
        <xsl:param name="book_id" />

        <verse style="v">
            <xsl:analyze-string select="@osisID" regex="(.*)\.(\d+)\.(\d+)">
                <xsl:matching-substring>
                    <xsl:attribute name="sid">
                        <xsl:value-of select="concat($book_id, ' ', regex-group(2),':', regex-group(3))" />
                    </xsl:attribute>
                    <xsl:attribute name="number">
                        <xsl:value-of select="regex-group(3)" />
                    </xsl:attribute>
                </xsl:matching-substring>
                <xsl:non-matching-substring></xsl:non-matching-substring>
            </xsl:analyze-string>
        </verse>

        <xsl:copy>
          <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>

        <verse>
            <xsl:attribute name="eid">
                <xsl:analyze-string select="@osisID" regex="(.*)\.(\d+)\.(\d+)">
                    <xsl:matching-substring>
                        <xsl:value-of select="concat($book_id, ' ', regex-group(2),':', regex-group(3))" />
                    </xsl:matching-substring>
                    <xsl:non-matching-substring></xsl:non-matching-substring>
                </xsl:analyze-string>
            </xsl:attribute>
        </verse>
    </xsl:template>

    <!-- Line break -->
    <xsl:template priority="3" match="lb">
        <optbreak />
    </xsl:template>

</xsl:stylesheet>


