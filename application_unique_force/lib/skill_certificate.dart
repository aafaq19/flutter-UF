import 'package:flutter/material.dart';

void main() {
  runApp(SkillDetailsApp());
}

class SkillDetailsApp extends StatelessWidget {
  const SkillDetailsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Skill Details',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SkillDetailsPage(),
    );
  }
}

class SkillDetailsPage extends StatelessWidget {
  const SkillDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
          },
        ),
        backgroundColor: const Color.fromARGB(230, 243, 188, 133),
        title: Text('Skill Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            SkillCard(
              title: 'Domain/ Functional',
              description:
                  'Click add to enter your domain & functional details',
            ),
            const SizedBox(height: 16),
            SkillCard(
              title: 'Tools/ Technology',
              description: 'Click add to enter your tools & technology details',
            ),
            const SizedBox(height: 16),
            SkillCard(
              title: 'Soft Skill',
              description: 'Click Add to enter your Soft Skill',
            ),
          ],
        ),
      ),
    );
  }
}

class SkillCard extends StatelessWidget {
  final String title;
  final String description;

  SkillCard({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:
            Color.fromARGB(237, 255, 255, 255), // Background color of the card
        borderRadius: BorderRadius.circular(8.0), // Rounded corners
        border: Border.all(
          color: const Color.fromARGB(230, 243, 188, 133), // Solid border color
          width: 2.0, // Border width for boldness
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 211, 105, 0)
                .withOpacity(0.3), // Shadow color
            spreadRadius: 1, // Spread radius of shadow
            blurRadius: 3, // Blur radius of shadow
            offset: Offset(2, 4), // Position offset of shadow
          ),
        ],
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation:
            0, // Elevation is set to 0 since shadow is handled by the container
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      description,
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle add button press
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(
                      230, 243, 188, 133), // Background color of the button
                  elevation: 5, // Elevation to give a shadow effect
                  shadowColor:
                      Color.fromARGB(255, 196, 117, 0), // Color of the shadow
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        20.0), // Rounded corners for the button
                  ),
                  padding: EdgeInsets.symmetric(
                      horizontal: 24, vertical: 12), // Button padding
                ),
                child: Text('Add',
                    style:
                        TextStyle(color: const Color.fromARGB(255, 3, 4, 5))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
