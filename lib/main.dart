import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:testia/services/olama.service.dart';
import 'package:testia/views/chat_view.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key});

  OllamaService ollamaService = Get.put(OllamaService());

  @override
  Widget build(BuildContext context) {
    ollamaService.init();
    return const MaterialApp(
      title: 'Teste de ia',
      home: ChatView(),
      color: Colors.black,
    );
  }
}
