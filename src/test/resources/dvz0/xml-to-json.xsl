<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="dvz"
                version="3.0"
                xmlns:dvz="https://xml.diga-ready.de/xsd/dvz0/v1"
                xmlns="http://www.w3.org/2005/xpath-functions"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text"/>
    <xsl:strip-space elements="*"/>
    <xsl:template match="/">
        <xsl:variable name="xml">
            <map>
                <xsl:apply-templates select="*"/>
            </map>
        </xsl:variable>
        <xsl:value-of select="xml-to-json($xml, map { 'indent': true() })"/>
    </xsl:template>
    <xsl:template match="dvz:DigaVerzeichnis | dvz:Indikationen | dvz:Kontraindikationen | dvz:Plattformen">
        <array key="{name()}">
            <xsl:apply-templates select="*"/>
        </array>
    </xsl:template>
    <xsl:template match="dvz:Diga | dvz:Plattform">
        <map>
            <xsl:apply-templates select="*"/>
        </map>
    </xsl:template>
    <xsl:template match="dvz:Hersteller">
        <map key="{name()}">
            <xsl:apply-templates select="*"/>
        </map>
    </xsl:template>
    <xsl:template match="dvz:Indikation">
        <string>
            <xsl:value-of select="."/>
        </string>
    </xsl:template>
    <xsl:template
            match="dvz:Pzn | dvz:DigaId | dvz:DigaVeId | dvz:Ik | dvz:AlterAb | dvz:AlterBis | dvz:AnwendungsTage">
        <number key="{name()}">
            <xsl:value-of select="."/>
        </number>
    </xsl:template>
    <xsl:template match="*">
        <string key="{name()}">
            <xsl:value-of select="."/>
        </string>
    </xsl:template>
</xsl:stylesheet>
