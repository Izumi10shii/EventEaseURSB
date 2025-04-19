import 'package:flutter/material.dart';


class AdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.all(25),
              child: ListView(
                shrinkWrap: true,
                children: [
                  ListTile(title: Text("Admin Login")),

                  ListTile(
                    title: Text("Admin Username/ID"),
                    subtitle: TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                  ListTile(
                    title: Text("Password"),
                    subtitle: TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF0A1D34),
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                          horizontal: 120,
                          vertical: 10,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        textStyle: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        // This is where the navigation happens
                        Navigator.pushNamed(context, '/admin_nav_page');
                      },
                      child: Text("Login"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
