<?xml version="1.0" encoding="UTF-8"?>
<schema queryBinding="xslt2" xmlns="http://purl.oclc.org/dsdl/schematron">
    <ns prefix="ccts" uri="urn:un:unece:uncefact:documentation:standard:CoreComponentsTechnicalSpecification:2"/>
    <ns prefix="qdt" uri="urn:un:unece:uncefact:data:standard:QualifiedDataType:100"/>
    <ns prefix="ram" uri="urn:un:unece:uncefact:data:standard:ReusableAggregateBusinessInformationEntity:100"/>
    <ns prefix="rsm" uri="urn:un:unece:uncefact:data:standard:CrossIndustryInvoice:100"/>
    <ns prefix="udt" uri="urn:un:unece:uncefact:data:standard:UnqualifiedDataType:100"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
    <pattern>
        <rule context="rsm:SupplyChainTradeTransaction">
            <assert id="DRE0-1" test="count(ram:IncludedSupplyChainTradeLineItem) = 1">
                Eine DiGA-Rechnung muss genau eine Position enthalten.
            </assert>
        </rule>
        <rule context="ram:IncludedSupplyChainTradeLineItem/ram:SpecifiedTradeProduct">
            <assert id="DRE0-2" test="ram:BuyerAssignedID[@schemeID='Freischaltcode']">
                Eine DiGA-Position muss einen Freischaltcode enthalten.
            </assert>
            <assert id="DRE0-3" test="ram:SellerAssignedID[@schemeID='DiGANr']">
                Eine DiGA-Position muss eine DiGA-Nummer enthalten.
            </assert>
            <assert id="DRE0-4" test="string-length(normalize-space(ram:Name)) > 0">
                Eine DiGA-Position muss einen DiGA-Namen enthalten.
            </assert>
        </rule>
        <rule context="ram:SpecifiedLineTradeDelivery">
            <assert id="DRE0-5" test="ram:BilledQuantity[@unitCode='DAY']">
                Die Verordnungsdauer muss in Tagen angegeben werden.
            </assert>
        </rule>
        <rule context="ram:ApplicableHeaderTradeAgreement">
            <assert id="DRE0-6" test="ram:SellerTradeParty/ram:ID[@schemeID='IK']">
                Eine DiGA-Rechnung muss das Institutionskennzeichen eines DiGA-Herstellers enthalten.
            </assert>
            <assert id="DRE0-7" test="ram:BuyerTradeParty/ram:ID[@schemeID='IK']">
                Eine DiGA-Rechnung muss das Institutionskennzeichen einer Krankenkasse enthalten.
            </assert>
        </rule>
    </pattern>
</schema>
