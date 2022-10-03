<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

        <xsl:template name="imt" match="para[@style='imt']|para[@style='imt1']|para[@style='imt2']|para[@style='imt3']">
            <xsl:call-template name="heading">
                <xsl:with-param name="content" select="node()" />
                <xsl:with-param name="level" select="string('####')" />
            </xsl:call-template>
        </xsl:template>

        <xsl:template name="is" match="para[@style='is']|para[@style='is1']|para[@style='is2']|para[@style='is3']">
            <xsl:call-template name="heading">
                <xsl:with-param name="content" select="node()" />
                <xsl:with-param name="level" select="string('#####')" />
            </xsl:call-template>
        </xsl:template>

        <xsl:template name="ip" match="para[@style='ip']|para[@style='ip1']|para[@style='ip2']|para[@style='ip3']">
            <xsl:call-template name="italic">
                <xsl:with-param name="content" select="node()" />
            </xsl:call-template>
        </xsl:template>

        <xsl:template name="ipi" match="para[@style='ipi']">
            <xsl:call-template name="paragraph">
                <xsl:with-param name="content" select="node()" />
            </xsl:call-template>
        </xsl:template>

        <xsl:template name="im" match="para[@style='im']">
            <xsl:call-template name="paragraph">
                <xsl:with-param name="content" select="node()" />
            </xsl:call-template>
        </xsl:template>

        <xsl:template name="imi" match="para[@style='imi']">
            <xsl:call-template name="italic">
                <xsl:with-param name="content" select="node()" />
            </xsl:call-template>
        </xsl:template>

        <xsl:template name="ipq" match="para[@style='ipq']|para[@style='imq']">
            <xsl:call-template name="blockquote">
                <xsl:with-param name="content" select="node()" />
            </xsl:call-template>
        </xsl:template>

        <xsl:template name="ipr" match="para[@style='ipr']">
            <xsl:call-template name="paragraph">
                <xsl:with-param name="content" select="node()" />
            </xsl:call-template>
        </xsl:template>

        <xsl:template name="iq" match="para[@style='iq']|para[@style='iq1']|para[@style='iq2']|para[@style='iq3']">
            <xsl:call-template name="paragraph">
                <xsl:with-param name="content" select="node()" />
            </xsl:call-template>
        </xsl:template>

        <xsl:template name="ib" match="para[@style='ib']">
        <xsl:text>

        </xsl:text>
        </xsl:template>

        <xsl:template name="ili" match="para[@style='ili']|para[@style='ili1']|para[@style='ili2']|para[@style='ili3']">
            <xsl:call-template name="list">
                <xsl:with-param name="content" select="node()" />
            </xsl:call-template>
        </xsl:template>

        <xsl:template name="iot" match="para[@style='iot']">
            <xsl:call-template name="heading">
                <xsl:with-param name="content" select="node()" />
                <xsl:with-param name="level" select="string('#####')" />
            </xsl:call-template>
        </xsl:template>

        <xsl:template name="io" match="para[@style='io']|para[@style='io1']|para[@style='io2']|para[@style='io3']">
            <xsl:call-template name="list">
                <xsl:with-param name="content" select="node()" />
            </xsl:call-template>
        </xsl:template>

        <xsl:template name="iex" match="para[@style='iex']">
            <xsl:call-template name="paragraph">
                <xsl:with-param name="content" select="node()" />
            </xsl:call-template>
        </xsl:template>

        <xsl:template name="ie" match="para[@style='ie']">
            <xsl:call-template name="hr" />
        </xsl:template>

        <xsl:template name="ignored_introduction_tags" match="para[@style='imte']">

        </xsl:template>


</xsl:stylesheet>
