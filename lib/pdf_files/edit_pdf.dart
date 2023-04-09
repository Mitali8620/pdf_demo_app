import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class EditPdf extends StatelessWidget {
  final pdf = pw.Document();
  final TextEditingController textController = TextEditingController();
  final file =
      File("/data/user/0/com.example.pdf_demo_app/app_flutter/example.pdf");

  Future loadPdf() async {
    if (await file.exists()) {
      final bytes = await file.readAsBytes();
      // pdf.loadFromBytes(bytes);
      print("File loaded from ${file.path}");
    }
  }

  void editPdf() {
    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Text(
              textController.text,
              style: const pw.TextStyle(fontSize: 32),
            ),
          ); // Center
        })); // Page
  }

  Future savePdf() async {
    editPdf();
    final bytes = await pdf.save();

    final dir = await getApplicationDocumentsDirectory();
    final file = File("${dir.path}/example.pdf");
    await file.writeAsBytes(bytes);

    print("File saved at ${dir.path}/example.pdf");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PDF Example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: textController,
              decoration: const InputDecoration(
                hintText: "Enter text to add to PDF",
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: loadPdf,
              child: const Text("Load PDF"),
            ),
            ElevatedButton(
              onPressed: savePdf,
              child: Text("Save PDF"),
            ),
          ],
        ),
      ),
    );
  }
}
