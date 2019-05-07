
class Appointment {

  Appointment(int id, String name, String date, String time, String duration, String location) {
    this.id = id;
    this.name = name;
    this.date = date;
    this.time = time;
    this.duration = duration;
    this.location = location;
  }

  factory Appointment.fromJson(Map<int, String> appointment) =>
      Appointment(_toInt(appointment['id']),
          appointment['name'],
          appointment['date'],
          appointment['time'],
          appointment['duration'],
          appointment['location']);

  int id;
  String name;
  String date;
  String time;
  String duration;
  String location;

  Map toJson() => {'id': id, 'name': name, 'date': date, 'time': time, 'duration': duration, 'location': location};
}

int _toInt(id) => id is int ? id : int.parse(id as String);

