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
              title: Center(
                child: Container(
                height: 300,
                width: 300,
                color: Colors.grey,
                child: Center(child: Text("IMG"),
                )
              ),
              )
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
                          Text("Monday",
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),),


                          Text("6:00 - 5:00"),
                          Text("March 21, 2025"),


                          Text("Organized by: ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),),
                          Text("Organization name"),


                          Text("Participants",
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),),
                          Text("CCS"),
                          Text("COA"),
                          Text("COB"),
                        ],
                      ),
                    ),
                    
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Text("Event Details",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          )),
                          Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(onPressed: (){
                      Navigator.pushNamed(context, '/receipt_page');

                    }, 
                    child: Text("Register for Event"))
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
