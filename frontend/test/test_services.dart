
import 'package:demo/src/view/services/appointment_service.dart';
import 'package:test/test.dart';
import 'package:demo/src/model/appointment.dart';

void main(){
  AppointmentService appointmentService;
  List<Appointment> appointments;
  Appointment appo =
  Appointment(1, "Abifaier", 2019, 6, 4, "2:30", "", "Lübeck", "hi");

  test("AppointmentService.creat appointment.getByDate",() async {
    await appointmentService.create(appo);
    appointments = await appointmentService.getByDate(appo.year, appo.month,appo.day);
    expect(appointments.contains(appo), true);
  });

  test("AppointmentService.update appointment.getByDate",() async {
    appointments = await appointmentService.getByDate(appo.year, appo.month,appo.day);
    int length = appointments.length;
    await appointmentService.update(Appointment(1, "KiezTour", 2019, 6, 4, "22:30", "", "Hamburg", "Lass mal nicht so spät anfangen."));
    appointments = await appointmentService.getByDate(appo.year, appo.month,appo.day);
    expect(appointments.length, length);
  });

  test("AppointmentService.delet getAll",() async {
    appointments = await appointmentService.getAll();
    int length = appointments.length;
    appointmentService.delete(appointments.last.id);
    appointments = await appointmentService.getAll();
    expect(appointments.length + 1, length);
  });
  test("AppointmentService.creat search",() async {
    await appointmentService.create(appo);
    appointments = await appointmentService.search(appo.name);
    expect(appointments.contains(appo), true);
  });

}