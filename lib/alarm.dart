import 'package:flutter/material.dart';

class Alarm extends StatefulWidget {
  const Alarm({super.key});

  @override
  State<Alarm> createState() => _AlarmState();
}

class _AlarmState extends State<Alarm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Alarms',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        backgroundColor: const Color.fromARGB(255, 20, 20, 20),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white, size: 28),
            onPressed: () {
              // TODO: Handle options
            },
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 20, 20, 20),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Put your alarm list or UI here
            const Text(
              'No alarms yet',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            // Padding(
            //   padding: EdgeInsets.only(top: 470),
            //   child: SizedBox(
            //     height: 90,
            //     width: 90,
            //     child: Center(
            //       child: FloatingActionButton(
            //         onPressed: () {},
            //         backgroundColor: const Color.fromARGB(255, 133, 186, 248),
            //         shape: const CircleBorder(),
            //         child: const Icon(
            //           Icons.add,
            //           size: 28,
            //           color: Color.fromARGB(255, 41, 40, 40),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
