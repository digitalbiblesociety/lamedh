<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template name="toc">
        <div class="table-of-contents-wrap">
            <!-- We first Check to see how many books the Bible has -->
            <!-- If only one exists don't generate the Table of Contents -->
            <xsl:variable name="book_numbers" select="count(/usx/book)"/>
            <xsl:choose>
                <xsl:when test="$book_numbers > 1 and $scope = 'bible'">
                        <div>
                            <xsl:attribute name="class">
                                table-of-contents <xsl:if test="$book_numbers > 30">double-column</xsl:if>
                            </xsl:attribute>

                            <xsl:for-each select="/usx/book">

                                <!-- Filter down the TOC to a book_list portion -->
                                <xsl:variable name="current_book" select="@code" />
                                <xsl:if test="$book_list[@usfm = $current_book]">
                                    <xsl:variable name="header_title">
                                        <xsl:choose>
                                            <xsl:when test="following::para[@style='h'][1]">
                                                <xsl:value-of select="following::para[@style='h'][1]" />
                                            </xsl:when>
                                            <xsl:when test="following::para[@style='mt'][1]">
                                                <xsl:value-of select="following::para[@style='mt'][1]" />
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="@code"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:variable>
                                    <xsl:variable name="book_category">
                                        <xsl:choose>
                                            <xsl:when test="@code='GEN' or @code='EXO' or @code='LEV' or @code='NUM'">
                                                <xsl:text>law</xsl:text>
                                            </xsl:when>
                                            <xsl:when
                                                test="@code='1CH' or @code='1KI' or @code='1SA' or @code='2CH' or @code='2KI' or @code='2SA' or @code='EST' or @code='EZR' or @code='JDG' or @code='JOS' or @code='NEH' or @code='RUT'">
                                                <xsl:text>history</xsl:text>
                                            </xsl:when>
                                            <xsl:when
                                                test="@code='ECC' or @code='JOB' or @code='PRO' or @code='PSA' or @code='SNG'">
                                                <xsl:text>poetry</xsl:text>
                                            </xsl:when>
                                            <xsl:when
                                                test="@code='DAN' or @code='EZK' or @code='ISA' or @code='JER' or @code='LAM'">
                                                <xsl:text>major_prophets</xsl:text>
                                            </xsl:when>
                                            <xsl:when
                                                test="@code='AMO' or @code='HAB' or @code='HAG' or @code='HOS' or @code='JOL' or @code='JON' or @code='MAL' or @code='MIC' or @code='NAM' or @code='OBA' or @code='ZEC' or @code='ZEP'">
                                                <xsl:text>minor_prophets</xsl:text>
                                            </xsl:when>
                                            <xsl:when test="@code='JHN' or @code='LUK' or @code='MAT' or @code='MRK'">
                                                <xsl:text>gospels</xsl:text>
                                            </xsl:when>
                                            <xsl:when test="@code='ACT'">
                                                <xsl:text>history</xsl:text>
                                            </xsl:when>
                                            <xsl:when
                                                test="@code='1CO' or @code='1TH' or @code='1TI' or @code='2CO' or @code='2TH' or @code='2TI' or @code='COL' or @code='EPH' or @code='GAL' or @code='HEB' or @code='PHM' or @code='PHP' or @code='ROM' or @code='TIT'">
                                                <xsl:text>letters_paul</xsl:text>
                                            </xsl:when>
                                            <xsl:when
                                                test="@code='1JN' or @code='1PE' or @code='2JN' or @code='2PE' or @code='3JN' or @code='JAS' or @code='JUD'">
                                                <xsl:text>letters_general</xsl:text>
                                            </xsl:when>
                                            <xsl:when test="@code='REV'">
                                                <xsl:text>prophecy</xsl:text>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:text>other_book</xsl:text>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:variable>
                                    <xsl:variable name="book_id" select="@code"/>
                                    <a class="{$book_category}" href="#{$book_id}"><xsl:value-of select="$header_title" disable-output-escaping="yes" /></a>
                                </xsl:if>
                            </xsl:for-each>
                        </div>
                </xsl:when>
                <xsl:otherwise></xsl:otherwise>
            </xsl:choose>
        </div>
    </xsl:template>


</xsl:stylesheet>
