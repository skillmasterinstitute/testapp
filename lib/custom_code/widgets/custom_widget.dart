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

import 'dart:io';
import 'package:dio/dio.dart';
// import 'package:path_provider/path_provider.dart';
import 'package:document_file_save_plus/document_file_save_plus.dart';
import 'package:mime_type/mime_type.dart';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart';

class CustomWidget extends StatefulWidget {
  const CustomWidget({
    Key? key,
    this.width,
    this.height,
    this.url,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? url;

  @override
  _CustomWidgetState createState() => _CustomWidgetState();
}

class _CustomWidgetState extends State<CustomWidget> {
  double downloadProgress = 0.0;
  bool downloading = false;

  void _downloadFile() async {
    setState(() {
      downloading = true;
      downloadProgress = 0.0;
    });

    final dio = Dio();

    try {
      final response = await dio.get(
        widget.url ?? '',
        options: Options(
          responseType: ResponseType.stream,
        ),
      );

      final file = File('your_file_path_here');

      final sink = file.openWrite();
      num received = 0;

      response.data.stream.listen(
        (data) {
          received += data.length;
          setState(() {
            downloadProgress =
                received / (response.headers['content-length'] as num);
          });
          sink.add(data);
        },
        onDone: () {
          sink.close();
          setState(() {
            downloading = false;
          });
        },
        onError: (error) {
          // Handle download error here
          print('Download error: $error');
        },
      );
    } catch (e) {
      // Handle any other errors that may occur during the download process
      print('Error downloading file: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      padding: EdgeInsets.all(16),
      child: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'First Text',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Second Text',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
          if (downloading)
            LinearProgressIndicator(
              value: downloadProgress,
            )
          else
            IconButton(
              icon: Icon(Icons.download),
              onPressed: _downloadFile,
            ),
        ],
      ),
    );
  }
}
