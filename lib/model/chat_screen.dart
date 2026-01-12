import 'package:cropco/model/chatbot_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'chat_screen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _focusNode = FocusNode();
  final _controller = TextEditingController();
  final _messages = <Map<String, String>>[];
  bool _loading = false;
  String _lang = "en";

  Future<void> _send() async {
    final q = _controller.text.trim();
    if (q.isEmpty) return;
    setState(() {
      _messages.add({"role": "farmer", "text": q});
      _loading = true;
    });
    _controller.clear();

    try {
      final reply = await ChatbotService.ask(q, lang: _lang);
      setState(() => _messages.add({"role": "bot", "text": reply}));
    } catch (_) {
      setState(() => _messages.add(
          {"role": "bot", "text": "Sorry, something went wrong. Try again."}));
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Farmer Assistant"),
        leading: IconButton(
            onPressed: () {
              FocusScope.of(context).unfocus();
              Get.back();
            },
            icon: const Icon(Icons.arrow_back)),
        actions: [
          PopupMenuButton<String>(
            initialValue: _lang,
            onSelected: (v) => setState(() => _lang = v),
            itemBuilder: (context) => const [
              PopupMenuItem(value: "en", child: Text("English")),
              PopupMenuItem(value: "hi", child: Text("हिन्दी")),
              PopupMenuItem(value: "te", child: Text("తెలుగు")),
              PopupMenuItem(value: "ta", child: Text("தமிழ்")),
            ],
          )
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: _messages.length,
                itemBuilder: (context, i) {
                  final m = _messages[i];
                  final isFarmer = m["role"] == "farmer";
                  return Align(
                    alignment:
                        isFarmer ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: isFarmer ? Colors.green[200] : Colors.grey[300],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(m["text"] ?? ""),
                    ),
                  );
                },
              ),
            ),
            if (_loading) const LinearProgressIndicator(),
            SafeArea(
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      focusNode: _focusNode,
                      textInputAction: TextInputAction.send,
                      onSubmitted: (_) => _send(),
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(12),
                        hintText: "Ask how to use the app…",
                      ),
                    ),
                  ),
                  IconButton(icon: const Icon(Icons.send), onPressed: _send),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
