import 'package:flutter/material.dart';

class GettingStartedScreen extends StatelessWidget {
  final String title = 'Getting Started';
  final String description = 'Learn how to get started with the app.';
  final List<Map<String, String>> steps = [
    {
      'step': 'Step 1: Download the App',
      'details':
          'Visit the app store on your device and search for "Office Attendance App." Download and install it.',
    },
    {
      'step': 'Step 2: Register Your Account',
      'details':
          'Open the app and register with your company email and a secure password. Check your email for a confirmation link.',
    },
    {
      'step': 'Step 3: Set Up Your Profile',
      'details':
          'Log in to the app and fill out your profile information, including your department and role.',
    },
    {
      'step': 'Step 4: Explore Features',
      'details':
          'Take a tour of the app’s features like attendance tracking, leave applications, and office announcements.',
    },
    {
      'step': 'Step 5: Customize Settings',
      'details':
          'Adjust app settings such as notifications, language preferences, and privacy settings to suit your needs.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),

        backgroundColor: Color.fromARGB(230, 243, 188, 133),
        // Set your AppBar color here
      ),
      body: Container(
        color: const Color.fromARGB(
            255, 255, 255, 255), // Background color for the screen
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
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
                ...steps.map((step) => StepItem(step: step)).toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class StepItem extends StatelessWidget {
  final Map<String, String> step;

  StepItem({required this.step});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Color.fromARGB(230, 255, 128, 0), width: 1.0),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 255, 163, 77).withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 3,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            step['step']!,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            step['details']!,
            style: TextStyle(
              fontSize: 14.0,
              color: Color.fromARGB(255, 22, 21, 21),
            ),
          ),
        ],
      ),
    );
  }
}
