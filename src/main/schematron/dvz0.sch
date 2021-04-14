<?xml version="1.0" encoding="UTF-8"?>
<!--
   - Copyright © 2020 BITMARCK Service GmbH
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
<schema queryBinding="xslt2" xmlns="http://purl.oclc.org/dsdl/schematron">
    <ns prefix="dvz0" uri="https://xml.diga-ready.de/xsd/dvz0/v1"/>
    <pattern>
        <rule context="/dvz0:DigaVerzeichnis">
            <assert id="DVZ0-DV-1-1" test="count(dvz0:Diga) > 0"
            >Ein DiGA-Verzeichnis muss mindestens einen Datensatz enthalten (redundant).</assert>
        </rule>
        <rule context="/dvz0:DigaVerzeichnis/dvz0:Diga">
            <assert id="DVZ0-DV-2-1" test="substring(normalize-space(dvz0:DigaVeId), 1, 5) = normalize-space(dvz0:DigaId)"
            >Die ersten fünf Zeichen einer DiGA-VE-ID und die DiGA-ID müssen gleich sein.</assert>
        </rule>
        <rule context="/dvz0:DigaVerzeichnis/dvz0:Diga/dvz0:Geschlechter">
            <assert id="DVZ0-DV-3-1" test="normalize-space(.) != ''"
            >Eine Liste von Geschlechtern darf nicht leer sein.</assert>
        </rule>
        <rule context="/dvz0:DigaVerzeichnis/dvz0:Diga/dvz0:MaxAnwendungstage">
            <assert id="DVZ0-DV-4-1" test=". mod ../dvz0:Anwendungstage = 0"
            >Die maximale kontinuierliche Anwendungsdauer muss ein ganzzahliges Vielfaches der Anwendungsdauer sein.</assert>
        </rule>
    </pattern>
</schema>
