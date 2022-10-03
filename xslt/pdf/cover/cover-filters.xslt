<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!--
        The Cover Filters allow for customization of the cover background
        without the need to change the image via the css 3.0 filters. The
        default region filters can be overridden in the table bible_pod.
    -->

    <xsl:template name="cover_filters">
        <xsl:param name="metadata" required="yes"/>
        <xsl:choose>
            <xsl:when test="$metadata/data/pod/cover_filter">
                filter: <xsl:value-of select="$metadata/data/pod/cover_filter"/>;
            </xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="$metadata/data/country/region_name = 'Southern Europe'">
                        filter: hue-rotate(38deg) saturate(110%);
                    </xsl:when>
                    <xsl:when test="$metadata/data/country/region_name = 'Western Europe'">
                        filter: hue-rotate(38deg) brightness(.95) saturate(110%);
                    </xsl:when>
                    <xsl:when test="$metadata/data/country/region_name = 'Northern Europe'">
                        filter: hue-rotate(38deg) brightness(.85) saturate(110%);
                    </xsl:when>
                    <xsl:when test="$metadata/data/country/region_name = 'Eastern Europe'">
                        filter: hue-rotate(38deg) brightness(.75) saturate(110%);
                    </xsl:when>
                    <xsl:when test="$metadata/data/country/region_name = 'South-eastern Asia'">
                        filter: hue-rotate(166deg) saturate(200%) brightness(1.25);
                    </xsl:when>
                    <xsl:when test="$metadata/data/country/region_name = 'Eastern Asia'">
                        filter: hue-rotate(142deg) saturate(150%);
                    </xsl:when>
                    <xsl:when test="$metadata/data/country/region_name = 'Western Asia'">
                        filter: hue-rotate(253deg) saturate(150%);
                    </xsl:when>
                    <xsl:when test="$metadata/data/country/region_name = 'Southern Asia'">
                        filter: hue-rotate(173deg) saturate(200%) brightness(1.25);
                    </xsl:when>
                    <xsl:when test="$metadata/data/country/region_name = 'Central Asia'">
                        filter: hue-rotate(180deg) saturate(200%) brightness(1.25);
                    </xsl:when>
                    <xsl:when test="$metadata/data/country/region_name = 'Northern America'">
                        filter: hue-rotate(300deg) saturate(110%) brightness(1.25);
                    </xsl:when>
                    <xsl:when test="$metadata/data/country/region_name = 'Latin America and the Caribbean'">
                        filter: hue-rotate(298deg) saturate(110%);
                    </xsl:when>
                    <xsl:when test="$metadata/data/country/region_name = 'Northern Africa'">
                        filter: hue-rotate(164deg) saturate(150%) sepia(75%);
                    </xsl:when>
                    <xsl:when test="$metadata/data/country/region_name = 'Sub-Saharan Africa'">
                        filter: hue-rotate(164deg) saturate(150%) sepia(75%);
                    </xsl:when>
                    <xsl:when test="$metadata/data/country/region_name = 'Polynesia'">
                        filter: hue-rotate(347deg) saturate(150%) brightness(1.15)
                    </xsl:when>
                    <xsl:when test="$metadata/data/country/region_name = 'Melanesia'">
                        filter: hue-rotate(347deg) saturate(150%) brightness(1.25)
                    </xsl:when>
                    <xsl:when test="$metadata/data/country/region_name = 'Micronesia'">
                        filter: hue-rotate(347deg) saturate(150%) brightness(1.35)
                    </xsl:when>
                    <xsl:when test="$metadata/data/country/region_name = 'Australia and New Zealand'">
                        filter: hue-rotate(347deg) saturate(150%) brightness(1.45)
                    </xsl:when>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>


</xsl:stylesheet>
