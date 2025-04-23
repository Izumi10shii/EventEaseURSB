import 'package:flutter/material.dart';

class RemindersPage extends StatelessWidget {
  const RemindersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            Center(
              child: Text(
                "Events Reminder",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),

            ReminderCard(),

            SizedBox(height: 20),

            ReminderCard(),
          ],
        ),
      ),
    );
  }
}

class ReminderCard extends StatelessWidget {
  const ReminderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140, // Increased height for better spacing
      decoration: BoxDecoration(
        color: Color(0xFF0A1D34),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          // Image placeholder with larger size
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Text(
                "IMG",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            ),
          ),
          SizedBox(width: 20),
          // Event details
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Art to Success:",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis, // Handle overflow
                  maxLines: 1,
                ),
                SizedBox(height: 5),
                Text(
                  "Introduction to Gra...",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                  overflow: TextOverflow.ellipsis, // Handle overflow
                  maxLines: 1,
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
          // Notification button with modern style
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF1A2C54),
              foregroundColor: Colors.white,
              shape: CircleBorder(),
              padding: EdgeInsets.all(12),
              elevation: 5,
            ),
            onPressed: () {},
            child: Icon(Icons.notifications, size: 24),
          ),
        ],
      ),
    );
  }
}
