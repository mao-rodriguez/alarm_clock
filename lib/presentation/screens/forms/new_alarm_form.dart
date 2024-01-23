import 'package:alarm_clock/domain/entities/alarm.dart';
import 'package:alarm_clock/presentation/providers/alarms_provider.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';
import 'package:alarm_clock/presentation/providers/time_provider.dart';

class NewAlarmForm extends StatelessWidget {
  NewAlarmForm({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                    onPressed: () {
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
                        timeProvider.resetTimeProvider();
                      }
                    },
                    child: const Text("Save"))
              ],
            )),
      ),
    );
  }
}
