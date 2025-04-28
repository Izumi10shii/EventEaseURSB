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
    if (
        // _selectedImage == null ||   // Commented out image validation
        _eventNameController.text.isEmpty ||
        _eventDateController.text.isEmpty ||
        _eventDescriptionController.text.isEmpty ||
        _organizerNameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill in all fields.")), // Updated text too
      );
      return;
    }

    setState(() {
      _isUploading = true;
    });

    try {
      /*
      final bytes = await _selectedImage!.readAsBytes();
      final base64Image = base64Encode(bytes);
      */

      // Updated collection name to 'event_info'
      await FirebaseFirestore.instance.collection('event_info').add({
        'name': _eventNameController.text.trim(),
        'date': _eventDateController.text.trim(),
        'description': _eventDescriptionController.text.trim(),
        'organizer': _organizerNameController.text.trim(),
        //'imageBase64': base64Image, // Image not added yet
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
          padding: EdgeInsets.all(20),
          children: [
            // Event Image Section
            GestureDetector(
              //onTap: _pickImage, // Commented out tap
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

            SizedBox(height: 24),

            // Event Name Field
            _buildTextField("Event Name", controller: _eventNameController),

            SizedBox(height: 16),

            // Organizer Name Field
            _buildTextField("Organizer Name", controller: _organizerNameController),

            SizedBox(height: 16),

            // Date Field with consistent style
            TextField(
              controller: _eventDateController,
              readOnly: true,
              decoration: _getInputDecoration("Set Date and Time"),
              onTap: _pickDateTime,
            ),

            SizedBox(height: 16),

            // Event Description Field
            _buildTextField("Event Description", 
              controller: _eventDescriptionController, 
              maxLines: 5
            ),

            SizedBox(height: 24),

            // Add Event Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF0A1D34),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: _isUploading ? null : _uploadEvent,
                child: _isUploading
                    ? CircularProgressIndicator(color: Colors.white)
                    : Text("Add Event", style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Updated helper method for consistent text field styling
  Widget _buildTextField(String label, {TextEditingController? controller, int maxLines = 1}) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: _getInputDecoration(label),
    );
  }

  // New method for consistent input decoration
  InputDecoration _getInputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Color(0xFF1A2C54)),
      filled: true,
      fillColor: Color(0xFFEFEFEF),
      contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: Colors.black12),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: Color(0xFF1A2C54), width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: Colors.red, width: 2),
      ),
    );
  }
}
