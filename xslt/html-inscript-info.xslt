<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xsl:output indent="yes" use-character-maps="html-illegal-chars" />
    <xsl:strip-space elements="*"/>

    <xsl:param name="metadata" select="document(concat('https://aleph.digitalbiblesociety.net/api/bibles/',$bible_id,'?format=xml'))"/>
    <xsl:param name="bible_id" as="xs:string" required="yes" />
    <xsl:param name="fcbh_audio_nt" as="xs:string" />
    <xsl:param name="fcbh_audio_ot" as="xs:string" />
    <xsl:param name="fcbh_drama_nt" as="xs:string" />
    <xsl:param name="fcbh_drama_ot" as="xs:string" />

    <xsl:include href="./helpers/numerals.xslt" />
    <xsl:include href="html/character-map.xslt" />
    <xsl:include href="./helpers/book_codes.xslt" />

    <xsl:variable name="book_ids" select="document('./helpers/book_codes.xslt')/*/xsl:variable[@name='books']" />

    <xsl:template match="/usx">{
        "id": "<xsl:value-of select="$metadata/data/abbr" />",
        "type": "bible",
        "name": "<xsl:choose><xsl:when test="$metadata/data/title_vernacular != ''"><xsl:value-of select="$metadata/data/title_vernacular" /></xsl:when><xsl:otherwise><xsl:value-of select="$metadata/data/title" /></xsl:otherwise></xsl:choose>",
        "nameEnglish": "<xsl:value-of select="$metadata/data/title" />",
        "hasLemma": <xsl:value-of select="$metadata/data/has_lemma" />,
        "abbr": "<xsl:value-of select="$metadata/data/abbr" />",
        "dir": "<xsl:value-of select="$metadata/data/dir" />",
        "lang": "<xsl:value-of select="$metadata/data/iso" />",
        "langName": "<xsl:value-of select="$metadata/data/autonym" />",
        "langNameEnglish": "<xsl:value-of select="$metadata/data/language" />",
        "fontClass": "<xsl:value-of select="$metadata/data/script" />",
        "script": "<xsl:value-of select="$metadata/data/script" />",
        "audioDirectory": "<xsl:value-of select="$metadata/data/abbr" />",
        "fcbh_drama_nt": "<xsl:value-of select="$fcbh_drama_nt" />",
        "fcbh_drama_ot": "<xsl:value-of select="$fcbh_drama_ot" />",
        "fcbh_audio_nt": "<xsl:value-of select="$fcbh_audio_nt" />",
        "fcbh_audio_ot": "<xsl:value-of select="$fcbh_audio_ot" />",
        "numbers":["0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60","61","62","63","64","65","66","67","68","69","70","71","72","73","74","75","76","77","78","79","80","81","82","83","84","85","86","87","88","89","90","91","92","93","94","95","96","97","98","99","100","101","102","103","104","105","106","107","108","109","110","111","112","113","114","115","116","117","118","119","120","121","122","123","124","125","126","127","128","129","130","131","132","133","134","135","136","137","138","139","140","141","142","143","144","145","146","147","148","149","150"],
        "country":"<xsl:value-of select="$metadata/data/country/name" />",
        "countryCode":"<xsl:value-of select="$metadata/data/country_id" />",
        "countries":[],
        "timeGenerated":"<xsl:value-of select="current-date()" />",
        "redistributable":true,
        "divisionNames":[<xsl:for-each select="book"><xsl:variable name="header_title"><xsl:choose><xsl:when test="following::para[@style='h'][1]"><xsl:value-of select="following::para[@style='h'][1]"/></xsl:when> <xsl:when test="following::para[@style='mt'][1]"> <xsl:value-of select="following::para[@style='mt'][1]"/></xsl:when> <xsl:when test="following::para[@style='toc1'][1]"> <xsl:value-of select="following::para[@style='toc1'][1]"/></xsl:when><xsl:otherwise><xsl:value-of select="@code"/></xsl:otherwise></xsl:choose></xsl:variable>"<xsl:value-of select="replace(normalize-space($header_title),'&quot;','')" />",</xsl:for-each>],
        "divisions":[<xsl:for-each select="book"><xsl:variable name="current_usfm_id" select="@code" />"<xsl:value-of select="$book_ids/code[@usfm = $current_usfm_id]/@usfx" />",</xsl:for-each>],
        "sections":[<xsl:for-each select="book"><xsl:variable name="current_usfm_id" select="@code" /><xsl:variable name="current_book" select="position()" /><xsl:for-each select="/*/chapter[count(preceding-sibling::book)=$current_book]">"<xsl:value-of select="concat($book_ids/code[@usfm = $current_usfm_id]/@usfx,@number)" />",</xsl:for-each></xsl:for-each>]
}</xsl:template>
</xsl:stylesheet>
