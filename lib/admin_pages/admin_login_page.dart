import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_event_ease/pages/nav_page.dart';

class AdminLoginPage extends StatefulWidget {
  const AdminLoginPage({super.key});

  @override
  State<AdminLoginPage> createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> loginAsAdmin() async {
    try {
      // Authenticate user with Firebase Authentication
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          );

      // Check if the user is an admin in Firestore
      final userDoc =
          await FirebaseFirestore.instance
              .collection('users')
              .doc(userCredential.user?.uid)
              .get();

      if (userDoc.exists) {
        final isAdmin = userDoc.data()?['role'] == 'admin';
        if (isAdmin) {
          // Navigate to the NavPage with isAdmin set to true
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => NavPage(isAdmin: true)),
          );
        } else {
          // Navigate to the NavPage with isAdmin set to false
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => NavPage(isAdmin: false)),
          );
        }
      } else {
        _showErrorDialog("Error", "User document does not exist.");
      }
    } on FirebaseAuthException catch (e) {
      _showErrorDialog(
        "Login Failed",
        e.message ?? "An error occurred. Please try again.",
      );
    }
  }

  void _showErrorDialog(String title, String message) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("OK"),
              ),
            ],
          ),
    );
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
              child: Form(
                key: _formKey,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    ListTile(
                      titleAlignment: ListTileTitleAlignment.center,
                      title: Align(
                        child: Text(
                          "Admin Login",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "Email",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      subtitle: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: 'admin@example.com',
                          hintStyle: TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Color(0xFFFCFCFC),
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
                        style: TextStyle(color: Colors.black),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your email";
                          }
                          return null;
                        },
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "Password",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      subtitle: TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: '********',
                          hintStyle: TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Color(0xFFFCFCFC),
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
                        style: TextStyle(color: Colors.black),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your password";
                          }
                          return null;
                        },
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
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              loginAsAdmin();
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "Please fill in all fields correctly.",
                                  ),
                                ),
                              );
                            }
                          },
                          child: Text("Login"),
                        ),
                      ),
                    ),

                  ],
                ),
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
                          Navigator.pushNamed(
                            context,
                            '/login_page',
                          ); // Fixed navigation
                        },
                        child: Icon(Icons.login, size: 24),
                      ),
                    ),
        ],

      ),
    );
  }
}
