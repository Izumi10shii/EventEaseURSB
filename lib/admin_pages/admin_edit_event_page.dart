import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AdminEditEventPage extends StatelessWidget {
  AdminEditEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ListView(
            children: [
              ListTile(
                title: Container(
                    width: double.infinity,
                    height: 300,
                  decoration: BoxDecoration(
                    color: Colors.grey,

                  ),
                  child: Column(
                    children: [Text("IMG")])),
              ),

              ListTile(
                title: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Event Name"),
                  ),
                ),
              ),

              ListTile(
                title: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Set Date"),
                  ),
                ),
              ),

              ListTile(
                title: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Event Description"),
                  ),
                ),
              ),

              ElevatedButton(onPressed: () {}, child: Text("Add Event")),
            ],
          ),
        ),
      ),
    );
  }
}
