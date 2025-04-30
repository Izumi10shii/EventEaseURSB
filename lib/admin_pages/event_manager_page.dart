import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EventManagerPage extends StatelessWidget {
  const EventManagerPage({super.key});

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

            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('event_info')
                  .orderBy('createdAt', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(child: Text("No events found."));
                }

                final events = snapshot.data!.docs;

                return Column(
                  children: events.map((doc) {
                    final data = doc.data() as Map<String, dynamic>;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: ReminderCard(
                        eventId: doc.id,
                        name: data['name'] ?? "No Title",
                        description: data['description'] ?? "",
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ReminderCard extends StatelessWidget {
  final String eventId;
  final String name;
  final String description;

  const ReminderCard({
    super.key,
    required this.eventId,
    required this.name,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: Color(0xFF0A1D34),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text("IMG"),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  description,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF1A2C54),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              minimumSize: Size(40, 40),
              padding: EdgeInsets.zero,
            ),
            onPressed: () {
              Navigator.pushNamed(
                context,
                "/admin_edit_event_page",
                arguments: {
                  'eventId': eventId,
                },
              );
            },
            child: Icon(Icons.edit),
          ),
        ],
      ),
    );
  }
}
