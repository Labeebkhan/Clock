import 'package:flutter/material.dart';

class Stopwatch extends StatefulWidget {
  const Stopwatch({super.key});

  @override
  State<Stopwatch> createState() => _StopwatchState();
}

class _StopwatchState extends State<Stopwatch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 34, 34, 34),
      appBar: AppBar(
        title: const Text(
          'Stopwatch',
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
      body: Column(
        children: [
          Container(child: Text('data', style: TextStyle(color: Colors.white))),
          Spacer(),
          Center(
            child: SizedBox(
              height: 90,
              width: 90,
              child: FloatingActionButton(
                onPressed: () {},
                child: const Icon(Icons.play_arrow, size: 40),
                backgroundColor: const Color.fromARGB(255, 133, 186, 248),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ),
          Padding(padding: const EdgeInsets.only(bottom: 80)),
        ],
      ),
    );
  }
}
