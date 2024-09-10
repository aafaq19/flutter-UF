import 'package:flutter/material.dart';

void main() {
  runApp(WorkLifeBalanceApp());
}

class WorkLifeBalanceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Work-Life Balance App',
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
      home: WorkLifeBalanceScreen(),
    );
  }
}

class WorkLifeBalanceScreen extends StatelessWidget {
  final String title = 'Work-Life Balance';
  final String description = 'Tips for balancing work and personal life.';
  final List<String> benefits = [
    'Reduces Stress: By maintaining a balance, you can reduce stress and improve your mental well-being.',
    'Increases Productivity: Balancing work and life helps you stay focused and energized, boosting productivity.',
    'Enhances Relationships: A balanced lifestyle ensures you have quality time with family and friends, strengthening bonds.',
    'Improves Health: By making time for exercise and relaxation, you can maintain better health.',
    'Fosters Personal Growth: Balance allows you to explore interests outside of work, contributing to a fulfilling life.',
  ];

  final List<Map<String, List<String>>> tips = [
    {
      'Set Boundaries': [
        'Define Work Hours: Establish clear working hours and stick to them.',
        'Avoid Work Intrusion: Keep work-related activities away from personal time, like avoiding emails during family time.',
      ],
    },
    {
      'Prioritize Tasks': [
        'Make a List: Identify and focus on important tasks, both at work and in personal life.',
        'Delegate: Share responsibilities at work and home to avoid overload.',
      ],
    },
    {
      'Schedule Breaks': [
        'Take Short Breaks: Regular breaks during work can boost productivity and prevent burnout.',
        'Plan Time Off: Take vacations or days off to recharge and spend time with loved ones.',
      ],
    },
    {
      'Practice Time Management': [
        'Use a Planner: Organize your day with a planner or app to allocate time effectively.',
        'Avoid Multitasking: Focus on one task at a time for better efficiency.',
      ],
    },
    {
      'Embrace Flexibility': [
        'Remote Work Options: If possible, explore flexible work arrangements to suit personal needs.',
        'Adapt to Changes: Be open to adjusting schedules when unexpected situations arise.',
      ],
    },
    {
      'Focus on Health': [
        'Exercise Regularly: Incorporate physical activity into your routine for better physical and mental health.',
        'Maintain a Healthy Diet: Eating well boosts energy levels and overall well-being.',
      ],
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
              Text(
                'Why Is It Important?',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: Colors.indigo),
              ),
              SizedBox(height: 10),
              ...benefits.map((benefit) => ListTile(
                    leading: Icon(Icons.check_circle, color: Colors.green),
                    title: Text(
                      benefit,
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.4,
                      ),
                    ),
                  )),
              SizedBox(height: 20),
              Text(
                'Practical Tips for Achieving Work-Life Balance',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: Colors.indigo),
              ),
              SizedBox(height: 10),
              ...tips.map((tip) {
                String tipTitle = tip.keys.first;
                List<String> tipDetails = tip[tipTitle]!;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tipTitle,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    ...tipDetails.map((detail) => Padding(
                          padding: const EdgeInsets.only(
                              left: 16.0, top: 8.0, bottom: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.arrow_right, color: Colors.red),
                              SizedBox(width: 5),
                              Expanded(
                                child: Text(
                                  detail,
                                  style: TextStyle(
                                    fontSize: 16,
                                    height: 1.4,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
