import 'package:flutter/material.dart';

class BotMessageComponent extends StatefulWidget {
  final String message;
  const BotMessageComponent({super.key, required this.message});

  @override
  State<StatefulWidget> createState() => _BotMessageComponent();
}

class _BotMessageComponent extends State<BotMessageComponent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 300,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(24),
                topRight: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
              color: Colors.grey[600],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                textAlign: TextAlign.start,
                softWrap: true,
                overflow: TextOverflow.visible,
                widget.message,
              ),
            ),
          )
        ],
      ),
    );
  }
}
