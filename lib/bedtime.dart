import 'package:flutter/material.dart';

class Bedtime extends StatefulWidget {
  const Bedtime({super.key});

  @override
  State<Bedtime> createState() => _BedtimeState();
}

class _BedtimeState extends State<Bedtime> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 34, 34, 34),
      appBar: AppBar(
        title: const Text(
          'Bed Time',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        backgroundColor: const Color.fromARGB(255, 34, 34, 34),
        actions: [
          PopupMenuButton<String>(
            shape: RoundedRectangleBorder(
              //To make the Corners of the DropDown Round
              borderRadius: BorderRadius.circular(16),
            ),
            offset: const Offset(0, 40), // to add the gap From the Top
            color: const Color.fromARGB(255, 43, 43, 43),
            icon: const Icon(Icons.more_vert, color: Colors.white),
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem<String>(
                  value: 'screensaver',
                  child: Text(
                    'ScreenSaver',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                PopupMenuItem(
                  value: 'setting',
                  child: Text('Setting', style: TextStyle(color: Colors.white)),
                ),
                PopupMenuItem(
                  value: 'privacy',
                  child: Text(
                    'Privacy Policy',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'feedback',
                  child: Text(
                    'Send feedback',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ];
            },
          ),
        ],
      ),
    );
  }
}
