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

import 'package:share_files_and_screenshot_widgets/share_files_and_screenshot_widgets.dart';

class Certificate extends StatefulWidget {
  const Certificate({
    Key? key,
    this.width,
    this.height,
    required this.name,
    required this.marks,
    required this.testName,
    required this.sa,
    required this.img,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String name;
  final String marks;
  final String testName;
  final String sa;
  final String img;

  @override
  _CertificateState createState() => _CertificateState();
}

class _CertificateState extends State<Certificate> {
  final GlobalKey _screenshotKey = GlobalKey();
  int originalSize = 800;

  void _shareScreenshot() async {
    final image = await ShareFilesAndScreenshotWidgets()
        .takeScreenshot(_screenshotKey, originalSize);

    // Share the image here
    await ShareFilesAndScreenshotWidgets().shareScreenshot(
        _screenshotKey, originalSize, "Title", "Name.png", "image/png",
        text: widget.sa!);
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: _screenshotKey,
      child: GestureDetector(
          onTap: () {
            _shareScreenshot();
          },
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            height: 550,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Align(
              alignment: AlignmentDirectional(0.00, 0.00),
              child: Container(
                height: 550,
                child: Stack(
                  alignment: AlignmentDirectional(0, 0),
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.00, 0.00),
                      child: Image.network(
                        widget.img!,
                        width: MediaQuery.sizeOf(context).width,
                        height: 550,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.00, 0.00),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 90, 10, 0),
                        child: Text(
                          widget.marks,
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Raleway',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900,
                                  ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.00, 0.00),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 85),
                        child: Text(
                          widget.name!,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Raleway',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.00, 0.00),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 4, 10, 0),
                        child: Text(
                          widget.testName!,
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Raleway',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 16.5,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
