import 'package:flutter/material.dart';
import 'package:flutter_event_ease/pages/calendar_page.dart';
import 'package:flutter_event_ease/pages/home_page.dart';
import 'package:flutter_event_ease/pages/profile_page.dart';
import 'package:flutter_event_ease/pages/reminders_page.dart';

class NavPage extends StatefulWidget{
  const NavPage({super.key});

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {

  int _selectedIndex = 0;

  void _navigateBottomBar(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  final List _pages = [
    //HomePage(),
    HomePage(),

    CalendarPage(),

    RemindersPage(),

    ProfilePage(),

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