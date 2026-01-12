import 'dart:convert';
import 'package:http/http.dart' as http;

class ChatbotService {
  static const String endpoint =
      "https://askchatbot-npdhw6btgq-uc.a.run.app";

  static Future<String> ask(String question, {String lang = "en"}) async {
    final resp = await http.post(
      Uri.parse(endpoint),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"question": question, "lang": lang}),
    );

    if (resp.statusCode == 200) {
      final data = jsonDecode(resp.body) as Map<String, dynamic>;
      return (data["answer"] as String?) ?? "No answer";
    }
    throw Exception("Chatbot error: ${resp.statusCode} ${resp.body}");
  }
}
