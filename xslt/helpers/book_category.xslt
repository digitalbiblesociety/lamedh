<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template name="book_category">
        <xsl:param name="code" />
        <xsl:choose>
            <xsl:when test="$code='GEN' or $code='EXO' or $code='LEV' or $code='NUM'">
                <xsl:text>law</xsl:text>
            </xsl:when>
            <xsl:when
                test="$code='1CH' or $code='1KI' or $code='1SA' or $code='2CH' or $code='2KI' or $code='2SA' or $code='EST' or $code='EZR' or $code='JDG' or $code='JOS' or $code='NEH' or $code='RUT'">
                <xsl:text>history</xsl:text>
            </xsl:when>
            <xsl:when
                test="$code='ECC' or $code='JOB' or $code='PRO' or $code='PSA' or $code='SNG'">
                <xsl:text>poetry</xsl:text>
            </xsl:when>
            <xsl:when
                test="$code='DAN' or $code='EZK' or $code='ISA' or $code='JER' or $code='LAM'">
                <xsl:text>major_prophets</xsl:text>
            </xsl:when>
            <xsl:when
                test="$code='AMO' or $code='HAB' or $code='HAG' or $code='HOS' or $code='JOL' or $code='JON' or $code='MAL' or $code='MIC' or $code='NAM' or $code='OBA' or $code='ZEC' or $code='ZEP'">
                <xsl:text>minor_prophets</xsl:text>
            </xsl:when>
            <xsl:when test="$code='JHN' or $code='LUK' or $code='MAT' or $code='MRK'">
                <xsl:text>gospels</xsl:text>
            </xsl:when>
            <xsl:when test="$code='ACT'">
                <xsl:text>history</xsl:text>
            </xsl:when>
            <xsl:when
                test="$code='1CO' or $code='1TH' or $code='1TI' or $code='2CO' or $code='2TH' or $code='2TI' or $code='COL' or $code='EPH' or $code='GAL' or $code='HEB' or $code='PHM' or $code='PHP' or $code='ROM' or $code='TIT'">
                <xsl:text>letters_paul</xsl:text>
            </xsl:when>
            <xsl:when
                test="$code='1JN' or $code='1PE' or $code='2JN' or $code='2PE' or $code='3JN' or $code='JAS' or $code='JUD'">
                <xsl:text>letters_general</xsl:text>
            </xsl:when>
            <xsl:when test="$code='REV'">
                <xsl:text>prophecy</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>other_book</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
</xsl:template>
</xsl:stylesheet>
