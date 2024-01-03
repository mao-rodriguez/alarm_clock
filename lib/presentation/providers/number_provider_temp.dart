import 'package:flutter/material.dart';

class NumberProvider extends ChangeNotifier {
  int _hour = 0;
  int _minute = 0;
  String _timeFormat = '';

  set hour(int value) {
    _hour = value;
    notifyListeners();
  }

  int get hour => _hour;

  set minute(int value) {
    _minute = value;
    notifyListeners();
  }

  int get minute => _minute;

  set timeFormat(String value) {
    _timeFormat = value;
    notifyListeners();
  }

  String get timeFormat => _timeFormat;
}
