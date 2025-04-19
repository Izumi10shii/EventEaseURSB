import 'package:flutter/material.dart';
import 'package:flutter_event_ease/pages/event_info_page.dart';
import 'package:flutter_event_ease/pages/home_page.dart';
import 'package:flutter_event_ease/pages/index_page.dart';
import 'package:flutter_event_ease/pages/receipt_page.dart';
import 'package:flutter_event_ease/pages/register_page.dart';
import 'package:flutter_event_ease/pages/login_page.dart';
import 'package:flutter_event_ease/pages/nav_page.dart';

//Admin Pages
import 'package:flutter_event_ease/admin_pages/admin_nav_page.dart';
import 'package:flutter_event_ease/admin_pages/admin_home_page.dart';
import 'package:flutter_event_ease/admin_pages/admin_login_page.dart';
import 'package:flutter_event_ease/admin_pages/admin_edit_event_page.dart';
import 'package:flutter_event_ease/admin_pages/participants_page.dart';
import 'package:flutter_event_ease/admin_pages/admin_event_info_page.dart';
import 'package:flutter_event_ease/admin_pages/event_manager_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/register_page': (context) => RegisterPage(),
        '/login_page': (context) => LoginPage(),
        '/index_page': (context) => IndexPage(),
        '/nav_page': (context) => NavPage(),
        '/home_page': (context) => HomePage(),
        '/event_info_page': (context) => EventInfoPage(), 
        '/receipt_page': (context) => ReceiptPage(),


        //Admin Pages
        '/admin_page': (context) => AdminPage(),
        '/admin_edit_event_page': (context) => AdminEditEventPage(),
        '/participants_page': (context) => ParticipantsPage(),
        '/admin_nav_page': (context) => AdminNavPage(),
        '/admin_home_page':(context) => AdminHomePage(),
        '/admin_event_info_page': (context) => AdminEventInfoPage(),
        '/event_manager_page': (context) => EventManagerPage(),

      },
      home: IndexPage(),
    );
  }
}
