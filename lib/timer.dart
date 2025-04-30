import 'package:flutter/material.dart';

class Timer extends StatefulWidget {
  const Timer({super.key});

  @override
  State<Timer> createState() => _TimerState();
}

class _TimerState extends State<Timer> {
  List<String> digits = [];

  void addDigit(String value) {
    if (digits.length >= 6) return;
    setState(() {
      if (value == '00') {
        digits.add('0');
        if (digits.length < 6) digits.add('0');
      } else {
        digits.add(value);
      }
    });
  }

  void deleteDigit() {
    if (digits.isNotEmpty) {
      setState(() {
        digits.removeLast();
      });
    }
  }

  String get displayTime {
    String padded = digits.join().padLeft(6, '0');
    String h = padded.substring(0, 2);
    String m = padded.substring(2, 4);
    String s = padded.substring(4, 6);
    return "$h h $m m $s s";
  }

  @override
  Widget build(BuildContext context) {
    final List<String> keys = [
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      '00',
      '0',
      '⌫',
    ];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 34, 34, 34),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 34, 34, 34),
        title: const Text(
          'Timer',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            offset: const Offset(0, 40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            color: const Color.fromARGB(255, 43, 43, 43),
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
                ],
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              Text(
                displayTime,
                style: const TextStyle(fontSize: 40, color: Colors.white70),
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(60),
                itemCount: keys.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  final key = keys[index];
                  return ElevatedButton(
                    onPressed: () {
                      if (key == '⌫') {
                        deleteDigit();
                      } else {
                        addDigit(key);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(6),
                      backgroundColor:
                          key == '⌫'
                              ? Colors.blue
                              : const Color.fromARGB(255, 50, 50, 50),
                      foregroundColor: Colors.white,
                      minimumSize: const Size(10, 10),
                    ),
                    child:
                        key == '⌫'
                            ? const Icon(Icons.backspace_outlined)
                            : Text(key, style: const TextStyle(fontSize: 24)),
                  );
                },
              ),
              const SizedBox(height: 20), // Optional: extra spacing
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return ScaleTransition(scale: animation, child: child);
                },
                child:
                    digits.isNotEmpty
                        ? Padding(
                          padding: const EdgeInsets.only(bottom: 60),
                          child: SizedBox(
                            height: 90,
                            width: 90,
                            key: const ValueKey('fab'),
                            child: FloatingActionButton(
                              onPressed: () {},
                              backgroundColor: const Color.fromARGB(
                                255,
                                133,
                                186,
                                248,
                              ),
                              shape: const CircleBorder(),
                              child: const Icon(
                                Icons.play_arrow,
                                size: 32,
                                color: Color.fromARGB(255, 34, 34, 34),
                              ),
                            ),
                          ),
                        )
                        : const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
