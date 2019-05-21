
class Appointment {

  Appointment(int id, String name, String date, String time, String duration, String location) {
    this.id = id;
    this.name = name;
    this.date = date;
    this.time = time;
    this.duration = duration;
    this.location = location;
  }

  int id;
  String name;
  String date;
  String time;
  String duration;
  String location;


  factory Appointment.fromJson(Map<String, dynamic> appointment) =>
      Appointment(_toInt(appointment['id']),
          appointment['name'] as String,
          appointment['date']as String,
          appointment['time']as String,
          appointment['duration']as String,
          appointment['location']as String);

  Map toJson() => {'id': id, 'name': name, 'date': date, 'time': time, 'duration': duration, 'location': location};
}

int _toInt(id) => id is int ? id : int.parse(id as String);

