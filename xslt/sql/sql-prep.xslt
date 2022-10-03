<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" encoding="utf-8" indent="yes"/>

    <xsl:template match="note" />

    <!-- Identification -->
    <xsl:template match="para[@style[.= 'toc1' or .= 'toc2' or .= 'toc3' or .= 'toca1' or .= 'toca2' or .= 'toca3']]" />

    <!-- Introductions -->
    <xsl:template match="para[@style[.= 'imt' or .= 'imt1' or .= 'imt2' or .= 'imt3' or .= 'is' or .= 'is1' or .= 'is2' or .= 'is3' or .= 'ip' or .= 'ipi' or .= 'im' or .= 'imi' or .= 'ipq' or .= 'imq' or .= 'ipr' or .= 'iq' or .= 'ib' or .= 'ili' or .= 'ili1' or .= 'ili2' or .= 'ili3' or .= 'iot' or .= 'io' or .= 'io1' or .= 'io2' or .= 'io3' or .= 'iex' or .= 'imte' or .= 'ie']]" />
    <!-- .= 'mt' or .= 'mte' or .= 'cl' or .= 'cd' or .= 'ms' or .= 'mr' or .= 's' or .= 'sr' or .= 'r' or .= 'd' or .= 'sp' or .= 'sd' or .= 'ior' or .= 'iqt' or .= 'rq' or .= 'qt' or .= 'ts' or .= 'fr' or .= 'ft' or .= 'fk' or .= 'fq' or .= 'fqa' or .= 'fl' or .= 'fw' or .= 'fp' or .= 'fv' or .= 'fdc' or .= 'xo' or .= 'xop' or .= 'xt' or .= 'xta' or .= 'xk' or .= 'xq' or .= 'xnt' or .= 'xdc' or .= 'x' or .= 'f' -->

    <!-- Titles & Headings -->
    <xsl:template match="para[@style[.= 'mt' or .= 'mt1' or .= 'mt2' or .= 'mt3' or .= 'mte' or .= 'cl' or .= 'cd' or .= 'ms' or .= 'mr' or .= 's' or .= 'sr' or .= 'r' or .= 'd' or .= 'sp' or .= 'sd']]" />

    <!-- note elements -->
    <xsl:template match="char[@style[.= 'fr' or .= 'ft' or .= 'fk' or .= 'fq' or .= 'fqa' or .= 'fl' or .= 'fw' or .= 'fp' or .= 'fv' or .= 'fdc' or .= 'xo' or .= 'xop' or .= 'xt' or .= 'xta' or .= 'xk' or .= 'xq' or .= 'xot' or .= 'xnt' or .= 'xdc']]" />

    <!-- Identity template : copy all text nodes, elements or attributes -->
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" />
        </xsl:copy>
    </xsl:template>


</xsl:stylesheet>
