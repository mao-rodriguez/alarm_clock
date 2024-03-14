import 'package:flutter/material.dart';

void showAlertDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(title: const Text("Alarm"), actions: [
    TextButton(
      child: const Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    )
  ]);

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      });
}
