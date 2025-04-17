import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            ListTile(
              title: Align(
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(999),
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            ListTile(
              title: Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "@username",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(onPressed: () {}, child: Icon(Icons.copy)),
                  ],
                ),
              ),
            ),

            ListTile(
              title: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(color: Colors.black),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(0),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(40),
                        ),
                      ),
                      child: Text(
                        "Full Name",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 40),
                    Text("Di O. Nela"),
                    SizedBox(width: 40),
                    ElevatedButton(onPressed: () {}, child: Icon(Icons.edit)),
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
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(0),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(40),
                        ),
                      ),

                      child: Text(
                        "Program",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 40),
                    Text("BSIT"),
                    SizedBox(width: 40),
                    ElevatedButton(onPressed: () {}, child: Icon(Icons.edit)),
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
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(0),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(40),
                        ),
                      ),

                      child: Text(
                        "Section",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 40),
                    Text("2-1A"),
                    SizedBox(width: 40),
                    ElevatedButton(onPressed: () {}, child: Icon(Icons.edit)),
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
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(0),
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(40),
                            ),
                          ),
                          child: Text(
                            "Interest",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),

                        ElevatedButton(onPressed: () {}, child: Text("Edit")),
                      ],
                    ),
                    SizedBox(width: 40),
                    //put in container
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Ethanol"),
                          Text("Ikimandians"),
                          Text("Marilag"),
                          SizedBox(width: 40),
                        ],
                      ),
                    ),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(0),
                          bottomLeft: Radius.circular(00),
                          bottomRight: Radius.circular(40),
                        ),
                      ),
                      child: Text(
                        "Recent Activities",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 40),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        "03/25/2025 | Attended URS Binangonan College Week: March...",
                      ),
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
    );
  }
}
