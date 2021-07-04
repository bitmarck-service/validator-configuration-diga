<xsl:stylesheet exclude-result-prefixes="bas mvz"
                xmlns:bas="http://www.gkv-datenaustausch.de/XMLSchema/EDFC0-basis/1.0"
                xmlns:mvz="http://www.gkv-datenaustausch.de/XML-Schema/EDRE0_MVZ/1.0"
                xmlns="https://xml.diga-ready.de/xsd/kvz0/v1"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0">
    <xsl:output indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:template match="mvz:Kostentraeger_Mappingverzeichnis">
        <Krankenkasseninformationen version="1.0.0" gueltigab="2020-11-11">
            <xsl:apply-templates select="node()"/>
        </Krankenkasseninformationen>
    </xsl:template>
    <xsl:template match="bas:Kostentraegerkuerzel">
        <Krankenkassenkuerzel>
            <xsl:apply-templates select="@* | node()"/>
        </Krankenkassenkuerzel>
    </xsl:template>
    <xsl:template match="bas:Kostentraegerkennung">
        <IK_Krankenkasse>
            <xsl:apply-templates select="@* | node()"/>
        </IK_Krankenkasse>
    </xsl:template>
    <xsl:template match="bas:Name_des_Kostentraegers">
        <Name_Krankenkasse>
            <xsl:apply-templates select="@* | node()"/>
        </Name_Krankenkasse>
    </xsl:template>
    <xsl:template match="bas:IK_des_Rechnungsempfaengers"/>
    <xsl:template match="bas:IK_Abrechnungsstelle">
        <IK_Kommunikationsstelle>
            <xsl:apply-templates select="@* | node()"/>
        </IK_Kommunikationsstelle>
    </xsl:template>
    <xsl:template match="bas:EMail_Kostentraeger">
        <EMail_Krankenkasse>
            <xsl:apply-templates select="@* | node()"/>
        </EMail_Krankenkasse>
    </xsl:template>
    <xsl:template match="*">
        <xsl:element name="{local-name()}">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="@*">
        <xsl:attribute name="{local-name()}">
            <xsl:value-of select="."/>
        </xsl:attribute>
    </xsl:template>
    <xsl:template match="comment() | text() | processing-instruction()">
        <xsl:copy/>
    </xsl:template>
</xsl:stylesheet>
