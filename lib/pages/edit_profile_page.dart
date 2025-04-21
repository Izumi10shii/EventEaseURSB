import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
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
                        color: Colors.white
                      ),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(onPressed: () {}, child: Icon(Icons.copy)),
                  ],
                ),
              ),
            ),

            ListTile(
              title: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Username"),
                  filled: true,
                        fillColor: Color(
                          0xFFFFFFFF,
                        ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Color(0xFF1A2C54), width: 2),
                  ),
                ),
              ),
            ),
            ListTile(
              title: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Program"),
                  filled: true,
                        fillColor: Color(
                          0xFFFFFFFF,
                        ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Color(0xFF1A2C54), width: 2),
                  ),
                ),
              ),
            ),
            ListTile(
              title: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Section"),
                  filled: true,
                        fillColor: Color(
                          0xFFFFFFFF,
                        ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Color(0xFF1A2C54), width: 2),
                  ),
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
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 40,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFF1A2C54),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(0),
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(60),
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
                        SizedBox(width: 60),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF1A2C54),
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {},
                          child: Icon(Icons.add),
                        ),
                        SizedBox(width: 20),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF1A2C54),
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {},
                          child: Icon(Icons.delete),
                        ),
                      ],
                    ),
                    SizedBox(width: 40),
                    //put in container
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Ethanol"), //add check box
                          Text("Ikimandians"),
                          Text("Marilag"),
                          TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text("Add New Interest"),
                              enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Color(0xFF1A2C54), width: 2),
                  ),
                            ),
                          ),
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
                  borderRadius: BorderRadius.circular(15),

                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 40,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFF1A2C54),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(22),
                          topRight: Radius.circular(0),
                          bottomLeft: Radius.circular(00),
                          bottomRight: Radius.circular(60),
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
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF0A1D34),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/admin_profile_page');
              },
              child: Text("Save Profile"),
            ),
          ],
        ),
      ),
    );
  }
}
