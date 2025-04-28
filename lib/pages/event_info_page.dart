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
        title: Text('Event Info', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: Color(0xFF1A2C54),
        elevation: 4, // Adding elevation for a more modern feel
      ),
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
                  // Only show the edit and delete buttons if the user is an admin
                  if (isAdmin)
                    Align(
                      alignment: Alignment.topRight,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
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
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              _showDeleteConfirmationDialog(context, eventId);
                            },
                          ),
                        ],
                      ),
                    ),
                  // Event image with improved styling
                  Container(
                    height: 250, // Increased height for the image
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey,
                      image: event['image_url'] != null
                          ? DecorationImage(
                              image: NetworkImage(event['image_url']),
                              fit: BoxFit.cover,
                            )
                          : null,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  // Event details
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(event['name'] ?? "Event Title",
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            )),
                        SizedBox(height: 10),
                        Text(
                          event['date'] != null
                              ? DateFormat('MMM dd, yyyy - hh:mm a').format(
                                  DateTime.parse(event['date']),
                                )
                              : "Date & Time",
                          style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text("Organized by:", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        Text(event['organizer'] ?? "Unknown", style: TextStyle(color: Colors.white70)),
                        SizedBox(height: 20),
                        Text("Participants", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        ...(event['participants'] ?? []).map<Widget>((p) =>
                            Text(p, style: TextStyle(color: Colors.white70))).toList(),
                        SizedBox(height: 20),
                        Text("Event Details", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
                        SizedBox(height: 10),
                        Text(event['description'] ?? "No details", style: TextStyle(color: Colors.white70)),
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

  // Function to show the delete confirmation dialog
  void _showDeleteConfirmationDialog(BuildContext context, String eventId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Delete Event", style: TextStyle(fontWeight: FontWeight.bold)),
          content: Text("Are you sure you want to delete this event?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("Cancel", style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            TextButton(
              onPressed: () async {
                // Delete the event from Firestore
                try {
                  await FirebaseFirestore.instance.collection('event_info').doc(eventId).delete();
                  Navigator.of(context).pop(); // Close the dialog
                  Navigator.of(context).pop(); // Go back to the previous page after deletion
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Event deleted successfully")));
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error deleting event")));
                }
              },
              child: Text("Delete", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
            ),
          ],
        );
      },
    );
  }
}
