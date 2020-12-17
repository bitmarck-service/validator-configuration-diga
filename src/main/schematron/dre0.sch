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
    <ns prefix="ram" uri="urn:un:unece:uncefact:data:standard:ReusableAggregateBusinessInformationEntity:100"/>
    <ns prefix="rsm" uri="urn:un:unece:uncefact:data:standard:CrossIndustryInvoice:100"/>
    <ns prefix="udt" uri="urn:un:unece:uncefact:data:standard:UnqualifiedDataType:100"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
    <pattern>
        <rule context="rsm:ExchangedDocument">
            <assert id="DRE0-ED-1" test="normalize-space(ram:ID) != ''"
            >Eine DiGA-Rechnung muß eine Rechnungsnummer enthalten.</assert>
            <assert id="DRE0-ED-2" test="normalize-space(ram:TypeCode) = '380'"
            >Eine DiGA-Rechnung muß vom Typ 380 (Commercial Invoice) sein.</assert>
            <assert id="DRE0-ED-3" test="matches(normalize-space(ram:IssueDateTime/udt:DateTimeString[@format = '102']), '^\d{8}$')"
            >Eine DiGA-Rechnung muß ein Rechnungsdatum im Format '102' (JJJJMMTT) enthalten.</assert>
        </rule>
        <rule context="rsm:SupplyChainTradeTransaction">
            <assert id="DRE0-SCTT-1" test="count(ram:IncludedSupplyChainTradeLineItem) = 1"
            >Eine DiGA-Rechnung muß genau eine Position enthalten.</assert>
            <assert id="DRE0-SCTT-2" test="matches(normalize-space(ram:IncludedSupplyChainTradeLineItem/ram:SpecifiedTradeProduct/ram:GlobalID[@schemeID = 'DiGAVEID']), '^\d{8}$')"
            >Eine DiGA-Position muß eine DiGA-VE-ID mit exakt acht Stellen enthalten.</assert>
            <assert id="DRE0-SCTT-3" test="matches(normalize-space(ram:IncludedSupplyChainTradeLineItem/ram:SpecifiedTradeProduct/ram:BuyerAssignedID[@schemeID = 'Freischaltcode']), '^[A-Z2-7]{16}$')"
            >Eine DiGA-Position muß einen Freischaltcode mit exakt 16 Stellen enthalten.</assert>
            <assert id="DRE0-SCTT-4" test="normalize-space(ram:IncludedSupplyChainTradeLineItem/ram:SpecifiedTradeProduct/ram:Name) != ''"
            >Eine DiGA-Position muß einen DiGA-Namen enthalten.</assert>
            <assert id="DRE0-SCTT-5" test="matches(normalize-space(ram:IncludedSupplyChainTradeLineItem/ram:SpecifiedTradeProduct/ram:IndividualTradeProductInstance/ram:SellByDateTime/udt:DateTimeString[@format = '102']), '^\d{8}$') or matches(normalize-space(ram:ApplicableHeaderTradeDelivery/ram:ActualDeliverySupplyChainEvent/ram:OccurrenceDateTime/udt:DateTimeString[@format = '102']), '^\d{8}$')"
            >Eine DiGA-Rechnung muß den Tag der Leistungserbringung bzw. das Lieferdatum im Format "102" (JJJJMMTT) enthalten.</assert>
            <assert id="DRE0-SCTT-6" test="not(ram:IncludedSupplyChainTradeLineItem/ram:SpecifiedTradeProduct/ram:IndividualTradeProductInstance/ram:SellByDateTime/udt:DateTimeString[@format = '102'] and ram:ApplicableHeaderTradeDelivery/ram:ActualDeliverySupplyChainEvent/ram:OccurrenceDateTime/udt:DateTimeString[@format = '102']) or normalize-space(ram:IncludedSupplyChainTradeLineItem/ram:SpecifiedTradeProduct/ram:IndividualTradeProductInstance/ram:SellByDateTime/udt:DateTimeString[@format = '102']) = normalize-space(ram:ApplicableHeaderTradeDelivery/ram:ActualDeliverySupplyChainEvent/ram:OccurrenceDateTime/udt:DateTimeString[@format = '102'])"
            >Wenn der Tag der Leistungserbringung bzw. das Lieferdatum an verschiedenen Stellen angegeben ist, dann müssen diese Angaben übereinstimmen.</assert>
            <assert id="DRE0-SCTT-7" test="xs:decimal(ram:IncludedSupplyChainTradeLineItem/ram:SpecifiedLineTradeAgreement/ram:NetPriceProductTradePrice/ram:ChargeAmount) = xs:decimal(ram:IncludedSupplyChainTradeLineItem/ram:SpecifiedLineTradeSettlement/ram:SpecifiedTradeSettlementLineMonetarySummation/ram:LineTotalAmount)"
            >Der Einzelpreis einer DiGA und der Gesamtpreis der Rechnungsposition müssen gleich sein.</assert>
            <assert id="DRE0-SCTT-8" test="ram:IncludedSupplyChainTradeLineItem/ram:SpecifiedLineTradeDelivery/ram:BilledQuantity/@unitCode = 'C62'"
            >Die Abrechnungseinheit muß "C62" (one) sein.</assert>
            <assert id="DRE0-SCTT-9" test="normalize-space(ram:IncludedSupplyChainTradeLineItem/ram:SpecifiedLineTradeDelivery/ram:BilledQuantity) = '1'"
            >Die Abrechnungsmenge muß "1" sein.</assert>
        </rule>
        <rule context="ram:ApplicableHeaderTradeAgreement">
            <assert id="DRE0-AHTA-1" test="matches(normalize-space(ram:SellerTradeParty/ram:ID[@schemeID = 'IK']), '^\d{9}$')"
            >Eine DiGA-Rechnung muß das Institutionskennzeichen (IK) eines DiGA-Herstellers mit exakt neun Ziffern enthalten.</assert>
            <assert id="DRE0-AHTA-2" test="matches(normalize-space(ram:BuyerTradeParty/ram:ID[@schemeID = 'IK']), '^\d{9}$')"
            >Eine DiGA-Rechnung muß das Institutionskennzeichen (IK) einer Krankenkasse mit exakt neun Ziffern enthalten.</assert>
        </rule>
        <rule context="ram:ApplicableHeaderTradeSettlement">
            <assert id="DRE0-AHTS-4" test="matches(normalize-space(ram:CreditorReferenceID[@schemeID = 'IK']), '^\d{9}$')"
            >Eine DiGA-Rechnung muß das Institutionskennzeichen (IK) des Zahlungsempfängers mit exakt neun Ziffern enthalten.</assert>
            <assert id="DRE0-AHTS-1" test="not(ram:TaxCurrencyCode) or normalize-space(ram:TaxCurrencyCode) = 'EUR'"
            >Eine DiGA-Rechnung muß den Mehrwertsteuerbetrag in Euro (EUR) enthalten.</assert>
            <assert id="DRE0-AHTS-2" test="normalize-space(ram:InvoiceCurrencyCode) = 'EUR'"
            >Eine DiGA-Rechnung muß den Rechnungsbetrag in Euro (EUR) enthalten.</assert>
            <assert id="DRE0-AHTS-3" test="normalize-space(ram:SpecifiedTradeSettlementHeaderMonetarySummation/ram:TaxTotalAmount[@currencyID = 'EUR']) != ''"
            >Eine DiGA-Rechnung muß den Mehrwertsteuerbetrag in Euro (EUR) enthalten.</assert>
        </rule>
        <rule context="ram:SpecifiedTradePaymentTerms">
            <assert id="DRE0-STPT-1" test="count(ram:Description) = 1 and normalize-space(ram:Description) = ''"
            >In einer DiGA-Rechnung muss die Beschreibung der Zahlungsbedingungen leer sein.</assert>
            <assert id="DRE0-STPT-2" test="not(ram:DueDateDateTime)"
            >Eine DiGA-Rechnung darf kein Fälligkeitsdatum enthalten.</assert>
        </rule>
        <rule context="ram:SpecifiedTradeSettlementPaymentMeans">
            <assert id="DRE0-AHTS-4" test="not(ram:ApplicableTradeSettlementFinancialCard)"
            >Eine DiGA-Rechnung darf keine Informationen zur Kartenzahlung enthalten.</assert>
            <assert id="DRE0-AHTS-5" test="not(ram:PayerPartyDebtorFinancialAccount)"
            >Eine DiGA-Rechnung darf keine Informationen zum Konto des Debitors enthalten.</assert>
            <assert id="DRE0-AHTS-6" test="not(ram:PayeePartyCreditorFinancialAccount)"
            >Eine DiGA-Rechnung darf keine Informationen zum Konto des Kreditors enthalten.</assert>
            <assert id="DRE0-AHTS-7" test="not(ram:PayerSpecifiedDebtorFinancialInstitution)"
            >Eine DiGA-Rechnung darf keine Informationen zur Bank des Debitors enthalten.</assert>
            <assert id="DRE0-AHTS-8" test="not(ram:PayeeSpecifiedCreditorFinancialInstitution)"
            >Eine DiGA-Rechnung darf keine Informationen zur Bank des Kreditors enthalten.</assert>
        </rule>
    </pattern>
</schema>
