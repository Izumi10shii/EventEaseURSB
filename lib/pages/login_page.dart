import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_event_ease/pages/register_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                  ListTile(title: Text("Event Ease")),

                  ListTile(
                    title: Text("Username/StudentID"),
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
                        Navigator.pushNamed(context, '/nav_page');
                      },
                      child: Text("Login"),
                    ),
                  ),

                  
                  ListTile(
                    title: Text.rich(
                      TextSpan(
                        text: "Are you a new user? ",
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: "Register Now!",
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
                                      MaterialPageRoute(
                                        builder: (context) => RegisterPage(),
                                      ),
                                    );
                                  },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            bottom: 20,
            right: 20,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF0A1D34),
                foregroundColor: Colors.white,
                padding: EdgeInsets.zero,
                minimumSize: Size(48, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/admin_page');
              },
              child: Icon(Icons.admin_panel_settings, size: 24),
            ),
          ),
        ],
      ),
    );
  }
}
