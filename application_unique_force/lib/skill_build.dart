import 'package:application_unique_force/check_attendance.dart';
import 'package:application_unique_force/professional_certificate.dart';
import 'package:application_unique_force/skill_certificate.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: SkillBuild(),
  ));
}

class SkillBuild extends StatelessWidget {
  const SkillBuild({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(230, 243, 188, 133),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Handle back button press
          },
        ),
        title: Text(
          'Skill Build',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.description, color: Colors.blue),
              title: Text('Professional Certificate'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const ProfessionalCertificatePage()),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.description, color: Colors.blue),
              title: Text('Skill Details'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SkillDetailsApp()),
                );
              },
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
