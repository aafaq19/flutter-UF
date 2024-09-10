import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ProfessionalCertificatePage(),
  ));
}

class ProfessionalCertificatePage extends StatefulWidget {
  const ProfessionalCertificatePage({super.key});

  @override
  _ProfessionalCertificatePageState createState() =>
      _ProfessionalCertificatePageState();
}

class _ProfessionalCertificatePageState
    extends State<ProfessionalCertificatePage> {
  List<String> certificates = []; // List to hold certificate file paths

  Future<void> _pickCertificate() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      // Get the file path
      String filePath = result.files.single.path ?? '';
      if (filePath.isNotEmpty) {
        setState(() {
          certificates.add(filePath); // Add the file path to the list
        });
      }
    } else {
      // User canceled the picker
    }
  }

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
          'Professional Certificate',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(237, 255, 255, 255), // White background
                borderRadius: BorderRadius.circular(12), // Rounded corners
                border: Border.all(
                  color:
                      Color.fromARGB(230, 243, 188, 133), // Subtle border color
                  width: 1.0, // Border width
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 211, 105, 0)
                        .withOpacity(0.4), // Shadow color
                    spreadRadius: 2, // Spread of the shadow
                    blurRadius: 6, // Blur radius of the shadow
                    offset: Offset(0, 2), // Offset of the shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Professional Certificate Details',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton(
                      onPressed:
                          _pickCertificate, // Call the file picker method
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(230, 37, 37, 36),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        'Add',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: certificates.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white, // White background
                      borderRadius:
                          BorderRadius.circular(10), // Rounded corners
                      border: Border.all(
                        color: Colors.grey.shade300, // Light grey border
                        width: 1.0, // Border width
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), // Shadow color
                          spreadRadius: 2, // Spread of the shadow
                          blurRadius: 5, // Blur radius of the shadow
                          offset: Offset(0, 3), // Offset of the shadow
                        ),
                      ],
                    ),
                    margin: EdgeInsets.only(
                      bottom: 10,
                    ), // Adds spacing between cards
                    child: ListTile(
                      leading:
                          Icon(Icons.insert_drive_file, color: Colors.black),
                      title: Text(
                        certificates[index].split('/').last,
                      ), // Show the file name
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          setState(() {
                            certificates.removeAt(
                                index); // Remove the selected certificate
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
