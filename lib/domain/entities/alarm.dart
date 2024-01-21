import 'package:alarm_clock/domain/entities/time.dart';
import 'package:flutter/material.dart';

class Alarm {
  final int alarmId;
  final String alarmName;
  final TimeOfDay alarmTime;
  final String alarmSound;
  final Time time;

  Alarm(
      {required this.alarmId,
      required this.alarmName,
      required this.alarmTime,
      required this.alarmSound,
      required this.time});
}
