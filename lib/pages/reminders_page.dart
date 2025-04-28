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
                "Event Reminder",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
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
      height: 110, // Reduced height for a more compact card
      decoration: BoxDecoration(
        color: Color(0xFF0A1D34), // Original color
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // Subtle shadow for modern look
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          // Image placeholder with rounded corners and soft background
          Container(
            width: 60, // Reduced image size
            height: 60, // Reduced image size
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Center(
              child: Text(
                "IMG",
                style: TextStyle(
                  fontSize: 14, // Reduced text size to match the new image size
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            ),
          ),
          SizedBox(width: 16), // Reduced spacing between the image and text
          // Event details with modernized spacing
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Art to Success:",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18, // Reduced font size for title
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                SizedBox(height: 5),
                Text(
                  "Introduction to Graffiti...",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14, // Reduced font size for description
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
          // Notification button with subtle design
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF1A2C54), // Original background color
              foregroundColor: Colors.white,
              shape: CircleBorder(),
              padding: EdgeInsets.all(10), // Reduced padding
              elevation: 3, // Subtle shadow for a modern look
            ),
            onPressed: () {},
            child: Icon(Icons.notifications, size: 20), // Smaller icon
          ),
        ],
      ),
    );
  }
}
