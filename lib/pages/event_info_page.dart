import 'package:flutter/material.dart';

class EventInfoPage extends StatelessWidget {
  EventInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: ListView(children: [ListTile(title: Text("Event Info Page"))]),
        ),
      ),
    );
  }
}
