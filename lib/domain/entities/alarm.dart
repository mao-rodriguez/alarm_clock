import 'package:flutter/material.dart';

class Alarm {
  final int alarmId;
  final String alarmName;
  final TimeOfDay alarmTime;
  final String alarmSound;

  Alarm(
      {required this.alarmId,
      required this.alarmName,
      required this.alarmTime,
      required this.alarmSound});
}
