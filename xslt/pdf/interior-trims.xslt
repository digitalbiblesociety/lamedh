<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!--
        These dimensions match the specifications from Lulu for the print
        on demand interior book trims
    -->

    <xsl:variable name="trims" as="element()*">

        <trim variation="custom_print_small"
              total_width="130"
              total_height="205"
              inner_margin_61="5"
              inner_margin_151="15"
              inner_margin_400="15"
              inner_margin_600="20"
         />
         
         <trim variation="custom_print_large"
              total_width="180"
              total_height="250"
              border="5"
              inner_margin_61="5"
              inner_margin_151="15"
              inner_margin_400="15"
              inner_margin_600="20"
         />

        <trim variation="web"
              total_width="197"
              total_height="284"
              border="9.53"
              inner_margin_61="3"
              inner_margin_151="13"
              inner_margin_400="16"
              inner_margin_600="19" />

        <trim variation="us_letter"
              total_width="222"
              total_height="286"
              old_border="15.88"
              border="6.35"
              inner_margin_61="3"
              inner_margin_151="13"
              inner_margin_400="16"
              inner_margin_600="19" />

        <trim variation="us_trade"
              total_width="159"
              total_height="235"
              border="15.88"
              inner_margin_61="3"
              inner_margin_151="13"
              inner_margin_400="16"
              inner_margin_600="19" />

        <trim variation="digest"
              total_width="146"
              total_height="222"
              border="15.88"
              inner_margin_61="3"
              inner_margin_151="13"
              inner_margin_400="16"
              inner_margin_600="19" />

    </xsl:variable>

</xsl:stylesheet>
