<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output indent="yes" method="xml" encoding="utf-8" omit-xml-declaration="yes"/>

    <xsl:template name="numerals">
        <xsl:param name="numeral_system" />
        <xsl:param name="number" />

        <!-- These only need to produce accurate numbers up to 150 -->
        <xsl:choose>
            <xsl:when test="$numeral_system = 'bengali'">
                <xsl:value-of select="translate($number, '0123456789', '০১২৩४५६७৮৯')"/>
            </xsl:when>
            <xsl:when test="$numeral_system = 'burmese'">
                <xsl:value-of select="translate($number, '0123456789', '၀၁၂၃၄၅၆၇၈၉')"/>
            </xsl:when>
            <xsl:when test="$numeral_system = 'chinese'">
                <xsl:value-of select="translate($number, '0123456789', '零一二三四五六七八九')"/>
            </xsl:when>
            <xsl:when test="$numeral_system = 'gujarati'">
                <xsl:value-of select="translate($number, '0123456789', '૦૧૨૩૪૫૬૭૮૯')"/>
            </xsl:when>
            <xsl:when test="$numeral_system = 'gurmukhi'">
                <xsl:value-of select="translate($number, '0123456789', '੦੧੨੩੪੫੬੭੮੯')"/>
            </xsl:when>
            <xsl:when test="$numeral_system = 'indopersian'">
                <xsl:value-of select="translate($number, '0123456789', '٠١٢٣٤٥٦٧٨٩')"/>
            </xsl:when>
            <xsl:when test="$numeral_system = 'kannada'">
                <xsl:value-of select="translate($number, '0123456789', '೦೧೨೩೪೫೬೭೮೯')"/>
            </xsl:when>
            <xsl:when test="$numeral_system = 'khmer'">
                <xsl:value-of select="translate($number, '0123456789', '០១២៣៤៥៦៧៨៩')"/>
            </xsl:when>
            <xsl:when test="$numeral_system = 'lao'">
                <xsl:value-of select="translate($number, '0123456789', '໐໑໒໓໔໕໖໗໘໙')"/>
            </xsl:when>
            <xsl:when test="$numeral_system = 'limbu'">
                <xsl:value-of select="translate($number, '0123456789', '᥆᥇᥈᥉᥊᥋᥌᥍᥎᥏')"/>
            </xsl:when>
            <xsl:when test="$numeral_system = 'malayalam'">
                <xsl:value-of select="translate($number, '0123456789', '൦൧൨൩൪൫൬൭൮൯')"/>
            </xsl:when>
            <xsl:when test="$numeral_system = 'oriya'">
                <xsl:value-of select="translate($number, '0123456789', '୦୧୨୩୪୫୬୭୮୯')"/>
            </xsl:when>
            <xsl:when test="$numeral_system = 'persian'">
                <xsl:value-of select="translate($number, '0123456789', '۰۱۲۳۴۵۶۷۸۹')"/>
            </xsl:when>
            <xsl:when test="$numeral_system = 'tamil'">
                <xsl:value-of select="translate($number, '0123456789', '௦௧௨௩௪௫௬௭௮௯')"/>
            </xsl:when>
            <xsl:when test="$numeral_system = 'telugu'">
                <xsl:value-of select="translate($number, '0123456789', '౦౧౨౩౪౫౬౭౮౯')"/>
            </xsl:when>
            <xsl:when test="$numeral_system = 'thai'">
                <xsl:value-of select="translate($number, '0123456789', '๐๑๒๓๔๕๖๗๘๙')"/>
            </xsl:when>
            <xsl:when test="$numeral_system = 'urdu'">
                <xsl:value-of select="translate($number, '0123456789', '۰۱۲۳۴۵۶۷۸۹')"/>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
