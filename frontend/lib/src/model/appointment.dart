
class Appointment {

  // constructor
  Appointment(this.id, this.name, this.date, this.time, this.duration, this.location);

  int id;
  String name;
  String date;
  String time;
  String duration;
  String location;




  factory Appointment.fromJson(Map<int, String> appointment) =>
      Appointment(_toInt(appointment['id']),
          appointment['name'],
          appointment['date'],
          appointment['time'],
          appointment['duration'],
          appointment['location']);

  Map toJson() => {'id': id, 'name': name, 'date': date, 'time': time, 'duration': duration, 'location': location};
}

int _toInt(id) => id is int ? id : int.parse(id as String);

