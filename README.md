[![Java CI](https://github.com/bitmarck-service/validator-configuration-diga/workflows/Java%20CI/badge.svg)](https://github.com/bitmarck-service/validator-configuration-diga/actions?query=workflow%3A%22Java+CI%22)

# KOSIT-Validator-Konfiguration für das DiGA-Fachverfahren

## Leistungsmerkmale

+ Validierung von Anfragen und Antworten für das Einlösen von Freischaltcodes gemäß Verfahrenskennzeichen EDFC0 und
  TDFC0.
+ Validierung von Anfragen und Antworten für das Einreichen von DiGA-Rechnungen auf Basis von EN16931 CIUS XRechnung 1.2
  (UN/CEFACT CII 100.D16B) gemäß Verfahrenskennzeichen EDRE0 und TDRE0.
+ Validierung von Stammdaten zu DiGAs und DiGA-Herstellern gemäß Verfahrenskennzeichen EDVZ0. 

### TODO:

+ Dokumentation mit Beispielen.
+ Automatische Tests. 

## Anforderungen

+ Java Runtime Environment, Version 1.8 oder später. 
+ [KOSIT-Validator](https://github.com/itplr-kosit/validator), Version 1.4.0 oder später.
+ [KOSIT-Validator-Konfiguration für XRechnung](https://github.com/itplr-kosit/validator-configuration-xrechnung),
  Version 1.2.2 oder 2.0.
