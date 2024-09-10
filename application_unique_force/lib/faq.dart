import 'package:flutter/material.dart';

void main() {
  runApp(FAQsApp());
}

class FAQsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Employee Attendance FAQs',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
      home: FAQsScreen(),
    );
  }
}

class FAQsScreen extends StatelessWidget {
  final String title = 'FAQs';
  final String description =
      'Find answers to common questions about attendance and office policies.';
  final List<Map<String, String>> faqs = [
    {
      'question': 'How do I mark my attendance?',
      'answer':
          'To mark your attendance, open the app, navigate to the attendance section, and click on "Mark Attendance." Make sure you are connected to the company Wi-Fi.',
    },
    {
      'question': 'What should I do if I forget to mark my attendance?',
      'answer':
          'If you forget to mark your attendance, please contact the HR department with your employee ID and the date you missed. They will assist you in updating your attendance record.',
    },
    {
      'question': 'How can I apply for leave?',
      'answer':
          'To apply for leave, go to the "Leave" section in the app, select the type of leave you want to apply for, and submit the request. Your manager will review and approve it.',
    },
    {
      'question': 'What are the company’s working hours?',
      'answer':
          'Our company operates from Monday to Friday, 9:00 AM to 6:00 PM. Please ensure you adhere to these hours unless you have made special arrangements.',
    },
    {
      'question': 'How can I check my attendance record?',
      'answer':
          'You can check your attendance record by going to the "Attendance History" section in the app. It will display your attendance status for each day.',
    },
    {
      'question': 'What is the policy for remote work?',
      'answer':
          'The remote work policy allows employees to work from home with prior approval from their manager. Please refer to the company policy document for more details.',
    },
    {
      'question': 'How do I contact HR for assistance?',
      'answer':
          'You can contact HR by emailing hr@example.com or calling (123) 456-7890 during business hours. They are available to assist with any queries or issues.',
    },
    {
      'question': 'Can I edit my attendance after marking it?',
      'answer':
          'Once attendance is marked, it cannot be edited through the app. For corrections, contact HR with the necessary details.',
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
              ...faqs.map((faq) => FAQItem(faq: faq)).toList(),
            ],
          ),
        ),
      ),
    );
  }
}

class FAQItem extends StatelessWidget {
  final Map<String, String> faq;

  FAQItem({required this.faq});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        faq['question']!,
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
            faq['answer']!,
            style: TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 0, 0, 0),
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }
}
