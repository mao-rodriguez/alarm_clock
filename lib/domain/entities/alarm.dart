import 'package:alarm_clock/domain/entities/time.dart';

class Alarm {
  Alarm(
      {required this.alarmId,
      required this.alarmName,
      required this.alarmSound,
      required this.time});

  final int alarmId;
  final String alarmName;
  final String alarmSound;
  final Time time;

  DateTime get dateTime {
    return DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, time.format24Hour, time.minute);
  }
}
