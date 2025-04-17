import 'package:flutter/material.dart';
import 'package:flutter_event_ease/pages/event_info_page.dart';
import 'package:flutter_event_ease/pages/home_page.dart';
import 'package:flutter_event_ease/pages/index_page.dart';
import 'package:flutter_event_ease/pages/receipt_page.dart';
import 'package:flutter_event_ease/pages/register_page.dart';
import 'package:flutter_event_ease/pages/login_page.dart';
import 'package:flutter_event_ease/pages/nav_page.dart';
import 'package:flutter_event_ease/pages/receipt_page.dart';

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
      },
      home: IndexPage(),
    );
  }
}
