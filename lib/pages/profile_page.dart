import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: ListView(
            children: [
              ListTile(
                title: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey,
                  ),
                ),
              ),
              ListTile(
                title: Text("@Username", style: TextStyle(fontSize: 40)),
              ),

              ListTile(
                title: Container(
                  padding: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(color: Colors.black),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Full Name",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        decoration: BoxDecoration(color: Colors.blue),
                      ),
                      SizedBox(width: 40),
                      Text("Di O. Nela"),
                      SizedBox(width: 40),
                      ElevatedButton(onPressed: () {}, child: Text("Edit")),
                    ],
                  ),
                ),
              ),

              ListTile(
                title: Container(
                  padding: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(color: Colors.black),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Program",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        decoration: BoxDecoration(color: Colors.blue),
                      ),
                      SizedBox(width: 40),
                      Text("BSIT"),
                      SizedBox(width: 40),
                      ElevatedButton(onPressed: () {}, child: Text("Edit")),
                    ],
                  ),
                ),
              ),

              ListTile(
                title: Container(
                  padding: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(color: Colors.black),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Section",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        decoration: BoxDecoration(color: Colors.blue),
                      ),
                      SizedBox(width: 40),
                      Text("2-1A"),
                      SizedBox(width: 40),
                      ElevatedButton(onPressed: () {}, child: Text("Edit")),
                    ],
                  ),
                ),
              ),

              //Interest
              ListTile(
                title: Container(
                  padding: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Interest",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        decoration: BoxDecoration(color: Colors.blue),
                      ),
                      SizedBox(width: 40),
                      Text("Ethanol"),
                      Text("Ikimandos"),
                      Text("Marilag"),
                      SizedBox(width: 40),
                      ElevatedButton(onPressed: () {}, child: Text("Edit")),
                    ],
                  ),
                ),
              ),
              ListTile(
                title: Container(
                  padding: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Recent Activities",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        decoration: BoxDecoration(color: Colors.blue),
                      ),
                      SizedBox(width: 40),
                      Text(
                        "03/25/2025 | Attended URS Binangonan College Week: March...",
                      ),
                      SizedBox(width: 40),
                    ],
                  ),
                ),
              ),
              ElevatedButton(onPressed: () {}, child: Text("Save Profile")),
            ],
          ),
        ),
      ),
    );
  }
}
