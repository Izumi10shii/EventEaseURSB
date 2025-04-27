import 'package:flutter/material.dart';
import 'package:flutter_event_ease/pages/calendar_page.dart';
import 'package:flutter_event_ease/pages/home_page.dart';
import 'package:flutter_event_ease/pages/profile_page.dart';
import 'package:flutter_event_ease/pages/reminders_page.dart';

class NavPage extends StatefulWidget {
  const NavPage({super.key});

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List _pages = [
    HomePage(isAdmin: false), // Pass the required isAdmin parameter
    CalendarPage(),
    RemindersPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 65, // Reduced height for the navigation bar
            decoration: BoxDecoration(
              color: Colors.transparent, // Removed extra white background
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, -2),
                ),
              ],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: _selectedIndex,
              onTap: _navigateBottomBar,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              backgroundColor: Colors.white, // Retained white color for the bar
              showSelectedLabels: false,
              showUnselectedLabels: false,
              elevation: 0,
              items: [
                BottomNavigationBarItem(
                  icon: _buildNavItem(0, Icons.home),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: _buildNavItem(1, Icons.calendar_month),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: _buildNavItem(2, Icons.notifications),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: _buildNavItem(3, Icons.person),
                  label: "",
                ),
              ],
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 300), // Animation duration
            curve: Curves.easeInOut, // Smooth animation curve
            top: -15, // Lowered the floating item closer to the bar
            left: MediaQuery.of(context).size.width / 4 * _selectedIndex + 20,
            child: _buildFloatingNavItem(),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon) {
    return Icon(
      icon,
      color: _selectedIndex == index ? Colors.transparent : Colors.grey,
    );
  }

  Widget _buildFloatingNavItem() {
    IconData selectedIcon;
    switch (_selectedIndex) {
      case 0:
        selectedIcon = Icons.home;
        break;
      case 1:
        selectedIcon = Icons.calendar_month;
        break;
      case 2:
        selectedIcon = Icons.notifications;
        break;
      case 3:
        selectedIcon = Icons.person;
        break;
      default:
        selectedIcon = Icons.home;
    }

    return Container(
      height: 60, // Box shape with equal height and width
      width: 60,
      decoration: BoxDecoration(
        color: Color(0xFF1A2C54),
        borderRadius: BorderRadius.circular(12), // Rounded corners for the box
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: Icon(selectedIcon, color: Colors.white, size: 28),
      ),
    );
  }
}
