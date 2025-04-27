import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_event_ease/pages/login_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterPagePt2 extends StatefulWidget {
  final String email;
  final String password;

  const RegisterPagePt2({required this.email, required this.password, super.key});

  @override
  State<RegisterPagePt2> createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPagePt2> {
  //Login Variables
  final studentIdController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  //UserInfo Variables
  final usernameController = TextEditingController();
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final MIController = TextEditingController();
  String selectedProgram = "Select Program"; // Placeholder for program dropdown
  String selectedYear = "Select Year"; // Placeholder for year dropdown
  String selectedSection = "Select Section"; // Placeholder for section dropdown


  Future<void> createUser() async {
    try {
      // Create user in Firebase Authentication
      final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: widget.email,
        password: widget.password,
      );

      // Save user information to Firestore with a role field
      await FirebaseFirestore.instance.collection('users').doc(userCredential.user?.uid).set({
        'student id': studentIdController.text.trim(),
        'username': usernameController.text.trim(),
        'firstname': firstnameController.text.trim(),
        'lastname': lastnameController.text.trim(),
        'MI': MIController.text.trim(),
        'program': selectedProgram,
        'year': selectedYear,
        'section': selectedSection,
        'role': 'user', // Default role set to 'user'
      });

      // Navigate to the index page
      Navigator.pushNamed(context, '/index_page');
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Error"),
          content: Text("Failed to register. Please try again."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("OK"),
            ),
          ],
        ),
      );
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
                  "Student ID",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                subtitle: TextField(
                  controller: studentIdController,
                  decoration: InputDecoration(
                    hintText: "",
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Color(0xFFFCFCFC), // background color inside textfield
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
                ),
              ),
              ListTile(
                title: Text(
                  "Username",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                subtitle: TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    hintText: "",
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Color(0xFFFCFCFC), // background color inside textfield
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
                ),
              ),
              ListTile(
                title: Text(
                  "Last Name",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                subtitle: TextField(
                  controller: lastnameController,
                  decoration: InputDecoration(
                    hintText: "",
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Color(0xFFFCFCFC), // background color inside textfield
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
                ),
              ),
              ListTile(
                title: Text(
                  "First Name",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                subtitle: TextField(
                  controller: firstnameController,
                  decoration: InputDecoration(
                    hintText: "",
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Color(0xFFFCFCFC), // background color inside textfield
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
                ),
              ),
              ListTile(
                title: Text(
                  "Middle Initial",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                subtitle: TextField(
                  controller: MIController,
                  decoration: InputDecoration(
                    hintText: "",
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Color(0xFFFCFCFC), // background color inside textfield
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
                ),
              ),
              ListTile(
                title: Text(
                  "Program",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                subtitle: DropdownButtonFormField<String>(
                  value: selectedProgram,
                  items: [
                    DropdownMenuItem(value: "Select Program", child: Text("Select Program")),
                    DropdownMenuItem(value: "BSIT", child: Text("BSIT")),
                    DropdownMenuItem(value: "BSIS", child: Text("BSIS")),
                    // Add more programs here
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedProgram = value!;
                    });
                  },
                  decoration: InputDecoration(
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
                ),
              ),
              ListTile(
                title: Text(
                  "Year",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                subtitle: DropdownButtonFormField<String>(
                  value: selectedYear,
                  items: [
                    DropdownMenuItem(value: "Select Year", child: Text("Select Year")),
                    DropdownMenuItem(value: "1st Year", child: Text("1st Year")),
                    DropdownMenuItem(value: "2nd Year", child: Text("2nd Year")),
                    DropdownMenuItem(value: "3rd Year", child: Text("3rd Year")),
                    DropdownMenuItem(value: "4th Year", child: Text("4th Year")),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedYear = value!;
                    });
                  },
                  decoration: InputDecoration(
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
                ),
              ),
              ListTile(
                title: Text(
                  "Section",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                subtitle: DropdownButtonFormField<String>(
                  value: selectedSection,
                  items: [
                    DropdownMenuItem(value: "Select Section", child: Text("Select Section")),
                    DropdownMenuItem(value: "1", child: Text("1")),
                    DropdownMenuItem(value: "2", child: Text("2")),
                    DropdownMenuItem(value: "3", child: Text("3")),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedSection = value!;
                    });
                  },
                  decoration: InputDecoration(
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
                    // Validate fields
                    if (studentIdController.text.isEmpty ||
                        usernameController.text.isEmpty ||
                        firstnameController.text.isEmpty ||
                        lastnameController.text.isEmpty ||
                        MIController.text.isEmpty ||
                        selectedProgram == "Select Program" ||
                        selectedYear == "Select Year" ||
                        selectedSection == "Select Section") {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("Warning"),
                          content: Text("Please fill in all fields"),
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

                    await createUser();
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
