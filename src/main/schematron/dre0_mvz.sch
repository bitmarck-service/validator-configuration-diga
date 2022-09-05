<?xml version="1.0" encoding="UTF-8"?>
<!--
   - Copyright © 2022 ITSG GmbH
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
    <ns prefix="dre0" uri="http://www.gkv-datenaustausch.de/XML-Schema/EDRE0_MVZ/3.0"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
    <pattern>
        <rule context="dre0:Krankenkasseninformation">
            <assert id="DRE0-MVZ-1-1" test="not(@gueltig_bis) or @insolvenz = 'J' or @gueltig_bis and @nachfolge_kostentraegerkuerzel"
            >Wenn "gueltig_bis" gefüllt ist, muss "nachfolge_kostentraegerkuerzel" gefüllt sein. Ausnahme: "insolvenz=J"</assert>
        </rule>
    </pattern>
</schema>
