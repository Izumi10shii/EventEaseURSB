import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminEditEventPage extends StatefulWidget {
  final String eventId;
  final Map<String, dynamic> initialData;

  const AdminEditEventPage({
    super.key,
    required this.eventId,
    required this.initialData,
  });

  @override
  State<AdminEditEventPage> createState() => _AdminEditEventPageState();
}

class _AdminEditEventPageState extends State<AdminEditEventPage> {
  late TextEditingController _eventNameController;
  late TextEditingController _eventDateController;
  late TextEditingController _eventDescriptionController;
  late TextEditingController _organizerNameController;

  bool _isUploading = false;

  @override
  void initState() {
    super.initState();
    _eventNameController = TextEditingController(text: widget.initialData['name']);
    _eventDateController = TextEditingController(text: widget.initialData['date']);
    _eventDescriptionController = TextEditingController(text: widget.initialData['description']);
    _organizerNameController = TextEditingController(text: widget.initialData['organizer']);
  }

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

  Future<void> _updateEvent() async {
    if (_eventNameController.text.isEmpty ||
        _eventDateController.text.isEmpty ||
        _eventDescriptionController.text.isEmpty ||
        _organizerNameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill in all fields.")),
      );
      return;
    }

    setState(() {
      _isUploading = true;
    });

    try {
      await FirebaseFirestore.instance.collection('event_info').doc(widget.eventId).update({
        'name': _eventNameController.text.trim(),
        'date': _eventDateController.text.trim(),
        'description': _eventDescriptionController.text.trim(),
        'organizer': _organizerNameController.text.trim(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Event updated successfully!")),
      );
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to update event: $e")),
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
            _buildTextField("Event Name", controller: _eventNameController),
            SizedBox(height: 16),
            _buildTextField("Organizer Name", controller: _organizerNameController),
            SizedBox(height: 16),
            TextField(
              controller: _eventDateController,
              readOnly: true,
              decoration: _getInputDecoration("Set Date and Time"),
              onTap: _pickDateTime,
            ),
            SizedBox(height: 16),
            _buildTextField("Event Description", controller: _eventDescriptionController, maxLines: 5),
            SizedBox(height: 24),
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
                onPressed: _isUploading ? null : _updateEvent,
                child: _isUploading
                    ? CircularProgressIndicator(color: Colors.white)
                    : Text("Update Event", style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, {required TextEditingController controller, int maxLines = 1}) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: _getInputDecoration(label),
    );
  }

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
    );
  }
}
