import 'package:flutter/material.dart';

class ParticipantsPage extends StatelessWidget {
  ParticipantsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ListView(
            padding: EdgeInsets.zero, // Remove listview padding
            children: [

              // HEADER
              Container(
                padding: EdgeInsets.all(20),
                color: Colors.blue,
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        "Event: Participants",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                        ),
                      ),
                    ),
                    SizedBox(height: 10), // slight spacing
                    Center(
                      child: Text(
                        "Intramurals 2025: URS 27th Anniversary Special",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),

              // TABLE
              Container(
                color: Colors.blue,
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    // TABLE HEADER
                    Row(
                      children: [
                        buildTableHeader("Student ID"),
                        buildTableHeader("Student Full Name"),
                        buildTableHeader("Email Address"),
                      ],
                    ),

                    // TABLE ROW
                    Row(
                      children: [
                        buildTableCell("B2023-00293", isGrey: true),
                        buildTableCell("Kent Harvey R. Paras"),
                        buildTableCell("hevharbi@gmail.com"),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // WIDGET FOR HEADER CELL
  Widget buildTableHeader(String text) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        decoration: BoxDecoration(
          color: Color(0xFF1A2C54),
          border: Border.all(color: Colors.black),
        ),
        child: Text(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          text,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  // WIDGET FOR DATA CELL
  Widget buildTableCell(String text, {bool isGrey = false}) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        decoration: BoxDecoration(
          color: isGrey ? Colors.grey : Colors.white,
          border: Border.all(color: Colors.black),
        ),
        child: Text(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          text,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
