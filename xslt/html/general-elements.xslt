<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- Tags to ignore -->
    <xsl:template name="ignored_tags" priority="10" match="para[@style='rem']|para[@style='ide']|verse[@eid]|optbreak|figure|para[@style='toc1']|para[@style='toc2']|para[@style='toc3']|para[@style='h']|book"/>

    <!-- Fallback for general tags -->
    <xsl:template name="general_fallback" match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="node()"/>
        </xsl:copy>
    </xsl:template>


</xsl:stylesheet>
