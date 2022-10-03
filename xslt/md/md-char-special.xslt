<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- Special Text -->
    <xsl:template name="add" match="char[@style='add']">
        <xsl:call-template name="char">
            <xsl:with-param name="content" select="node()" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="bk" match="char[@style='bk']">
        <xsl:call-template name="char">
            <xsl:with-param name="content" select="node()" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="dc" match="char[@style='dc']">
        <xsl:call-template name="char">
            <xsl:with-param name="content" select="node()" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="ior" match="char[@style='ior']">
        <xsl:call-template name="char">
            <xsl:with-param name="content" select="node()" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="iqt" match="char[@style='iqt']">
        <xsl:call-template name="char">
            <xsl:with-param name="content" select="node()" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="k" match="char[@style='k']">
        <xsl:call-template name="char">
            <xsl:with-param name="content" select="node()" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="litl" match="char[@style='litl']">
        <xsl:call-template name="char">
            <xsl:with-param name="content" select="node()" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="nd" match="char[@style='nd']">
        <xsl:call-template name="char">
            <xsl:with-param name="content" select="node()" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="ord" match="char[@style='ord']">
        <xsl:call-template name="char">
            <xsl:with-param name="content" select="node()" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="pn" match="char[@style='pn']">
        <xsl:call-template name="char">
            <xsl:with-param name="content" select="node()" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="png" match="char[@style='png']">
        <xsl:call-template name="char">
            <xsl:with-param name="content" select="node()" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="qac" match="char[@style='qac']">
        <xsl:call-template name="char">
            <xsl:with-param name="content" select="node()" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="qs" match="char[@style='qs']">
        <xsl:call-template name="char">
            <xsl:with-param name="content" select="node()" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="qt" match="char[@style='qt']">
        <xsl:call-template name="char">
            <xsl:with-param name="content" select="node()" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="rq" match="char[@style='rq']">
        <xsl:call-template name="char">
            <xsl:with-param name="content" select="node()" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="sig" match="char[@style='sig']">
        <xsl:call-template name="char">
            <xsl:with-param name="content" select="node()" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="sls" match="char[@style='sls']">
        <xsl:call-template name="char">
            <xsl:with-param name="content" select="node()" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="tl" match="char[@style='tl']">
        <xsl:call-template name="char">
            <xsl:with-param name="content" select="node()" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="wj" match="char[@style='wj']">
        <span style="color:red"><xsl:value-of select="node()" /></span>
    </xsl:template>

</xsl:stylesheet>
