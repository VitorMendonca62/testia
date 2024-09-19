import 'package:flutter/material.dart';

class InputMessageComponent extends StatefulWidget {
  final Function(String message) sendMessage;

  const InputMessageComponent({
    super.key,
    required this.sendMessage,
  });

  @override
  State<StatefulWidget> createState() => _InputMessageComponent();
}

class _InputMessageComponent extends State<InputMessageComponent> {
  final TextEditingController inputController = TextEditingController();

  _sendMessageWithButton() {
    if (inputController.text.isNotEmpty) {
      _sendMessage(inputController.text);
    }
  }

  _sendMessage(String value) {
    if (value.isNotEmpty) {
      inputController.clear();
      widget.sendMessage(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onSubmitted: _sendMessage,
        keyboardType: TextInputType.text,
        cursorColor: Colors.black,
        controller: inputController,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: _sendMessageWithButton,
            icon: const Icon(Icons.send),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 15),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.black45,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(22),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.blue,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(22),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.black45,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(22),
          ),
        ),
      ),
    );
  }
}
