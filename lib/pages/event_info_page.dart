import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class EventInfoPage extends StatelessWidget {
  const EventInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final rawArgs = ModalRoute.of(context)!.settings.arguments;
if (rawArgs is! Map<String, dynamic>) {
  return const Center(child: Text("Invalid arguments passed to EventInfoPage"));
}
final args = rawArgs as Map<String, dynamic>;

    final String eventId = args['eventId'];
    final bool isAdmin = args['isAdmin'] ?? false;

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text(
          'Event Info',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color(0xFF1A2C54),
        elevation: 4,
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance.collection('event_info').doc(eventId).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text("Error fetching event details"));
          }
          if (!snapshot.hasData || !snapshot.data!.exists) {
            return const Center(child: Text("Event not found"));
          }

          final event = snapshot.data!.data() as Map<String, dynamic>;

          return Container(
            color: const Color(0xFF1A2C54),
            child: SafeArea(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  // Event Image
                  Container(
                    height: 260,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[200],
                      image: event['image_url'] != null
                          ? DecorationImage(
                              image: NetworkImage(event['image_url']),
                              fit: BoxFit.cover,
                            )
                          : null,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 15,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Admin buttons
                  if (isAdmin)
                    Align(
                      alignment: Alignment.topRight,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            style: IconButton.styleFrom(
                              backgroundColor: const Color(0xFF0A1D34),
                              shape: const CircleBorder(),
                            ),
                            icon: const Icon(Icons.edit, color: Colors.white),
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
                              shape: const CircleBorder(),
                            ),
                            icon: const Icon(Icons.delete, color: Colors.white),
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
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Date & Time
                  Row(
                    children: [
                      const Icon(Icons.calendar_today, size: 18, color: Colors.white70),
                      const SizedBox(width: 8),
                      Text(
                        event['date'] != null
                            ? DateFormat('MMMM d, yyyy • h:mm a')
                                .format(DateTime.parse(event['date']))
                            : "Date & Time",
                        style: const TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Divider(color: Colors.white24, thickness: 1),
                  const SizedBox(height: 20),

                  // Organizer
                  const Text(
                    "Organized by",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    event['organizer'] ?? "Unknown",
                    style: const TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                  const SizedBox(height: 20),

                  // Participants
                  if (event['participants'] != null &&
                      (event['participants'] as List).isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Participants",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 8),
                        ...List.generate(
                          (event['participants'] as List).length,
                          (index) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2),
                            child: Text(
                              event['participants'][index],
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  const SizedBox(height: 20),

                  // Event Details
                  const Text(
                    "Event Details",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 200,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0A1D34),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      event['description'] ?? "No details provided.",
                      style: const TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Register Button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1A2C54),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text(
                              "Registration Confirmed",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            content: Text(
                              'You have been registered to "${event['name']}"',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text(
                                  "OK",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: const Text("Register"),
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
          title: const Text("Delete Event", style: TextStyle(fontWeight: FontWeight.bold)),
          content: const Text("Are you sure you want to delete this event?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Cancel", style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            TextButton(
              onPressed: () async {
                try {
                  await FirebaseFirestore.instance.collection('event_info').doc(eventId).delete();
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Event deleted successfully")),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Error deleting event")),
                  );
                }
              },
              child: const Text(
                "Delete",
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    );
  }
}
