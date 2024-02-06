import 'package:alarm_clock/domain/entities/alarm.dart';
import 'package:alarm_clock/presentation/providers/alarms_provider.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';
import 'package:alarm_clock/presentation/providers/time_provider.dart';
import 'dart:developer' as developer;

class NewAlarmForm extends StatelessWidget {
  NewAlarmForm({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static void _programmedTask() {
    DateTime currentDateTime = DateTime.now();
    developer.log("programmed: ${currentDateTime.toString()}");
  }

  @override
  Widget build(BuildContext context) {
    final timeProvider = context.watch<TimeProvider>();
    final alarmProvider = context.watch<AlarmsProvider>();
    return Scaffold(
      body: SafeArea(
        child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FormField(builder: (FormFieldState<int> state) {
                      /// Hour picker
                      return NumberPicker(
                        minValue: 1,
                        maxValue: 12,
                        value: timeProvider.hour,
                        onChanged: (value) => timeProvider.hour = value,
                      );
                    }),
                    FormField(
                      builder: (FormFieldState<int> state) {
                        /// Minute Picker
                        return NumberPicker(
                          minValue: 0,
                          maxValue: 59,
                          value: timeProvider.minute,
                          onChanged: (value) => timeProvider.minute = value,
                        );
                      },
                    ),

                    /// Format time: choose between AM or PM format.
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            timeProvider.timeFormat = "AM";
                          },
                          child: const Text("AM"),
                        ),
                        GestureDetector(
                          onTap: () {
                            timeProvider.timeFormat = "PM";
                          },
                          child: const Text("PM"),
                        ),
                      ],
                    )
                  ],
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        int random = Random().nextInt(500);
                        Alarm alarm = Alarm(
                            alarmId: random,
                            alarmName: 'Alarm No: $random',
                            alarmSound: 'Ughhhh',
                            alarmTime: TimeOfDay.now(),
                            time: timeProvider.currentTime);

                        alarmProvider.addAlarm(alarm);
                        DateTime alarmTime = DateTime(
                            DateTime.now().year,
                            DateTime.now().month,
                            DateTime.now().day,
                            timeProvider.format24Hour,
                            timeProvider.minute);
                        developer.log("Inicial: ${alarmTime.toString()}");

                        AndroidAlarmManager.periodic(
                          const Duration(minutes: 10), // Repeat every 24 hours
                          random, // Unique alarm ID 'Alarm triggered at ${alarmTime.hour}:${alarmTime.minute}'
                          _programmedTask,
                          startAt: alarmTime,
                          exact: true,
                          wakeup:
                              true, // Ensure the device wakes up to trigger the alarm
                          rescheduleOnReboot:
                              true, // Reschedule the alarm after device reboot
                        );
                        /*timeProvider.resetTimeProvider();
                        print(alarmTime.hour);*/
                      }
                    },
                    child: const Text("Save"))
              ],
            )),
      ),
    );
  }
}
