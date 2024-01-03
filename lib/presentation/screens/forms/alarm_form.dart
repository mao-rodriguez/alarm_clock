import 'package:alarm_clock/domain/entities/alarm.dart';
import 'package:alarm_clock/presentation/providers/alarms_provider.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';
import 'package:alarm_clock/presentation/providers/number_provider_temp.dart';

class AlarmForm extends StatelessWidget {
  AlarmForm({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final numberProvider = context.watch<NumberProvider>();
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
                        minValue: 0,
                        maxValue: 12,
                        value: numberProvider.hour,
                        onChanged: (value) => numberProvider.hour = value,
                      );
                    }
                        // onSaved: ((value) => hour = value!),
                        ),
                    FormField(
                      builder: (FormFieldState<int> state) {
                        /// Minute Picker
                        return NumberPicker(
                            minValue: 0,
                            maxValue: 59,
                            value: numberProvider.minute,
                            onChanged: (value) =>
                                numberProvider.minute = value);
                      },
                      // onSaved: ((value) => minute = value!),
                    ),

                    /// Format time: choose between AM or PM format.
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            numberProvider.timeFormat = "AM";
                            print(numberProvider.timeFormat);
                          },
                          child: Container(child: const Text("AM")),
                        ),
                        GestureDetector(
                          onTap: () {
                            numberProvider.timeFormat = "PM";
                            print(numberProvider.timeFormat);
                          },
                          child: Container(child: const Text("PM")),
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
                            format: numberProvider.timeFormat,
                            hour: numberProvider.hour,
                            minute: numberProvider.minute);

                        alarmProvider.addAlarm(alarm);
                      }
                    },
                    child: const Text("Save"))
              ],
            )),
      ),
    );
  }
}
