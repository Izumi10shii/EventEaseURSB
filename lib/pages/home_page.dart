import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  final bool isAdmin;

  const HomePage({super.key, required this.isAdmin});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  // Update search query as the user types
  void _updateSearchQuery() {
    setState(() {
      _searchQuery = _searchController.text.trim();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            // Title
            ListTile(
              title: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "EventEase",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            // Admin-specific "Add Event" button
            if (widget.isAdmin)
              ListTile(
                title: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF1A2C54),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/admin_add_event_page');
                    },
                    child: Text("Add Event"),
                  ),
                ),
              ),

            // Search bar
            ListTile(
              title: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: _searchController,
                  onChanged: (_) => _updateSearchQuery(),
                  decoration: InputDecoration(
                    hintText: 'Search Events',
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Color(0xFFEFEFEF),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 20,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.black12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Color(0xFF1A2C54),
                        width: 2,
                      ),
                    ),
                    suffixIcon: Icon(Icons.search),
                  ),
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),

            SizedBox(height: 20),

            // College Departments title
            ListTile(
              title: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "College Departments",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ),

            // Event cards
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('event_info')
                  .orderBy('createdAt', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: CircularProgressIndicator(),
                  ));
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text('No events found.'),
                    ),
                  );
                }

                final events = snapshot.data!.docs;
                final filteredEvents = _searchQuery.isEmpty
                    ? events
                    : events.where((doc) {
                        final data = doc.data() as Map<String, dynamic>;
                        final name = data['name'] ?? '';
                        final date = data['date'] ?? '';
                        return name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
                               date.toLowerCase().contains(_searchQuery.toLowerCase());
                    }).toList();

                return Column(
                  children: filteredEvents.map((doc) {
                    final data = doc.data() as Map<String, dynamic>;
                    final eventId = doc.id;

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: GestureDetector(
                        onTap: () {
                          // Navigate to EventInfoPage and pass eventId
                          Navigator.pushNamed(
                            context,
                            '/event_info_page',
                            arguments: eventId,  // Pass the eventId here
                          );
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 5,
                          child: ListTile(
                            leading: Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey[300],
                              ),
                              child: Icon(Icons.image, size: 40, color: Colors.white),
                            ),
                            title: Text(
                              data['name'] ?? 'Event Name',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            subtitle: Text(
                              data['date'] ?? 'Event Date & Time',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                        ),
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
