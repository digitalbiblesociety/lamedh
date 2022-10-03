<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xsl:output method="html" />

    <xsl:param name="api_url" as="xs:string" required="yes" />
    <xsl:param name="bible_id" as="xs:string" required="yes" />
    <xsl:param name="type" as="xs:string" required="yes" />
    <xsl:param name="trim" as="xs:string" required="yes" />
    <xsl:param name="back_page_verses" as="xs:string" required="yes" />
    <xsl:param name="back_page_book" as="xs:string" required="yes" />
    <xsl:param name="spine_width" as="xs:decimal" required="yes" />

    <xsl:param name="metadata" select="document(concat($api_url, $bible_id, '?format=xml&amp;include_pod=true&amp;trim=', $trim))"/>
    <xsl:variable name="dimensions" select="document('cover-sizes.xslt')/*/xsl:variable[@name='sizes']/size[@variation = concat($trim, '_',$type)]" />

    <xsl:include href="cover-filters.xslt" />

    <xsl:template name="cover_img" match="/usx">
        <html>
            <head>
                <link href="../../../../assets/css/print-cover.css" rel="stylesheet" />
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
                <style>
                    @font-face {
                        font-family: "<xsl:value-of select="$metadata/data/pod/font" />";
                        src: url("../../../../assets/fonts/<xsl:value-of select="$metadata/data/pod/font" />") format("<xsl:value-of select="$metadata/data/pod/font_format" />");
                    }
                    @font-face {
                        font-family: "<xsl:value-of select="$metadata/data/pod/font" />";
                        src: url("../../../../assets/fonts/<xsl:value-of select="$metadata/data/pod/font_bold" />") format("<xsl:value-of select="$metadata/data/pod/font_format" />");
                        font-weight: bold;
                    }
                    @page {
                        border-color: transparent;
                        marks: none;
                        size: <xsl:value-of select="($dimensions/@total_width + $spine_width)" />mm <xsl:value-of select="$dimensions/@total_height" />mm;
                    }
                    body {
                        font-family: '<xsl:value-of select="$metadata/data/pod/font" />';
                    }
                    .lulu-space {
                        background-color: #FFF;
                        display: block;
                        position: absolute;
                        width: <xsl:value-of select="$dimensions/@barcode_width" />mm;
                        height: <xsl:value-of select="$dimensions/@barcode_height" />mm;
                        bottom: <xsl:value-of select="$dimensions/@barcode_margin" />mm;
                        right: <xsl:value-of select="$dimensions/@barcode_margin" />mm;
                    }
                    .back-page,
                    .front-page {
                        margin: <xsl:value-of select="($dimensions/@trim + $dimensions/@margin)" />mm;
                        width: <xsl:value-of select="$dimensions/@live_area_width" />mm;
                        height: <xsl:value-of select="$dimensions/@live_area_height" />mm;
                    }
                    .back-page {
                        margin-right:<xsl:value-of select="$dimensions/@margin" />mm;
                    }
                    .front-page {
                        margin-left:<xsl:value-of select="$dimensions/@margin" />mm;
                    }
                    .spine {
                        margin-top:<xsl:value-of select="($dimensions/@trim + $dimensions/@margin)" />mm;
                        width: <xsl:value-of select="$spine_width" />mm!important;
                    }

                    .spine .spine-lang {
                        bottom: <xsl:value-of select="($dimensions/@trim + $dimensions/@margin + $dimensions/@bottom_spacing)" />mm;
                    }

                    .spine h1 {
                        <xsl:choose>
                            <xsl:when test="($spine_width * .125) &lt; 1.25">
                                opacity: 0;  /* too small */
                            </xsl:when>
                            <xsl:when test="($spine_width * .125) &lt; 2">
                                font-size: <xsl:value-of select="$spine_width * .6" />mm; /* less than */
                            </xsl:when>
                            <xsl:when test="10 &gt; ($spine_width * .125)">
                                font-size: <xsl:value-of select="$spine_width * .125" />mm; /* greater than */
                            </xsl:when>
                            <xsl:otherwise>
                                font-size: <xsl:value-of select="$spine_width * .125" />mm; /* otherwise */
                            </xsl:otherwise>
                        </xsl:choose>
                        letter-spacing: 1mm;
                    }

                    .back-page .logo {
                        height: <xsl:value-of select="$dimensions/@barcode_height * .75" />mm;
                        bottom: <xsl:value-of select="$dimensions/@barcode_margin" />mm;
                        left: <xsl:value-of select="$dimensions/@barcode_margin" />mm;
                    }

                    .cover-wrap::before {
                        content: "";
                        position: fixed;
                        left: 0;
                        right: 0;
                        z-index: -1;
                        display: block;
                        background-image: url('../../../../assets/img/pod/cover.png');
                        background-size: cover;
                        width: 100%;
                        height: 100%;
                    }

                    .flap-front,
                    .flap-back {
                        width: <xsl:value-of select="$dimensions/@fold_width" />mm;
                        height: <xsl:value-of select="$dimensions/@fold_height" />mm;
                        margin: <xsl:value-of select="$dimensions/@fold_margin" />mm;
                    }

                    .cover-wrap::before,
                    .color-strip {
                    <xsl:call-template name="cover_filters">
                        <xsl:with-param name="metadata" select="$metadata"/>
                    </xsl:call-template>
                    }

                    .flap-back {
                        display:flex;
                        flex-direction:column;
                    }
                    .flap-back .flap-back-text {
                        flex: 1;
                    }
                    .flap-back-details {
                        color: white;
                        text-align: center;
                        font-size: 8pt;
                        flex-align: end;
                        padding: 0 20pt 60pt 20pt;

                    }
                    .flap-back-details div {
                        display:flex;
                        flex-direction:row;
                        justify-content:space-between;
                    }
                </style>
            </head>
            <body>
                <div class="cover-wrap {$trim}">

                    <xsl:if test="$type = 'dustcover'">
                        <div class="flap-back">

                            <div class="flap-back-text">

                            </div>

                            <div class="flap-back-details">
                                

                            </div>
                        </div>
                    </xsl:if>

                    <xsl:if test="not($trim = 'web')">
                    <div class="back-page">
                        <div class="verses">
                            <h5><xsl:value-of select="$back_page_book" /></h5>
                            <xsl:value-of select="$back_page_verses" />
                        </div>
                        
                        <div class="text-blurb">
                            This print on demand Bible is translated into <xsl:value-of select="$metadata/data/language/name" />, a language spoken in <xsl:value-of select="$metadata/data/country/region_name" />.
                            It is published by <xsl:value-of select="$metadata/data/pod/publisher/name" /> and provided by Digital Bible Society. This Bible is also available as an ebook for free download at dbs.org.
                        </div>

                        <div class="back-page-bottom">

                        <div class="logo-block">
                            <img class="logo" src="../../../../assets/img/logo_dbs_white.svg" />
                            <div class="address-block">
                                <div class="name">DIGITAL <b>BIBLE</b> SOCIETY</div>
                                <div class="address">P.O. Box 2881 • Conroe, TX. 77305</div>
                                <div class="website">www.dbs.org</div>
                            </div>
                        </div>

                        </div>
                    </div>

                    <div class="spine">
                        <div class="spine-text-wrap">
                            <h1><xsl:value-of select="$metadata/data/title_vernacular" /></h1>
                            <div class="spine-lang"><xsl:value-of select="$metadata/data/language/name" /></div>
                        </div>
                    </div>
                    </xsl:if>

                    <div class="front-page">
                        <h1><xsl:value-of select="$metadata/data/title_vernacular" /></h1>
                        <h2><xsl:value-of select="$metadata/data/title" /></h2>
                    </div>

                    <div class="gradient"></div>
                    <div class="color-strip">
                        <div class="top-line"></div>
                        <div class="bot-line"></div>
                    </div>

                    <xsl:if test="$type = 'dustcover'">
                        <div class="flap-front"></div>
                    </xsl:if>

                </div>
            </body>

        </html>

    </xsl:template>

    <!-- Fallback for general tags -->
    <xsl:template match="@*|node()"></xsl:template>

</xsl:stylesheet>