import 'package:alarm_clock/config/theme/app_theme.dart';
import 'package:alarm_clock/presentation/providers/alarms_provider.dart';
import 'package:alarm_clock/presentation/screens/alarms/alarms_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AndroidAlarmManager.initialize();
  runApp(MultiProvider(
    // TODO: NO NEED TO SIGN ALL THE PROVIDERS IN THIS WIDGET.
    providers: [
      ChangeNotifierProvider(create: (_) => AlarmsProvider()),
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
