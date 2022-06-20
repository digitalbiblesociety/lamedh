<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema">

    <xsl:include href="../helpers/book_category.xslt" />

    <xsl:template match="/usx" name="nav">
        <xsl:result-document method="xml" href="content/nav.html">

            <xsl:variable name="book_numbers" select="count(/usx/book)"/>
            <xsl:choose>
                <xsl:when test="$book_numbers > 1">
                    <input class="menu-checkbox" type="checkbox" id="menu" name="menu"/>
                    <div class="menu">
                        <label class="menu-toggle" for="menu">☰</label>
                        <div class="books">
                            <xsl:for-each select="/usx/book">
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

                                <xsl:variable name="book_category">
                                    <xsl:call-template name="book_category">
                                        <xsl:with-param name="code" select="@code" />
                                    </xsl:call-template>
                                </xsl:variable>

                                <xsl:variable name="book_id" select="@code"/>
                                <xsl:variable name="book_count" select="position()"/>

                                <label class="{$book_category}" for="b{@code}">
                                    <xsl:value-of select="$header_title"/>
                                </label>
                                <input class="menu-checkbox" type="checkbox" id="b{@code}" name="b{@code}"/>
                                <div class="menu {$book_category}">
                                    <label for="b{@code}">
                                        <span>
                                            <xsl:value-of select="$header_title"/>
                                        </span>
                                    </label>
                                    <xsl:for-each select="/*/chapter[count(preceding-sibling::book)=$book_count]">
                                        <xsl:if test="not(@eid)">
                                            <a href="{$book_id}.html#c{@number}">
                                                <xsl:value-of select="@number"/>
                                            </a>
                                        </xsl:if>
                                    </xsl:for-each>
                                </div>
                            </xsl:for-each>
                        </div>
                    </div>
                </xsl:when>
                <xsl:otherwise></xsl:otherwise>
            </xsl:choose>
        </xsl:result-document>
    </xsl:template>

    <xsl:template name="menu">
        <xsl:param name="current_book" />
        <xsl:variable name="book_numbers" select="count(/usx/book)" />
        <xsl:choose>
            <xsl:when test="$book_numbers > 1">
                <input class="menu-checkbox" type="checkbox" id="menu" name="menu"/>
                <div class="menu">
                    <label class="menu-toggle" for="menu">☰</label>
                    <div class="books">
                        <xsl:for-each select="/usx/book">
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
                            <xsl:variable name="book_category">
                                <xsl:choose>
                                    <xsl:when test="@code='GEN' or @code='EXO' or @code='LEV' or @code='NUM'">
                                        <xsl:text>law</xsl:text>
                                    </xsl:when>
                                    <xsl:when test="@code='1CH' or @code='1KI' or @code='1SA' or @code='2CH' or @code='2KI' or @code='2SA' or @code='EST' or @code='EZR' or @code='JDG' or @code='JOS' or @code='NEH' or @code='RUT'">
                                        <xsl:text>history</xsl:text>
                                    </xsl:when>
                                    <xsl:when test="@code='ECC' or @code='JOB' or @code='PRO' or @code='PSA' or @code='SNG'">
                                        <xsl:text>poetry</xsl:text>
                                    </xsl:when>
                                    <xsl:when test="@code='DAN' or @code='EZK' or @code='ISA' or @code='JER' or @code='LAM'">
                                        <xsl:text>major_prophets</xsl:text>
                                    </xsl:when>
                                    <xsl:when test="@code='AMO' or @code='HAB' or @code='HAG' or @code='HOS' or @code='JOL' or @code='JON' or @code='MAL' or @code='MIC' or @code='NAM' or @code='OBA' or @code='ZEC' or @code='ZEP'">
                                        <xsl:text>minor_prophets</xsl:text>
                                    </xsl:when>
                                    <xsl:when test="@code='JHN' or @code='LUK' or @code='MAT' or @code='MRK'">
                                        <xsl:text>gospels</xsl:text>
                                    </xsl:when>
                                    <xsl:when test="@code='ACT'">
                                        <xsl:text>history</xsl:text>
                                    </xsl:when>
                                    <xsl:when test="@code='1CO' or @code='1TH' or @code='1TI' or @code='2CO' or @code='2TH' or @code='2TI' or @code='COL' or @code='EPH' or @code='GAL' or @code='HEB' or @code='PHM' or @code='PHP' or @code='ROM' or @code='TIT'">
                                        <xsl:text>letters_paul</xsl:text>
                                    </xsl:when>
                                    <xsl:when test="@code='1JN' or @code='1PE' or @code='2JN' or @code='2PE' or @code='3JN' or @code='JAS' or @code='JUD'">
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
                            <xsl:variable name="book_count" select="position()"/>

                            <label for="b{@code}">
                                <xsl:attribute name="class">
                                    <xsl:value-of select="$book_category" /> <xsl:if test="@code = $current_book"> active </xsl:if>
                                </xsl:attribute>
                                <xsl:value-of select="$header_title"/>
                                <xsl:if test="$current_book = $book_id">
                                    <span class="selected-border"></span>
                                </xsl:if>
                            </label>
                            <input class="menu-checkbox" type="checkbox" id="b{@code}" name="b{@code}"/>
                            <div class="menu {$book_category}">
                                <label for="b{@code}">
                                    <span><xsl:value-of select="$header_title" /></span>
                                </label>
                                <xsl:for-each select="/*/chapter[count(preceding-sibling::book)=$book_count]">
                                    <xsl:if test="not(@eid)">
                                        <a href="{$book_id}.html#c{@number}"><xsl:value-of select="@number"/></a>
                                    </xsl:if>
                                </xsl:for-each>
                            </div>
                        </xsl:for-each>
                    </div>
                </div>
            </xsl:when>
            <xsl:otherwise></xsl:otherwise>
        </xsl:choose>
    </xsl:template>


</xsl:stylesheet>
