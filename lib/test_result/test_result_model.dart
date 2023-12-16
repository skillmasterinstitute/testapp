import '/flutter_flow/flutter_flow_util.dart';
import 'test_result_widget.dart' show TestResultWidget;
import 'package:flutter/material.dart';

class TestResultModel extends FlutterFlowModel<TestResultWidget> {
  ///  Local state fields for this page.

  bool? aa = false;

  bool? bb = false;

  bool? cc = false;

  bool? dd = false;

  int pageNavigation = 1;

  int markSecured = 0;

  int totalQuestions = 0;

  bool timeend = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Stores action output result for [AdMob - Show Interstitial Ad] action in Button widget.
  bool? interstitialAdSuccess1Copy;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
