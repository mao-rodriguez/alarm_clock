import 'package:alarm_clock/config/theme/app_theme.dart';
import 'package:alarm_clock/presentation/providers/alarms_provider.dart';
import 'package:alarm_clock/presentation/providers/time_provider.dart';
import 'package:alarm_clock/presentation/screens/alarms/alarms_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    // TODO: NO NEED TO SIGN ALL THE PROVIDERS IN THIS WIDGET.
    providers: [
      ChangeNotifierProvider(create: (_) => AlarmsProvider()),
      ChangeNotifierProvider(create: (_) => TimeProvider())
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
