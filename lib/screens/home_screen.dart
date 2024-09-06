import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Gemini gemini = Gemini.instance;

  ChatUser currentUser = ChatUser(
    id: "0",
    firstName: "User",
  );

  List<ChatMessage> messages = [];

  ChatUser geminiUser = ChatUser(
    id: "1",
    firstName: "Gemini",
    profileImage:
        "https://tse2.mm.bing.net/th?id=OIP.AsXti9JBcuEGIODbisEAYwHaEK&pid=Api&P=0&h=180",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Chat bot",
        ),
      ),
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return DashChat(
      currentUser: currentUser,
      onSend: _sendMessage,
      messages: messages,
    );
  }

  void _sendMessage(ChatMessage chatmessage) {
    setState(() {
      messages = [chatmessage, ...messages];
    });
    try {
      String question = chatmessage.text;
      gemini.streamGenerateContent(question).listen(
        (event) {
          ChatMessage? lastMessage = messages.firstOrNull;
          if (lastMessage != null && lastMessage.user == geminiUser) {
            lastMessage = messages.removeAt(0);
            String response = event.content?.parts?.fold(
                    "", (previous, current) => "$previous ${current.text}") ??
                "";
            lastMessage.text += response;
            setState(() {
              messages = [lastMessage!, ...messages];
            });
          } else {
            String response = event.content?.parts?.fold(
                    "", (previous, current) => "$previous ${current.text}") ??
                "";
            ChatMessage message = ChatMessage(
                user: geminiUser, createdAt: DateTime.now(), text: response);

            setState(() {
              messages = [message, ...messages];
            });
          }
        },
      );
    } catch (e) {
      print(e);
    }
  }
}
