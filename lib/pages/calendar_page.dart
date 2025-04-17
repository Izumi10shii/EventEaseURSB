import 'package:flutter/material.dart';

class CalendarPage extends StatelessWidget{
  CalendarPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(

        body: Center(
          child: Column(
            children: [
              Text("Calendar Page"),
            ],
          ),
        ),
    );
  }  
}