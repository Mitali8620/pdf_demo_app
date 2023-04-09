import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PdfAnnotation extends StatefulWidget {
  final String path;

  const PdfAnnotation({Key? key, required this.path}) : super(key: key);

  @override
  _PdfAnnotationState createState() => _PdfAnnotationState();
}

class _PdfAnnotationState extends State<PdfAnnotation> {
  late PDFViewController _pdfViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Viewer'),
      ),
      body: PDFView(
        filePath: widget.path,
        onRender: (pages) => setState(() {}),
        onViewCreated: (controller) => _pdfViewController = controller,
        onPageChanged: (page, total) => print('page $page of $total'),
        onPageError: (page, error) => print('error on page $page: $error'),
      ),
    );
  }
}
