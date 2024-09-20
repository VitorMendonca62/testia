import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:http/http.dart' as http;

// final ByteData data = await rootBundle.load("assets/$name");
// return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
class PdfService {
  Future<List<int>?> _readDocumentData() async {
    final response = await http.get(Uri.parse(
        "http://www.condepefidem.pe.gov.br/c/document_library/get_file?p_l_id=18393234&folderId=18394117&name=DLFE-89632.pdf"));

    if (response.statusCode == 200) {
      return response.bodyBytes;
    }

    return null;
  }

  Future<String> getPdfText() async {
    List<int>? bytes = await _readDocumentData();

    final PdfDocument document = PdfDocument(inputBytes: bytes);

    PdfTextExtractor extractor = PdfTextExtractor(document);

    List<TextLine> textLines = extractor.extractTextLines();
    String text = "";

    for (int i = 0; i < textLines.length; i++) {
      text += "${textLines[i].text} ";
    }
    return text;
  }
}
