import 'package:flutter/material.dart';
import 'package:flutter_event_ease/admin_pages/admin_add_event_page.dart';
import 'package:flutter_event_ease/admin_pages/admin_edit%20_event_page.dart';
import 'package:flutter_event_ease/admin_pages/admin_login_page.dart';
import 'package:flutter_event_ease/pages/edit_profile_page.dart';
import 'package:flutter_event_ease/pages/event_info_page.dart';
import 'package:flutter_event_ease/pages/home_page.dart';
import 'package:flutter_event_ease/pages/index_page.dart';
import 'package:flutter_event_ease/pages/profile_page.dart';
import 'package:flutter_event_ease/pages/receipt_page.dart';
import 'package:flutter_event_ease/pages/register_page.dart';
import 'package:flutter_event_ease/pages/login_page.dart';
import 'package:flutter_event_ease/pages/nav_page.dart';
import 'package:flutter_event_ease/pages/CCS_events_page.dart';
import 'package:flutter_event_ease/pages/COA_events_page.dart';
import 'package:flutter_event_ease/pages/COB_events_page.dart';
import 'package:flutter_event_ease/pages/edit_event_page.dart'; 

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

  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) {
        if (settings.name == '/admin_edit_event_page') {
          final args = settings.arguments as Map<String, dynamic>;

          return MaterialPageRoute(
            builder: (context) => AdminEditEventPage(
              eventId: args['eventId'],
              initialData: args['initialData'],
            ),
          );
        }
        return null; // fallback
      },
      routes: {
        '/register_page': (context) => RegisterPage(),
        '/profile_page': (context) => ProfilePage(),
        '/login_page': (context) => LoginPage(),
        '/admin_login_page': (context) => AdminLoginPage(),
        '/admin_add_event_page': (context) => AdminAddEventPage(),
        '/index_page': (context) => IndexPage(),
        '/nav_page': (context) => NavPage(isAdmin: false), // Keep isAdmin for pages that still need it
        '/home_page': (context) => HomePage(isAdmin: false), // Keep isAdmin for pages that still need it
        '/event_info_page': (context) => EventInfoPage(), // No need to pass isAdmin here anymore
        '/receipt_page': (context) => ReceiptPage(),
        '/edit_profile_page': (context) => EditProfilePage(isAdmin: true,),
        '/edit_event_page': (context) => EditEventPage(isAdmin: true), // Keep isAdmin for pages that need it
        '/COA_events_page': (context) => COAEventsPage(),
        '/COB_events_page': (context) => COBEventsPage(),
        '/CCS_events_page': (context) => CCSEventsPage(),
      },
      home: IndexPage(),
    );
  }
}
