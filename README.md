# SWTII Cal

Wir (die Gruppe Mittwoch-15:15) haben uns dieses Semester für den Kalender entschieden. 
Hierbei liegt der Fokus auf Individualisierung und Übersichtlichkeit des Kalenders, was realisiert wird, indem jeder Tag farbliche Inhalte bekommt, welche Termine repräsentieren.
Diese Idee stammt aus dem vorherigen SWT Semester, indem wir auch schon als Gruppe gearbeitet haben.
Dieses Semester wollen wir das Konzept ausbauen und evtl sogar öffentlich machen.
Der Kalender wird hierbei als Web Dienst angeboten, welcher mit REST, Dart und html/css realisiert wird.
Die Website sollte dafür global aufrufbar sein und so wenig lokale Daten wie möglich erzeugen. Accounts sollen dafür auf dem Server liegen, samt Terminen und ähnlichem.
Die Darstellung erfolgt dann im ersten Schritt (html/css) anhand des Datums und Wochentagen und im zweiten Schritt werden die Termine vom Server geholt und in die Felder getragen.

Moin, um die Restfull APi zu intergrieren, brauchen wir noch ein Dart Modul, das nennt sich Aqueduct, ist eine Opensource Lösung um Dart und Rest zusammen zu legen.

Bei Fragen mich fragen( Marius ) oder dieser Anleitung folgen.
https://itnext.io/building-restful-web-apis-with-dart-aqueduct-and-postgresql-3cc9b931f777