import 'package:flutter/material.dart';

void main() {
  runApp(ContactSupportApp());
}

class ContactSupportApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact Support',
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: TextTheme(
          bodyMedium: TextStyle(
            fontSize: 18,
            height: 1.4,
          ),
          titleLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: ContactSupportScreen(),
    );
  }
}

class ContactSupportScreen extends StatelessWidget {
  final String title = 'Contact Support';
  final String description = 'Reach out to our support team for help.';
  final List<Map<String, String>> contactMethods = [
    {
      'method': 'Email Support',
      'details':
          'For any inquiries, email us at support@company.com. Our team is available 24/7 to assist you with any issues or questions.',
    },
    {
      'method': 'Call Support',
      'details':
          'You can reach us by phone at (123) 456-7890. Our support line is open from 9:00 AM to 6:00 PM, Monday to Friday.',
    },
    {
      'method': 'Live Chat',
      'details':
          'Use our live chat feature on the company intranet to connect with a support agent in real-time. Available during business hours.',
    },
    {
      'method': 'Submit a Ticket',
      'details':
          'Log into the support portal and submit a ticket with your issue details. Our team will get back to you within 24 hours.',
    },
    {
      'method': 'Visit IT Desk',
      'details':
          'For in-person support, visit the IT support desk located on the second floor. Open from 9:00 AM to 5:00 PM on weekdays.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(230, 243, 188, 133),
        title: Text(title),
      ),
      body: Padding(
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
              ...contactMethods
                  .map((method) => ContactMethodItem(method: method))
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }
}

class ContactMethodItem extends StatelessWidget {
  final Map<String, String> method;

  ContactMethodItem({required this.method});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        method['method']!,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.indigo,
        ),
      ),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            method['details']!,
            style: TextStyle(
              fontSize: 16,
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }
}
