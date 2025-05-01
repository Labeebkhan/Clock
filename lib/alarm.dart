import 'package:flutter/material.dart';

class Alarm extends StatefulWidget {
  const Alarm({super.key});

  @override
  State<Alarm> createState() => _AlarmState();
}

class _AlarmState extends State<Alarm> {
  bool _isAlarm1On = false;
  bool _isAlarm2On = false;
  bool _isExpanded1 = false;
  bool _isExpanded2 = false;

  final List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  List<bool> selectedDays1 = List.generate(7, (index) => false);
  List<bool> selectedDays2 = List.generate(7, (index) => false);

  bool vibrate1 = true;
  bool vibrate2 = false;

  Widget buildDaySelector(List<bool> selectedDays, Function(int) onTap) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(days.length, (index) {
        return GestureDetector(
          onTap: () => onTap(index),
          child: CircleAvatar(
            backgroundColor:
                selectedDays[index] ? Colors.lightBlueAccent : Colors.grey[800],
            radius: 18,
            child: Text(days[index][0], style: TextStyle(color: Colors.white)),
          ),
        );
      }),
    );
  }

  Widget buildDropdown({
    required List<bool> selectedDays,
    required Function(int) onDayTap,
    required bool vibrate,
    required Function(bool?) onVibrateChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        buildDaySelector(selectedDays, onDayTap),
        const SizedBox(height: 12),
        Row(
          children: [
            Icon(Icons.vibration, color: Colors.white),
            const SizedBox(width: 10),
            const Text('Vibrate', style: TextStyle(color: Colors.white)),
            const Spacer(),
            Checkbox(
              value: vibrate,
              onChanged: onVibrateChanged,
              activeColor: Colors.lightBlueAccent,
              checkColor: Colors.black,
            ),
          ],
        ),
      ],
    );
  }

  Widget buildAlarmTile({
    required String time,
    required List<bool> selectedDays,
    required bool isAlarmOn,
    required ValueChanged<bool> onSwitchChanged,
    required bool isExpanded,
    required VoidCallback onExpandToggle,
    required Function(int) onDayTap,
    required bool vibrate,
    required Function(bool?) onVibrateChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 55, 55, 55),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Time & Days
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        time,
                        style: const TextStyle(
                          fontSize: 48,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        selectedDays
                            .asMap()
                            .entries
                            .where((entry) => entry.value)
                            .map((entry) => days[entry.key])
                            .join(', '),
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                // Arrow Icon + Switch
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: onExpandToggle,
                      child: Icon(
                        isExpanded
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Switch(
                      value: isAlarmOn,
                      onChanged: onSwitchChanged,
                      activeColor: Colors.lightBlueAccent,
                    ),
                  ],
                ),
              ],
            ),
            if (isExpanded)
              buildDropdown(
                selectedDays: selectedDays,
                onDayTap: onDayTap,
                vibrate: vibrate,
                onVibrateChanged: onVibrateChanged,
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Alarms',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        backgroundColor: const Color.fromARGB(255, 34, 34, 34),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            offset: const Offset(0, 40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            color: const Color.fromARGB(255, 34, 34, 34),
            itemBuilder:
                (BuildContext context) => [
                  const PopupMenuItem<String>(
                    value: 'screensaver',
                    child: Text(
                      'Screensaver',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const PopupMenuItem<String>(
                    value: 'settings',
                    child: Text(
                      'Settings',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const PopupMenuItem<String>(
                    value: 'privacy',
                    child: Text(
                      'Privacy policy',
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
                  const PopupMenuItem<String>(
                    enabled: false,
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
          buildAlarmTile(
            time: '10:30',
            selectedDays: selectedDays1,
            isAlarmOn: _isAlarm1On,
            onSwitchChanged: (value) => setState(() => _isAlarm1On = value),
            isExpanded: _isExpanded1,
            onExpandToggle: () => setState(() => _isExpanded1 = !_isExpanded1),
            onDayTap:
                (index) => setState(
                  () => selectedDays1[index] = !selectedDays1[index],
                ),
            vibrate: vibrate1,
            onVibrateChanged: (val) => setState(() => vibrate1 = val ?? false),
          ),
          buildAlarmTile(
            time: '08:30',
            selectedDays: selectedDays2,
            isAlarmOn: _isAlarm2On,
            onSwitchChanged: (value) => setState(() => _isAlarm2On = value),
            isExpanded: _isExpanded2,
            onExpandToggle: () => setState(() => _isExpanded2 = !_isExpanded2),
            onDayTap:
                (index) => setState(
                  () => selectedDays2[index] = !selectedDays2[index],
                ),
            vibrate: vibrate2,
            onVibrateChanged: (val) => setState(() => vibrate2 = val ?? false),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
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
    );
  }
}
