import 'package:flutter/material.dart';
import 'dart:async'; // For using Timer
import 'package:intl/intl.dart'; // For formatting date and time

class Clock extends StatefulWidget {
  const Clock({super.key});

  @override
  State<Clock> createState() => _AlarmState(); // Creates a mutable state
}

class _AlarmState extends State<Clock> {
  late String _timeString; // Stores formatted time
  late String _dateString; // Stores formatted date
  late Timer _timer; // Repeats every second to update time

  @override
  void initState() {
    super.initState();
    _updateTime(); // Set initial time
    _timer = Timer.periodic(
      const Duration(seconds: 1), // Runs every 1 second
      (Timer t) => _updateTime(), // Calls function to update UI
    );
  }

  // Function to get current time and date, format it and update state
  void _updateTime() {
    final DateTime now = DateTime.now();
    final String formattedTime = DateFormat('hh:mm ').format(now); // e.g. 04:36
    final String formattedDate = DateFormat(
      'E, d MMM',
    ).format(now); // e.g. Thu, 17 Apr

    setState(() {
      _timeString = formattedTime;
      _dateString = formattedDate;
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel timer to avoid memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Top AppBar with title and menu
      appBar: AppBar(
        title: const Text(
          'Clock',
          style: TextStyle(color: Colors.white, fontSize: 26),
        ),
        backgroundColor: const Color.fromARGB(255, 20, 20, 20),
        actions: [
          // 3-dot popup menu button
          PopupMenuButton<String>(
            icon: Icon(Icons.more_vert, color: Colors.white),
            offset: Offset(0, 40), // Pushes the popup down a little
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16), // Rounded popup
            ),
            color: Color(0xFF2A2A2A), // Dark background for menu
            itemBuilder:
                (BuildContext context) => [
                  // Each option in the popup
                  PopupMenuItem<String>(
                    value: 'screensaver',
                    child: Text(
                      'Screensaver',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'settings',
                    child: Text(
                      'Settings',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'privacy',
                    child: Text(
                      'Privacy policy',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'feedback',
                    child: Text(
                      'Send feedback',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  PopupMenuItem<String>(
                    enabled: false, // Not clickable, just text
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Help', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ],
          ),
        ],
      ),

      backgroundColor: const Color.fromARGB(255, 20, 20, 20), // Dark page bg
      // Clock UI
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0), // Space around column
          child: Column(
            children: [
              // Main time text
              Text(
                _timeString, // Shows current time
                style: const TextStyle(fontSize: 60, color: Colors.white),
              ),

              const SizedBox(height: 10), // Space between time and date
              // Date below the time
              Text(
                _dateString, // Shows formatted date
                style: const TextStyle(fontSize: 24, color: Colors.white70),
              ),

              Spacer(), // Pushes everything above upward
              // Floating Add Button at bottom center
              Container(
                child: SizedBox(
                  height: 90,
                  width: 90,

                  child: FloatingActionButton(
                    onPressed: () async {
                      TimeOfDay? pickedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );

                      if (pickedTime != null) {
                        print('Picked time: ${pickedTime.format(context)}');
                        // Optional: store the time in a variable or add an alarm
                      }
                    },
                    backgroundColor: const Color.fromARGB(255, 133, 186, 248),
                    shape: const CircleBorder(),
                    child: const Icon(
                      Icons.add,
                      size: 28,
                      color: Color.fromARGB(255, 41, 40, 40),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
