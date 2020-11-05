<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">

    <ns uri="http://www.xoev.de/de/validator/varl/1" prefix="rep"/>
    <ns uri="http://www.xoev.de/de/validator/framework/1/scenarios" prefix="s"/>

    <pattern>
        <rule context="rep:report">
            <assert test="@varlVersion='1.0.0'">VARL version must be 1.0.0.
            </assert>
        </rule>
    </pattern>

    <pattern>
        <rule context="rep:report[rep:noScenarioMatched]">
            <assert test="@valid='false'">If no scenario matched, then the report must be flagged invalid.</assert>
        </rule>
        <rule context="rep:report[rep:scenarioMatched/rep:validationStepResult[@valid = 'false']]">
            <assert test="@valid='false'">If any validation step has been flagged invalid, then the report must be
                flagged invalid.
            </assert>
        </rule>
        <rule context="rep:report[rep:scenarioMatched and empty(rep:scenarioMatched/rep:validationStepResult[@valid = 'false'])]">
            <assert test="@valid='true'">If a scenario matched and no validation step has been flagged invalid, then the
                report must be flagged valid.
            </assert>
        </rule>
    </pattern>

    <pattern>
        <rule context="rep:scenarioMatched[rep:validationStepResult[@id = 'val-xsd' and @valid='true']]">
            <assert test="rep:validationStepResult[@id = 'val-sch.1']">If xsd is valid then schematron checks have to be
                performed.
            </assert>
        </rule>
        <rule context="rep:scenarioMatched[rep:validationStepResult[@id = 'val-xsd' and @valid='false']]">
            <assert test="empty(rep:validationStepResult[@id = 'val-sch.1'])">If xsd is invalid then schematron checks
                must not be performed.
            </assert>
        </rule>
    </pattern>

    <pattern>
        <rule context="rep:validationStepResult[rep:message[@level=('error','warning')]]">
            <assert test="@valid = 'false'">If a validation step has errors or warnings, it must be flagged invalid.
            </assert>
        </rule>
        <rule context="rep:validationStepResult[not(rep:message[@level=('error','warning')])]">
            <assert test="@valid = 'true'">If a validation step has no errors or warnings, it must be flagged valid.
            </assert>
        </rule>
    </pattern>

    <pattern>
        <rule context="rep:message">
            <assert test="@lineNumber or @xpathLocation">Some kind of error location must be given.</assert>
        </rule>
    </pattern>
</schema>
