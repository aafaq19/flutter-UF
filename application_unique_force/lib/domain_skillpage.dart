import 'package:flutter/material.dart';

void main() {
  runApp(KeySkillsApp());
}

class KeySkillsApp extends StatelessWidget {
  const KeySkillsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Key Skills',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: KeySkillsPage(),
    );
  }
}

class KeySkillsPage extends StatefulWidget {
  const KeySkillsPage({super.key});

  @override
  _KeySkillsPageState createState() => _KeySkillsPageState();
}

class _KeySkillsPageState extends State<KeySkillsPage> {
  final List<String> allSkills = [
    'Flutter Development',
    'Front End Design',
    'Web Designing',
    'Frontend Development',
    'Wordpress',
    'Graphic Designing',
    'Front End',
    'Banners',
    'Responsive Design'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Key Skills'),
        backgroundColor: const Color.fromARGB(255, 255, 248, 248),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Key skills',
              style: TextStyle(
                color: const Color.fromARGB(255, 0, 0, 0),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Add skills that best define your expertise, for e.g., Direct Marketing, Oracle, Java, etc. (Minimum 1)',
              style: TextStyle(
                color: const Color.fromARGB(255, 10, 9, 9),
              ),
            ),
            SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                Chip(
                  label: Text(allSkills.first),
                  onDeleted: () {
                    setState(() {
                      allSkills.removeAt(0);
                    });
                  },
                  backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                  labelStyle: TextStyle(color: Colors.white),
                ),
                TextButton(
                  onPressed: () {
                    // Handle showing the full list of skills
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return _buildSkillSelectionModal(context);
                      },
                    );
                  },
                  child: Text('+ ${allSkills.length - 1} more'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillSelectionModal(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 255, 228, 228),
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${allSkills.length} Selected Key skills',
            style: TextStyle(
              color: const Color.fromARGB(255, 0, 0, 0),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: allSkills.map((skill) {
                return Chip(
                  label: Text(skill),
                  onDeleted: () {
                    setState(() {
                      allSkills.remove(skill);
                    });
                    Navigator.pop(context); // Close modal after deletion
                  },
                  backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                  labelStyle: TextStyle(color: Colors.white),
                );
              }).toList(),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Done'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
