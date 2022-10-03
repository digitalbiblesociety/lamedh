<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template name="mt" match="para[@style='mt']">
        <xsl:call-template name="paragraph">
            <xsl:with-param name="content" select="node()" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="mte" match="para[@style='mte']">
        <xsl:call-template name="paragraph">
            <xsl:with-param name="content" select="node()" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="cl" match="para[@style='cl']">
        <xsl:call-template name="paragraph">
            <xsl:with-param name="content" select="node()" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="cd" match="para[@style='cd']">
        <xsl:call-template name="paragraph">
            <xsl:with-param name="content" select="node()" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="ms" match="para[@style='ms']">
        <xsl:call-template name="paragraph">
            <xsl:with-param name="content" select="node()" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="mr" match="para[@style='mr']">
        <xsl:call-template name="paragraph">
            <xsl:with-param name="content" select="node()" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="s" match="para[@style='s']">
        <xsl:call-template name="paragraph">
            <xsl:with-param name="content" select="node()" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="sr" match="para[@style='sr']">
        <xsl:call-template name="paragraph">
            <xsl:with-param name="content" select="node()" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="r" match="para[@style='r']">
        <xsl:call-template name="paragraph">
            <xsl:with-param name="content" select="node()" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="d" match="para[@style='d']">
        <xsl:call-template name="paragraph">
            <xsl:with-param name="content" select="node()" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="sp" match="para[@style='sp']">
        <xsl:call-template name="paragraph">
            <xsl:with-param name="content" select="node()" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="sd" match="para[@style='sd']">
        <xsl:call-template name="paragraph">
            <xsl:with-param name="content" select="node()" />
        </xsl:call-template>
    </xsl:template>

</xsl:stylesheet>
