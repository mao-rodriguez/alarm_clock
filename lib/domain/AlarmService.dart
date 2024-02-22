import 'package:alarm_clock/domain/entities/alarm.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'dart:developer' as developer;

class AlarmService {
  int random;
  Alarm alarm;
  AlarmService({required this.random, required this.alarm});

  void periodic() {
    DateTime currentDateTime = DateTime.now();
    developer.log("programmed: ${currentDateTime.toString()}");
    AndroidAlarmManager.periodic(
      const Duration(minutes: 5), // Repeat every 24 hours
      random, // Unique alarm ID
      _programmedTask,
      startAt: alarm.dateTime,
      exact: true,
      wakeup: true, // Ensure the device wakes up to trigger the alarm
      rescheduleOnReboot: true, // Reschedule the alarm after device reboot
      allowWhileIdle: true,
    );
  }

  static void _programmedTask() {
    DateTime currentDateTime = DateTime.now();
    developer.log("programmed: ${currentDateTime.toString()}");
  }
}
