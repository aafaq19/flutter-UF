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
      home: ActivityPage(),
    );
  }
}

class ActivityPage extends StatelessWidget {
  const ActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView(
                children: [
                  activityBox('Month: July', 'Date: 12', 'Year: 2024'),
                  activityBox('Month: August', 'Date: 15', 'Year: 2024'),
                  activityBox('Month: September', 'Date: 20', 'Year: 2024'),
                  activityBox('Month: October', 'Date: 25', 'Year: 2024'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget activityBox(String month, String date, String year) {
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
              Text(
                month,
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 2),
              Text(
                date,
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 2),
              Text(
                year,
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green, // Background color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child:
                const Text('Approved', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
