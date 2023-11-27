import 'package:alarm_clock/domain/entities/alarm.dart';
import 'package:flutter/material.dart';

class AlarmsProvider extends ChangeNotifier {
  List<Alarm> alarmsList = [
    Alarm(
        alarmId: 01,
        alarmName: 'Nueva alarma',
        alarmTime: TimeOfDay.now(),
        alarmSound: 'Iron Fist'),
    Alarm(
        alarmId: 02,
        alarmName: 'Madrugue',
        alarmTime: const TimeOfDay(hour: 06, minute: 55),
        alarmSound: 'Overkill'),
    Alarm(
        alarmId: 03,
        alarmName: 'Pasta',
        alarmTime: const TimeOfDay(hour: 17, minute: 32),
        alarmSound: 'Bomber'),
  ];

  void addAlarm(Alarm alarm) {
    alarmsList.add(alarm);
    notifyListeners();
  }

  void deleteAlarm(int alarmId) {
    alarmsList.removeWhere((element) => element.alarmId == alarmId);
    notifyListeners();
  }
}
