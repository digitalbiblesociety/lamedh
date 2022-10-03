<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="verse[@eid]|optbreak|figure|char[@style='fr']|chapter|periph|para[@style='ide']|para[@style='toc1']|para[@style='toc2']|para[@style='toc3']|para[@style='h']|para[@style='rem']" />
<xsl:template match="para[@style='imt']|para[@style='imt1']|para[@style='imt2']|para[@style='imt3']|para[@style='imt4']" />
<xsl:template match="para[@style='is']|para[@style='is1']|para[@style='is2']|para[@style='is3']|para[@style='is4']" />
<xsl:template match="para[@style='iq']|para[@style='iq1']|para[@style='iq2']|para[@style='iq3']|para[@style='iq4']" />
<xsl:template match="para[@style='ili']|para[@style='ili1']|para[@style='ili2']|para[@style='ili3']|para[@style='ili4']" />
<xsl:template match="para[@style='io']|para[@style='io1']|para[@style='io2']|para[@style='io3']|para[@style='io4']" />
<xsl:template match="para[@style='ip']|para[@style='ipi']|para[@style='im']|para[@style='imi']|para[@style='ipq']|para[@style='imq']|para[@style='ipr']|para[@style='ib']|para[@style='iot']|para[@style='iex']|para[@style='imte']|para[@style='ie']" />
<xsl:template match="para[@style='mt']|para[@style='mt1']|para[@style='mt2']|para[@style='mt3']" />

</xsl:stylesheet>
