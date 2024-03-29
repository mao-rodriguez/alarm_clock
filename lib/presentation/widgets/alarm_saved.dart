import 'package:alarm_clock/domain/entities/alarm.dart';
import 'package:flutter/material.dart';

class AlarmSaved extends StatelessWidget {
  const AlarmSaved({super.key, required this.alarm});
  final Alarm alarm;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: colors.primary, borderRadius: BorderRadius.circular(35)),
      child: Column(children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Text(
              alarm.alarmName,
              style: const TextStyle(color: Colors.black),
            )),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Text(
              "${alarm.time.hour}:${alarm.time.minute} ${alarm.time.timeFormat.name}",
              style: const TextStyle(color: Colors.black),
            )),
      ]),
    );
  }
}
