import 'package:flutter/material.dart';

class RemindersPage extends StatelessWidget {
  const RemindersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: ListView(
            children: [
              ListTile(
                title: Text("Events Reminder",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ))
              ),
              ListTile(
                title: Container(
                  height: 100,
                  width: 20,
                  decoration: BoxDecoration(color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(20),
                          color: Colors.white,
                          child: Text("IMG"),
                        ),
                        SizedBox(width: 20),
                        Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Event Title"),
                            Text("Event Description"),
                          ],
                        ),
                        SizedBox(width: 20),

                        ElevatedButton(onPressed: () {}, child: Text("Bell")),
                      ],
                    ),
                  ),
                ),
              ),
            //Space

            ListTile(
                title: Container(
                  height: 100,
                  width: 20,
                  decoration: BoxDecoration(color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(20),
                          color: Colors.white,
                          child: Text("IMG"),
                        ),
                        SizedBox(width: 20),
                        Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Event Title"),
                            Text("Event Description"),
                          ],
                        ),
                        SizedBox(width: 20),

                        ElevatedButton(onPressed: () {}, child: Text("Bell")),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
