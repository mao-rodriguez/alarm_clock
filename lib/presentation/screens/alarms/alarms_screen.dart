
import 'package:flutter/material.dart';

class AlarmsScreen extends StatelessWidget {
  const AlarmsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Padding(
            padding: EdgeInsets.all(6),
            child: Icon(
              Icons.watch_later_outlined,
              color: Color.fromRGBO(100, 181, 246, 1),
            ),
          ),
          title: const Text('Simple Alarm Clock'),
          centerTitle: true,
        )
        body: SafeArea(child: _alarmsWidget()),
    );
  }
}

class _alarmsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: ,
              itemBuilder: (context, index){

              }
            )
          ,)
        ]
        ),
      )
  }
}
