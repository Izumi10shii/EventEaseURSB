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

                ListTile(title: 
                Center(child: 
                Text("Event Ease",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),)
                )
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
                      "Username",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    subtitle: TextField(
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
                      "Full Name",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    subtitle: TextField(
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
                      "Program",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    subtitle: TextField(
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
                      "Year & Section",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    subtitle: TextField(
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
                  onPressed: () {
                    Navigator.pushNamed(context, '/index_page');
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
