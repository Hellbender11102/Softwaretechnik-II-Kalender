
class Appointment {

  Appointment(int id, String name, DateTime dateTime, String duration, String location) {
    this.id = id;
    this.name = name;
    this.dateTime = dateTime;
    this.duration = duration;
    this.location = location;
  }

  int id;
  String name;
  DateTime dateTime;
  String duration;
  String location;


  factory Appointment.fromJson(Map<String, dynamic> appointment) =>
      Appointment(_toInt(appointment['id']),
          appointment['name'],
          appointment['dateTime'],
          appointment['duration'],
          appointment['location']);

  Map toJson() => {'id': id, 'name': name, 'dateTime' : dateTime, 'duration': duration, 'location': location};
}

int _toInt(id) => id is int ? id : int.parse(id);

