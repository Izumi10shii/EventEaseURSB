import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RemindersPage extends StatelessWidget {
  const RemindersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Center(
              child: Text(
                "Event Reminder",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Fetch and display events
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('event_info')
                  .orderBy('createdAt', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text("No reminders found."));
                }

                final events = snapshot.data!.docs;

                return Column(
                  children: events.map((doc) {
                    final data = doc.data() as Map<String, dynamic>;
                    final name = data['name'] ?? '';
                    final description = data['description'] ?? '';

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: ReminderCard(
                        name: name,
                        description: description,
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
  final String name;
  final String description;

  const ReminderCard({
    super.key,
    required this.name,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      decoration: BoxDecoration(
        color: const Color(0xFF0A1D34),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          // Image placeholder
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: const Center(
              child: Text(
                "IMG",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          // Event details
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
         
        ],
      ),
    );
  }
}
