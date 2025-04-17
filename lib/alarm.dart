import 'package:flutter/material.dart';

class Alarm extends StatefulWidget {
  const Alarm({super.key});

  @override
  State<Alarm> createState() => _AlarmState();
}

class _AlarmState extends State<Alarm> {
  bool _isAlarm1On = false;
  bool _isAlarm2On = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Alarms',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        backgroundColor: Color.fromARGB(255, 34, 34, 34),
        actions: [
          PopupMenuButton<String>(
            icon: Icon(Icons.more_vert, color: Colors.white),
            offset: Offset(
              0,
              40,
            ), // THIS IS USED TO ADJUST THE HEIGHT OF THE POPUP
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            color: Color.fromARGB(255, 34, 34, 34), // Match that dark gray tone
            itemBuilder:
                (BuildContext context) => [
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
                    enabled: false, // we’re adding a custom row instead
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
      backgroundColor: const Color.fromARGB(255, 34, 34, 34),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 55, 55, 55),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Time & Days
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          '10:30',
                          style: TextStyle(
                            fontSize: 48,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Tue, Wed',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  // Arrow Icon + Switch
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 20),

                      Switch(
                        value: _isAlarm1On,
                        onChanged: (value) {
                          setState(() {
                            _isAlarm1On = value;
                          });
                        },
                        activeColor: Colors.lightBlueAccent,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 55, 55, 55),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Time & Days
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          '08:30',
                          style: TextStyle(
                            fontSize: 48,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Mon, Tue, Wed, Thu, Fri',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  // Arrow Icon + Switch
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 20),
                      Switch(
                        value: _isAlarm2On,
                        onChanged: (value) {
                          setState(() {
                            _isAlarm2On = value;
                          });
                        },
                        activeColor: Colors.lightBlueAccent,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Container(
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
          ),
        ],
      ),
    );
  }
}
