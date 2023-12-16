import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'fast2sms_widget.dart' show Fast2smsWidget;
import 'package:flutter/material.dart';

class Fast2smsModel extends FlutterFlowModel<Fast2smsWidget> {
  ///  Local state fields for this page.

  String otp = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode1;
  TextEditingController? phoneNumberController1;
  String? Function(BuildContext, String?)? phoneNumberController1Validator;
  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode2;
  TextEditingController? phoneNumberController2;
  String? Function(BuildContext, String?)? phoneNumberController2Validator;
  // Stores action output result for [Backend Call - API (SMS API)] action in Button widget.
  ApiCallResponse? apiResultfan;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    phoneNumberFocusNode1?.dispose();
    phoneNumberController1?.dispose();

    phoneNumberFocusNode2?.dispose();
    phoneNumberController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
