import 'package:flutter/material.dart';

class EventManagerPage extends StatelessWidget {
  const EventManagerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: ListView(
            children: [
              ListTile(
                title: Text("Events Manager",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ))
              ),
              ListTile(
                title: Container(
                  height: 100,
                  width: 0,
                  decoration: BoxDecoration(color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)
                          ),
                          child: Text("IMG"),
                        ),
                        SizedBox(width: 20),
                        Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Art to Success: "),
                            Text("Introduction to Graphics"),
                          ],
                        ),
                        SizedBox(width: 20),

                        ElevatedButton(onPressed: () {
                          Navigator.pushNamed(context,'/admin_edit_event_page');
                        }, child: Icon(Icons.edit)),
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
                          child: Text("IMG"),
                          decoration: BoxDecoration(
                          color: Colors.white,

                          borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                        SizedBox(width: 20),
                        Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Event Title"),
                            Text("Event Description"),
                          ],
                        ),
                        SizedBox(width: 20),

                        ElevatedButton(onPressed: () {
                          Navigator.pushNamed(context,'/admin_edit_event_page');
                        }, child: Icon(Icons.edit)),
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
