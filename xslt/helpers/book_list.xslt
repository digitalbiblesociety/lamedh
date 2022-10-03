<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:variable name="book_list" as="element()*">
        <code usfm="GEN" usfx="GN" osis="Gen" order_p="1" section="law" section_group="law_history" testament="OT" canon="bible" />
        <code usfm="EXO" usfx="EX" osis="Exod" order_p="2" section="law" section_group="law_history" testament="OT" canon="bible" />
        <code usfm="LEV" usfx="LV" osis="Lev" order_p="3" section="law" section_group="law_history" testament="OT" canon="bible" />
        <code usfm="NUM" usfx="NU" osis="Num" order_p="4" section="law" section_group="law_history" testament="OT" canon="bible" />
        <code usfm="DEU" usfx="DT" osis="Deut" order_p="5" section="law" section_group="law_history" testament="OT" canon="bible" />
        <code usfm="JOS" usfx="JS" osis="Josh" order_p="6" section="history" section_group="law_history" testament="OT" canon="bible" />
        <code usfm="JDG" usfx="JG" osis="Judg" order_p="7" section="history" section_group="law_history" testament="OT" canon="bible" />
        <code usfm="RUT" usfx="RT" osis="Ruth" order_p="8" section="history" section_group="law_history" testament="OT" canon="bible" />
        <code usfm="1SA" usfx="S1" osis="1Sam" order_p="9" section="history" section_group="law_history" testament="OT" canon="bible" />
        <code usfm="2SA" usfx="S2" osis="2Sam" order_p="10" section="history" section_group="law_history" testament="OT" canon="bible" />
        <code usfm="1KI" usfx="K1" osis="1Kgs" order_p="11" section="history" section_group="law_history" testament="OT" canon="bible" />
        <code usfm="2KI" usfx="K2" osis="2Kgs" order_p="12" section="history" section_group="law_history" testament="OT" canon="bible" />
        <code usfm="1CH" usfx="R1" osis="1Chr" order_p="13" section="history" section_group="law_history" testament="OT" canon="bible" />
        <code usfm="2CH" usfx="R2" osis="2Chr" order_p="14" section="history" section_group="law_history" testament="OT" canon="bible" />
        <code usfm="EZR" usfx="ER" osis="Ezra" order_p="15" section="history" section_group="law_history" testament="OT" canon="bible" />
        <code usfm="NEH" usfx="NH" osis="Neh" order_p="16" section="history" section_group="law_history" testament="OT" canon="bible" />
        <code usfm="EST" usfx="ET" osis="Esth" order_p="17" section="history" section_group="law_history" testament="OT" canon="bible" />

        <code usfm="JOB" usfx="JB" osis="Job" order_p="18" section="poetry" section_group="poetry_prophets" testament="OT" canon="bible" />
        <code usfm="PSA" usfx="PS" osis="Ps" order_p="19" section="poetry" section_group="poetry_prophets" testament="OT" canon="bible" />
        <code usfm="PRO" usfx="PR" osis="Prov" order_p="20" section="poetry" section_group="poetry_prophets" testament="OT" canon="bible" />
        <code usfm="ECC" usfx="EC" osis="Eccl" order_p="21" section="poetry" section_group="poetry_prophets" testament="OT" canon="bible" />
        <code usfm="SNG" usfx="SS" osis="Song" order_p="22" section="poetry" section_group="poetry_prophets" testament="OT" canon="bible" />
        <code usfm="ISA" usfx="IS" osis="Isa" order_p="23" section="prophets_major" section_group="poetry_prophets" testament="OT" canon="bible" />
        <code usfm="JER" usfx="JR" osis="Jer" order_p="24" section="prophets_major" section_group="poetry_prophets" testament="OT" canon="bible" />
        <code usfm="LAM" usfx="LM" osis="Lam" order_p="25" section="prophets_major" section_group="poetry_prophets" testament="OT" canon="bible" />
        <code usfm="EZK" usfx="EK" osis="Ezek" order_p="26" section="prophets_major" section_group="poetry_prophets" testament="OT" canon="bible" />
        <code usfm="DAN" usfx="DN" osis="Dan" order_p="27" section="prophets_major" section_group="poetry_prophets" testament="OT" canon="bible" />
        <code usfm="HOS" usfx="HS" osis="Hos" order_p="28" section="prophets_minor" section_group="poetry_prophets" testament="OT" canon="bible" />
        <code usfm="JOL" usfx="JL" osis="Joel" order_p="29" section="prophets_minor" section_group="poetry_prophets" testament="OT" canon="bible" />
        <code usfm="AMO" usfx="AM" osis="Amos" order_p="30" section="prophets_minor" section_group="poetry_prophets" testament="OT" canon="bible" />
        <code usfm="OBA" usfx="OB" osis="Obad" order_p="31" section="prophets_minor" section_group="poetry_prophets" testament="OT" canon="bible" />
        <code usfm="JON" usfx="JH" osis="Jonah" order_p="32" section="prophets_minor" section_group="poetry_prophets" testament="OT" canon="bible" />
        <code usfm="MIC" usfx="MC" osis="Mic" order_p="33" section="prophets_minor" section_group="poetry_prophets" testament="OT" canon="bible" />
        <code usfm="NAM" usfx="NM" osis="Nah" order_p="34" section="prophets_minor" section_group="poetry_prophets" testament="OT" canon="bible" />
        <code usfm="HAB" usfx="HK" osis="Hab" order_p="35" section="prophets_minor" section_group="poetry_prophets" testament="OT" canon="bible" />
        <code usfm="ZEP" usfx="ZP" osis="Zeph" order_p="36" section="prophets_minor" section_group="poetry_prophets" testament="OT" canon="bible" />
        <code usfm="HAG" usfx="HG" osis="Hag" order_p="37" section="prophets_minor" section_group="poetry_prophets" testament="OT" canon="bible" />
        <code usfm="ZEC" usfx="ZC" osis="Zech" order_p="38" section="prophets_minor" section_group="poetry_prophets" testament="OT" canon="bible" />
        <code usfm="MAL" usfx="ML" osis="Mal" order_p="39" section="prophets_minor" section_group="poetry_prophets" testament="OT" canon="bible" />

        <code usfm="MAT" usfx="MT" osis="Matt" order_p="41" section="gospels" testament="NT" canon="bible" />
        <code usfm="MRK" usfx="MK" osis="Mark" order_p="42" section="gospels" testament="NT" canon="bible" />
        <code usfm="LUK" usfx="LK" osis="Luke" order_p="43" section="gospels" testament="NT" canon="bible" />
        <code usfm="JHN" usfx="JN" osis="John" order_p="44" section="gospels" testament="NT" canon="bible" />
        <code usfm="ACT" usfx="AC" osis="Acts" order_p="45" section="history_apostolic" testament="NT" canon="bible" />
        <code usfm="ROM" usfx="RM" osis="Rom" order_p="46" section="epistles_pauline" testament="NT" canon="bible" />
        <code usfm="1CO" usfx="C1" osis="1Cor" order_p="47" section="epistles_pauline" testament="NT" canon="bible" />
        <code usfm="2CO" usfx="C2" osis="2Cor" order_p="48" section="epistles_pauline" testament="NT" canon="bible" />
        <code usfm="GAL" usfx="GL" osis="Gal" order_p="49" section="epistles_pauline" testament="NT" canon="bible" />
        <code usfm="EPH" usfx="EP" osis="Eph" order_p="50" section="epistles_pauline" testament="NT" canon="bible" />
        <code usfm="PHP" usfx="PP" osis="Phil" order_p="51" section="epistles_pauline" testament="NT" canon="bible" />
        <code usfm="COL" usfx="CL" osis="Col" order_p="52" section="epistles_pauline" testament="NT" canon="bible" />
        <code usfm="1TH" usfx="H1" osis="1Thess" order_p="53" section="epistles_pauline" testament="NT" canon="bible" />
        <code usfm="2TH" usfx="H2" osis="2Thess" order_p="54" section="epistles_pauline" testament="NT" canon="bible" />
        <code usfm="1TI" usfx="T1" osis="1Tim" order_p="55" section="epistles_pauline" testament="NT" canon="bible" />
        <code usfm="2TI" usfx="T2" osis="2Tim" order_p="56" section="epistles_pauline" testament="NT" canon="bible" />
        <code usfm="TIT" usfx="TT" osis="Titus" order_p="57" section="epistles_pauline" testament="NT" canon="bible" />
        <code usfm="PHM" usfx="PM" osis="Phlm" order_p="58" section="epistles_pauline" testament="NT" canon="bible" />
        <code usfm="HEB" usfx="HB" osis="Heb" order_p="59" section="epistles_pauline" testament="NT" canon="bible" />
        <code usfm="JAS" usfx="JM" osis="Jas" order_p="60" section="epistles_general" testament="NT" canon="bible" />
        <code usfm="1PE" usfx="P1" osis="1Pet" order_p="61" section="epistles_general" testament="NT" canon="bible" />
        <code usfm="2PE" usfx="P2" osis="2Pet" order_p="62" section="epistles_general" testament="NT" canon="bible" />
        <code usfm="1JN" usfx="J1" osis="1John" order_p="63" section="epistles_general" testament="NT" canon="bible" />
        <code usfm="2JN" usfx="J2" osis="2John" order_p="64" section="epistles_general" testament="NT" canon="bible" />
        <code usfm="3JN" usfx="J3" osis="3John" order_p="65" section="epistles_general" testament="NT" canon="bible" />
        <code usfm="JUD" usfx="JD" osis="Jude" order_p="66" section="epistles_general" testament="NT" canon="bible" />
        <code usfm="REV" usfx="RV" osis="Rev" order_p="67" section="apocalypse" testament="NT" canon="bible" />

        <code usfm="TOB" usfx="TB" osis="Tob" order_p="68" section="apocrypha" testament="AP" canon="bible_plus" />
        <code usfm="JDT" usfx="JT" osis="Jdt" order_p="69" section="apocrypha" testament="AP" canon="bible_plus" />
        <code usfm="ESG" usfx="EG" osis="EsthGr" order_p="70" section="apocrypha" testament="AP" canon="bible_plus" />
        <code usfm="WIS" usfx="WS" osis="wis" order_p="71" section="apocrypha" testament="AP" canon="bible_plus" />
        <code usfm="SIR" usfx="SR" osis="Sir" order_p="72" section="apocrypha" testament="AP" canon="bible_plus" />
        <code usfm="BAR" usfx="BR" osis="Bar" order_p="73" section="apocrypha" testament="AP" canon="bible_plus" />
        <code usfm="LJE" usfx="JE" osis="EpJer" order_p="74" section="apocrypha" testament="AP" canon="bible_plus" />
        <code usfm="S3Y" usfx="PA" osis="PrAzar" order_p="75" section="apocrypha" testament="AP" canon="bible_plus" />
        <code usfm="SUS" usfx="SN" osis="Sus" order_p="76" section="apocrypha" testament="AP" canon="bible_plus" />
        <code usfm="BEL" usfx="BL" osis="Bel" order_p="77" section="apocrypha" testament="AP" canon="bible_plus" />
        <code usfm="1MA" usfx="M1" osis="1Macc" order_p="78" section="apocrypha" testament="AP" canon="bible_plus" />
        <code usfm="2MA" usfx="M2" osis="2Macc" order_p="79" section="apocrypha" testament="AP" canon="bible_plus" />
        <code usfm="3MA" usfx="M3" osis="3Macc" order_p="80" section="apocrypha" testament="AP" canon="bible_plus" />
        <code usfm="4MA" usfx="M4" osis="4Macc" order_p="81" section="apocrypha" testament="AP" canon="bible_plus" />
        <code usfm="1ES" usfx="E1" osis="1Esd" order_p="82" section="apocrypha" testament="AP" canon="bible_plus" />
        <code usfm="2ES" usfx="E2" osis="2Esd" order_p="83" section="apocrypha" testament="AP" canon="bible_plus" />
        <code usfm="MAN" usfx="PN" osis="PrMan" order_p="84" section="apocrypha" testament="AP" canon="bible_plus" />
        <code usfm="PS2" usfx="PX" osis="AddPs" order_p="85" section="apocrypha" testament="AP" canon="bible_plus" />
        <code usfm="ODA" usfx="OD" osis="Odes" order_p="86" section="apocrypha" testament="AP" canon="bible_plus" />
        <code usfm="PSS" usfx="SP" osis="PssSol" order_p="87" section="apocrypha" testament="AP" canon="bible_plus" />
        <code usfm="EZA" usfx="EA" osis="4Ezra" order_p="88" section="apocrypha" testament="AP" canon="bible_plus" />
        <code usfm="5EZ" usfx="E5" osis="5Ezra" order_p="89" section="apocrypha" testament="AP" canon="bible_plus" />
        <code usfm="6EZ" usfx="E6" osis="6Ezra" order_p="90" section="apocrypha" testament="AP" canon="bible_plus" />
        <code usfm="DAG" usfx="DG" osis="DanGr" order_p="91" section="apocrypha" testament="AP" canon="bible_plus" />
        <code usfm="PS3" usfx="P3" osis="5ApocSyrPss" order_p="92" section="apocrypha" testament="AP" canon="bible_plus" />
        <code usfm="2BA" usfx="2B" osis="2Bar" order_p="93" section="apocrypha" testament="AP" canon="bible_plus" />
        <code usfm="LBA" usfx="LB" osis="EpBar" order_p="94" section="apocrypha" testament="AP" canon="bible_plus" />
        <code usfm="JUB" usfx="JU" osis="Jub" order_p="95" section="apocrypha" testament="AP" canon="bible_plus" />
        <code usfm="ENO" usfx="EO" osis="1En" order_p="96" section="apocrypha" testament="AP" canon="bible_plus" />
        <code usfm="1MQ" usfx="Q1" osis="1Meq" order_p="97" section="apocrypha" testament="AP" canon="bible_plus" />
        <code usfm="2MQ" usfx="Q2" osis="2Meq" order_p="98" section="apocrypha" testament="AP" canon="bible_plus" />
        <code usfm="3MQ" usfx="Q3" osis="3Meq" order_p="99" section="apocrypha" testament="AP" canon="bible_plus" />
        <code usfm="REP" usfx="RP" osis="Rep" order_p="100" section="apocrypha" testament="AP" canon="bible_plus" />
        <code usfm="4BA" usfx="B4" osis="4Bar" order_p="101" section="apocrypha" testament="AP" canon="bible_plus" />
        <code usfm="LAO" usfx="LO" osis="EpLao" order_p="102" section="apocrypha" testament="AP" canon="bible_plus" />
        <code usfm="ADE" usfx="AE" osis="AddEsth" order_p="103" section="apocrypha" testament="AP" canon="bible_plus" />
    </xsl:variable>

</xsl:stylesheet>
