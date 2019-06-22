# SWTII Cal

________________________________________________________________________________
HOW TO SETUP:

Es entsteht c.a. 1GByte Traffic.


Vorbereitung: Die Docker INstanz sollte 2GB RAM haben, 1GB RAM haben, !!!! 
Mehr RAM beschleunigt den Prozess da weniger während des Build-Prozesses weniger PAGING auftritt.
Ab einem Punkt, ich weiß nicht wo, beschleunigt mehr RAM den Prozess nicht mehr.


1. Navigieren Sie im Terminal ind das Root_Verzeichnis des Projektes.

2. RUN: docker-compose up --build

3. Machen Sie sich einen Kaffee, kommen Sie in ("1-2"/"5-10")(2/1 GB RAM) Min zurück. 
    - während des kompilierens sehen Sie etwas wie:
        - "[WARNING] No actions completed for 25.0s, waiting on:".
    - Dadurch das der Build-Prozess nicht optimiert ist.
    - Kompilieren erzeugt "minified" Kompilat
        - "minified" bedeutet das auf Länge von Code optimiert wird.
        - Auswirkung: z.B. durch minimieren der Funktionsnamen, werden die Dateigrößen kleiner.
        
4. Rufen Sie diese Adresse auf: www.localhost:8080/calendar/index.html

5. Fertig.
________________________________________________________________________________



Wir (die Gruppe Mittwoch-15:15) haben uns dieses Semester für den Kalender entschieden. 
Hierbei liegt der Fokus auf Individualisierung und Übersichtlichkeit des Kalenders, was realisiert wird, indem jeder Tag farbliche Inhalte bekommt, welche Termine repräsentieren.
Diese Idee stammt aus dem vorherigen SWT Semester, indem wir auch schon als Gruppe gearbeitet haben.
Dieses Semester wollen wir das Konzept ausbauen und evtl sogar öffentlich machen.
Der Kalender wird hierbei als Web Dienst angeboten, welcher mit REST, Dart und html/css realisiert wird.
Die Website sollte dafür global aufrufbar sein und so wenig lokale Daten wie möglich erzeugen. Accounts sollen dafür auf dem Server liegen, samt Terminen und ähnlichem.
Die Darstellung erfolgt dann im ersten Schritt (html/css) anhand des Datums und Wochentagen und im zweiten Schritt werden die Termine vom Server geholt und in die Felder getragen.
Wir Verwenden für unser Projekt das Model der "Features Branches" und unsere Definition of Done lautet "Manuelle Tests und kommentiert".

Moin, um die Restfull APi zu intergrieren, brauchen wir noch ein Dart Modul, das nennt sich Aqueduct, ist eine Opensource Lösung um Dart und Rest zusammen zu legen.

Bei Fragen mich fragen( Marius ) oder dieser Anleitung folgen.
https://itnext.io/building-restful-web-apis-with-dart-aqueduct-and-postgresql-3cc9b931f777

Desweiteren haben wir uns dazu entschieden, uns immer Dienstags um 12.00 Uhr in der Uni zu treffen, um an dem Projekt weiter zu arbeiten. Weitere Termine Entscheiden wir von Woche zu Woche.


