import 'package:flutter/material.dart';

class RemindersPage extends StatelessWidget{
  RemindersPage({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Text("Reminders Page"),
            ],
          ),
        ),
      ),
    );
  }  
}