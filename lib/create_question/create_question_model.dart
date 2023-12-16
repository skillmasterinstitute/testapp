import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'create_question_widget.dart' show CreateQuestionWidget;
import 'package:flutter/material.dart';

class CreateQuestionModel extends FlutterFlowModel<CreateQuestionWidget> {
  ///  Local state fields for this page.

  bool aa = false;

  bool bb = false;

  bool cc = false;

  bool dd = false;

  int? indexNo;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Question widget.
  FocusNode? questionFocusNode;
  TextEditingController? questionController;
  String? Function(BuildContext, String?)? questionControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for Option1 widget.
  FocusNode? option1FocusNode;
  TextEditingController? option1Controller;
  String? Function(BuildContext, String?)? option1ControllerValidator;
  // State field(s) for CheckboxA widget.
  bool? checkboxAValue;
  // State field(s) for Option2 widget.
  FocusNode? option2FocusNode;
  TextEditingController? option2Controller;
  String? Function(BuildContext, String?)? option2ControllerValidator;
  // State field(s) for CheckboxB widget.
  bool? checkboxBValue;
  // State field(s) for Option3 widget.
  FocusNode? option3FocusNode;
  TextEditingController? option3Controller;
  String? Function(BuildContext, String?)? option3ControllerValidator;
  // State field(s) for CheckboxC widget.
  bool? checkboxCValue;
  // State field(s) for Option4 widget.
  FocusNode? option4FocusNode;
  TextEditingController? option4Controller;
  String? Function(BuildContext, String?)? option4ControllerValidator;
  // State field(s) for CheckboxD widget.
  bool? checkboxDValue;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  QuestionFinalRecord? createQuestion;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    questionFocusNode?.dispose();
    questionController?.dispose();

    option1FocusNode?.dispose();
    option1Controller?.dispose();

    option2FocusNode?.dispose();
    option2Controller?.dispose();

    option3FocusNode?.dispose();
    option3Controller?.dispose();

    option4FocusNode?.dispose();
    option4Controller?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
