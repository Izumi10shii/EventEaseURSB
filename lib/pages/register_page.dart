import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_event_ease/pages/login_page.dart';
import 'package:flutter_event_ease/pages/register_page_pt2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterPage extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => RegisterPage(),
      );
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  //Login Variables
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  //UserInfo Variables
  final usernameController = TextEditingController();
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final MIController = TextEditingController();
  final programController = TextEditingController();
  final yearController = TextEditingController();
  final sectionController = TextEditingController();

  /*
  DateTime selectedDate =   DateTime.now(); //for datetime later
  Color _selected color = Colors.white; // for color later
  

*/

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> createUserInfo() async {
    try {
      final userInfo = await FirebaseFirestore.instance.collection('users').add({
        'username': usernameController.text.trim(),
        'firstname': firstnameController.text.trim(),
        'lastname': lastnameController.text.trim(),
        'MI': MIController.text.trim(),
        'program': programController.text.trim(),
        'year': yearController.text.trim(),
        'section': sectionController.text.trim(),

        /*
        'date': FieldValue.serverTimestamp(), // for date and time
         'color': rgbtoHex(_selectedColor), // for color later
         */
      });
      print(userInfo.id); // Print the document ID of the created user info
    } catch (e) {
      print(e);
    }
  }

/* separate to two pages
  @override
  void dispose{
    usernameController.dispose();
    firstnameController.dispose();
    lastnameController.dispose();
    MIController.dispose();
    programController.dispose();
    yearController.dispose();
    sectionController.dispose();
    super.dispose();
  }
*/
  Future<void> createUser() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      print("Please fill in all fields");
      return; // Exit the function if fields are empty
    }

    try {
      final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      print("User created: ${userCredential.user?.email}");
      Navigator.pushNamed(context, '/index_page');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        print("Email already in use, try another one");
      } else if (e.code == 'weak-password') {
        print("Password is too weak");
      } else if (e.code == 'invalid-email') {
        print("Invalid email address");
      } else {
        print("Error: ${e.message}");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(25),
          child: ListView(
            children: [
              ListTile(
                title: Center(
                  child: Text(
                    "Event Ease",
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
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
                subtitle: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: "",
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
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "",
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
                  "Confirm Password",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                subtitle: TextField(
                  controller: confirmPasswordController,
                    obscureText: true,
                  decoration: InputDecoration(
                    hintText: "",
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
                title: ElevatedButton(
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
                    if (emailController.text.isEmpty) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("Warning"),
                          content: Text("Email cannot be empty"),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text("OK"),
                            ),
                          ],
                        ),
                      );
                      return;
                    }
                    if (passwordController.text.isEmpty) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("Warning"),
                          content: Text("Password cannot be empty"),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text("OK"),
                            ),
                          ],
                        ),
                      );
                      return;
                    }
                    if (passwordController.text != confirmPasswordController.text) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("Warning"),
                          content: Text("Passwords do not match"),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text("OK"),
                            ),
                          ],
                        ),
                      );
                      return;
                    }

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterPagePt2(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                        ),
                      ),
                    );
                  },
                  child: Text("Register"),
                ),
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
                          recognizer: TapGestureRecognizer()
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
