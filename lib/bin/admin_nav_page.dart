import 'package:flutter/material.dart';
import 'package:flutter_event_ease/pages/calendar_page.dart';

import 'package:flutter_event_ease/admin_pages/event_manager_page.dart';

import 'package:flutter_event_ease/admin_pages/admin_profile_page.dart';


class AdminNavPage extends StatefulWidget {
  const AdminNavPage({super.key});

  @override
  State<AdminNavPage> createState() => _AdminNavPageState();
}

class _AdminNavPageState extends State<AdminNavPage> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List _pages = [


    CalendarPage(),

    EventManagerPage(),

    AdminProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,

        elevation: 8,
        items: [
          BottomNavigationBarItem(
            icon:
                _selectedIndex == 0
                    ? Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Color(
                          0xFF1A2C54,
                        ), // Background color when selected
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(Icons.home, color: Colors.white),
                    )
                    : Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon:
                _selectedIndex == 1
                    ? Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Color(0xFF1A2C54),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(Icons.calendar_month, color: Colors.white),
                    )
                    : Icon(Icons.calendar_month),
            label: "Calendar",
          ),
          BottomNavigationBarItem(
            icon:
                _selectedIndex == 2
                    ? Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Color(0xFF1A2C54),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(Icons.notifications, color: Colors.white),
                    )
                    : Icon(Icons.notifications),
            label: "Reminders",
          ),
          BottomNavigationBarItem(
            icon:
                _selectedIndex == 3
                    ? Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Color(0xFF1A2C54),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(Icons.person, color: Colors.white),
                    )
                    : Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
