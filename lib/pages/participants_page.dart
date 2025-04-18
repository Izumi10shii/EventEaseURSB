import 'package:flutter/material.dart';

class ParticipantsPage extends StatelessWidget {
  ParticipantsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ListView(
            children: [
              ListTile(
                title: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.blue
                  ),
                  child: Column(
                    children: [
                      Text("Event: Participants",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),),
                      Text("Intramurals 2025: URS 27th Anniversay Special",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),),
                    ],
                  ),
                ),
              ),

              ListTile(
                title: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFF1A2C54),
                            border: Border.all(color: Colors.black),
                          ),
                          child: Text("Student ID",style: TextStyle(
                            color: Colors.white,
                          ),),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                          color: Color(0xFF1A2C54),
                            border: Border.all(color: Colors.black),
                          ),
                          child: Text("Student Full Name",style: TextStyle(
                            color: Colors.white,
                          ),),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                          color: Color(0xFF1A2C54),
                            border: Border.all(color: Colors.black),
                          ),
                          child: Text("Email Address",
                          style: TextStyle(
                            color: Colors.white,
                          ),),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              ListTile(
                title: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            border: Border.all(color: Colors.black),
                          ),
                          child: Text("B2023-00293"),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                          ),
                          child: Text("Kent Harvey R. Paras")),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                          ),
                          child: Text("hevharbi@gmail.com")),
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
