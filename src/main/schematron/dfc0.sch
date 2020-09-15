<?xml version="1.0" encoding="UTF-8"?>
<schema queryBinding="xslt2" xmlns="http://purl.oclc.org/dsdl/schematron">
    <ns prefix="dfc0" uri="http://www.gkv-datenaustausch.de/XML-Schema/EDFC0_Pruefung/1.0"/>
    <pattern>
        <rule context="/dfc0:Pruefung_Freischaltcode[@nachrichtentyp='ANF']">
            <assert id="DFC0-1" test="dfc0:Anfrage">
                Eine Anfrage muß das Element `Anfrage` enthalten.
            </assert>
        </rule>
        <rule context="/dfc0:Pruefung_Freischaltcode[@nachrichtentyp='ANT']">
            <assert id="DFC0-2" test="dfc0:Antwort">
                Eine Erfolgsmeldung muß das Element `Antwort` enthalten.
            </assert>
        </rule>
        <rule context="/dfc0:Pruefung_Freischaltcode[@nachrichtentyp='FEH']">
            <assert id="DFC0-3" test="dfc0:Fehlerinformation">
                Eine Fehlermeldung muß das Element `Fehlerinformation` enthalten.
            </assert>
        </rule>
    </pattern>
</schema>
