<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xsl:param name="api_url" as="xs:string" required="yes" />
    <xsl:param name="bible_id" as="xs:string" required="yes" />
    <xsl:param name="trim" as="xs:string" required="yes" />
    <xsl:param name="scope" as="xs:string" required="yes" />
    <xsl:param name="suffix" as="xs:string" required="yes" />
    <xsl:param name="portion" as="xs:string" required="yes" />
    <xsl:param name="page_count" as="xs:integer" required="yes" />

    <xsl:param name="metadata" select="document(concat($api_url,$bible_id,'?format=xml&amp;include_pod=true&amp;cacheclear=true&amp;trim=',$trim,'&amp;scope=',$scope))"/>
    <xsl:variable name="dimensions" select="document('interior-trims.xslt')/*/xsl:variable[@name='trims']/trim[@variation = $trim]" />
    <xsl:variable name="book_list" select="document('../helpers/book_list.xslt')/*/xsl:variable[@name='book_list']/code[$portion=(@section, @section_group, @testament, @canon, @usfm)]" />

    <xsl:include href="custom-print-styles.xslt" />
    <xsl:include href="../helpers/ignored_tags.xslt" />
    <xsl:include href="../html/single-file-bible.xslt" />
    <xsl:include href="../html/elements.xslt" />
    <xsl:include href="toc.xslt" />
    
    <xsl:template match="/usx" name="bible">
        <xsl:result-document method="html" href="{$bible_id}{$suffix}.html">
            <html>
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
                <xsl:call-template name="header_styles" />
                <meta name="book_list">
                    <xsl:attribute name="content">
                    <xsl:for-each select="$book_list"><xsl:value-of select="@usfm" />,</xsl:for-each>
                    </xsl:attribute>
                </meta>
            </head>
            <body class="scripture-styles lamedh" dir="{$metadata/data/alphabet/direction}" lang="{$metadata/data/iso}" script="{$metadata/data/script}">
                <div class="title-page">
                    <h1 class="title_vernacular"><xsl:value-of select="$metadata/data/title_vernacular" /></h1>
                    <h2 class="title"><xsl:value-of select="$metadata/data/title" /></h2>
                    <time class="date"> <xsl:value-of select="$metadata/data/date" /> </time>
                    <p class="copyright"> <xsl:copy-of select="$metadata/data/copyright" /> </p>
                </div>

                <div class="blurb-page">
                    <div class="publisher-block">
                    <xsl:if test="$metadata/data/pod/publisher">
                        <div class="publisher-logo">
                            <xsl:value-of select="$metadata/data/pod/publisher/logo" disable-output-escaping="yes" />
                        </div>
                        <div class="publisher-title">
                            <xsl:value-of select="$metadata/data/pod/publisher/name" />
                            <small><xsl:value-of select="$metadata/data/pod/publisher/autonym" /></small>
                        </div>
                        <div class="publisher-text">
                            <xsl:copy-of select="$metadata/data/pod/publisher_text" />
                        </div>

                        <h4><xsl:value-of select="$metadata/data/title_vernacular" /></h4>
                        <h5><xsl:value-of select="$metadata/data/title" /></h5>

                    </xsl:if>

                    <div class="description">
                    <xsl:choose>
                        <xsl:when test="not($metadata/data/pod/description)">
                            <p>
                                This Bible is provided at cost by the Digital Bible Society with permission from
                                <xsl:value-of select="$metadata/data/pod/publisher/name" /> for non-commercial use.
                                This Bible, and over a thousand others, are available in a variety of digital formats for free download at dbs.org.
                            </p>
                        </xsl:when>
                        <xsl:otherwise>
                             <xsl:value-of select="$metadata/data/pod/description" disable-output-escaping="yes" />
                        </xsl:otherwise>
                    </xsl:choose>
                    </div>
                    </div>

                    <aside>
                        <div class="description-aside language">Language: <span><xsl:value-of select="$metadata/data/language/name" /></span></div>
                        <div class="description-aside country">Country: <span><xsl:value-of select="$metadata/data/country/name" /></span></div>
                        <div class="description-aside publisher">Publisher: <span><xsl:value-of select="$metadata/data/pod/publisher/name" /> </span></div>
                        <div class="description-aside copyright">Copyright: <span><xsl:value-of select="$metadata/data/copyright" /></span></div>
                        <div class="description-aside date">Last Updated: <span><xsl:value-of select="format-dateTime(current-dateTime(),'[Y0001]-[M01]-[D01]')" /></span></div>
                        <div class="description-aside id">ID: <span><xsl:value-of select="$metadata/data/id" /> </span></div>
                        <div class="description-aside id">ISO: <span><xsl:value-of select="$metadata/data/iso" /> </span></div>
                        <div class="description-aside id">ISBN: <xsl:value-of select="$metadata/data/isbn13" /> </div>
                    </aside>

                    <svg class="dbs-logo" viewBox="0 0 308.43 221.74" xmlns="http://www.w3.org/2000/svg"><g fill-rule="evenodd"><path d="m33.87 178.52v-17.6h3.56a16.1 16.1 0 0 1 5.57.64 7.44 7.44 0 0 1 3.87 3.14 9.83 9.83 0 0 1 1.44 5.3 9.27 9.27 0 0 1 -1.14 4.68 6.89 6.89 0 0 1 -2.83 2.92 10.56 10.56 0 0 1 -5 1zm1.65-1.65h2a18.15 18.15 0 0 0 5-.42 5.7 5.7 0 0 0 3-2.34 7.4 7.4 0 0 0 1.14-4.1 7.86 7.86 0 0 0 -1.19-4.35 5.71 5.71 0 0 0 -3.35-2.45 20.61 20.61 0 0 0 -5.31-.48h-1.23z" fill="#777"/><path d="m51.3 160.98h1.7v17.59h-1.7z" fill="#777"/><path d="m73.42 163.9-1.29 1.28a9.61 9.61 0 0 0 -3.13-2.18 8.66 8.66 0 0 0 -3.35-.75 7.28 7.28 0 0 0 -3.81 1.07 7.39 7.39 0 0 0 -2.84 2.76 7.3 7.3 0 0 0 -1 3.67 7.66 7.66 0 0 0 1 3.77 8.07 8.07 0 0 0 2.84 2.82 7.94 7.94 0 0 0 4 1.06 6.26 6.26 0 0 0 4.43-1.54 6 6 0 0 0 2.12-4h-5.47v-1.71h7.37a8.75 8.75 0 0 1 -2.37 6.49 8.29 8.29 0 0 1 -6.24 2.39 9.3 9.3 0 0 1 -7.47-3.29 8.84 8.84 0 0 1 -2.12-6 9.39 9.39 0 0 1 1.24-4.68 8.7 8.7 0 0 1 3.35-3.35 9.87 9.87 0 0 1 4.8-1.22 11 11 0 0 1 4.12.8 12 12 0 0 1 3.82 2.55z" fill="#777"/><path d="m77.33 160.98h1.71v17.59h-1.71z" fill="#777"/><path d="m81.31 162.68v-1.7h9.33v1.7h-3.82v15.84h-1.7v-15.84z" fill="#777"/><path d="m98.11 161 7.94 17.59h-1.86l-2.68-5.79h-7.37l-2.68 5.79h-1.86l8.1-17.59zm-.11 3.7-2.89 6.38h5.83z" fill="#777"/><path d="m108.83 160.98h1.71v15.95h6.6v1.7h-8.25v-17.65z" fill="#777"/><path d="m129.82 161a8.14 8.14 0 0 1 3.14.48 3.41 3.41 0 0 1 1.7 1.54 4.45 4.45 0 0 1 .67 2.28 4.2 4.2 0 0 1 -.51 2.13 3.51 3.51 0 0 1 -1.6 1.54 5.87 5.87 0 0 1 2 1.12 4.91 4.91 0 0 1 1.14 1.54 4.33 4.33 0 0 1 .41 2 4.54 4.54 0 0 1 -1.5 3.56 5.88 5.88 0 0 1 -4 1.49h-4.69l-.15-17.17v-.51zm-1.76 1.7v5.63h.94a6.54 6.54 0 0 0 2.63-.37 2.7 2.7 0 0 0 1.29-1.12 3 3 0 0 0 .46-1.64 2.52 2.52 0 0 0 -.82-1.92 3.93 3.93 0 0 0 -2.63-.69h-1.93v.11zm0 14.14h2.12a7.3 7.3 0 0 0 2.73-.37 3.57 3.57 0 0 0 1.44-1.17 2.93 2.93 0 0 0 .52-1.7 2.83 2.83 0 0 0 -.77-2 3.8 3.8 0 0 0 -2-1.23 17.65 17.65 0 0 0 -3.05-.26h-1z" fill="#444"/><path d="m139.2 160.98h1.7v17.59h-1.7z" fill="#444"/><path d="m147.81 161a8.23 8.23 0 0 1 3.15.48 3.49 3.49 0 0 1 1.7 1.54 4.54 4.54 0 0 1 .67 2.28 4.2 4.2 0 0 1 -.52 2.13 3.51 3.51 0 0 1 -1.6 1.54 5.87 5.87 0 0 1 2 1.12 4.76 4.76 0 0 1 1.14 1.54 4.2 4.2 0 0 1 .41 2 4.53 4.53 0 0 1 -1.49 3.56 5.9 5.9 0 0 1 -4 1.49h-4.69l-.17-17.68zm-1.75 1.7v5.63h.94a6.49 6.49 0 0 0 2.62-.37 2.65 2.65 0 0 0 1.29-1.12 3 3 0 0 0 .47-1.64 2.52 2.52 0 0 0 -.83-1.92 3.91 3.91 0 0 0 -2.63-.69h-1.92l.05.11zm0 7.39v6.75h2.11a7.27 7.27 0 0 0 2.73-.37 3.6 3.6 0 0 0 1.45-1.17 3 3 0 0 0 .51-1.7 2.78 2.78 0 0 0 -.77-2 3.77 3.77 0 0 0 -2-1.23 17.62 17.62 0 0 0 -3-.26z" fill="#444"/><path d="m157.5 160.98h1.7v15.95h6.55v1.7h-8.25z" fill="#444"/><path d="m168 161h9.74v1.7h-8.09v5.53h8v1.7h-8v6.91h8v1.7h-9.65z" fill="#444"/><path d="m187 175.28 1.6-.91c1.13 2 2.44 2.87 3.92 2.87a3.21 3.21 0 0 0 1.77-.42 4.14 4.14 0 0 0 1.25-1.12 2.72 2.72 0 0 0 .45-1.49 2.28 2.28 0 0 0 -.68-1.7 14.69 14.69 0 0 0 -3.19-2.81 17.26 17.26 0 0 1 -2.95-2.4 4.06 4.06 0 0 1 -1-2.71 3.67 3.67 0 0 1 .57-2.07 3.93 3.93 0 0 1 1.65-1.49 5.09 5.09 0 0 1 2.27-.53 4.64 4.64 0 0 1 2.51.64 8 8 0 0 1 2.44 2.28l-1.53 1.12a6.5 6.5 0 0 0 -1.82-1.7 3.44 3.44 0 0 0 -1.65-.43 2.53 2.53 0 0 0 -1.82.69 2.14 2.14 0 0 0 -.74 1.6 2 2 0 0 0 .28 1.11 3.73 3.73 0 0 0 .91 1.17 27.39 27.39 0 0 0 2.45 1.76 13.62 13.62 0 0 1 3.35 3 4.82 4.82 0 0 1 .92 2.65 4.15 4.15 0 0 1 -1.6 3.3 5.58 5.58 0 0 1 -3.81 1.44 5.93 5.93 0 0 1 -3.07-.86 8.26 8.26 0 0 1 -2.51-3zm20.13-14.73a7.26 7.26 0 0 1 5.75 2.71 10.38 10.38 0 0 1 0 13.08 7.33 7.33 0 0 1 -5.62 2.71 7 7 0 0 1 -5.66-2.71 9.82 9.82 0 0 1 -2.33-6.48 11.17 11.17 0 0 1 1.05-4.74 8.06 8.06 0 0 1 2.88-3.35 7.37 7.37 0 0 1 3.93-1.22zm.13 1.7a5.48 5.48 0 0 0 -3.15 1.07 7.19 7.19 0 0 0 -2.37 2.76 8.42 8.42 0 0 0 -.74 3.92 7.73 7.73 0 0 0 1.87 5.26 5.62 5.62 0 0 0 4.52 2.13 5.85 5.85 0 0 0 3.24-1 7 7 0 0 0 2.33-2.71 9.33 9.33 0 0 0 0-7.65 7.44 7.44 0 0 0 -2.38-2.71 5.38 5.38 0 0 0 -3.24-1.07zm26.25 2-1.31 1.06a7.7 7.7 0 0 0 -2.52-2.28 7.32 7.32 0 0 0 -3.24-.8 6.21 6.21 0 0 0 -3.58 1.06 7.32 7.32 0 0 0 -2.52 2.71 8.29 8.29 0 0 0 -.87 3.89 7.69 7.69 0 0 0 2 5.36 6.42 6.42 0 0 0 5.08 2.13 6.9 6.9 0 0 0 5.61-2.87l1.31 1.06a7.73 7.73 0 0 1 -3 2.56 9.1 9.1 0 0 1 -4 .9 8 8 0 0 1 -6.63-3.08 9.81 9.81 0 0 1 -2.08-6.28 9.12 9.12 0 0 1 2.47-6.48 8.22 8.22 0 0 1 6.29-2.66 8.54 8.54 0 0 1 4.06 1 8.06 8.06 0 0 1 3 2.76z" fill="#777"/><path d="m237.31 160.98h1.7v17.59h-1.7z" fill="#777"/><path d="m242.41 160.98h9.8v1.7h-8.15v5.53h8.05v1.7h-8.05v6.91h8.05v1.7h-9.7z" fill="#777"/><path d="m253.91 162.68v-1.7h9.33v1.7h-3.81v15.84h-1.7v-15.84z" fill="#777"/><path d="m264.38 160.98h1.96l4.38 7.23 4.28-7.23h1.96l-5.42 9.19v8.4h-1.65v-8.4z" fill="#777"/></g><path d="m3.83 135.71h137.87v6.7h-137.87z" fill="#6c6c6c"/><path d="m165.55 135.71h137.87v6.7h-137.87z" fill="#6c6c6c"/><path d="m25.01 141.74h254.5v6.13h-254.5z" fill="#6c6c6c"/><path d="m20.59 143.65h262.3v6.13h-262.3z" fill="#6c6c6c"/><ellipse cx="284.48" cy="143.13" fill="#6c6c6c" rx="18.96" ry="6.69"/><ellipse cx="22.83" cy="142.67" fill="#6c6c6c" rx="19" ry="6.96"/><path d="m129.66 142.94c0-4 5.37-7.23 12-7.23 6.61 0 12 3.25 12 7.23" fill="#6c6c6c" fill-rule="evenodd"/><path d="m153.57 142.94c.1-4 5.42-7.23 12-7.23 6.61 0 12 3.25 12 7.23" fill="#6c6c6c" fill-rule="evenodd"/><ellipse cx="273" cy="141.95" fill="#a1a1a1" rx="2.99" ry="3.08"/><path d="m225.09 140.35h38.99v4.09h-38.99z" fill="#a1a1a1"/><path d="m246.46 48.32q-20.98-30.85-69.91-48.32 45.93 69.93-16.47 132.69 60-20.56 86.38-84.37" fill="#e6e6e6" fill-rule="evenodd"/><path d="m280.54 70.92q-20.05-41.07-54.94-63.69 0 90.51-65.47 125.46 77.87-5.17 120.41-61.77" fill="#c9c9c9" fill-rule="evenodd" opacity=".75"/><path d="m297.48 83.31c-5.37-19.2-15.29-39.08-30-59.65q-17 96.65-107.35 109 103.94-4.14 137.35-49.38" fill="#909090" fill-rule="evenodd" opacity=".85"/><path d="m303.47 122.38a74.91 74.91 0 0 0 -3-21.64q-43.83 30.95-140.34 31.9 59.94 1 143.34-10.26" fill="#7d7d7d" fill-rule="evenodd"/><path d="m3.83 124.4a126.93 126.93 0 0 1 3-24.67q38 31.9 128.89 32.91-50 2.07-131.88-8.24" fill="#a9a9a9" fill-rule="evenodd"/><path d="m9.82 83.31c0-2.77 2.68-13 8-30.89q34.08 72 117.94 80.22-90-2.07-125.89-49.33" fill="#c0c0c0" fill-rule="evenodd"/><path d="m98.51 198.63h1.08l2.5 5.92 2.6-5.92h.19l2.62 5.92 2.54-5.92h1.09l-3.54 8.15h-.19l-2.61-5.78-2.6 5.83h-.19z" fill="#777"/><path d="m111.26 198.63h1.08l2.5 5.92 2.6-5.92h.19l2.62 5.92 2.54-5.92h1.09l-3.54 8.15h-.19l-2.61-5.78-2.6 5.83h-.2z" fill="#777"/><path d="m124 198.63h1.08l2.5 5.92 2.6-5.92h.19l2.61 5.92 2.55-5.92h1.09l-3.54 8.15h-.2l-2.6-5.83-2.61 5.83h-.19z" fill="#777"/><path d="m139 205.13a.88.88 0 0 1 .65.27.94.94 0 0 1 0 1.32.88.88 0 0 1 -.65.27.93.93 0 0 1 0-1.86z" fill="#777"/><path d="m142.28 206.78v-11h2.28a11.83 11.83 0 0 1 3.59.4 4.82 4.82 0 0 1 2.5 2 5.91 5.91 0 0 1 .91 3.3 5.77 5.77 0 0 1 -.72 2.92 4.66 4.66 0 0 1 -1.86 1.85 7 7 0 0 1 -3.2.6zm1.05-1h1.28a11.85 11.85 0 0 0 3.16-.28 3.7 3.7 0 0 0 2-1.46 4.51 4.51 0 0 0 .71-2.57 4.73 4.73 0 0 0 -.77-2.72 3.87 3.87 0 0 0 -2.15-1.55 13 13 0 0 0 -3.41-.32h-.78z" fill="#777"/><path d="m153.72 195.76h2.17a5.09 5.09 0 0 1 2 .32 2.39 2.39 0 0 1 1.11.92 2.65 2.65 0 0 1 .41 1.43 2.56 2.56 0 0 1 -.36 1.34 2.69 2.69 0 0 1 -1 1 4 4 0 0 1 1.32.68 2.69 2.69 0 0 1 .72.95 2.89 2.89 0 0 1 .26 1.21 3 3 0 0 1 -1 2.25 3.65 3.65 0 0 1 -2.6.91h-3zm1.08 1.08v3.53h.63a5 5 0 0 0 1.69-.21 1.79 1.79 0 0 0 .85-.68 1.74 1.74 0 0 0 .32-1 1.47 1.47 0 0 0 -.53-1.19 2.7 2.7 0 0 0 -1.69-.43zm0 4.64v4.22h1.36a5.05 5.05 0 0 0 1.77-.23 2.07 2.07 0 0 0 .91-.74 1.87 1.87 0 0 0 .34-1.09 1.91 1.91 0 0 0 -.48-1.28 2.53 2.53 0 0 0 -1.32-.75 9.78 9.78 0 0 0 -2-.13z" fill="#777"/><path d="m161.36 204.73.94-.56c.66 1.21 1.42 1.82 2.28 1.82a2.2 2.2 0 0 0 1-.26 1.77 1.77 0 0 0 .74-.69 1.81 1.81 0 0 0 .26-.92 1.87 1.87 0 0 0 -.38-1.09 8.88 8.88 0 0 0 -1.88-1.77 9.76 9.76 0 0 1 -1.72-1.5 2.75 2.75 0 0 1 -.58-1.69 2.56 2.56 0 0 1 .34-1.31 2.48 2.48 0 0 1 1-.93 2.77 2.77 0 0 1 1.36-.34 3 3 0 0 1 1.46.38 5 5 0 0 1 1.43 1.42l-.9.68a4.13 4.13 0 0 0 -1.06-1.08 1.77 1.77 0 0 0 -.95-.26 1.5 1.5 0 0 0 -1.09.4 1.33 1.33 0 0 0 -.42 1 1.64 1.64 0 0 0 .14.69 2.93 2.93 0 0 0 .55.74c.15.14.62.5 1.42 1.1a8 8 0 0 1 2 1.88 3.06 3.06 0 0 1 .53 1.65 2.81 2.81 0 0 1 -.91 2.09 3.11 3.11 0 0 1 -2.21.88 3.22 3.22 0 0 1 -1.82-.54 4.78 4.78 0 0 1 -1.53-1.79z" fill="#777"/><path d="m171.12 205.13a.93.93 0 0 1 0 1.86.88.88 0 0 1 -.65-.27.94.94 0 0 1 0-1.32.88.88 0 0 1 .65-.27z" fill="#777"/><path d="m178.07 198.42a4.05 4.05 0 0 1 3.12 1.37 4.36 4.36 0 0 1 -.06 5.92 4.31 4.31 0 0 1 -6.13 0 4.39 4.39 0 0 1 -.06-5.92 4.06 4.06 0 0 1 3.13-1.37zm0 1a3 3 0 0 0 -2.25 1 3.2 3.2 0 0 0 -.94 2.33 3.28 3.28 0 0 0 .43 1.65 3 3 0 0 0 1.15 1.18 3.28 3.28 0 0 0 3.21 0 3 3 0 0 0 1.15-1.18 3.28 3.28 0 0 0 .43-1.65 3.2 3.2 0 0 0 -.94-2.33 3 3 0 0 0 -2.24-.97z" fill="#777"/><path d="m183.86 198.63h1.07v1.19a3.92 3.92 0 0 1 1-1 1.81 1.81 0 0 1 2-.07l-.55.88a1.53 1.53 0 0 0 -.55-.14 1.58 1.58 0 0 0 -1 .43 2.81 2.81 0 0 0 -.74 1.34 12.88 12.88 0 0 0 -.19 2.82v2.75h-1.07z" fill="#777"/><path d="m195.89 198.63h1.05v6.5a7.68 7.68 0 0 1 -.3 2.51 3.29 3.29 0 0 1 -1.43 1.73 4.73 4.73 0 0 1 -2.45.6 5.84 5.84 0 0 1 -1.88-.29 3.83 3.83 0 0 1 -1.36-.8 4.8 4.8 0 0 1 -1-1.46h1.14a3 3 0 0 0 1.2 1.2 4.39 4.39 0 0 0 3.64 0 2.45 2.45 0 0 0 1.05-1 4.46 4.46 0 0 0 .31-1.95v-.42a3.93 3.93 0 0 1 -1.44 1.15 4.2 4.2 0 0 1 -1.82.4 4.14 4.14 0 0 1 -2.11-.56 3.94 3.94 0 0 1 -1.53-1.5 4.1 4.1 0 0 1 -.54-2.07 4.19 4.19 0 0 1 2.12-3.66 4.13 4.13 0 0 1 2.09-.57 4 4 0 0 1 1.71.38 4.64 4.64 0 0 1 1.52 1.25zm-3.09.8a3.26 3.26 0 0 0 -1.65.44 3.05 3.05 0 0 0 -1.2 1.19 3.22 3.22 0 0 0 -.44 1.64 3 3 0 0 0 .9 2.22 3.22 3.22 0 0 0 2.33.87 3.19 3.19 0 0 0 2.33-.87 3.07 3.07 0 0 0 .88-2.28 3.3 3.3 0 0 0 -.41-1.64 2.93 2.93 0 0 0 -1.14-1.15 3.32 3.32 0 0 0 -1.6-.42z" fill="#777"/></svg>

                </div>

                <xsl:call-template name="toc" />
                <xsl:call-template name="bible_body" />
            </body>
            </html>
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>
