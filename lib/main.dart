import 'package:flutter/material.dart';
import 'package:flutter_event_ease/pages/event_info_page.dart';
import 'package:flutter_event_ease/pages/home_page.dart';
import 'package:flutter_event_ease/pages/index_page.dart';
import 'package:flutter_event_ease/pages/receipt_page.dart';
import 'package:flutter_event_ease/pages/register_page.dart';
import 'package:flutter_event_ease/pages/login_page.dart';
import 'package:flutter_event_ease/pages/nav_page.dart';
import 'package:flutter_event_ease/pages/CCS_events_page.dart';
import 'package:flutter_event_ease/pages/COA_events_page.dart';
import 'package:flutter_event_ease/pages/COB_events_page.dart';

//Admin Pages
import 'package:flutter_event_ease/admin_pages/admin_nav_page.dart';
import 'package:flutter_event_ease/admin_pages/admin_home_page.dart';
import 'package:flutter_event_ease/admin_pages/admin_login_page.dart';
import 'package:flutter_event_ease/admin_pages/admin_edit_event_page.dart';
import 'package:flutter_event_ease/admin_pages/participants_page.dart';
import 'package:flutter_event_ease/admin_pages/admin_event_info_page.dart';
import 'package:flutter_event_ease/admin_pages/event_manager_page.dart';
import 'package:flutter_event_ease/admin_pages/admin_profile_page.dart';
import 'package:flutter_event_ease/admin_pages/admin_edit_profile_page.dart';

//FIREBASE START
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; 

late FirebaseFirestore db; 

void main() async{
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);

  db = FirebaseFirestore.instance;

  final user = <String, dynamic>{
    "first": "John",
    "last": "Doe",
    "born": 1815
  };

  db.collection("users").add(user).then((DocumentReference doc) => 
  print('DocumentSnapshot added with ID: ${doc.id}'));

runApp(const MyApp());
} 

//FIREBASE END












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
        '/edit_profile_page': (context) => ReceiptPage(),


        //Admin Pages
        '/admin_page': (context) => AdminPage(),
        '/admin_edit_event_page': (context) => AdminEditEventPage(),
        '/participants_page': (context) => ParticipantsPage(),
        '/admin_nav_page': (context) => AdminNavPage(),
        '/admin_home_page':(context) => AdminHomePage(),
        '/admin_event_info_page': (context) => AdminEventInfoPage(),
        '/event_manager_page': (context) => EventManagerPage(),
        '/admin_profile_page': (context) => AdminProfilePage(),
        '/admin_edit_profile_page': (context) => AdminEditProfilePage(),
        '/COA_events_page' :(context) => COAEventsPage(),
        '/COB_events_page' :(context) => COBEventsPage(),
        '/CCS_events_page' :(context) => CCSEventsPage(),
      },
      home: IndexPage(),
    );
  }
}
