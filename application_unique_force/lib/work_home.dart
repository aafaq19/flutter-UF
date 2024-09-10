import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: WorkFromHomePage(),
  ));
}

class WorkFromHomePage extends StatefulWidget {
  const WorkFromHomePage({super.key});

  @override
  _WorkFromHomePageState createState() => _WorkFromHomePageState();
}

class _WorkFromHomePageState extends State<WorkFromHomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DateTime? _fromDate;
  DateTime? _toDate;
  final TextEditingController _reasonController = TextEditingController();

  // Function to show date picker and return selected date
  Future<void> _selectDate(BuildContext context, DateTime? initialDate,
      ValueChanged<DateTime?> onDateSelected) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != initialDate) {
      onDateSelected(picked);
    }
  }

  @override
  void dispose() {
    _reasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(230, 243, 188, 133),
        title: const Text('Work From Home'),
      ),
      body: SingleChildScrollView(
        // Wrap the Column with SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Dashboard Overview
              _buildDashboardOverview(),
              const SizedBox(height: 20),
              // Work From Home Request Form
              _buildWorkFromHomeRequestForm(context),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Dashboard Overview
  Widget _buildDashboardOverview() {
    return Container(
      decoration: BoxDecoration(
        color:
            Color.fromARGB(237, 255, 255, 255), // Background color of the card
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color.fromARGB(230, 243, 188, 133), // Border color
          width: 2.0, // Border width
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 211, 105, 0),
            blurRadius: 5.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Dashboard Overview',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildStatusTile("Total annual day's in, Work from home", '24'),
            _buildStatusTile('Current Status', 'Working from Home'),
            _buildStatusTile('Remote Days Used', '4'),
            _buildStatusTile('Remote Days Remaining', '20'),
          ],
        ),
      ),
    );
  }

  // Status Tile Widget
  Widget _buildStatusTile(String title, String value) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 4),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      trailing: Text(
        value,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
          color: Colors.indigo,
        ),
      ),
    );
  }

  // Work From Home Request Form
  Widget _buildWorkFromHomeRequestForm(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:
            Color.fromARGB(237, 255, 255, 255), // Background color of the card
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color.fromARGB(230, 243, 188, 133), // Border color
          width: 2.0, // Border width
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 211, 105, 0),
            blurRadius: 5.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Request Work From Home',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () =>
                          _selectDate(context, _fromDate, (pickedDate) {
                        setState(() {
                          _fromDate = pickedDate;
                        });
                      }),
                      child: AbsorbPointer(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'From Date',
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.calendar_today),
                          ),
                          controller: TextEditingController(
                            text: _fromDate == null
                                ? ''
                                : _fromDate!.toLocal().toString().split(' ')[0],
                          ),
                          validator: (value) {
                            if (_fromDate == null) {
                              return 'Please select a start date';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _selectDate(context, _toDate, (pickedDate) {
                        setState(() {
                          _toDate = pickedDate;
                        });
                      }),
                      child: AbsorbPointer(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'To Date',
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.calendar_today),
                          ),
                          controller: TextEditingController(
                            text: _toDate == null
                                ? ''
                                : _toDate!.toLocal().toString().split(' ')[0],
                          ),
                          validator: (value) {
                            if (_toDate == null) {
                              return 'Please select an end date';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              TextFormField(
                maxLines: 3,
                controller: _reasonController,
                decoration: const InputDecoration(
                  labelText: 'Reason',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a reason';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Handle request submission
                    _showRequestSubmittedDialog(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(230, 242, 166, 90),
                  foregroundColor: Colors.black,
                  textStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text('Submit Request'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Show Request Submitted Dialog
  void _showRequestSubmittedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Request Submitted'),
          content: const Text(
              'Your request for work from home has been submitted for approval.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
