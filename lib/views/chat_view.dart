import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testia/components/input_message_component.dart';
import 'package:testia/components/messages_component.dart';
import 'package:testia/services/olama.service.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  RxList<List<String>> messages = <List<String>>[].obs;
  OllamaService ollamaService = Get.put(OllamaService());
  final ScrollController _scrollController = ScrollController();

  sendMessage(String message, String type) async {
    messages.add([type, message]);
    await _scrollToEnd();

    final response = await ollamaService.getResponse(message);

    if (response == null) {
      messages.add(["bot", "Algo deu errado na resposta, tente novamente!1"]);
      return;
    }
    messages.add(["bot", response]);
    await _scrollToEnd();
  }

  _scrollToEnd() async {
    _scrollController.animateTo(
      _scrollController.position.extentTotal + 40,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    // chat_view.dart
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Chat com IA")),
      ),
      body: Column(
        children: [
          Expanded(
            child: MessagesComponent(
              messages: messages,
              scrollController: _scrollController,
            ),
          ),
          InputMessageComponent(
            sendMessage: sendMessage,
            scrollToEnd: _scrollToEnd,
          ),
        ],
      ),
    );
  }
}
