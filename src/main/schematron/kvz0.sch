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
    <ns prefix="kvz0" uri="https://xml.diga-ready.de/xsd/kvz0/v1"/>
    <pattern>
        <rule context="/kvz0:Krankenkasseninformationen">
            <assert id="KVZ0-K-1" test="count(kvz0:Krankenkasseninformation) > 0"
            >Ein Krankenkassenverzeichnis muss mindestens einen Datensatz enthalten (redundant).</assert>
        </rule>
<!--
        <rule context="kvz0:Krankenkasseninformation">
            <assert id="KVZ0-K-2" test="matches(normalize-space(kvz0:Endpunkt_Kommunikationsstelle), '^[a-z][a-z0-9-]*(\.[a-z][a-z0-9-]*)*$')"
            >Der Endpunkt der Kommunikationsstelle muss ein FQDN sein.</assert>
        </rule>
-->
    </pattern>
</schema>
