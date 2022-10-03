<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema">

    <!--
        Generates a identifiable token for anonymous web tracking beacons
            - utm_content:
            - utm_source: Source of the traffic
            - utm_campaign:
            - utm_medium:
    -->

    <xsl:param name="log_url" as="xs:string" required="yes" />
    <xsl:param name="hashes" as="xs:string" required="yes" />
    <xsl:param name="utm_source" as="xs:string" required="yes" />
    <xsl:param name="utm_campaign" as="xs:string" required="yes" />
    <xsl:param name="utm_medium" as="xs:string" required="yes" />

    <xsl:template name="token_hash">
        <xsl:param name="book_id" />

        <xsl:variable name="tokenized_hashes" select="tokenize($hashes, ':::')" />

        <xsl:for-each select="$tokenized_hashes">
            <xsl:variable name="token" select="." />
            <xsl:if test="contains($token, $book_id)">
                <img>
                    <xsl:attribute name="src"><xsl:value-of select="$log_url" />?utm_content=<xsl:value-of select="substring($token,4)" />&amp;utm_source=<xsl:value-of select="$utm_source" />&amp;utm_campaign=<xsl:value-of select="$utm_campaign" />&amp;utm_medium=<xsl:value-of select="$utm_medium" /></xsl:attribute>
                    <xsl:attribute name="onerror">this.style.display='none'</xsl:attribute>
                </img>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
