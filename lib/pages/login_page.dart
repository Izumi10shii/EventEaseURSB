import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_event_ease/pages/register_page.dart';

class LoginPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => LoginPage());
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> loginUser() async {
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          );
      print(userCredential);

      if (userCredential.user != null) {
        Navigator.pushReplacementNamed(
          context,
          '/nav_page',
        ); // Replace with your home page route
      }
    } on FirebaseAuthException catch (e) {
      // Show an error message if login fails
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.message ?? 'Login failed')));
      print(e.message);
    }
  }

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
                  ListTile(
                    titleAlignment: ListTileTitleAlignment.center,
                    title: Align(
                      child: Text(
                        "Event Ease",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                        ),
                      ),
                    ),
                  ),

                  ListTile(
                    title: Text(
                      "Username/StudentID",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    subtitle: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'B2023-00290',
                        hintStyle: TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Color(
                          0xFFFCFCFC,
                        ), // background color inside textfield
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 14,
                          horizontal: 20,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.black12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Color(0xFF1A2C54),
                            width: 2,
                          ),
                        ),
                      ),
                      style: TextStyle(color: Colors.black), // typing te
                    ),
                  ),

                  ListTile(
                    title: Text(
                      "PassWord",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    subtitle: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: '********',
                        hintStyle: TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Color(
                          0xFFFCFCFC,
                        ), // background color inside textfield
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 14,
                          horizontal: 20,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.black12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Color(0xFF1A2C54),
                            width: 2,
                          ),
                        ),
                      ),
                      style: TextStyle(color: Colors.black), // typing te
                    ),
                  ),
                  SizedBox(height: 20),
                  ListTile(
                    title: SizedBox(
                      width: double.infinity,

                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF0A1D34),
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          textStyle: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () async {
                          await loginUser();
                        },
                        child: Text("Login"),
                      ),
                    ),
                  ),

                  ListTile(
                    title: Align(
                      alignment: Alignment.center,
                      child: Text.rich(
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
