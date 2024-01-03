import 'package:alarm_clock/config/theme/app_theme.dart';
import 'package:alarm_clock/presentation/providers/alarms_provider.dart';
import 'package:alarm_clock/presentation/providers/number_provider_temp.dart';
import 'package:alarm_clock/presentation/screens/alarms/alarms_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AlarmsProvider()),
      ChangeNotifierProvider(create: (_) => NumberProvider())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Simple Alarm Clock',
        debugShowCheckedModeBanner: false,
        theme: AppTheme(colorIndex: 0).theme(),
        home: const AlarmsScreen());
  }
}
