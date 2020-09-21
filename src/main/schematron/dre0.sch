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
    <ns prefix="ccts" uri="urn:un:unece:uncefact:documentation:standard:CoreComponentsTechnicalSpecification:2"/>
    <ns prefix="qdt" uri="urn:un:unece:uncefact:data:standard:QualifiedDataType:100"/>
    <ns prefix="ram" uri="urn:un:unece:uncefact:data:standard:ReusableAggregateBusinessInformationEntity:100"/>
    <ns prefix="rsm" uri="urn:un:unece:uncefact:data:standard:CrossIndustryInvoice:100"/>
    <ns prefix="udt" uri="urn:un:unece:uncefact:data:standard:UnqualifiedDataType:100"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
    <pattern>
        <rule context="rsm:SupplyChainTradeTransaction">
            <assert id="DRE0-1" test="count(ram:IncludedSupplyChainTradeLineItem) = 1">
                Eine DiGA-Rechnung muß genau eine Position enthalten.
            </assert>
        </rule>
        <rule context="ram:IncludedSupplyChainTradeLineItem/ram:SpecifiedTradeProduct">
            <assert id="DRE0-2" test="ram:BuyerAssignedID[@schemeID='Freischaltcode']">
                Eine DiGA-Position muß einen Freischaltcode enthalten.
            </assert>
            <assert id="DRE0-3" test="ram:GlobalID[@schemeID='DiGANr']">
                Eine DiGA-Position muß eine DiGA-Nummer enthalten.
            </assert>
            <assert id="DRE0-4" test="string-length(normalize-space(ram:Name)) > 0">
                Eine DiGA-Position muß einen DiGA-Namen enthalten.
            </assert>
        </rule>
        <rule context="ram:SpecifiedLineTradeDelivery">
            <assert id="DRE0-5" test="ram:BilledQuantity[@unitCode='DAY']">
                Die Verordnungsdauer muß in Tagen angegeben werden.
            </assert>
        </rule>
        <rule context="ram:ApplicableHeaderTradeAgreement">
            <assert id="DRE0-6" test="ram:SellerTradeParty/ram:ID[@schemeID='IK']">
                Eine DiGA-Rechnung muß das Institutionskennzeichen eines DiGA-Herstellers enthalten.
            </assert>
            <assert id="DRE0-7" test="ram:BuyerTradeParty/ram:ID[@schemeID='IK']">
                Eine DiGA-Rechnung muß das Institutionskennzeichen einer Krankenkasse enthalten.
            </assert>
        </rule>
    </pattern>
</schema>
