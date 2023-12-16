import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_test_widget.dart' show CreateTestWidget;
import 'package:flutter/material.dart';

class CreateTestModel extends FlutterFlowModel<CreateTestWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode;
  TextEditingController? yourNameController;
  String? Function(BuildContext, String?)? yourNameControllerValidator;
  String? _yourNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'tsewt09n' /* Test Title is Required */,
      );
    }

    return null;
  }

  // State field(s) for points widget.
  FocusNode? pointsFocusNode;
  TextEditingController? pointsController;
  String? Function(BuildContext, String?)? pointsControllerValidator;
  String? _pointsControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'i7rs0f3z' /* Marks Per Question is Required */,
      );
    }

    return null;
  }

  // State field(s) for marks widget.
  FocusNode? marksFocusNode;
  TextEditingController? marksController;
  String? Function(BuildContext, String?)? marksControllerValidator;
  String? _marksControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'hevxx2v7' /* Fill Duration of Test in Minut... */,
      );
    }

    if (val.isEmpty) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  TestRecord? createTest;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    yourNameControllerValidator = _yourNameControllerValidator;
    pointsControllerValidator = _pointsControllerValidator;
    marksControllerValidator = _marksControllerValidator;
  }

  @override
  void dispose() {
    yourNameFocusNode?.dispose();
    yourNameController?.dispose();

    pointsFocusNode?.dispose();
    pointsController?.dispose();

    marksFocusNode?.dispose();
    marksController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
