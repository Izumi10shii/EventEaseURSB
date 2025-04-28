import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class EventInfoPage extends StatelessWidget {
  final bool isAdmin;

  const EventInfoPage({super.key, required this.isAdmin});

  @override
  Widget build(BuildContext context) {
    final String eventId = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      body: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance.collection('event_info').doc(eventId).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("Error fetching event details"));
          }
          if (!snapshot.hasData || !snapshot.data!.exists) {
            return Center(child: Text("Event not found"));
          }

          final event = snapshot.data!.data() as Map<String, dynamic>;

          return Container(
            decoration: BoxDecoration(
              color: Color(0xFF1A2C54),
            ),
            child: SafeArea(
              child: ListView(
                padding: EdgeInsets.all(16),
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey,
                      image: event['image_url'] != null
                          ? DecorationImage(
                              image: NetworkImage(event['image_url']),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          event['name'] ?? "Event Title",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          event['date'] != null
                              ? DateFormat('MMM dd, yyyy - hh:mm a').format(
                                  DateTime.parse(event['date'] as String),
                                )
                              : "Date & Time",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white70,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text("Organized by:", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                        Text(event['organizer'] ?? "Organization name", style: TextStyle(color: Colors.white70)),
                        SizedBox(height: 20),
                        Text("Participants", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                        ...((event['participants'] as List<dynamic>?) ?? [])
                            .map((participant) => Text(participant, style: TextStyle(color: Colors.white70)))
                            .toList(),
                        SizedBox(height: 20),
                        Text("Event Details", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                        SizedBox(height: 10),
                        Text(event['description'] ?? "No details available", style: TextStyle(color: Colors.white70)),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
