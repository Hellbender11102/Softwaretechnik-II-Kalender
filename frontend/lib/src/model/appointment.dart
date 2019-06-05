class Appointment {
  // constructor
  Appointment(this.id, this.name, this.year, this.month, this.day, this.time,
      this.duration, this.location);

  // leeres Appointment
  Appointment.zero();

  factory Appointment.fromJson(Map<String, dynamic> appointment) => Appointment(
      appointment['id'] as int,
      appointment['name'] as String,
      appointment['year'] as int,
      appointment['month'] as int,
      appointment['day'] as int,
      appointment['time'] as String,
      appointment['duration'] as String,
      appointment['location'] as String);

  List<String> contactCodes = [];
  int id;
  String name;
  int year;
  int month;
  int day;
  String time = "";
  String duration = "";
  String location;

  Map toJson() => {
        'id' :id,
        'name': name,
        'year': year,
        'month': month,
        "day": day,
        'time': time,
        'duration': duration,
        'location': location
      };

  ///date like 'yyyy-mm-dd'
  set date(String str) {
    final List<String> split = str.split("-");
    year = int.parse(split[0]);
    month = int.parse(split[1]);
    day = int.parse(split[2]);
  }

  String get date {
    return "$year-$month-$day";
  }
}

