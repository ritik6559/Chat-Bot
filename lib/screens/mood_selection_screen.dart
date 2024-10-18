import 'package:chatbot/screens/home_screen.dart';
import 'package:flutter/material.dart';

class MoodSelectionScreen extends StatelessWidget {
  const MoodSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> styles = ['Sexual', 'Romantic', 'Angry', 'Neutral'];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Select Conversation Style',
        ),
      ),
      body: ListView.builder(
        itemCount: styles.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(styles[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ChatScreen(conversationStyle: styles[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
