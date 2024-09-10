import 'package:flutter/material.dart';

void main() {
  runApp(TimeManagementApp());
}

class TimeManagementApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Management App',
      home: TimeManagementScreen(),
    );
  }
}

class TimeManagementScreen extends StatelessWidget {
  final String title = 'Time Management';
  final String description = 'Improve your productivity with these tips.';
  final List<String> benefits = [
    'Increased Productivity: By managing your time well, you can accomplish more tasks efficiently.',
    'Reduced Stress: Organizing your tasks can minimize last-minute rushes and stress.',
    'Better Work-Life Balance: Efficient time management allows for more free time and better balance between work and personal life.',
    'Goal Achievement: Helps in prioritizing tasks, leading to faster achievement of goals.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0), // Set the title color here
          ),
        ),
        backgroundColor: const Color.fromARGB(
            230, 243, 188, 133), // Set AppBar background color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              description,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Benefits of Effective Time Management',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            SizedBox(height: 10),
            ...benefits.map((benefit) => ListTile(
                  leading: Icon(Icons.check_circle, color: Colors.green),
                  title: Text(
                    benefit,
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.4,
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
