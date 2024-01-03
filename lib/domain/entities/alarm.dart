import 'package:flutter/material.dart';

class Alarm {
  final int alarmId;
  final String alarmName;
  final TimeOfDay alarmTime;
  final String alarmSound;
  final int hour;
  final int minute;
  final String format;

  Alarm(
      {required this.hour,
      required this.minute,
      required this.format,
      required this.alarmId,
      required this.alarmName,
      required this.alarmTime,
      required this.alarmSound});
}
