import 'package:chatbot/common/custom_button.dart';
import 'package:chatbot/utils/show_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:chatbot/screens/home_screen.dart'; // Your ChatScreen import

class MoodSelectionScreen extends StatefulWidget {
  const MoodSelectionScreen({super.key});

  @override
  State<MoodSelectionScreen> createState() => _MoodSelectionScreenState();
}

class _MoodSelectionScreenState extends State<MoodSelectionScreen> {
  String selectedMood = '';
  final List<Map<String, String>> styles = [
    {
      'mood': 'Sexual',
      'icon': "❤️‍🔥",
    },
    {
      'mood': 'Romantic',
      'icon': "❤️",
    },
    {
      'mood': 'Angry',
      'icon': "😡",
    },
    {
      'mood': 'Neutral',
      'icon': "😐",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Hello",
              style: TextStyle(
                color: Colors.yellow,
                fontWeight: FontWeight.bold,
                fontSize: 34,
              ),
            ),
            const Text(
              "I am Sara",
              style: TextStyle(
                color: Colors.yellow,
                fontWeight: FontWeight.bold,
                fontSize: 34,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Image.asset(
              'assets/images/chatbot.jpg',
              height: 200,
              width: 200,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Let's have some fun!!",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: styles
                  .map(
                    (mood) => GestureDetector(
                      onTap: () {
                        //print(mood['mood']);
                        setState(() {
                          selectedMood = mood['mood'] ?? '';
                          print(selectedMood);
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          mood['icon'].toString(),
                          style: const TextStyle(
                            fontSize: 45,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            const Text(
              "How do you want to talk?",
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomButton(
                title: "Let's Chat",
                onTap: () {
                  print(selectedMood);
                  if (selectedMood.isEmpty) {
                    showSnackBar(
                      context,
                      "Please select your mood!!!",
                      'Oops!!!!',
                    );
                    return;
                  }
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ChatScreen(
                        conversationStyle: selectedMood,
                      ),
                    ),
                  );
                },
                color: Colors.yellow,
              ),
            )
          ],
        ),
      ),
    );
  }
}
