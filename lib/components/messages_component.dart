import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testia/components/bot_message_component.dart';
import 'package:testia/components/me_message_component.dart';

class MessagesComponent extends StatelessWidget {
  final RxList<List<String>> messages;
  const MessagesComponent({
    super.key,
    required this.messages,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView(
        children: [
          Wrap(
            // ignore: invalid_use_of_protected_member
            children: messages.value.map((message) {
              if (message.first == "me") {
                return MeMessageComponent(message: message.last);
              }
              return BotMessageComponent(message: message.last);
            }).toList(),
          )
        ],
      ),
    );
  }
}
