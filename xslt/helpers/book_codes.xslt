<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:variable name="books" as="element()*">
        <code usfm="GEN" usfx="GN" osis="Gen" order_p="1" testament="OT" />
        <code usfm="EXO" usfx="EX" osis="Exod" order_p="2" testament="OT" />
        <code usfm="LEV" usfx="LV" osis="Lev" order_p="3" testament="OT" />
        <code usfm="NUM" usfx="NU" osis="Num" order_p="4" testament="OT" />
        <code usfm="DEU" usfx="DT" osis="Deut" order_p="5" testament="OT" />
        <code usfm="JOS" usfx="JS" osis="Josh" order_p="6" testament="OT" />
        <code usfm="JDG" usfx="JG" osis="Judg" order_p="7" testament="OT" />
        <code usfm="RUT" usfx="RT" osis="Ruth" order_p="8" testament="OT" />
        <code usfm="1SA" usfx="S1" osis="1Sam" order_p="9" testament="OT" />
        <code usfm="2SA" usfx="S2" osis="2Sam" order_p="10" testament="OT" />
        <code usfm="1KI" usfx="K1" osis="1Kgs" order_p="11" testament="OT" />
        <code usfm="2KI" usfx="K2" osis="2Kgs" order_p="12" testament="OT" />
        <code usfm="1CH" usfx="R1" osis="1Chr" order_p="13" testament="OT" />
        <code usfm="2CH" usfx="R2" osis="2Chr" order_p="14" testament="OT" />
        <code usfm="EZR" usfx="ER" osis="Ezra" order_p="15" testament="OT" />
        <code usfm="NEH" usfx="NH" osis="Neh" order_p="16" testament="OT" />
        <code usfm="EST" usfx="ET" osis="Esth" order_p="17" testament="OT" />
        <code usfm="JOB" usfx="JB" osis="Job" order_p="18" testament="OT" />
        <code usfm="PSA" usfx="PS" osis="Ps" order_p="19" testament="OT" />
        <code usfm="PRO" usfx="PR" osis="Prov" order_p="20" testament="OT" />
        <code usfm="ECC" usfx="EC" osis="Eccl" order_p="21" testament="OT" />
        <code usfm="SNG" usfx="SS" osis="Song" order_p="22" testament="OT" />
        <code usfm="ISA" usfx="IS" osis="Isa" order_p="23" testament="OT" />
        <code usfm="JER" usfx="JR" osis="Jer" order_p="24" testament="OT" />
        <code usfm="LAM" usfx="LM" osis="Lam" order_p="25" testament="OT" />
        <code usfm="EZK" usfx="EK" osis="Ezek" order_p="26" testament="OT" />
        <code usfm="DAN" usfx="DN" osis="Dan" order_p="27" testament="OT" />
        <code usfm="HOS" usfx="HS" osis="Hos" order_p="28" testament="OT" />
        <code usfm="JOL" usfx="JL" osis="Joel" order_p="29" testament="OT" />
        <code usfm="AMO" usfx="AM" osis="Amos" order_p="30" testament="OT" />
        <code usfm="OBA" usfx="OB" osis="Obad" order_p="31" testament="OT" />
        <code usfm="JON" usfx="JH" osis="Jonah" order_p="32" testament="OT" />
        <code usfm="MIC" usfx="MC" osis="Mic" order_p="33" testament="OT" />
        <code usfm="NAM" usfx="NM" osis="Nah" order_p="34" testament="OT" />
        <code usfm="HAB" usfx="HK" osis="Hab" order_p="35" testament="OT" />
        <code usfm="ZEP" usfx="ZP" osis="Zeph" order_p="36" testament="OT" />
        <code usfm="HAG" usfx="HG" osis="Hag" order_p="37" testament="OT" />
        <code usfm="ZEC" usfx="ZC" osis="Zech" order_p="38" testament="OT" />
        <code usfm="MAL" usfx="ML" osis="Mal" order_p="39" testament="OT" />
        <code usfm="MAT" usfx="MT" osis="Matt" order_p="41" testament="NT" />
        <code usfm="MRK" usfx="MK" osis="Mark" order_p="42" testament="NT" />
        <code usfm="LUK" usfx="LK" osis="Luke" order_p="43" testament="NT" />
        <code usfm="ADE" usfx="AE" osis="AddEsth" order_p="44" testament="AP" />
        <code usfm="JHN" usfx="JN" osis="John" order_p="44" testament="NT" />
        <code usfm="ACT" usfx="AC" osis="Acts" order_p="45" testament="NT" />
        <code usfm="ROM" usfx="RM" osis="Rom" order_p="46" testament="NT" />
        <code usfm="1CO" usfx="C1" osis="1Cor" order_p="47" testament="NT" />
        <code usfm="2CO" usfx="C2" osis="2Cor" order_p="48" testament="NT" />
        <code usfm="GAL" usfx="GL" osis="Gal" order_p="49" testament="NT" />
        <code usfm="EPH" usfx="EP" osis="Eph" order_p="50" testament="NT" />
        <code usfm="PHP" usfx="PP" osis="Phil" order_p="51" testament="NT" />
        <code usfm="COL" usfx="CL" osis="Col" order_p="52" testament="NT" />
        <code usfm="1TH" usfx="H1" osis="1Thess" order_p="53" testament="NT" />
        <code usfm="2TH" usfx="H2" osis="2Thess" order_p="54" testament="NT" />
        <code usfm="1TI" usfx="T1" osis="1Tim" order_p="55" testament="NT" />
        <code usfm="2TI" usfx="T2" osis="2Tim" order_p="56" testament="NT" />
        <code usfm="TIT" usfx="TT" osis="Titus" order_p="57" testament="NT" />
        <code usfm="PHM" usfx="PM" osis="Phlm" order_p="58" testament="NT" />
        <code usfm="HEB" usfx="HB" osis="Heb" order_p="59" testament="NT" />
        <code usfm="JAS" usfx="JM" osis="Jas" order_p="60" testament="NT" />
        <code usfm="1PE" usfx="P1" osis="1Pet" order_p="61" testament="NT" />
        <code usfm="2PE" usfx="P2" osis="2Pet" order_p="62" testament="NT" />
        <code usfm="1JN" usfx="J1" osis="1John" order_p="63" testament="NT" />
        <code usfm="2JN" usfx="J2" osis="2John" order_p="64" testament="NT" />
        <code usfm="3JN" usfx="J3" osis="3John" order_p="65" testament="NT" />
        <code usfm="JUD" usfx="JD" osis="Jude" order_p="66" testament="NT" />
        <code usfm="REV" usfx="RV" osis="Rev" order_p="67" testament="NT" />
        <code usfm="TOB" usfx="TB" osis="Tob" order_p="68" testament="AP" />
        <code usfm="JDT" usfx="JT" osis="Jdt" order_p="69" testament="AP" />
        <code usfm="ESG" usfx="EG" osis="EsthGr" order_p="70" testament="AP" />
        <code usfm="WIS" usfx="WS" osis="wis" order_p="71" testament="AP" />
        <code usfm="SIR" usfx="SR" osis="Sir" order_p="72" testament="AP" />
        <code usfm="BAR" usfx="BR" osis="Bar" order_p="73" testament="AP" />
        <code usfm="LJE" usfx="JE" osis="EpJer" order_p="74" testament="AP" />
        <code usfm="S3Y" usfx="PA" osis="PrAzar" order_p="75" testament="AP" />
        <code usfm="SUS" usfx="SN" osis="Sus" order_p="76" testament="AP" />
        <code usfm="BEL" usfx="BL" osis="Bel" order_p="77" testament="AP" />
        <code usfm="1MA" usfx="M1" osis="1Macc" order_p="78" testament="AP" />
        <code usfm="2MA" usfx="M2" osis="2Macc" order_p="79" testament="AP" />
        <code usfm="3MA" usfx="M3" osis="3Macc" order_p="80" testament="AP" />
        <code usfm="4MA" usfx="M4" osis="4Macc" order_p="81" testament="AP" />
        <code usfm="1ES" usfx="E1" osis="1Esd" order_p="82" testament="AP" />
        <code usfm="2ES" usfx="E2" osis="2Esd" order_p="83" testament="AP" />
        <code usfm="MAN" usfx="PN" osis="PrMan" order_p="84" testament="AP" />
        <code usfm="PS2" usfx="PX" osis="AddPs" order_p="85" testament="AP" />
        <code usfm="ODA" usfx="OD" osis="Odes" order_p="86" testament="AP" />
        <code usfm="PSS" usfx="SP" osis="PssSol" order_p="87" testament="AP" />
        <code usfm="EZA" usfx="EA" osis="4Ezra" order_p="88" testament="AP" />
        <code usfm="5EZ" usfx="E5" osis="5Ezra" order_p="89" testament="AP" />
        <code usfm="6EZ" usfx="E6" osis="6Ezra" order_p="90" testament="AP" />
        <code usfm="DAG" usfx="DG" osis="DanGr" order_p="91" testament="AP" />
        <code usfm="PS3" usfx="P3" osis="5ApocSyrPss" order_p="92" testament="AP" />
        <code usfm="2BA" usfx="2B" osis="2Bar" order_p="93" testament="AP" />
        <code usfm="LBA" usfx="LB" osis="EpBar" order_p="94" testament="AP" />
        <code usfm="JUB" usfx="JU" osis="Jub" order_p="95" testament="AP" />
        <code usfm="ENO" usfx="EO" osis="1En" order_p="96" testament="AP" />
        <code usfm="1MQ" usfx="Q1" osis="1Meq" order_p="97" testament="AP" />
        <code usfm="2MQ" usfx="Q2" osis="2Meq" order_p="98" testament="AP" />
        <code usfm="3MQ" usfx="Q3" osis="3Meq" order_p="99" testament="AP" />
        <code usfm="REP" usfx="RP" osis="Rep" order_p="100" testament="AP" />
        <code usfm="4BA" usfx="B4" osis="4Bar" order_p="101" testament="AP" />
        <code usfm="LAO" usfx="LO" osis="EpLao" order_p="102" testament="AP" />
    </xsl:variable>

</xsl:stylesheet>
