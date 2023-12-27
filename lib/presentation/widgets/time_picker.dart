import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class TimePicker extends StatefulWidget {
  const TimePicker({super.key});

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  var hour = 0;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      NumberPicker(
          minValue: 0,
          maxValue: 12,
          value: hour,
          onChanged: (value) => setState(() => hour = value))
    ]);
  }
}
