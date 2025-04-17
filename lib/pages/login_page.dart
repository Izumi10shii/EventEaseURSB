import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget{
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
        body: Center(
          child: Padding(padding: EdgeInsets.all(25),
          child: ListView(
            children: [
              ListTile(
                title: Text("Event Ease"),
              ),

              ListTile(
                title: Text("Username/StudentID"),
                subtitle: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    ),
              ),
               ListTile(
                title: Text("Password"),
                subtitle: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    ),
              ),

              ElevatedButton(
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
                onPressed: (){
                Navigator.pushNamed(context, '/nav_page');
              }, 
                child: Text("Login"))

            ],
          ),
          )
        ),
    );
  }
}