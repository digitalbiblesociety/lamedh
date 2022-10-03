<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template name="lh" match="para[@style='lh']">
        <xsl:call-template name="paragraph">
            <xsl:with-param name="content" select="node()" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="li" match="para[@style='li']">
        <xsl:call-template name="paragraph">
            <xsl:with-param name="content" select="node()" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="lf" match="para[@style='lf']">
        <xsl:call-template name="paragraph">
            <xsl:with-param name="content" select="node()" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="lim" match="para[@style='lim']">
        <xsl:call-template name="paragraph">
            <xsl:with-param name="content" select="node()" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="litl" match="para[@style='litl']">
        <xsl:call-template name="paragraph">
            <xsl:with-param name="content" select="node()" />
        </xsl:call-template>
    </xsl:template>

</xsl:stylesheet>
