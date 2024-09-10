import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApps());
}

class MyApps extends StatelessWidget {
  const MyApps({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Employee Attendance',
      home: AttendanceReport(),
    );
  }
}

class AttendanceReport extends StatelessWidget {
  const AttendanceReport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendance Report'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              icon: const Icon(CupertinoIcons.search),
              onPressed: () {
                // Implement search functionality
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView(
                children: [
                  notificationBox('Day 1', '9:00 AM', '5:00 PM', '8 hrs'),
                  notificationBox('Day 2', '9:15 AM', '4:45 PM', '7.5 hrs'),
                  notificationBox('Day 3', '8:45 AM', '5:15 PM', '8.5 hrs'),
                  notificationBox('Day 4', '9:30 AM', '5:30 PM', '8 hrs'),
                  notificationBox('Day 5', '9:00 AM', '5:00 PM', '8 hrs'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget notificationBox(
      String day, String entryTime, String exitTime, String hours) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(235, 255, 232, 198),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/men.jpg'),
          ),
          const SizedBox(width: 16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Saqalain',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text(
                    'Entry: $entryTime',
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Exit: $exitTime',
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          Text(
            hours,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 15, 15, 15),
            ),
          ),
        ],
      ),
    );
  }
}
