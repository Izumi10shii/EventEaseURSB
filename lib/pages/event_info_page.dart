import 'package:flutter/material.dart';

class EventInfoPage extends StatelessWidget {
  EventInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            ListTile(title: Text("Event Info Page")),

            ListTile(
              title: Container(
                height: 100,
                width: 100,
                color: Colors.grey,
                child: Text("IMG"),
              ),
            ),

            ListTile(
              //Event Info
              title: Text("Event Title"),
              subtitle: Container(
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Text("Event Ease"),
                          Text("Monday"),
                          Text("6:00 - 5:00"),
                          Text("March 21, 2025"),
                          Text("Organized by: "),
                          Text("Organization name"),
                          Text("Participants"),
                          Text("CCS"),
                          Text("COA"),
                          Text("COB"),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text("Event Details"),
                          Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
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
    );
  }
}
