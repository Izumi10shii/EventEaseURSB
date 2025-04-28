import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart'; // Import for date formatting

// Event model
class Event {
  final String title;
  final String time;
  final DateTime date;

  Event(this.title, this.time, this.date);
}

class CalendarPage extends StatefulWidget {
  CalendarPage({super.key});

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  final DateTime today = DateTime.now();
  Map<DateTime, List<Event>> events = {}; // This will store the events by date
  DateTime selectedDay = DateTime.now(); // Keep track of selected day

  @override
  void initState() {
    super.initState();
    fetchEvents(); // Fetch events from Firestore when the page loads.
  }

  // Fetch events from Firestore
  Future<void> fetchEvents() async {
    // Query the event_info collection
    final querySnapshot = await FirebaseFirestore.instance.collection('event_info').get();

    // Map to store events by date
    final Map<DateTime, List<Event>> eventsMap = {};

    // Date format to parse the string date
    final dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss.SSS");

    // Loop through each document and add it to the eventsMap
    for (var doc in querySnapshot.docs) {
      final eventData = doc.data();
      final eventDateString = eventData['date']; // Get the 'date' field as string

      if (eventDateString != null) {
        try {
          // Parse the date string into DateTime
          final eventDate = dateFormat.parse(eventDateString);

          // Normalize event date to remove time (for comparison purposes)
          final normalizedEventDate = DateTime(eventDate.year, eventDate.month, eventDate.day);

          // Create the event object
          final event = Event(
            eventData['name'],  // Assuming 'name' is the event title
            eventData['description'],  // Assuming 'description' is the event time
            eventDate, // Date of the event
          );

          // Add the event to the map for the specific date
          if (eventsMap.containsKey(normalizedEventDate)) {
            eventsMap[normalizedEventDate]!.add(event);
          } else {
            eventsMap[normalizedEventDate] = [event];
          }
        } catch (e) {
          print("Error parsing date: $e");
        }
      }
    }

    // Check if the widget is still mounted before calling setState
    if (mounted) {
      setState(() {
        events = eventsMap;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            Center(
              child: Text(
                "Calendar of Events",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
            SizedBox(height: 20),
            // Animated TableCalendar
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              padding: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 12,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
              child: TableCalendar(
                rowHeight: 50, // Increased row height for better spacing
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  titleTextStyle: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                  leftChevronIcon: Icon(Icons.chevron_left, color: Colors.blueAccent),
                  rightChevronIcon: Icon(Icons.chevron_right, color: Colors.blueAccent),
                ),
                daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  weekendStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                calendarStyle: CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: Colors.blueAccent,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueAccent.withOpacity(0.6),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  selectedDecoration: BoxDecoration(
                    color: Colors.orangeAccent,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orangeAccent.withOpacity(0.6),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  weekendTextStyle: TextStyle(color: Colors.red),
                  defaultTextStyle: TextStyle(color: Colors.black87),
                  markersMaxCount: 1, // Limit number of markers per day
                  markerDecoration: BoxDecoration(
                    color: Colors.green, // Green highlight for event days
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green.withOpacity(0.4),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                ),
                focusedDay: today,
                firstDay: DateTime.utc(2024, 1, 1),
                lastDay: DateTime.utc(2040, 1, 1),
                eventLoader: (day) {
                  // Normalize the `day` to remove time for comparison
                  final normalizedDay = DateTime(day.year, day.month, day.day);

                  // Return the events for the normalized day
                  return events[normalizedDay] ?? [];
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    this.selectedDay = selectedDay;
                  });
                },
              ),
            ),
            SizedBox(height: 40),
            Text(
              "Upcoming Events",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),
            SizedBox(height: 20),
            // Show events for selected day
            if (events[selectedDay] != null && events[selectedDay]!.isNotEmpty)
              ...events[selectedDay]!.map((event) {
                return EventCard(
                  label: "Registered",
                  title: event.title,
                  date: DateFormat('MMM dd, yyyy').format(event.date),
                  time: event.time,
                );
              }).toList()
            else
              Text(
                "No events for this day.",
                style: TextStyle(fontSize: 18),
              ),
          ],
        ),
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final String label;
  final String title;
  final String date;
  final String time;

  const EventCard({
    super.key,
    required this.label,
    required this.title,
    required this.date,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 10),
        // Animated EventCard
        AnimatedContainer(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              // Image placeholder with larger size
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    "IMG",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16),
              // Event details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    SizedBox(height: 5),
                    Text(
                      date,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    SizedBox(height: 5),
                    Text(
                      time,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
