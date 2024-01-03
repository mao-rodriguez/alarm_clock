import 'package:alarm_clock/domain/entities/alarm.dart';
import 'package:flutter/material.dart';

class AlarmsProvider extends ChangeNotifier {
  List<Alarm> alarmsList = [];

  void addAlarm(Alarm alarm) {
    alarmsList.add(alarm);
    notifyListeners();
  }

  void deleteAlarm(int alarmId) {
    alarmsList.removeWhere((element) => element.alarmId == alarmId);
    notifyListeners();
  }
}
