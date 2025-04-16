import 'package:flutter/material.dart';
import 'dart:async'; // For Timer;
import 'package:intl/intl.dart'; // For DateFormat

class Clock extends StatefulWidget {
  const Clock({super.key});

  @override
  State<Clock> createState() => _AlarmState();
}

class _AlarmState extends State<Clock> {
  late String _timeString;
  late String _dateString;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _updateTime();
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer t) => _updateTime(),
    );
  }

  void _updateTime() {
    final DateTime now = DateTime.now();
    final String formattedTime = DateFormat('hh:mm ').format(now);
    final String formattedDate = DateFormat('E, d MMM').format(now);

    setState(() {
      _timeString = formattedTime;
      _dateString = formattedDate;
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Clock',
          style: TextStyle(color: Colors.white, fontSize: 26),
        ),
        backgroundColor: const Color.fromARGB(255, 20, 20, 20),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white, size: 28),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 20, 20, 20),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Text(
                _timeString,
                style: const TextStyle(fontSize: 60, color: Colors.white),
              ),
              const SizedBox(height: 10),
              Text(
                _dateString,
                style: const TextStyle(fontSize: 24, color: Colors.white70),
              ),
              Spacer(),
              Container(
                child: SizedBox(
                  height: 90,
                  width: 90,
                  child: FloatingActionButton(
                    onPressed: () {},
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
