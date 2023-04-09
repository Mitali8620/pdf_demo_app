import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class CreatePdfPage extends StatelessWidget {
  final pdf = pw.Document();

  writeOnPdf() {
    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Text("Hello, World!",
                style: const pw.TextStyle(fontSize: 32)),
          ); // Center
        })); // Page
  }

  Future savePdf() async {
    writeOnPdf();
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
        backgroundColor: Colors.blue.shade900,
        title: const Text("PDF Example"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: savePdf,
          child: const Text("Save PDF"),
        ),
      ),
    );
  }
}
