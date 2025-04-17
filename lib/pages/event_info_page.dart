import 'package:flutter/material.dart';

class EventInfoPage extends StatelessWidget {
  EventInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            ListTile(
              title: Center(
                child: Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey,
                  ),
                  child: Center(child: Text("IMG")),
                ),
              ),
            ),

            ListTile(
              //Event Info
              title: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Color(0xFF1A2C54),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Event Title",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Monday",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),

                          Text(
                            "6:00 - 5:00",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "March 21, 2025",
                            style: TextStyle(color: Colors.white),
                          ),

                          SizedBox(height: 20),
                          Text(
                            "Organized by: ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Organization name",
                            style: TextStyle(color: Colors.white),
                          ),

                          SizedBox(height: 20),
                          Text(
                            "Participants",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text("CCS", style: TextStyle(color: Colors.white)),
                          Text("COA", style: TextStyle(color: Colors.white)),
                          Text("COB", style: TextStyle(color: Colors.white)),

                          SizedBox(height: 20),
                          Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Color(0xFF0A1D34),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  "Event Details",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/receipt_page');
                            },
                            child: Text("Register for Event"),
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
