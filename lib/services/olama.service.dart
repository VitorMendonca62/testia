import 'dart:io';
import 'package:get/get.dart';
import 'package:ollama/ollama.dart';
import 'package:testia/services/pdf.service.dart';

class OllamaService {
  PdfService pdfService = Get.put(PdfService());
  List<ChatMessage> messages = [];
  final Ollama ollama = Ollama(baseUrl: Uri.http("http://127.0.0.1:11434/"));

  init() async {
    String text = await pdfService.getPdfText();

    messages.add(
      ChatMessage(
          role: 'user',
          content:
              'Use esse texto como base para as próximas perguntas, ele estará contornado por ###: ### $text ###'),
    );

    print("#########################");
    print("Primeiro conteudo");
    print(messages.first.content);
    print("#########################");

    final stream = ollama.chat(
      messages,
      model: 'llama3.2:1b',
    );

    stream.listen(stdout.write);
  }

  Future<String?> getResponse(String question) async {
    try {
      messages.add(
        ChatMessage(
            role: 'user',
            content:
                "Elabore uma resposta para a seguinte pergunta: '$question', você também pode pesquisar na sua base de dados, mas não pode fugir muito da proposta do texto que foi passado anteriormente e está contornado por ###. Caso a pergunta não seja direcionada sobre o projeto de Matricula Online da cidade do recife, responda o seguinte: 'Eu não posso lhe ajudar'. Para contextualizar: Você é um chatbot de um aplicativo que serve para retirar dúvidas de pessoas sobre o sistema de matricula da cidade do recife. Seja neutro na hora de falar sobre algum politico que está em exercício atualmente. Resuma para que não seja tão verboso a resposta."),
      );
      print("#########################");
      print("Segundo conteudo");
      print(messages.last.content);
      print("#########################");

      final stream = ollama.chat(
        messages,
        model: 'llama3.2:1b',
      );

      print("#########################");
      print("Ter conteudo");
      print(stream.toList());
      print("#########################");

      String response = "";

      stream.listen(stdout.write);

      print("FOI");
      return response;
    } catch (e) {
      print(e);
      print("NAo foi");
      return "Algo deu errado na resposta, tente novamente!2";
    }
  }
}
