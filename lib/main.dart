import 'package:flutter/material.dart';
import 'alarm.dart';
import 'clock.dart';

// exact Google-style bedtime icon

void main() {
  runApp(const landing());
}

class landing extends StatelessWidget {
  const landing({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ClockHome(), debugShowCheckedModeBanner: false);
  }
}

class ClockHome extends StatefulWidget {
  @override
  _ClockHomeState createState() => _ClockHomeState();
}

class _ClockHomeState extends State<ClockHome> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Alarm(),
    Clock(),
    Center(child: Text('Timer', style: TextStyle(fontSize: 24))),
    Center(child: Text('Stopwatch', style: TextStyle(fontSize: 24))),
    Center(child: Text('BedTime', style: TextStyle(fontSize: 24))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 20, 20, 20),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Needed for more than 3 items
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
        },
        backgroundColor: const Color.fromARGB(255, 47, 47, 47),
        selectedItemColor: const Color.fromARGB(255, 152, 151, 151),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.alarm), label: 'Alarm'),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: 'Clock',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer_outlined),
            label: 'Timer',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.av_timer),
            label: 'Stopwatch',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.nights_stay), label: 'Bed'),
        ],
      ),
    );
  }
}
