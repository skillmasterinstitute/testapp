import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'upload_study_material_widget.dart' show UploadStudyMaterialWidget;
import 'package:flutter/material.dart';

class UploadStudyMaterialModel
    extends FlutterFlowModel<UploadStudyMaterialWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for Trades widget.
  String? tradesValue;
  FormFieldController<String>? tradesValueController;
  // State field(s) for Types widget.
  String? typesValue;
  FormFieldController<String>? typesValueController;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
