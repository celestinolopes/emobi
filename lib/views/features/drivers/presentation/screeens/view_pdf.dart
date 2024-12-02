import 'dart:async';

import 'package:e_mobi/pallete_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class ViewPdfPage extends StatefulWidget {
  const ViewPdfPage({super.key, required this.path});
  final String path;

  @override
  State<ViewPdfPage> createState() => _ViewPdfPageState();
}

class _ViewPdfPageState extends State<ViewPdfPage> {
  final Completer<PDFViewController> _controller =
      Completer<PDFViewController>();

  int? pages = 0;

  int? currentPage = 0;

  bool isReady = false;

  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          "Visualização de documentos",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: PalleteColors.primaryColor,
      ),
      body: PDFView(
        filePath: widget.path,
        enableSwipe: false,
        swipeHorizontal: true,
        autoSpacing: false,
        pageFling: false,
        backgroundColor: Colors.white,
        onRender: (pages) {
          setState(() {
            pages = pages;
            isReady = true;
          });
        },
        onError: (error) {
          print(error.toString());
        },
        onPageError: (page, error) {
          print('$page: ${error.toString()}');
        },
        onViewCreated: (PDFViewController pdfViewController) {
          _controller.complete(pdfViewController);
        },
      ),
    );
  }
}
