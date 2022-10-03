<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="char">
        <xsl:call-template name="italic">
            <xsl:with-param name="content" select="node()" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="chapter">
        <xsl:call-template name="heading">
            <xsl:with-param name="content" select="node()" />
            <xsl:with-param name="level" select="string('####')" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="verse">
        <xsl:call-template name="bold">
            <xsl:with-param name="content" select="node()" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="para[@style='s']|para[@style='s1']|para[@style='s2']|para[@style='s3']">
        <xsl:call-template name="heading">
            <xsl:with-param name="content" select="node()" />
            <xsl:with-param name="level" select="string('###')" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="para[@style='h']">
        <xsl:call-template name="heading">
            <xsl:with-param name="content" select="node()" />
            <xsl:with-param name="level" select="string('#')" />
        </xsl:call-template>
    </xsl:template>


    <xsl:template match="para">
        <xsl:apply-templates select="node()"/>
    </xsl:template>

    <!-- Tags to ignore -->
    <xsl:template name="ignored_tags" match="note|para[@style='ide']|verse[@eid]|optbreak|figure|para[@style='toc1']|para[@style='toc2']|para[@style='toc3']|para[@style='mt1']|para[@style='mt2']"/>

    <!-- Fallback for general tags -->
    <xsl:template name="general_fallback" match="@*|node()">
        <xsl:copy><xsl:apply-templates select="node()"/></xsl:copy>
    </xsl:template>

</xsl:stylesheet>







