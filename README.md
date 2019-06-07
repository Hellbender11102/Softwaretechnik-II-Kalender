# SWTII Cal

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

Online https://projects.mylab.th-luebeck.de/calendar/#/login

// Entwicklickung:
!!!!ACHTUNG!!!!
ECHTE Zugangsdaten dürfen !NIEMALS! in einem Repository auftauchen.
Bitte nur zur lokalen Entwicklung nutzen.


SQL zum erstellen einer Datenbank,
    'password' und 'user' nach Wahl.
  
  
// entfernt alle aktuellen verbindungen zur db   
select pg_terminate_backend(pid) from pg_stat_activity where datname='calendar';
// löscht die Database
DROP DATABASE calendar
----------------------------------------------
CREATE USER cal_user WITH createdb;
ALTER USER cal_user WITH password 'password';
CREATE DATABASE calendar;
GRANT all ON database calendar TO cal_user;
----------------------------------------------
// dockercompose


docker-compose up --build

