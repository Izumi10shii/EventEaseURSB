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

              ListTile(title: Container(
                alignment: Alignment.center,
                height: 300,
                width: 300,
                color: Colors.grey,
                child: Text("Calendar HERE")),
              ) ,
              

              ListTile(
                //WIP
                title: Container(
                  child: Column(
                    children: [
                      Text("Upcoming Events",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),),
                      SizedBox(height: 40),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Registered",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              height: 100,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
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
                                        Text("Intramurals",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),),
                                        Text("March 21, 2025",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),),
                                        Text("6:00AM-5:00PM",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),),
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

                      SizedBox(height: 40),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Not Yet Registered",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),),
                            Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                              height: 100,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
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

                                        Text("Intramurals",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),),
                                        Text("March 21, 2025",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),),
                                        Text("6:00AM-5:00PM",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),),
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
