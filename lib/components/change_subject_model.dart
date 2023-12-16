import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'change_subject_widget.dart' show ChangeSubjectWidget;
import 'package:flutter/material.dart';

class ChangeSubjectModel extends FlutterFlowModel<ChangeSubjectWidget> {
  ///  Local state fields for this component.

  bool isSearchOn = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  final textFieldKey = GlobalKey();
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? textFieldSelectedOption;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<TradesRecord> simpleSearchResults = [];

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
