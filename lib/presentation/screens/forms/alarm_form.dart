import 'package:alarm_clock/presentation/widgets/time_picker.dart';
import 'package:flutter/material.dart';

class AlarmForm extends StatelessWidget {
  AlarmForm({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String timeFormat = "AM";
    int hour = 0;
    int minute = 0;
    return Scaffold(
      body: SafeArea(
        child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FormField(
                      builder: (FormFieldState<int> state) {
                        return const TimePicker();
                      },
                      onSaved: ((value) => hour = value!),
                    ),
                    FormField(
                      builder: (FormFieldState<int> state) {
                        return const TimePicker();
                      },
                      onSaved: ((value) => minute = value!),
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            timeFormat = "AM";
                            print(timeFormat);
                          },
                          child: Container(child: const Text("AM")),
                        ),
                        GestureDetector(
                          onTap: () {
                            timeFormat = "PM";
                            print(timeFormat);
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
                      }
                    },
                    child: const Text("Save"))
              ],
            )),
      ),
    );
  }
}
