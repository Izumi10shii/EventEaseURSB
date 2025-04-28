import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class EventInfoPage extends StatelessWidget {
  final bool isAdmin = true; // Hardcoded to true as you specified

  @override
  Widget build(BuildContext context) {
    final String eventId = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(
          'Event Info',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Color(0xFF1A2C54),
        elevation: 4,
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future:
            FirebaseFirestore.instance
                .collection('event_info')
                .doc(eventId)
                .get(),
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
            color: Color(0xFF1A2C54),
            child: SafeArea(
              child: ListView(
                padding: EdgeInsets.all(16),
                children: [
                  // Event image
                  Container(
                    height: 260,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[200],
                      image:
                          event['image_url'] != null
                              ? DecorationImage(
                                image: NetworkImage(event['image_url']),
                                fit: BoxFit.cover,
                              )
                              : null,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 15,
                          offset: Offset(0, 8),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  // Admin edit/delete buttons
                  if (isAdmin)
                    Align(
                      alignment: Alignment.topRight,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            style: IconButton.styleFrom(
                              backgroundColor: Color(0xFF0A1D34),
                              shape: CircleBorder(),
                            ),
                            icon: Icon(Icons.edit, color: Colors.white),
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                '/admin_edit_event_page',
                                arguments: {
                                  'eventId': eventId,
                                  'initialData': event,
                                },
                              );
                            },
                          ),
                          IconButton(
                            style: IconButton.styleFrom(
                              backgroundColor: Colors.red,
                              shape: CircleBorder(),
                            ),
                            icon: Icon(Icons.delete, color: Colors.white),
                            onPressed: () {
                              _showDeleteConfirmationDialog(context, eventId);
                            },
                          ),
                        ],
                      ),
                    ),
                  // Event Title
                  Text(
                    event['name'] ?? "Event Title",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  // Date
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 18,
                        color: Colors.white70,
                      ),
                      SizedBox(width: 8),
                      Text(
                        event['date'] != null
                            ? DateFormat(
                              'MMMM d, yyyy • h:mm a',
                            ).format(DateTime.parse(event['date']))
                            : "Date & Time",
                        style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Divider(color: Colors.white24, thickness: 1),
                  SizedBox(height: 20),
                  // Organizer
                  Text(
                    "Organized by",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    event['organizer'] ?? "Unknown",
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  // Participants
                  if (event['participants'] != null &&
                      (event['participants'] as List).isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Participants",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 8),
                        ...List.generate(
                          (event['participants'] as List).length,
                          (index) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2),
                            child: Text(
                              event['participants'][index],
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  SizedBox(height: 20),
                  Text(
                    "Event Details",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 10),
                  // Event Description
                  Container(
                    height: 200,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color(0xFF0A1D34),
                      borderRadius: BorderRadius.circular(20),
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          event['description'] ?? "No details provided.",
                          style: TextStyle(color: Colors.white70, fontSize: 16),
                        ),
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

  void _showDeleteConfirmationDialog(BuildContext context, String eventId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Delete Event",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Text("Are you sure you want to delete this event?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "Cancel",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            TextButton(
              onPressed: () async {
                try {
                  await FirebaseFirestore.instance
                      .collection('event_info')
                      .doc(eventId)
                      .delete();
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Event deleted successfully")),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Error deleting event")),
                  );
                }
              },
              child: Text(
                "Delete",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
