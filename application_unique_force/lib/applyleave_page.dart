import 'package:flutter/material.dart';

void main() {
  runApp(ApplyLeaveApp());
}

class ApplyLeaveApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ApplyLeavePage(),
    );
  }
}

class ApplyLeavePage extends StatefulWidget {
  @override
  _ApplyLeavePageState createState() => _ApplyLeavePageState();
}

class _ApplyLeavePageState extends State<ApplyLeavePage> {
  final _formKey = GlobalKey<FormState>();
  String? _leaveType;
  DateTime? _fromDate;
  DateTime? _toDate;
  String? _supervisor;
  final _reasonController = TextEditingController();

  @override
  void dispose() {
    _reasonController.dispose();
    super.dispose();
  }

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Apply Leave'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Leave Type',
                  border: OutlineInputBorder(),
                ),
                value: _leaveType,
                items: [
                  'Sick Leave',
                  'Casual Leave',
                  'Annual Leave',
                  'Permission',
                  'LOP',
                  'Paternity Leave'
                ]
                    .map((type) => DropdownMenuItem(
                          value: type,
                          child: Text(type),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _leaveType = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a leave type';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
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
                          decoration: InputDecoration(
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
                  SizedBox(width: 16),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _selectDate(context, _toDate, (pickedDate) {
                        setState(() {
                          _toDate = pickedDate;
                        });
                      }),
                      child: AbsorbPointer(
                        child: TextFormField(
                          decoration: InputDecoration(
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
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Select Supervisor',
                  border: OutlineInputBorder(),
                ),
                value: _supervisor,
                items: ['Thunku AR', 'Jhonson Dhanapal', 'Ravichan V']
                    .map((supervisor) => DropdownMenuItem(
                          value: supervisor,
                          child: Text(supervisor),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _supervisor = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a supervisor';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _reasonController,
                decoration: InputDecoration(
                  labelText: 'Reason',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a reason';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Handle form submission
                    print('Form submitted');
                  }
                },
                child: Center(
                  child: Text('Submit'),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(230, 242, 166, 90),
                  foregroundColor: Colors.black,
                  textStyle: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
