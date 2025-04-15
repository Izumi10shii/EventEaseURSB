import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget{
  ProfilePage({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Text("Profile Page"),
            ],
          ),
        ),
      ),
    );
  }  
}