import 'package:flutter/material.dart';

class CalendarPage extends StatelessWidget {
  CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ListView(
            children: [
              ListTile(title: Text("Calendar Page")),

              ListTile(title: Text("Calendar HERE")),

              ListTile(
                //WIP
                title: Container(
                  child: Column(
                    children: [
                      Text("Upcoming Events"),

                      Container(
                        child: Column(
                          children: [
                            Text("Registered"),
                            Container(
                              height: 100,
                              width: 20,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(20),
                                      child: Text("IMG"),
                                      decoration: BoxDecoration(
                                        color: Colors.white,

                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Event Title"),
                                        Text("Event Description"),
                                      ],
                                    ),
                                    SizedBox(width: 20),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
