<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template name="p" match="para[@style='p']">
        <xsl:call-template name="paragraph">
            <xsl:with-param name="content" select="node()" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="m" match="para[@style='m']">
        <xsl:call-template name="paragraph">
            <xsl:with-param name="content" select="node()" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="po" match="para[@style='po']">
        <xsl:call-template name="paragraph">
            <xsl:with-param name="content" select="node()" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="pr" match="para[@style='pr']">
        <xsl:call-template name="paragraph">
            <xsl:with-param name="content" select="node()" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="cls" match="para[@style='cls']">
        <xsl:call-template name="paragraph">
            <xsl:with-param name="content" select="node()" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="pmo" match="para[@style='pmo']">
        <xsl:call-template name="paragraph">
            <xsl:with-param name="content" select="node()" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="pm" match="para[@style='pm']">
        <xsl:call-template name="paragraph">
            <xsl:with-param name="content" select="node()" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="pmc" match="para[@style='pmc']">
        <xsl:call-template name="paragraph">
            <xsl:with-param name="content" select="node()" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="pmr" match="para[@style='pmr']">
        <xsl:call-template name="paragraph">
            <xsl:with-param name="content" select="node()" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="pi" match="para[@style='pi']">
        <xsl:call-template name="paragraph">
            <xsl:with-param name="content" select="node()" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="mi" match="para[@style='mi']">
        <xsl:call-template name="paragraph">
            <xsl:with-param name="content" select="node()" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="pc" match="para[@style='pc']">
        <xsl:call-template name="paragraph">
            <xsl:with-param name="content" select="node()" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="ph" match="para[@style='ph']">
        <xsl:call-template name="paragraph">
            <xsl:with-param name="content" select="node()" />
        </xsl:call-template>
    </xsl:template>

</xsl:stylesheet>
