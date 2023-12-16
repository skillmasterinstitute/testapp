import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'result_page_widget.dart' show ResultPageWidget;
import 'package:flutter/material.dart';

class ResultPageModel extends FlutterFlowModel<ResultPageWidget> {
  ///  Local state fields for this page.

  double? marks;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in ResultPage widget.
  int? checkMarks;
  // Stores action output result for [Backend Call - Read Document] action in ResultPage widget.
  UserRecord? checkedResult;
  // Stores action output result for [AdMob - Show Interstitial Ad] action in Column widget.
  bool? interstitialAdSuccess;
  // Stores action output result for [AdMob - Show Interstitial Ad] action in Button widget.
  bool? interstitialAdSuccess1;
  // Stores action output result for [AdMob - Show Interstitial Ad] action in Button widget.
  bool? interstitialAdSuccess2;

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
