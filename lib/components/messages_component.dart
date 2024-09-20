import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testia/components/bot_message_component.dart';
import 'package:testia/components/me_message_component.dart';

class MessagesComponent extends StatelessWidget {
  final RxList<List<String>> messages;
  final ScrollController scrollController;

  const MessagesComponent({
    super.key,
    required this.messages,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.builder(
          controller: scrollController,
          itemCount: messages.length,
          itemBuilder: (context, index) {
            var message = messages[index];

            if (message.first == "me") {
              return MeMessageComponent(message: message.last);
            }
            return BotMessageComponent(message: message.last);
          });
    });
  }
}
