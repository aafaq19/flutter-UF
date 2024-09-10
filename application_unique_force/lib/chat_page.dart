import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ChatbotScreen(),
  ));
}

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

  @override
  _ChatbotScreenState createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  List<Widget> messages = [];

  @override
  void initState() {
    super.initState();
    // Initial bot messages
    messages.addAll([
      BotMessageWidget(
          message:
              "Hi, I'm the Unique Force recruiting bot and I'm here to help you."),
      BotMessageWidget(message: "How may I help you today?"),
      BotMessageWidget(
          message: "Here are a few relevant topics to guide you..."),
    ]);
    messages.addAll(_buildOptionButtons());
  }

  List<Widget> _buildOptionButtons() {
    return [
      SizedBox(height: 30),
      OptionButton(
        text: "Find a position for myself",
        onPressed: () {
          _handleUserSelection("Find a position for myself");
        },
      ),
      SizedBox(height: 12),
      OptionButton(
        text: "Learn about our employee benefits",
        onPressed: () {
          _handleUserSelection("Learn about our employee benefits");
        },
      ),
      SizedBox(height: 12),
      OptionButton(
        text: "Learn about life at Unique Force",
        onPressed: () {
          _handleUserSelection("Learn about life at Unique Force");
        },
      ),
      SizedBox(height: 12),
      TextButton(
        onPressed: () {
          _handleUserSelection("I need help with something else");
        },
        child: Text(
          "I need help with something else",
          style: TextStyle(fontSize: 16, color: Colors.red),
        ),
      ),
      SizedBox(height: 20),
      TextButton(
        onPressed: () {
          setState(() {
            messages.clear();
            messages.addAll([
              BotMessageWidget(
                  message:
                      "Hi, I'm the Unique Force recruiting bot and I'm here to help you."),
              BotMessageWidget(message: "How may I help you today?"),
              BotMessageWidget(
                  message: "Here are a few relevant topics to guide you..."),
            ]);
            messages.addAll(_buildOptionButtons());
          });
        },
        child: Text(
          "Start again",
          style: TextStyle(fontSize: 16, color: Colors.blue),
        ),
      ),
    ];
  }

  void _handleUserSelection(String selection) {
    setState(() {
      messages.add(UserMessageWidget(message: selection));
      messages.add(BotMessageWidget(message: "You selected: $selection"));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: messages,
        ),
      ),
    );
  }
}

class BotMessageWidget extends StatelessWidget {
  final String message;

  const BotMessageWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        message,
        style: TextStyle(fontSize: 16, color: Colors.black87),
      ),
    );
  }
}

class UserMessageWidget extends StatelessWidget {
  final String message;

  const UserMessageWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.symmetric(vertical: 4),
      alignment: Alignment.centerRight,
      child: Text(
        message,
        style: TextStyle(fontSize: 16, color: Colors.black87),
      ),
    );
  }
}

class OptionButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  OptionButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(fontSize: 16),
      ),
      style: ElevatedButton.styleFrom(
        foregroundColor: const Color.fromARGB(255, 0, 0, 0),
        backgroundColor:
            const Color.fromARGB(230, 243, 188, 133), // Button text color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      ),
    );
  }
}
