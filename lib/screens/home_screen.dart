import 'package:chatbot/models/message.dart';
import 'package:chatbot/widget/chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:mistralai_client_dart/mistralai_client_dart.dart';

class ChatScreen extends StatefulWidget {
  final String conversationStyle;
  const ChatScreen({
    super.key,
    required this.conversationStyle,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Message> _messages = [];
  final ScrollController _scrollController = ScrollController();
  final MistralAIClient _client = MistralAIClient(
    apiKey:
        'ZLKjWTjbRyzwNtA984AhqFkM319l0khn', // Replace with your Mistral AI API key
  );
  late String _systemPrompt;

  @override
  void initState() {
    super.initState();
    _setSystemPrompt();
    _addInitialBotMessage();
  }

  void _setSystemPrompt() {
    switch (widget.conversationStyle) {
      case 'Sexual':
        setState(() {
          _systemPrompt =
              "You are a sexual AI assistant. Respond to the user's messages in a sexual tone, affectionate, and lustful manner.";
        });
        break;
      case 'Romantic':
        setState(() {
          _systemPrompt =
              "You are a romantic AI assistant. Respond to the user's messages in a warm tone, affectionate and loving manner";
        });
        break;
      case 'Happy':
        setState(() {
          _systemPrompt =
              "You are an extremely cheerful AI assistant. Respond to the user's messages with enthusiasm, positivity, and excitement.";
        });
        break;
      default:
        setState(() {
          _systemPrompt =
              "You are a helpful AI assistant. Respond to the user's messages in a neutral and informative manner.";
        });
    }
  }

  void _addInitialBotMessage() {
    setState(() {
      _messages.add(
        Message(
          type: 'bot',
          message:
              "Bot: Hello! I'm in a ${widget.conversationStyle.toLowerCase()} mood. How can I assist you today?",
        ),
      );
    });
  }

  void _sendMessage() async {
    if (_controller.text.isNotEmpty) {
      final query = _controller.text.trim();
      _controller.clear();
      setState(() {
        _messages.add(
          Message(
            type: "user",
            message: query,
          ),
        );
      });

      _scrollToBottom();

      final request = ChatCompletionRequest(
        model: 'mistral-small-latest',
        messages: [
          UserMessage(
            content: UserMessageContent.string(
              '$query and give the result should be strictly in $_systemPrompt manner and respond back with a more $_systemPrompt respond in a human manner',
            ),
          ),
        ],
      );

      try {
        final chatResponse = await _client.chatComplete(request: request);
        _scrollToBottom();

        setState(() {
          _messages.add(
            Message(
              type: "bot",
              message: chatResponse.choices?[0].message.toString() ?? '',
            ),
          );
        });
      } catch (e) {
        setState(() {
          _messages.add(
            Message(
              type: 'bot',
              message: 'Sorry, I encountered an error',
            ),
          );
        });
        print(
          "Error: $e",
        );
      }
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mistral AI Chatbot',
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return ChatBubble(
                  message: message.message,
                  isMe: message.type == 'user' ? true : false,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Enter your message',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.send,
                  ),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
