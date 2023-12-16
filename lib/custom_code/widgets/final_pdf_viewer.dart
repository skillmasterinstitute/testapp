// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class FinalPdfViewer extends StatefulWidget {
  const FinalPdfViewer({
    Key? key,
    this.width,
    this.height,
    required this.pdfPath,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String pdfPath;

  @override
  _FinalPdfViewerState createState() => _FinalPdfViewerState();
}

class _FinalPdfViewerState extends State<FinalPdfViewer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SfPdfViewer.network(widget.pdfPath,
          scrollDirection: PdfScrollDirection.vertical, pageSpacing: 0),
    );
  }
}
