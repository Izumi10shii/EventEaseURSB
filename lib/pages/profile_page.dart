import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart'; // Import for Clipboard functionality
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  Future<Map<String, dynamic>?> fetchUserData() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final doc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
      return doc.data();
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F5FB),  // Light background color
      body: FutureBuilder<Map<String, dynamic>?>(  // Fetch user data
        future: fetchUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError || !snapshot.hasData) {
            return Center(child: Text("Failed to load profile data"));
          }

          final userData = snapshot.data!;
          final interests = userData['interests'] ?? [];  // Fetch interests from Firestore

          return Center(
            child: ListView(
              children: [
                SizedBox(height: 40,),
                ListTile(
                  title: Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 300,
                      width: 300,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[300],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ListTile(
                  title: Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "@${userData['username']}",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(width: 20),
                        ElevatedButton(
                          onPressed: () {
                            Clipboard.setData(ClipboardData(text: userData['username'] ?? ''));
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Username copied to clipboard")),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(40, 40),
                            backgroundColor: Color(0xFF1A2C54),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            elevation: 0,
                          ),
                          child: Icon(Icons.copy),
                        ),
                      ],
                    ),
                  ),
                ),
                _buildBlueSection("Full Name", "${userData['firstname']} ${userData['MI']} ${userData['lastname']}"),
                _buildBlueSection("Program", "${userData['program']}"),
                _buildBlueSection("Section", "${userData['section']}"),
                _buildInterestSection(interests),
                _buildRecentActivitiesSection(),
                ListTile(
                  title: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/edit_profile_page');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF1A2C54),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 5,
                      padding: EdgeInsets.symmetric(vertical: 10),
                    ),
                    child: Text(
                      "Edit Profile",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildBlueSection(String title, String content) {
    return ListTile(
      title: Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0), // Added slight padding inside the container
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),  // Sharp top-right corner
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),  // Curve bottom-right corner
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Color(0xFF1A2C54),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(0),  // Sharp top-right corner
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(100),  // Curve bottom-right corner
                ),
              ),
              child: Text(
                title,
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Text(
                content,
                style: TextStyle(color: Colors.black87, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInterestSection(List<dynamic> interests) {
    return ListTile(
      title: Container(
        padding: EdgeInsets.all(0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                color: Color(0xFF1A2C54),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(22),
                  topRight: Radius.circular(0),  // Sharp top-right corner
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(60),
                ),
              ),
              child: Text(
                "Interests",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: interests.isEmpty
                    ? [Text("No interests added yet", style: TextStyle(color: Colors.black54))]
                    : interests.map<Widget>((interest) => Text(interest, style: TextStyle(color: Colors.black87))).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentActivitiesSection() {
    return ListTile(
      title: Container(
        padding: EdgeInsets.all(0),
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                color: Color(0xFF1A2C54),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(22),
                  topRight: Radius.circular(0),  // Sharp top-right corner
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(60),
                ),
              ),
              child: Text(
                "Recent Activities",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "03/25/2025 | Attended URS Binangonan College Week: March...",
                style: TextStyle(color: Colors.black87),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
