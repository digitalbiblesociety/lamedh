<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template name="em" match="char[@style='em']">
        <xsl:call-template name="char">
            <xsl:with-param name="content" select="node()" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="bd" match="char[@style='bd']">
        <xsl:call-template name="char">
            <xsl:with-param name="content" select="node()" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="bdit" match="char[@style='bdit']">
        <xsl:call-template name="char">
            <xsl:with-param name="content" select="node()" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="it" match="char[@style='it']">
        <xsl:call-template name="char">
            <xsl:with-param name="content" select="node()" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="no" match="char[@style='no']">
        <xsl:call-template name="char">
            <xsl:with-param name="content" select="node()" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="sc" match="char[@style='sc']">
        <xsl:call-template name="char">
            <xsl:with-param name="content" select="node()" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="sup" match="char[@style='sup']">
        <xsl:call-template name="char">
            <xsl:with-param name="content" select="node()" />
        </xsl:call-template>
    </xsl:template>

</xsl:stylesheet>







