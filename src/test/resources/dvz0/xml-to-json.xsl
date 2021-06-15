<?xml version="1.0" encoding="UTF-8"?>
<!--
  - Copyright © 2021 BITMARCK Service GmbH
  -
  - Licensed under the Apache License, Version 2.0 (the "License");
  - you may not use this file except in compliance with the License.
  - You may obtain a copy of the License at
  -
  -     http://www.apache.org/licenses/LICENSE-2.0
  -
  - Unless required by applicable law or agreed to in writing, software
  - distributed under the License is distributed on an "AS IS" BASIS,
  - WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  - See the License for the specific language governing permissions and
  - limitations under the License.
  -->
<xsl:stylesheet version="3.0"
                xmlns="http://www.w3.org/2005/xpath-functions"
                xmlns:dvz="https://xml.diga-ready.de/xsd/dvz0/v2"
                xmlns:map="http://www.w3.org/2005/xpath-functions/map"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text"/>
    <xsl:template match="/">
        <xsl:variable name="xml">
            <map>
                <xsl:apply-templates select="*"/>
            </map>
        </xsl:variable>
        <xsl:value-of select="xml-to-json($xml, map:entry('indent', true()))"/>
    </xsl:template>
    <xsl:template match="dvz:DigaVerzeichnis">
        <array key="{name()}">
            <xsl:apply-templates select="*"/>
        </array>
    </xsl:template>
    <xsl:template match="dvz:Diga">
        <map>
            <xsl:apply-templates
                    select="dvz:Anwendungstage | dvz:Beschreibung | dvz:Details | dvz:DigaId | dvz:DigaVeId"/>
            <array key="Freigaben">
                <xsl:apply-templates select="dvz:Freigabe"/>
            </array>
            <xsl:apply-templates select="dvz:GültigAb | dvz:GültigBis | dvz:Hersteller | dvz:Homepage"/>
            <array key="Indikationen">
                <xsl:apply-templates select="dvz:Indikation"/>
            </array>
            <array key="Kategorien">
                <xsl:apply-templates select="dvz:Kategorie"/>
            </array>
            <array key="Kontraindikationen">
                <xsl:apply-templates select="dvz:Kontraindikation"/>
            </array>
            <xsl:apply-templates select="dvz:Name | dvz:Packungspreis"/>
            <array key="Plattformen">
                <xsl:apply-templates select="dvz:Plattform"/>
            </array>
            <xsl:apply-templates select="dvz:Pzn | dvz:Zulassungsbeginn | dvz:Zulassungsende"/>
        </map>
    </xsl:template>
    <xsl:template match="dvz:Freigabe | dvz:Plattform">
        <map>
            <xsl:apply-templates select="*"/>
        </map>
    </xsl:template>
    <xsl:template match="dvz:Hersteller">
        <map key="{name()}">
            <xsl:apply-templates select="*"/>
        </map>
    </xsl:template>
    <xsl:template match="dvz:Anwendungstage | dvz:AlterAb | dvz:AlterBis">
        <number key="{name()}">
            <xsl:value-of select="."/>
        </number>
    </xsl:template>
    <xsl:template match="dvz:Indikation | dvz:Kategorie | dvz:Kontraindikation">
        <string>
            <xsl:value-of select="."/>
        </string>
    </xsl:template>
    <xsl:template match="*">
        <string key="{name()}">
            <xsl:value-of select="."/>
        </string>
    </xsl:template>
</xsl:stylesheet>
