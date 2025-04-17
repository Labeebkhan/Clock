import 'package:flutter/material.dart';
import 'alarm.dart';
import 'clock.dart';
import 'Timer.dart';

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
    Timer(),
    Center(child: Text('Stopwatch', style: TextStyle(fontSize: 24))),
    Center(child: Text('BedTime', style: TextStyle(fontSize: 24))),
  ];

  final List<IconData> _icons = [
    Icons.alarm,
    Icons.access_time,
    Icons.timer_outlined,
    Icons.av_timer,
    Icons.nights_stay,
  ];

  final List<String> _labels = ['Alarm', 'Clock', 'Timer', 'Stopwatch', 'Bed'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 55, 55, 55),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
        },
        backgroundColor: const Color.fromARGB(255, 55, 55, 55),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: List.generate(_icons.length, (index) {
          return BottomNavigationBarItem(
            label: _labels[index],
            icon: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color:
                    _currentIndex == index
                        ? Colors.blue.withOpacity(0.3)
                        : Colors.transparent,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Icon(_icons[index]),
            ),
          );
        }),
      ),
    );
  }
}
