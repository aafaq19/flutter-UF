import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(230, 243, 188, 133),
        title: Text('About Us', style: TextStyle(color: Colors.black)),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Company Image
            Padding(
              padding: EdgeInsets.all(16.0), // Adjust the value as needed
              child: Image.asset('assets/grp.jpg',
                  width: double.infinity, height: 200, fit: BoxFit.cover),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Our Company',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(height: 10),
                  Text(
                    '''Unique Force is Chennai based company started by IT industry experts and we facilitate the “handshake” between the business and technology to deliver solutions that add business value. \n
Unique Force founder realized the need of business and technical experts to manage high customer expectation and the rapidly growing technology and established Unique Force to fill the gap and train the people''',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Our Vision',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "We envision a world where technology seamlessly enhances human potential. Our company aims to pioneer transformative solutions that bridge gaps, spark imagination, and drive progress",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
