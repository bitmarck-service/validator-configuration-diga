[![XSLT CI](https://github.com/bitmarck-service/validator-configuration-diga/workflows/XSLT%20CI/badge.svg)](https://github.com/bitmarck-service/validator-configuration-diga/actions?query=workflow%3A%22XSLT+CI%22)

# DiGA-Konfiguration für den KoSIT Validator

Dieses Repository beinhaltet eine Konfiguration für den [KoSIT Validator](https://github.com/itplr-kosit/validator), die
für die Validierung aller Nachrichten geeignet ist die im Rahmen des DiGA-Fachverfahren ausgetauscht werden.

## Leistungsmerkmale

+ Validierung von Anfragen und Antworten für das Einlösen von Freischaltcodes gemäß Verfahrenskennzeichen EDFC0 und
  TDFC0.
+ Validierung von Anfragen und Antworten für das Einreichen von DiGA-Rechnungen auf Basis von EN16931 CIUS XRechnung 1.2
  oder XRechnung 2.0, jeweils in Ausprägung UN/CEFACT CII 100.D16B gemäß Verfahrenskennzeichen EDRE0 und TDRE0.
+ Validierung von Stammdaten zu DiGAs und DiGA-Herstellern gemäß Verfahrenskennzeichen EDVZ0. 

### TODO:

+ Automatische Tests

## Anforderungen

+ Java Runtime Environment, Version 1.8 oder später. 
+ Optional: [Apache Ant](https://ant.apache.org), Version 1.10.9 oder später.

## Empfohlen: Bauen der Konfiguration

Fertige Konfigurationen können von der GitHub action
[XSLT CI](https://github.com/bitmarck-service/validator-configuration-diga/actions?query=workflow%3A%22XSLT+CI%22)
bezogen werden.
Zum Selber-Bauen des aktuellen Commits benötigen Sie Apache Ant.
Die Konfiguration können Sie mit dem folgenden Befehl bauen:

    $ ant

Das Ergebnis befindet sich dann in `build/config`.

## Beispiele

Die folgenden Beispiele gehen von einer selbstgebauten Konfiguration aus (siehe oben).
Falls Sie eine fertige Konfiguration heruntergeladen haben, müssen Sie selbst die externen Abhängigkeiten bereitstellen
und alle Pfadangaben entsprechend ändern.

### Anfragen zum Einlösen des Freischaltcodes

```bash
$ java -jar lib/validationtool-1.4.1-standalone.jar -h -s build/config/scenarios.xml -o build/test src/test/resources/dfc0/ANF.xml 
KoSIT Validator version 1.4.1
Loading scenarios from  file:///Users/christian/projects/bitmarck-service/validator-configuration-diga/build/config/scenarios.xml
Using repository  null
Loaded "DiGA-Konfiguration für den KoSIT Validator" by BITMARCK Service GmbH from 2020-09-15 

The following scenarios are available:
  * DiGA Freischaltcode (DFC0), Version 2.0.0
  * DiGA-Rechnung (DRE0-Anfrage) basierend auf EN16931 CIUS XRechnung (UN/CEFACT CII 100.D16B)
  * Prüfbericht für DiGA-Rechnung (DRE0-Antwort)
  * DiGA-Verzeichnis, Version 1.0.0 (DVZ0)

Processing of 1 objects started
Processing of 1 objects completed in 136ms
Results:
----------------------------------------------------------------------------------------------------------------
|filename                                                    |Schema |Schematron|Acceptance|Error/Description   |
|/Users/christian/projects/bitmarck-service/validator-conf...|   Y   |    Y     |ACCEPTABLE|                    |
|ration-diga/src/test/resources/dfc0/ANF.xml                 |       |          |          |                    |
----------------------------------------------------------------------------------------------------------------
Acceptable:  1  Rejected:  0


##############################
#   Validation succesful!    #
##############################
$ open build/test/ANF-report.html
```

Der `open`-Befehl dient zur Anzeige des detaillierten HTML-Prüfberichts.
In diesem Beispiel wird das XML-Dokument akzeptiert.

### Antworten zum Einlösen des Freischaltcodes

```bash
$ java -jar lib/validationtool-1.4.1-standalone.jar -h -s build/config/scenarios.xml -o build/test src/test/resources/dfc0/{ANT,FEH}*.xml 
KoSIT Validator version 1.4.1
Loading scenarios from  file:///Users/christian/projects/bitmarck-service/validator-configuration-diga/build/config/scenarios.xml
Using repository  null
Loaded "DiGA-Konfiguration für den KoSIT Validator" by BITMARCK Service GmbH from 2020-09-15 

The following scenarios are available:
  * DiGA Freischaltcode (DFC0), Version 2.0.0
  * DiGA-Rechnung (DRE0-Anfrage) basierend auf EN16931 CIUS XRechnung (UN/CEFACT CII 100.D16B)
  * Prüfbericht für DiGA-Rechnung (DRE0-Antwort)
  * DiGA-Verzeichnis, Version 1.0.0 (DVZ0)

Processing of 7 objects started
Processing of 7 objects completed in 229ms
Results:
----------------------------------------------------------------------------------------------------------------
|filename                                                    |Schema |Schematron|Acceptance|Error/Description   |
|/Users/christian/projects/bitmarck-service/validator-conf...|   Y   |    Y     |ACCEPTABLE|                    |
|ration-diga/src/test/resources/dfc0/ANT.xml                 |       |          |          |                    |
|/Users/christian/projects/bitmarck-service/validator-conf...|   Y   |    Y     |ACCEPTABLE|                    |
|ration-diga/src/test/resources/dfc0/FEH-100.xml             |       |          |          |                    |
|/Users/christian/projects/bitmarck-service/validator-conf...|   Y   |    Y     |ACCEPTABLE|                    |
|ration-diga/src/test/resources/dfc0/FEH-101.xml             |       |          |          |                    |
|/Users/christian/projects/bitmarck-service/validator-conf...|   Y   |    Y     |ACCEPTABLE|                    |
|ration-diga/src/test/resources/dfc0/FEH-102.xml             |       |          |          |                    |
|/Users/christian/projects/bitmarck-service/validator-conf...|   Y   |    Y     |ACCEPTABLE|                    |
|ration-diga/src/test/resources/dfc0/FEH-200.xml             |       |          |          |                    |
|/Users/christian/projects/bitmarck-service/validator-conf...|   Y   |    Y     |ACCEPTABLE|                    |
|ration-diga/src/test/resources/dfc0/FEH-201.xml             |       |          |          |                    |
|/Users/christian/projects/bitmarck-service/validator-conf...|   Y   |    Y     |ACCEPTABLE|                    |
|ration-diga/src/test/resources/dfc0/FEH-202.xml             |       |          |          |                    |
----------------------------------------------------------------------------------------------------------------
Acceptable:  7  Rejected:  0


##############################
#   Validation succesful!    #
##############################
$ open build/test/ANT-report.html 
```

Der `open`-Befehl dient wiederum zur Anzeige des detaillierten HTML-Prüfberichts.
Auch in diesem Beispiel werden alle XML-Dokumente akzeptiert, inklusive der Antwort und der Fehlerinformationen.

### Einreichen von DiGA-Rechnungen auf Basis von XRechnung 1.2

#### Schritt 1 - Validierung gegen XRechnung 1.2

```bash
$ java -jar lib/validationtool-1.4.1-standalone.jar -h -s lib/xrechnung_1.2.2/scenarios.xml -o build/test src/test/resources/dre0/xrechnung-1.2-*.xml
KoSIT Validator version 1.4.1
Loading scenarios from  file:///Users/christian/projects/bitmarck-service/validator-configuration-diga/lib/xrechnung_1.2.2/scenarios.xml
Using repository  null
Loaded "Prüftool-Konfiguration XRechnung 1.2.2" by KoSIT from 2019-12-30 

The following scenarios are available:
  * EN16931 CIUS XRechnung (UBL Invoice)
  * EN16931 CIUS XRechnung (UBL CreditNote)
  * EN16931 CIUS XRechnung (CII)

Processing of 2 objects started
Processing of 2 objects completed in 250ms
Results:
----------------------------------------------------------------------------------------------------------------
|filename                                                    |Schema |Schematron|Acceptance|Error/Description   |
|/Users/christian/projects/bitmarck-service/validator-conf...|   Y   |    Y     |ACCEPTABLE|                    |
|ration-diga/src/test/resources/dre0/xrechnung-1.2-falsch.xml|       |          |          |                    |
|/Users/christian/projects/bitmarck-service/validator-conf...|   Y   |    Y     |ACCEPTABLE|                    |
|ration-diga/src/test/resources/dre0/xrechnung-1.2-richtig.xm|       |          |          |                    |
|l                                                           |       |          |          |                    |
----------------------------------------------------------------------------------------------------------------
Acceptable:  2  Rejected:  0


##############################
#   Validation succesful!    #
##############################
$ open build/test/xrechnung-1.2-richtig-report.html
```

Der `open`-Befehl dient zur Anzeige des detaillierten HTML-Prüfberichts.
In diesem Beispiel werden beide Dokumente akzeptiert - es handelt sich zunächst um gültige XRechnungen gemäß Version
1.2.

#### Schritt 2 - Validierung gegen DiGA-Rechnung

```bash
$ java -jar lib/validationtool-1.4.1-standalone.jar -h -s build/config/scenarios.xml -o build/test src/test/resources/dre0/xrechnung-1.2-*.xml
KoSIT Validator version 1.4.1
Loading scenarios from  file:///Users/christian/projects/bitmarck-service/validator-configuration-diga/build/config/scenarios.xml
Using repository  null
Loaded "DiGA-Konfiguration für den KoSIT Validator" by BITMARCK Service GmbH from 2020-09-15 

The following scenarios are available:
  * DiGA Freischaltcode (DFC0), Version 2.0.0
  * DiGA-Rechnung (DRE0-Anfrage) basierend auf EN16931 CIUS XRechnung (UN/CEFACT CII 100.D16B)
  * Prüfbericht für DiGA-Rechnung (DRE0-Antwort)
  * DiGA-Verzeichnis, Version 1.0.0 (DVZ0)

Processing of 2 objects started
Processing of 2 objects completed in 220ms
Results:
--------------------------------------------------------------------------------------------------------------------------------------------------------
|filename                                                    |Schema |Schematron|Acceptance|Error/Description                                           |
|/Users/christian/projects/bitmarck-service/validator-conf...|   Y   |    N     |  REJECT  |Eine DiGA-Position muß eine DiGA-VE-ID mit exakt acht Stelle|
|ration-diga/src/test/resources/dre0/xrechnung-1.2-falsch.xml|       |          |          |n enthalten.;Eine DiGA-Position muß einen Freischaltcode mit|
|                                                            |       |          |          | exakt 16 Stellen enthalten.;Eine DiGA-Rechnung muß den T...|
|/Users/christian/projects/bitmarck-service/validator-conf...|   Y   |    Y     |ACCEPTABLE|                                                            |
|ration-diga/src/test/resources/dre0/xrechnung-1.2-richtig.xm|       |          |          |                                                            |
|l                                                           |       |          |          |                                                            |
--------------------------------------------------------------------------------------------------------------------------------------------------------
Acceptable:  1  Rejected:  1


##############################
#     Validation failed!     #
##############################
$ open build/test/xrechnung-1.2-falsch-report.html
```

Eine der beiden Rechnungen wird abgelehnt, da sie nicht die Anforderungen an eine DiGA-Rechnung erfüllt.
Der `open`-Befehl dient zur Anzeige des detaillierten HTML-Prüfberichts für das fehlerhafte Dokument.

### Prüfberichte zur DiGA-Rechnung auf Basis von XRechnung 1.2

Auch der im vorigen Schritt erzeugte Prüfbericht lässt sich wiederum validieren:

```bash
$ java -jar lib/validationtool-1.4.1-standalone.jar -h -s build/config/scenarios.xml -o build/test build/test/xrechnung-1.2-falsch-report.xml 
KoSIT Validator version 1.4.1
Loading scenarios from  file:///Users/christian/projects/bitmarck-service/validator-configuration-diga/build/config/scenarios.xml
Using repository  null
Loaded "DiGA-Konfiguration für den KoSIT Validator" by BITMARCK Service GmbH from 2020-09-15 

The following scenarios are available:
  * DiGA Freischaltcode (DFC0), Version 2.0.0
  * DiGA-Rechnung (DRE0-Anfrage) basierend auf EN16931 CIUS XRechnung (UN/CEFACT CII 100.D16B)
  * Prüfbericht für DiGA-Rechnung (DRE0-Antwort)
  * DiGA-Verzeichnis, Version 1.0.0 (DVZ0)

Processing of 1 objects started
Processing of 1 objects completed in 250ms
Results:
----------------------------------------------------------------------------------------------------------------
|filename                                                    |Schema |Schematron|Acceptance|Error/Description   |
|/Users/christian/projects/bitmarck-service/validator-conf...|   Y   |    Y     |ACCEPTABLE|                    |
|ration-diga/build/test/xrechnung-1.2-falsch-report.xml      |       |          |          |                    |
----------------------------------------------------------------------------------------------------------------
Acceptable:  1  Rejected:  0


##############################
#   Validation succesful!    #
##############################
$ open build/test/xrechnung-1.2-falsch-report-report.html 
```

Der `open`-Befehl dient zur Anzeige des detaillierten HTML-Prüfberichts für den im vorigen Schritt erzeugten
XML-Prüfbericht. 

### Einreichen von DiGA-Rechnungen auf Basis von XRechnung 2.0

#### Schritt 1 - Validierung gegen XRechnung 2.0

```bash
$ java -jar lib/validationtool-1.4.0-standalone.jar -h -s lib/xrechnung_2.0.0/scenarios.xml -o build/test src/test/resources/dre0/xrechnung-2.0-*.xml
KoSIT Validator version 1.4.0
Loading scenarios from  file:///Users/christian/projects/bitmarck-service/validator-configuration-diga/lib/xrechnung_2.0.0/scenarios.xml
Using repository  null
Loaded "Validator Configuration XRechnung 2.0.0" by Coordination Office for IT Standards (KoSIT) from 2020-08-06 

The following scenarios are available:
  * EN16931 XRechnung (UBL Invoice)
  * EN16931 XRechnung (UBL CreditNote)
  * EN16931 XRechnung (CII)
  * EN16931 (UBL Invoice)
  * EN16931 (UBL CreditNote)
  * EN16931 (CII)

Processing of 2 objects started
Processing of 2 objects completed in 276ms
Results:
----------------------------------------------------------------------------------------------------------------
|filename                                                    |Schema |Schematron|Acceptance|Error/Description   |
|/Users/christian/projects/bitmarck-service/validator-conf...|   Y   |    Y     |ACCEPTABLE|                    |
|ration-diga/src/test/resources/dre0/xrechnung-2.0-falsch    |       |          |          |                    |
|.xml                                                        |       |          |          |                    |
|/Users/christian/projects/bitmarck-service/validator-conf...|   Y   |    Y     |ACCEPTABLE|                    |
|ration-diga/src/test/resources/dre0/xrechnung-2.0-richti    |       |          |          |                    |
|g.xml                                                       |       |          |          |                    |
----------------------------------------------------------------------------------------------------------------
Acceptable:  2  Rejected:  0


##############################
#   Validation succesful!    #
##############################
$ open build/test/xrechnung-2.0-richtig-report.html 
```

Der `open`-Befehl dient wieder zur Anzeige des detaillierten HTML-Prüfberichts.
Auch in diesem Beispiel werden beide Dokumente akzeptiert - es handelt sich zunächst um gültige XRechnungen gemäß
Version 2.0.

#### Schritt 2 - Validierung gegen DiGA-Rechnung

```bash
$ java -jar lib/validationtool-1.4.1-standalone.jar -h -s build/config/scenarios.xml -o build/test src/test/resources/dre0/xrechnung-2.0-*.xml
KoSIT Validator version 1.4.1
Loading scenarios from  file:///Users/christian/projects/bitmarck-service/validator-configuration-diga/build/config/scenarios.xml
Using repository  null
Loaded "DiGA-Konfiguration für den KoSIT Validator" by BITMARCK Service GmbH from 2020-09-15 

The following scenarios are available:
  * DiGA Freischaltcode (DFC0), Version 2.0.0
  * DiGA-Rechnung (DRE0-Anfrage) basierend auf EN16931 CIUS XRechnung (UN/CEFACT CII 100.D16B)
  * Prüfbericht für DiGA-Rechnung (DRE0-Antwort)
  * DiGA-Verzeichnis, Version 1.0.0 (DVZ0)

Processing of 2 objects started
Processing of 2 objects completed in 216ms
Results:
--------------------------------------------------------------------------------------------------------------------------------------------------------
|filename                                                    |Schema |Schematron|Acceptance|Error/Description                                           |
|/Users/christian/projects/bitmarck-service/validator-conf...|   Y   |    N     |  REJECT  |Eine DiGA-Position muß eine DiGA-VE-ID mit exakt acht Stelle|
|ration-diga/src/test/resources/dre0/xrechnung-2.0-falsch.xml|       |          |          |n enthalten.;Eine DiGA-Position muß einen Freischaltcode mit|
|                                                            |       |          |          | exakt 16 Stellen enthalten.;Eine DiGA-Rechnung muß den T...|
|/Users/christian/projects/bitmarck-service/validator-conf...|   Y   |    Y     |ACCEPTABLE|                                                            |
|ration-diga/src/test/resources/dre0/xrechnung-2.0-richtig.xm|       |          |          |                                                            |
|l                                                           |       |          |          |                                                            |
--------------------------------------------------------------------------------------------------------------------------------------------------------
Acceptable:  1  Rejected:  1


##############################
#     Validation failed!     #
##############################
$ open build/test/xrechnung-2.0-falsch-report.html 
```

Wiederum wird eine der beiden Rechnungen abgelehnt, da sie nicht die Anforderungen an eine DiGA-Rechnung erfüllt.
Der `open`-Befehl dient zur Anzeige des detaillierten HTML-Prüfberichts für das fehlerhafte Dokument.

### Prüfberichte zur DiGA-Rechnung auf Basis von XRechnung 2.0

Auch der im vorigen Schritt erzeugte Prüfbericht lässt sich wiederum validieren:

```bash
$ java -jar lib/validationtool-1.4.1-standalone.jar -h -s build/config/scenarios.xml -o build/test build/test/xrechnung-2.0-falsch-report.xml 
KoSIT Validator version 1.4.1
Loading scenarios from  file:///Users/christian/projects/bitmarck-service/validator-configuration-diga/build/config/scenarios.xml
Using repository  null
Loaded "DiGA-Konfiguration für den KoSIT Validator" by BITMARCK Service GmbH from 2020-09-15 

The following scenarios are available:
  * DiGA Freischaltcode (DFC0), Version 2.0.0
  * DiGA-Rechnung (DRE0-Anfrage) basierend auf EN16931 CIUS XRechnung (UN/CEFACT CII 100.D16B)
  * Prüfbericht für DiGA-Rechnung (DRE0-Antwort)
  * DiGA-Verzeichnis, Version 1.0.0 (DVZ0)

Processing of 1 objects started
Processing of 1 objects completed in 257ms
Results:
----------------------------------------------------------------------------------------------------------------
|filename                                                    |Schema |Schematron|Acceptance|Error/Description   |
|/Users/christian/projects/bitmarck-service/validator-conf...|   Y   |    Y     |ACCEPTABLE|                    |
|ration-diga/build/test/xrechnung-2.0-falsch-report.xml      |       |          |          |                    |
----------------------------------------------------------------------------------------------------------------
Acceptable:  1  Rejected:  0


##############################
#   Validation succesful!    #
##############################
$ open build/test/xrechnung-2.0-falsch-report-report.html 
```

Wiederum dient der `open`-Befehl zur Anzeige des detaillierten HTML-Prüfberichts für den im vorigen Schritt erzeugten
XML-Prüfbericht. 

### Stammdaten aus dem DiGA-Verzeichnis

```bash
$ java -jar lib/validationtool-1.4.1-standalone.jar -h -s build/config/scenarios.xml -o build/test src/test/resources/dvz0/diga-verzeichnis.xml 
KoSIT Validator version 1.4.1
Loading scenarios from  file:///Users/christian/projects/bitmarck-service/validator-configuration-diga/build/config/scenarios.xml
Using repository  null
Loaded "DiGA-Konfiguration für den KoSIT Validator" by BITMARCK Service GmbH from 2020-09-15 

The following scenarios are available:
  * DiGA Freischaltcode (DFC0), Version 2.0.0
  * DiGA-Rechnung (DRE0-Anfrage) basierend auf EN16931 CIUS XRechnung (UN/CEFACT CII 100.D16B)
  * Prüfbericht für DiGA-Rechnung (DRE0-Antwort)
  * DiGA-Verzeichnis, Version 1.0.0 (DVZ0)

Processing of 1 objects started
Processing of 1 objects completed in 135ms
Results:
----------------------------------------------------------------------------------------------------------------
|filename                                                    |Schema |Schematron|Acceptance|Error/Description   |
|/Users/christian/projects/bitmarck-service/validator-conf...|   Y   |    Y     |ACCEPTABLE|                    |
|ration-diga/src/test/resources/dvz0/diga-verzeichnis.xml    |       |          |          |                    |
----------------------------------------------------------------------------------------------------------------
Acceptable:  1  Rejected:  0


##############################
#   Validation succesful!    #
##############################
$ open build/test/diga-verzeichnis-report.html 
```

Auch in diesem Beispiel dient der `open`-Befehl zur Anzeige des detaillierten HTML-Prüfberichts.
