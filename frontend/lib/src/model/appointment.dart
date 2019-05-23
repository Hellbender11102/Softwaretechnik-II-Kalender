
class Appointment {

  // constructor
  Appointment(this.id, this.name, this.date, this.time, this.duration, this.location);

  int id;
  String name;
  String date;
  String time;
  String duration;
  String location;


    factory Appointment.fromJson(Map<String, dynamic> appointment) =>
      Appointment(_toInt(appointment['id']),
          appointment['name'],
          appointment['date'],
          appointment['time'],
          appointment['duration'],
          appointment['location']);

  Map toJson() => {'id': id, 'name': name, 'date': date, 'time': time, 'duration': duration, 'location': location};

  DateTime dateTimeGen() {
    var split = date.split("-");
    return DateTime.utc(
        int.parse(split[0]), int.parse(split[1]), int.parse(split[2]));
  }

  String getDate(){
    return date.substring(8,10)+"/"+date.substring(5,7)+"/"+date.substring(0,4);
}
}

int _toInt(id) => id is int ? id : int.parse(id as String);

