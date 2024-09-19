import 'package:flutter/material.dart';

class MeMessageComponent extends StatefulWidget {
  final String message;
  const MeMessageComponent({super.key, required this.message});

  @override
  State<StatefulWidget> createState() => _MeMessageComponent();
}

class _MeMessageComponent extends State<MeMessageComponent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 300,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(24),
                topLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
              color: Colors.green[800],
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
