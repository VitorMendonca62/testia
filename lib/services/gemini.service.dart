import 'package:get/get.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:testia/services/pdf.service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class GeminiService {
  final apiKey = dotenv.env["CHATBOT_API_KEY"];
  late GenerativeModel model;
  late ChatSession chat;
  PdfService pdfService = Get.put(PdfService());

  init() async {
    if (apiKey == null) {
      return throw Exception("A chave da API do Gemini está nulo, adicione!");
    }

    model = GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: apiKey!,
      generationConfig: GenerationConfig(
        temperature: 1,
        topK: 64,
        topP: 0.95,
        maxOutputTokens: 8192,
        responseMimeType: 'text/plain',
      ),
    );

    String text = await pdfService.getPdfText();

    print(text);

    // chat = model.startChat(history: [
    //   Content.text(
    //       "Use esse texto como base para as próximas perguntas, ele estará contornado por ###: ### $text ###"),
    // ]);

    chat = model.startChat(history: [
      Content.text(
          "Use esse texto como base para as próximas perguntas, ele estará contornado por ###: ### $text ###"),
    ]);
  }

  Future<String?> getResponse(String question) async {
    try {
      var content = Content.text(
          "Elabore uma resposta para a seguinte pergunta: '$question', você também pode pesquisar na sua base de dados, mas não pode fugir muito da proposta do texto que foi passado anteriormente. Caso a pergunta não seja direcionada sobre o projeto de Matricula Online da cidade do recife, responda o seguinte: 'Eu não posso lhe ajudar'. Para contextualizar: Você é um chatbot de um aplicativo que serve para retirar dúvidas de pessoas sobre o sistema de matricula da cidade do recife. Seja neutro na hora de falar sobre algum politico que está em exercício atualmente. Resuma para que não seja tão verboso a resposta.");
      var response = await chat.sendMessage(content);
      print("FOI");
      return response.text;
    } catch (e) {
      print(e);
      print("NAo foi");
      return "Algo deu errado na resposta, tente novamente!";
    }
  }
}
  