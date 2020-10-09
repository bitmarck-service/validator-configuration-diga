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
        <rule context="rsm:ExchangedDocument">
            <assert id="DRE0-1" test="normalize-space(ram:TypeCode) = '380'">
                Eine DiGA-Rechnung muß vom Typ 380 (Commercial Invoice) sein.
            </assert>
        </rule>
        <rule context="rsm:SupplyChainTradeTransaction">
            <assert id="DRE0-2" test="count(ram:IncludedSupplyChainTradeLineItem) = 1">
                Eine DiGA-Rechnung muß genau eine Position enthalten.
            </assert>
        </rule>
        <rule context="ram:IncludedSupplyChainTradeLineItem/ram:SpecifiedTradeProduct">
            <assert id="DRE0-3" test="matches(normalize-space(ram:BuyerAssignedID[@schemeID='Freischaltcode']), '[A-Z2-7]{16}')">
                Eine DiGA-Position muß einen Freischaltcode mit exakt 16 Stellen enthalten.
            </assert>
            <assert id="DRE0-4" test="matches(normalize-space(ram:GlobalID[@schemeID='DiGAVEID']), '\d{8}')">
                Eine DiGA-Position muß eine DiGA-VE-ID mit exakt acht Stellen enthalten.
            </assert>
            <assert id="DRE0-5" test="string-length(normalize-space(ram:Name)) > 0">
                Eine DiGA-Position muß einen DiGA-Namen enthalten.
            </assert>
        </rule>
        <rule context="ram:SpecifiedLineTradeDelivery">
            <assert id="DRE0-6" test="ram:BilledQuantity[@unitCode='C62']">
                Die Abrechnungseinheit muß 'C62' (one) sein.
            </assert>
            <assert id="DRE0-7" test="ram:BilledQuantity = 1">
                Die Abrechnungsmenge muß eins sein.
            </assert>
        </rule>
        <rule context="ram:ApplicableHeaderTradeAgreement">
            <assert id="DRE0-8" test="string-length(normalize-space(ram:SellerTradeParty/ram:ID[@schemeID='IK'])) = 9">
                Eine DiGA-Rechnung muß das Institutionskennzeichen eines DiGA-Herstellers mit exakt neun Stellen enthalten.
            </assert>
            <assert id="DRE0-9" test="string-length(normalize-space(ram:BuyerTradeParty/ram:ID[@schemeID='IK'])) = 9">
                Eine DiGA-Rechnung muß das Institutionskennzeichen einer Krankenkasse mit exakt neun Stellen enthalten.
            </assert>
        </rule>
    </pattern>
</schema>
