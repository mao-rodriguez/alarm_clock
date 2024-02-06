import 'package:alarm_clock/domain/entities/time.dart';
import 'package:flutter/material.dart';

class TimeProvider extends ChangeNotifier {
  Time time;

  TimeProvider() : time = Time(hour: 6, minute: 0, timeFormat: '');

  set hour(int value) {
    time.hour = value;
    notifyListeners();
  }

  int get hour => time.hour;

  set minute(int value) {
    time.minute = value;
    notifyListeners();
  }

  int get minute => time.minute;

  set timeFormat(String value) {
    time.timeFormat = value;
    notifyListeners();
  }

  String get timeFormat => time.timeFormat;

  /// Return new instance of Time object.
  Time get currentTime => Time.copy(time);

  /// Return the time in 24-hour format.
  int get format24Hour => time.format24Hour;

  /// Reset time provider.
  void resetTimeProvider() {
    time = Time(hour: 6, minute: 0, timeFormat: '');
    notifyListeners();
  }
}
