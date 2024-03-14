import 'package:alarm_clock/domain/AlarmService.dart';
import 'package:alarm_clock/domain/entities/alarm.dart';
import 'package:alarm_clock/domain/enums/time_format.dart';
import 'package:alarm_clock/presentation/providers/alarms_provider.dart';
import 'package:alarm_clock/presentation/widgets/alarmAlert.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';
import 'package:alarm_clock/domain/entities/time.dart';

class NewAlarmForm extends StatefulWidget {
  NewAlarmForm({super.key});
  final TextEditingController _alarmNameText = TextEditingController();
  final TextEditingController _alarmSound = TextEditingController();

  @override
  State<NewAlarmForm> createState() => _NewAlarmFormState();
}

class _NewAlarmFormState extends State<NewAlarmForm> {
  final _formKey = GlobalKey<FormState>();
  Time time = Time(hour: 6, minute: 0, timeFormat: TimeFormat.AM);
// TODO:  Terminar de ajustar el selector de formato de tiempo.
  @override
  Widget build(BuildContext context) {
    final alarmProvider = context.watch<AlarmsProvider>();
    var elevatedButton = ElevatedButton(
        onPressed: () {
          int random = Random().nextInt(500);
          Alarm alarm = Alarm(
              alarmId: random,
              alarmName: widget._alarmNameText.text,
              alarmSound: widget._alarmSound.text,
              time: Time.copy(time));
// TODO: Must sustract 1 from current date.
          alarmProvider.addAlarm(alarm);
          // AlarmService(alarm: alarm, random: random).periodic();
          showAlertDialog(context);
          _formKey.currentState!.reset();
          _formKey.currentState!.save();
          // Navigator.pop(context);
        },
        child: const Text("Save"));
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        FormField(
                          builder: (FormFieldState<int> state) {
                            /// Hour picker
                            return NumberPicker(
                              infiniteLoop: true,
                              zeroPad: true,
                              minValue: 1,
                              maxValue: 12,
                              value: time.hour,
                              textStyle: const TextStyle(
                                  color: Colors.grey, fontSize: 20),
                              selectedTextStyle: const TextStyle(
                                  color: Colors.white, fontSize: 32),
                              decoration: const BoxDecoration(
                                  border: Border(
                                      top: BorderSide(color: Colors.white),
                                      bottom: BorderSide(color: Colors.white))),
                              onChanged: (value) =>
                                  setState(() => time.hour = value),
                            );
                          },
                          onSaved: (value) => time.hour = 6,
                        ),
                        FormField(
                          builder: (FormFieldState<int> state) {
                            /// Minute Picker
                            return NumberPicker(
                              infiniteLoop: true,
                              zeroPad: true,
                              minValue: 0,
                              maxValue: 59,
                              value: time.minute,
                              textStyle: const TextStyle(
                                  color: Colors.grey, fontSize: 20),
                              selectedTextStyle: const TextStyle(
                                  color: Colors.white, fontSize: 32),
                              decoration: const BoxDecoration(
                                  border: Border(
                                      top: BorderSide(color: Colors.white),
                                      bottom: BorderSide(color: Colors.white))),
                              onChanged: (value) =>
                                  setState(() => time.minute = value),
                            );
                          },
                          onSaved: (value) => time.minute = 0,
                        ),

                        /// Format time: choose between AM or PM format.
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() => time.timeFormat = TimeFormat.AM);
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 16),
                                decoration: BoxDecoration(
                                    color: time.timeFormat == TimeFormat.AM
                                        ? Colors.grey.shade800
                                        : Colors.grey.shade600,
                                    border: Border.all(
                                        color: time.timeFormat == TimeFormat.AM
                                            ? Colors.grey
                                            : Colors.grey.shade400)),
                                child: const Text(
                                  "AM",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() => time.timeFormat = TimeFormat.PM);
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 16),
                                decoration: BoxDecoration(
                                    color: time.timeFormat == TimeFormat.PM
                                        ? Colors.grey.shade800
                                        : Colors.grey.shade600,
                                    border: Border.all(
                                        color: time.timeFormat == TimeFormat.PM
                                            ? Colors.grey
                                            : Colors.grey.shade400)),
                                child: const Text("PM",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22)),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  TextFormField(
                    controller: widget._alarmNameText,
                    decoration: const InputDecoration(
                      labelText: 'Alarm name',
                    ),
                  ),
                  TextFormField(
                    controller: widget._alarmSound,
                    decoration: const InputDecoration(
                      labelText: 'Alarm sound',
                    ),
                  ),
                  elevatedButton
                ],
              )),
        ),
      ),
    );
  }
}
