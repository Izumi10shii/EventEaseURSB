import 'package:flutter/material.dart';

class ReceiptPage extends StatelessWidget {
  ReceiptPage({super.key});

  String name = "Rodsef";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [

            ListTile(
              title: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                  color: Colors.grey,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Proof of Registration",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        "Intramurals",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      Text(
                        "Name: $name",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Student ID: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Course: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Email: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),

                      SizedBox(height: 20,),
                      Text(
                        "Monday, March 31: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("6:00 - 5:00PM"),

                      SizedBox(height: 20,),
                      Text(
                        "Event Details: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                      ),
                    ],
                  ),
                ),
              ),
            

            ListTile(
              title: Center(
                child: Container(
                  height: 360,
                  width: 360,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(child: Text("QR CODE")),
                ),
              ),
            ),

            ListTile(
              title: ElevatedButton(onPressed: () {}, child: Text("Download")),
            ),
          ],
        ),
      ),
    );
  }
}
