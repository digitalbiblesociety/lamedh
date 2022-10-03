<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template name="q" match="para[@style='q']">
        <xsl:call-template name="paragraph">
            <xsl:with-param name="content" select="node()" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="qr" match="para[@style='qr']">
        <xsl:call-template name="paragraph">
            <xsl:with-param name="content" select="node()" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="qc" match="para[@style='qc']">
        <xsl:call-template name="paragraph">
            <xsl:with-param name="content" select="node()" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="qa" match="para[@style='qa']">
        <xsl:call-template name="paragraph">
            <xsl:with-param name="content" select="node()" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="qm" match="para[@style='qm']">
        <xsl:call-template name="paragraph">
            <xsl:with-param name="content" select="node()" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="qd" match="para[@style='qd']">
        <xsl:call-template name="paragraph">
            <xsl:with-param name="content" select="node()" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="b" match="para[@style='b']">
        <xsl:call-template name="paragraph">
            <xsl:with-param name="content" select="node()" />
        </xsl:call-template>
    </xsl:template>

</xsl:stylesheet>
