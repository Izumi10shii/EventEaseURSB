import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_event_ease/pages/login_page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(25),
            child: ListView(
              children: [
                ListTile(title: Text("Event Ease")),

                ListTile(
                  title: Text("Student ID"),
                  subtitle: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      //hintText: "Student ID ",
                    ),
                  ),
                ),

                ListTile(
                  title: Text("Username"),
                  subtitle: TextField(
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                ),

                ListTile(
                  title: Text("Full Name"),
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

                ListTile(
                  title: Text("Confirm Password"),
                  subtitle: TextField(
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                ),

                ListTile(
                  title: Text("Program"),
                  subtitle: TextField(
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                ),

                ListTile(
                  title: Text("Year & Section"),
                  subtitle: TextField(
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                ),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF0A1D34),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(
                      horizontal: 100,
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
                    Navigator.pushNamed(context, '/index_page');
                  },
                  child: Text("Register"),
                ),
                ListTile(
                title: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Text.rich(
                    TextSpan(
                      text: "Already an EventEase user? ",
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: "Login Here!",
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer:
                              TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context, 
                                    MaterialPageRoute(builder: (context) => LoginPage()),
                                  );
                                },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ],
            ),
          ),
        ),

    );
  }
}
