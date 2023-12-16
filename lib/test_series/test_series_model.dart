import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'test_series_widget.dart' show TestSeriesWidget;
import 'package:flutter/material.dart';

class TestSeriesModel extends FlutterFlowModel<TestSeriesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Stores action output result for [AdMob - Show Interstitial Ad] action in IconButton widget.
  bool? interstitialAdSuccess1Copy5Copy;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  TestStudentRecord? testCreated;
  // Stores action output result for [AdMob - Show Interstitial Ad] action in IconButton widget.
  bool? interstitialAdSuccess1Copy2;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  TestStudentRecord? testCreated2;
  // Stores action output result for [AdMob - Show Interstitial Ad] action in IconButton widget.
  bool? interstitialAdSuccess1Copy3;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  TestStudentRecord? testCreated1;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
