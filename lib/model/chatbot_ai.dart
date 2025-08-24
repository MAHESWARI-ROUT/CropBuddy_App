import 'package:cropco/widgets/message_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class ChatbotAi extends StatefulWidget {
  const ChatbotAi({super.key});

  @override
  State<ChatbotAi> createState() => _ChatbotAiState();
}

class _ChatbotAiState extends State<ChatbotAi> {
  final TextEditingController _userInput = TextEditingController();
  static const apiKey = "AIzaSyBFYY4dftvMcqxOEif1bh6MmjnY5Uo3lcw";
final model = GenerativeModel(
  model: 'models/gemini-1.5-pro-latest',
  apiKey: apiKey,
);
  final List<MessageContainer> _messages = [];
  Future<void> sendMessages() async {
    final message = _userInput.text;
    setState(() {
      _messages.add(MessageContainer(
        isUser: true,
        message: message,
      ));
    });
    final content = [Content.text(message)];
    final response = await model.generateContent(content);
    setState(() {
      _messages
          .add(MessageContainer(isUser: false, message: response.text ?? " "));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    final message = _messages[index];
                    return MessageContainer(
                      isUser: message.isUser,
                      message: message.message,
                    );
                  })),
         
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.80,
                  child: TextField(
                    controller: _userInput,
                    decoration: InputDecoration(
                      hintText: 'have query ask me!',
                      hintStyle: const TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    sendMessages();
                  },
                  icon: const Icon(Icons.send),
                ),
                //const Spacer(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
