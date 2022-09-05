<?xml version="1.0" encoding="UTF-8"?>
<!--
   - Copyright © 2020 - 2021 BITMARCK Service GmbH
   - Copyright © 2021 ITSG GmbH
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
    <ns prefix="dfc0" uri="http://www.gkv-datenaustausch.de/XML-Schema/EDFC0_Pruefung/1.0"/>
    <pattern>
        <rule context="/dfc0:Pruefung_Freischaltcode[@nachrichtentyp='ANF']">
            <assert id="DFC0-PF-1" test="dfc0:Anfrage"
            >Eine Anfrage muß das Element `Anfrage` enthalten.</assert>
        </rule>
        <rule context="/dfc0:Pruefung_Freischaltcode[@nachrichtentyp='ANT']">
            <assert id="DFC0-PF-2" test="dfc0:Antwort"
            >Eine Erfolgsmeldung muß das Element `Antwort` enthalten.</assert>
        </rule>
        <rule context="/dfc0:Pruefung_Freischaltcode[@nachrichtentyp='FEH']">
            <assert id="DFC0-PF-3" test="dfc0:Fehlerinformation"
            >Eine Fehlermeldung muß das Element `Fehlerinformation` enthalten.</assert>
        </rule>
    </pattern>
</schema>
