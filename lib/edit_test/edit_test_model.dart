import '/flutter_flow/flutter_flow_util.dart';
import 'edit_test_widget.dart' show EditTestWidget;
import 'package:flutter/material.dart';

class EditTestModel extends FlutterFlowModel<EditTestWidget> {
  ///  Local state fields for this page.

  String? typeoftest = '0';

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode;
  TextEditingController? yourNameController;
  String? Function(BuildContext, String?)? yourNameControllerValidator;
  // State field(s) for city widget.
  FocusNode? cityFocusNode1;
  TextEditingController? cityController1;
  String? Function(BuildContext, String?)? cityController1Validator;
  // State field(s) for city widget.
  FocusNode? cityFocusNode2;
  TextEditingController? cityController2;
  String? Function(BuildContext, String?)? cityController2Validator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    yourNameFocusNode?.dispose();
    yourNameController?.dispose();

    cityFocusNode1?.dispose();
    cityController1?.dispose();

    cityFocusNode2?.dispose();
    cityController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
