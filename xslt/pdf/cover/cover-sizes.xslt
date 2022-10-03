<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!--
        These dimensions match the specifications from Lulu for the print
        on demand book covers
    -->

    <xsl:variable name="sizes" as="element()*">

        <size variation="a4_coil" total_width="426" total_height="304" margin="6.35" trim="3.18"
              live_area_width="197" live_area_height="284"
              barcode_width="92" barcode_height="32" barcode_margin="9.53" />

        <size variation="a4_dustjacket" total_width="623" total_height="316" margin="6" trim="6"
              live_area_width="200" live_area_height="291"
              flap_width="83" flap_height="303"
              barcode_width="92" barcode_height="32" barcode_margin="6" />

        <size variation="a4_hardcover" total_width="471" total_height="341" margin="9.53" trim="19"
              live_area_width="197" live_area_height="284"
              barcode_width="92" barcode_height="32" barcode_margin="9.53"/>

        <size variation="a4_paperback" total_width="430" total_height="304" margin="6.35" trim="3.18"
              live_area_width="197" live_area_height="284"
              barcode_width="92" barcode_height="32" barcode_margin="9.53"/>

        <size variation="a4_saddlestitch" total_width="426" total_height="304" margin="6.35" trim="3.18"
              live_area_width="197" live_area_height="284"
              barcode_width="92" barcode_height="32" barcode_margin="9.53"/>

        <size variation="us_trade_coil" total_width="305" total_height="235" margin="6.35" trim="3.18"
              live_area_width="140" live_area_height="216"
              barcode_width="92" barcode_height="32" barcode_margin="9.53"/>

        <size variation="us_trade_paperback" total_width="311" total_height="235" margin="6.35" trim="3.18"
              live_area_width="140" live_area_height="216"
              barcode_width="92" barcode_height="32" barcode_margin="9.53"/> <!-- Subtracted 4 from total width-->

        <size variation="us_trade_hardcover" total_width="356" total_height="273" margin="9.53" trim="19"
              live_area_width="137" live_area_height="216"
              barcode_width="92" barcode_height="32" barcode_margin="9.53"/>

        <size variation="us_trade_saddlestitch" total_width="305" total_height="235" margin="6.35" trim="3.18"
              live_area_width="140" live_area_height="216"
              barcode_width="92" barcode_height="32" barcode_margin="9.53"/>

        <size variation="us_trade_dustcover"
            total_width="501"
            total_height="248"
            live_area_width="137" live_area_height="216"
            spine_width="0"
            margin="6"
            fold_height="235"
            fold_width="83"
            fold_margin="6.35"
            trim="6"
            barcode_width="92" barcode_height="32" barcode_margin="10"
        />

        <!-- Reset from -->
        <size variation="us_letter_hardcover" total_width="476" total_height="324" margin="9.53" trim="19"
              live_area_width="200" live_area_height="267" bottom_spacing="0"
              barcode_width="92" barcode_height="32" barcode_margin="9.53"/>

        <size variation="us_letter_paperback" total_width="438" total_height="286" margin="6.35" trim="3.18"
              live_area_width="203" live_area_height="267" bottom_spacing="0"
              barcode_width="92" barcode_height="32" barcode_margin="9.53"/>

        <size variation="us_letter_saddlestitch" total_width="438" total_height="286" margin="6.35" trim="3.18"
              live_area_width="203" live_area_height="267" bottom_spacing="0"
              barcode_width="92" barcode_height="32" barcode_margin="9.53"/>

        <size variation="us_letter_coil" total_width="432" total_height="279" margin="6.35" trim="3.18"
              live_area_width="203" live_area_height="267" bottom_spacing="0"
              barcode_width="92" barcode_height="32" barcode_margin="9.53"/>

        <!-- total_width decreased by 8 -->
        <size variation="us_letter_dustcover"
            total_width="630"
            total_height="300"
            live_area_width="215" live_area_height="260"
            bottom_spacing="15"
            spine_width="0"
            margin="6"
            fold_height="273"
            fold_width="70"
            fold_margin="6"
            trim="6"
            barcode_width="92" barcode_height="32" barcode_margin="10"
        />

        <size variation="Pocket_Book_coil" total_width="222" total_height="181" margin="6.35" trim="3.18"
              barcode_width="92" barcode_height="32" barcode_margin="9.53"/>

        <size variation="web" total_width="60" total_height="90" margin="0" trim="0"
              barcode_width="0" barcode_height="0" barcode_margin="0"/>
    </xsl:variable>

</xsl:stylesheet>
