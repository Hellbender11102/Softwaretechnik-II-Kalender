
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


  factory Appointment.fromJson(Map<int, String> appointment) =>
      Appointment(_toInt(appointment['id']),
          appointment['name'],
          appointment['date'],
          appointment['time'],
          appointment['duration'],
          appointment['location']);

  Map toJson() => {'id': id, 'name': name, 'date': date, 'time': time, 'duration': duration, 'location': location};

  String getDate(){
    return date.substring(8,10)+"/"+date.substring(5,7)+"/"+date.substring(0,4);
}
}

int _toInt(id) => id is int ? id : int.parse(id as String);

