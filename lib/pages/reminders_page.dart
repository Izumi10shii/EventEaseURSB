import 'package:flutter/material.dart';

class RemindersPage extends StatelessWidget {
  const RemindersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            ListTile(
              title: Align(
                alignment: Alignment.center,
                child: Text(
                  "Events Reminder",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            
            ListTile(
              title: Container(
                height: 120,
                width: 0,
                decoration: BoxDecoration(
                  color: Color(0xFF0A1D34),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(30),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text("IMG"),
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Art to Success: ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Introduction to Gra...",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ],
                      ),
                      SizedBox(width: 10),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Color(0xFF1A2C54), // Button background color
                          foregroundColor: Colors.white, // Icon color\
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              10,
                            ), // Small rounding (or use 0 for a perfect square)
                          ),
                          minimumSize: Size(
                            40,
                            40,
                          ), // Make width and height equal = square
                          padding:
                              EdgeInsets
                                  .zero, // Remove extra padding inside button
                        ),
                        onPressed: () {},
                        child: Icon(Icons.notifications),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //Space
            ListTile(
              title: Container(
                height: 120,
                width: 0,
                decoration: BoxDecoration(
                  color: Color(0xFF0A1D34),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(30),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text("IMG"),
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Art to Success: ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Introduction to Gra...",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ],
                      ),
                      SizedBox(width: 10),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Color(0xFF1A2C54), // Button background color
                          foregroundColor: Colors.white, // Icon color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              10,
                            ), // Small rounding (or use 0 for a perfect square)
                          ),
                          minimumSize: Size(
                            40,
                            40,
                          ), // Make width and height equal = square
                          padding:
                              EdgeInsets
                                  .zero, // Remove extra padding inside button
                        ),
                        onPressed: () {},
                        child: Icon(Icons.notifications),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
