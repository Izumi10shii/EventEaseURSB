import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  final bool isAdmin;

  const EditProfilePage({super.key, required this.isAdmin});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _programController = TextEditingController();
  final TextEditingController _sectionController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _middleInitialController =
      TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _interestController = TextEditingController();

  List<String> _interests = [];

  // Fetch user data
  Future<void> fetchUserData() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final doc =
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .get();
      final data = doc.data();
      if (data != null) {
        setState(() {
          _usernameController.text = data['username'] ?? '';
          _programController.text = data['program'] ?? '';
          _sectionController.text = data['section'] ?? '';
          _firstNameController.text = data['firstname'] ?? '';
          _middleInitialController.text = data['MI'] ?? ''; // Fetch the MI
          _lastNameController.text = data['lastname'] ?? '';
          _interests = List<String>.from(data['interests'] ?? []);
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  // Save Profile Changes
  Future<void> saveProfile() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final updatedData = {
        'username': _usernameController.text,
        'program': _programController.text,
        'section': _sectionController.text,
        'firstname': _firstNameController.text,
        'MI': _middleInitialController.text, // Save the MI
        'lastname': _lastNameController.text,
        'interests': _interests,
      };

      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .update(updatedData);
      Navigator.pushNamed(
        context,
        '/profile_page',
      ); // Navigate back to profile page
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 25),
        child: ListView(
          children: [
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
            // Username
            _buildTextField('Username', _usernameController),

            // First Name
            _buildTextField('First Name', _firstNameController),

            // Middle Initial
            _buildTextField('Middle Initial', _middleInitialController),

            // Last Name
            _buildTextField('Last Name', _lastNameController),

            // Program
            _buildTextField('Program', _programController),

            // Section
            _buildTextField('Section', _sectionController),

            SizedBox(height: 30),

            // Interests Section (Only visible for admins)
            if (widget.isAdmin) _buildInterestsSection(),

            SizedBox(height: 30),

            // Save Profile Button
            ListTile(
              title: ElevatedButton(
                onPressed: saveProfile,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1A2C54), // Dark Blue Background
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: Text("Save Profile"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build text fields
  Widget _buildTextField(String label, TextEditingController controller) {
    return ListTile(
      title: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              decoration: BoxDecoration(
                color: Color(0xFF1A2C54), // Dark Grey Blue Background
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(0),
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(60),
                ),
              ),
              child: Text(
                label,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(width: 30),
            Expanded(
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Color(0xFF2C3E50), width: 2),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build interests section (Admin Only)
  Widget _buildInterestsSection() {
    return ListTile(
      title: Container(
        padding: EdgeInsets.all(0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Color(0xFF1A2C54), // Dark Blue
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomRight: Radius.circular(60),
                    ),
                  ),
                  child: Text(
                    "Interest",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF1A2C54),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      _interests.add(_interestController.text);
                      _interestController.clear();
                    });
                  },
                  child: Icon(Icons.add),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF1A2C54),
                    foregroundColor: Colors.white,
                  ),
                  onPressed:
                      _interests.isNotEmpty
                          ? () {
                            setState(() {
                              _interests.removeLast(); // Remove last interest
                            });
                          }
                          : null,
                  child: Icon(Icons.delete),
                ),
              ],
            ),
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _interests.isEmpty
                      ? Text("None added yet")
                      : Column(
                        children:
                            _interests
                                .map((interest) => Text(interest))
                                .toList(),
                      ),
                  SizedBox(height: 10),
                  TextField(
                    controller: _interestController,
                    decoration: InputDecoration(
                      labelText: "Add New Interest",
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Color(0xFF2C3E50),
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
