import "package:flutter/material.dart";
import "package:testia/components/input_message_component.dart";
import "package:testia/components/messages_component.dart";
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  RxList<List<String>> messages = <List<String>>[].obs;

  sendMessage(String message) {
    messages.add(["me", message]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Chat com IA")),
      ),
      body: Column(
        children: [
          Expanded(
            child: MessagesComponent(
              messages: messages,
            ),
          ),
          InputMessageComponent(
            sendMessage: sendMessage,
          ),
        ],
      ),
    );
  }
}
