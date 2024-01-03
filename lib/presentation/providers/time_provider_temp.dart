import 'package:alarm_clock/domain/entities/time_temp.dart';
import 'package:flutter/material.dart';

class TimeProvider extends ChangeNotifier {
  List<Time> timeList = [];

  void addAlarm(Time time) {
    timeList.add(time);
    notifyListeners();
  }
}
