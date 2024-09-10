import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LearningPage extends StatelessWidget {
  const LearningPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learning Resources'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            buildLearningCard(
              title: 'Flutter Development',
              description:
                  'Learn how to develop mobile applications using Flutter.',
              url: 'https://flutter.dev/docs',
            ),
            buildLearningCard(
              title: 'Dart Programming',
              description:
                  'Understand the basics of Dart programming language.',
              url: 'https://dart.dev/guides',
            ),
            buildLearningCard(
              title: 'Udemy Courses',
              description:
                  'Explore comprehensive courses on various programming languages.',
              url: 'https://www.udemy.com/',
            ),
            buildLearningCard(
              title: 'Coursera',
              description:
                  'Access university-level courses on software development and more.',
              url: 'https://www.coursera.org/',
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLearningCard(
      {required String title,
      required String description,
      required String url}) {
    return Card(
      color: const Color.fromARGB(230, 243, 188, 133),
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: Text(description),
        trailing: const Icon(Icons.arrow_forward),   
        onTap: () async {
          // ignore: deprecated_member_use
          if (await canLaunch(url)) {
            // ignore: deprecated_member_use
            await launch(url);
          } else {
            throw 'Could not launch $url';
          }
        },
      ),
    );
  }
}
void main() {
  runApp(MaterialApp(
    home: LearningPage(),
  ));
}
