import 'package:flutter/material.dart';
import 'package:flutter_event_ease/pages/calendar_page.dart';
import 'package:flutter_event_ease/pages/profile_page.dart';

import 'package:flutter_event_ease/admin_pages/event_manager_page.dart';
import 'package:flutter_event_ease/admin_pages/admin_home_page.dart';
import 'package:flutter_event_ease/admin_pages/admin_profile_page.dart';

class AdminNavPage extends StatefulWidget{
  const AdminNavPage({super.key});

  @override
  State<AdminNavPage> createState() => _NavPageState();
}

class _NavPageState extends State<AdminNavPage> {

  int _selectedIndex = 0;

  void _navigateBottomBar(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  final List _pages = [
    //HomePage(),
    AdminHomePage(),

    CalendarPage(),

    EventManagerPage(),

    AdminProfilePage(),

  ];


  @override
  Widget build(BuildContext context){
    return Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: _navigateBottomBar,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
            label: "Home"),

            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
            label: "Calendar"),

            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
            label: "Reminders"),

            BottomNavigationBarItem(
              icon: Icon(Icons.person),
            label: "Profile"),

          ])
    );
  }
}