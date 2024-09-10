import 'package:flutter/material.dart';

class SkillDetails extends StatelessWidget {
  final List<String> currentSkills = [
    "Flutter Development",
    "Dart Programming",
    "UI/UX Design",
    "Firebase Backend",
  ];

  final List<String> futureSkills = [
    "AI and Machine Learning",
    "Blockchain",
    "Devops Engineer",
    "Data Science",
    "Prompt Engineer",
  ];

  SkillDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Color.fromARGB(230, 243, 188, 133),
        title: Text('Skill Building'),
      ),
      body: ListView(
        children: [
          _buildSectionHeader('Current Skills'),
          ...currentSkills.map((skill) => _buildSkillItem(skill)),
          _buildSectionHeader('Future Skills'),
          ...futureSkills.map((skill) => _buildSkillItem(skill)),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildSkillItem(String skill) {
    return ListTile(
      leading: _getSkillIcon(skill),
      title: Text(skill),
      onTap: () {
        // Implement skill detail view or action here
      },
    );
  }

  Icon _getSkillIcon(String skill) {
    switch (skill) {
      case "Flutter Development":
        return Icon(Icons.phone_android, color: Colors.blue);
      case "Dart Programming":
        return Icon(Icons.code, color: Colors.green);
      case "UI/UX Design":
        return Icon(Icons.design_services, color: Colors.purple);
      case "Firebase Backend":
        return Icon(Icons.cloud, color: Colors.orange);
      case "AI and Machine Learning":
        return Icon(Icons.memory, color: Colors.red);
      case "Blockchain":
        return Icon(Icons.security, color: Colors.brown);
      case "Devops Engineer":
        return Icon(Icons.view_in_ar, color: Colors.teal);
      case "Data Science":
        return Icon(Icons.analytics, color: Colors.indigo);
      case "Prompt Engineer":
        return Icon(Icons.security, color: Colors.black);
      default:
        return Icon(Icons.help_outline, color: Colors.grey);
    }
  }
}
