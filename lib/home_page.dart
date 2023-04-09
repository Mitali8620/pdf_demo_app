import 'package:flutter/material.dart';
import 'package:pdf_demo_app/pdf_files/edit_pdf.dart';
import 'package:pdf_demo_app/pdf_files/pdf_annonation.dart';
import 'pdf_files/create_pdf.dart';
import 'pdfview/pdf_view_screen.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

//
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: const Text("Pdf implementation"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  ///PdfToImageConversionPage
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CreatePdfPage(),
                  ));
                },
                child: const Text("Create pdf")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => EditPdf(),
                  ));
                },
                child: const Text("Edit pdf")),
            ElevatedButton(onPressed: () {}, child: const Text("Pdf to image")),
            ElevatedButton(
              onPressed: () {
                ///PdfToImageConversionPage
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const PdfViewerPage(
                    file: "assets/pdfs/sample.pdf",
                  ),
                ));
              },
              child: const Text("Load pdf file"),
            ),
            ElevatedButton(
              onPressed: () {
                ///PdfToImageConversionPage
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const PdfAnnotation(
                    path: "assets/pdfs/samples.pdf",
                  ),
                ));
              },
              child: const Text("Load pdf file"),
            ),
          ],
        ),
      ),
    );
  }
}
