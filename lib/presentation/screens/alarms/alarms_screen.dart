import 'package:alarm_clock/domain/entities/alarm.dart';
import 'package:alarm_clock/presentation/screens/forms/alarm_form.dart';
import 'package:alarm_clock/presentation/providers/alarms_provider.dart';
import 'package:alarm_clock/presentation/widgets/alarm_saved.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AlarmsScreen extends StatelessWidget {
  const AlarmsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: AppBar(
      //   leading: const Padding(
      //     padding: EdgeInsets.all(6),
      //     child: Icon(
      //       Icons.watch_later_outlined,
      //       color: Color.fromRGBO(100, 181, 246, 1),
      //     ),
      //   ),
      //   title: const Text('Simple Alarm Clock'),
      //   centerTitle: true,
      // ),
      body: SafeArea(child: AlarmsWidget()),
    );
  }
}

class AlarmsWidget extends StatelessWidget {
  const AlarmsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Column(
        children: <Widget>[
          Row(
            children: [
              Text(
                'My Alarms',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AlarmForm()));
                  },
                  child: const Text('+'))
            ],
          ),
          const AlarmsList()
        ],
      ),
    );
  }
}

class AlarmsList extends StatelessWidget {
  const AlarmsList({super.key});

  @override
  Widget build(BuildContext context) {
    final alarmsProvider = Provider.of<AlarmsProvider>(context);
    return Expanded(
      child: ListView.builder(
          itemCount: alarmsProvider.alarmsList.length,
          itemBuilder: (context, index) {
            Alarm alarm = alarmsProvider.alarmsList[index];
            return AlarmSaved(alarm: alarm);
          }),
    );
  }
}
