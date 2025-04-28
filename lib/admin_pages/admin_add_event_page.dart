import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
//import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminAddEventPage extends StatefulWidget {
  const AdminAddEventPage({super.key});

  @override
  State<AdminAddEventPage> createState() => _AdminAddEventPageState();
}

class _AdminAddEventPageState extends State<AdminAddEventPage> {
  File? _selectedImage;
  bool _isUploading = false;

  final TextEditingController _eventNameController = TextEditingController();
  final TextEditingController _eventDateController = TextEditingController();
  final TextEditingController _eventDescriptionController = TextEditingController();
  final TextEditingController _organizerNameController = TextEditingController();

/*
  Future<void> _pickImage() async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        setState(() {
          _selectedImage = File(pickedFile.path);
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to pick image: $e")),
      );
    }
  }
  */

  Future<void> _pickDateTime() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        final DateTime fullDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );

        setState(() {
          _eventDateController.text = fullDateTime.toString();
        });
      }
    }
  }

  Future<void> _uploadEvent() async {
    if (_selectedImage == null ||
        _eventNameController.text.isEmpty ||
        _eventDateController.text.isEmpty ||
        _eventDescriptionController.text.isEmpty ||
        _organizerNameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill in all fields and select an image.")),
      );
      return;
    }

    setState(() {
      _isUploading = true;
    });

    try {
      // Convert image to base64
      final bytes = await _selectedImage!.readAsBytes();
      final base64Image = base64Encode(bytes);

      // Save event details and image to Firestore
      await FirebaseFirestore.instance.collection('events').add({
        'name': _eventNameController.text.trim(),
        'date': _eventDateController.text.trim(),
        'description': _eventDescriptionController.text.trim(),
        'organizer': _organizerNameController.text.trim(),
        'imageBase64': base64Image,
        'createdAt': FieldValue.serverTimestamp(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Event added successfully!")),
      );

      // Clear fields and reset state
      setState(() {
        _selectedImage = null;
        _eventNameController.clear();
        _eventDateController.clear();
        _eventDescriptionController.clear();
        _organizerNameController.clear();
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to add event: $e")),
      );
    } finally {
      setState(() {
        _isUploading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          children: [
            // Event Image Section
            GestureDetector(
              //onTap: _pickImage,
              child: Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20),
                  image: _selectedImage != null
                      ? DecorationImage(
                          image: FileImage(_selectedImage!),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: _selectedImage == null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.image,
                            size: 100,
                            color: Colors.white70,
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Tap to select an image",
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
                      )
                    : null,
              ),
            ),

            SizedBox(height: 20),

            // Event Name Field
            _buildTextField("Event Name", controller: _eventNameController),

            SizedBox(height: 20),

            // Organizer Name Field
            _buildTextField("Organizer Name", controller: _organizerNameController),

            SizedBox(height: 20),

            // Set Date Field
            ListTile(
              title: TextField(
                controller: _eventDateController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: "Set Date and Time",
                  filled: true,
                  fillColor: Color(0xFFEFEFEF),
                  contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.black12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Color(0xFF1A2C54), width: 2),
                  ),
                ),
                onTap: _pickDateTime,
              ),
            ),

            SizedBox(height: 20),

            // Event Description Field
            _buildTextField("Event Description", controller: _eventDescriptionController, maxLines: 5),

            SizedBox(height: 20),

            // Add Event Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF0A1D34),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              onPressed: _isUploading ? null : _uploadEvent,
              child: _isUploading
                  ? CircularProgressIndicator(color: Colors.white)
                  : Text("Add Event"),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build text fields
  Widget _buildTextField(String label, {TextEditingController? controller, int maxLines = 1}) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Color(0xFFEFEFEF),
        contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.black12),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Color(0xFF1A2C54), width: 2),
        ),
      ),
    );
  }
}
