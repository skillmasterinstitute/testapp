import '/flutter_flow/flutter_flow_util.dart';
import 'p_d_f_view_widget.dart' show PDFViewWidget;
import 'package:flutter/material.dart';

class PDFViewModel extends FlutterFlowModel<PDFViewWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
