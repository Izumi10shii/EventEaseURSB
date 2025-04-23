import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

Future<void> loginAdmin() async {
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
    } on FirebaseAuthException catch (e) {
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
                    title: 
                    Center(
                      child: Text(
                      "Event Ease",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),),
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
                      "Password",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    subtitle: TextField(
                      controller: passwordController,
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

                  ListTile(
                    title: Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF0A1D34),
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                            horizontal: 0,
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
                        onPressed: () async {
                          await loginAdmin();
                          Navigator.pushNamed(context, '/admin_nav_page');
                        },
                        child: Text("Login as Admin"),
                      ),
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
