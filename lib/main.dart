import 'package:flutter/material.dart';
import 'package:flutter_event_ease/admin_pages/admin_login_page.dart';
import 'package:flutter_event_ease/pages/edit_profile_page.dart';
import 'package:flutter_event_ease/pages/event_info_page.dart'; // Merged file
import 'package:flutter_event_ease/pages/home_page.dart';
import 'package:flutter_event_ease/pages/index_page.dart';
import 'package:flutter_event_ease/pages/receipt_page.dart';
import 'package:flutter_event_ease/pages/register_page.dart';
import 'package:flutter_event_ease/pages/login_page.dart';
import 'package:flutter_event_ease/pages/nav_page.dart';
import 'package:flutter_event_ease/pages/CCS_events_page.dart';
import 'package:flutter_event_ease/pages/COA_events_page.dart';
import 'package:flutter_event_ease/pages/COB_events_page.dart';
import 'package:flutter_event_ease/admin_pages/admin_add_event_page.dart';
import 'package:flutter_event_ease/pages/edit_event_page.dart'; // Merged file

// Admin-specific imports removed since they are now merged into shared files

// FIREBASE START
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

late FirebaseFirestore db;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  db = FirebaseFirestore.instance;
/*

  final user = <String, dynamic>{
    "first": "John",
    "last": "Doe",
    "born": 1815
  };

  db.collection("users").add(user).then((DocumentReference doc) =>
      print('DocumentSnapshot added with ID: ${doc.id}'));
*/
  runApp(const MyApp());
}

// FIREBASE END

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
    '/event_info': (context) => EventInfoPage(isAdmin: false),
        '/register_page': (context) => RegisterPage(),
        '/login_page': (context) => LoginPage(),
        '/admin_login_page': (context) => AdminLoginPage(),
        '/admin_add_event_page': (context) => AdminAddEventPage(),
        '/index_page': (context) => IndexPage(),
        '/nav_page': (context) => NavPage(isAdmin: false),
        '/home_page': (context) => HomePage(isAdmin: false), // Pass isAdmin parameter
        '/event_info_page': (context) => EventInfoPage(isAdmin: false), // Merged file
        '/receipt_page': (context) => ReceiptPage(),
        '/edit_profile_page': (context) => EditProfilePage(),
        '/edit_event_page': (context) => EditEventPage(isAdmin: true), // Merged file
        '/COA_events_page': (context) => COAEventsPage(),
        '/COB_events_page': (context) => COBEventsPage(),
        '/CCS_events_page': (context) => CCSEventsPage(),
      },
      home: IndexPage(),
    );
  }
}
