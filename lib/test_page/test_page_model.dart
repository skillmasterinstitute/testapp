import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:async';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'test_page_widget.dart' show TestPageWidget;
import 'package:flutter/material.dart';

class TestPageModel extends FlutterFlowModel<TestPageWidget> {
  ///  Local state fields for this page.

  bool? aa = false;

  bool? bb = false;

  bool? cc = false;

  bool? dd = false;

  int pageNavigation = 1;

  int markSecured = 0;

  int totalQuestions = 0;

  bool timeEnd = false;

  ///  State fields for stateful widgets in this page.

  InstantTimer? instantTimer;
  // State field(s) for Timer widget.
  int timerMilliseconds = 600000;
  String timerValue = StopWatchTimer.getDisplayTime(
    600000,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  QuestionStudentRecord? questionCreated;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  QuestionStudentRecord? questionCreated1;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  QuestionStudentRecord? questionCreated12;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  QuestionStudentRecord? questionCreated123;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  QuestionStudentRecord? questionCreated1234;
  // Stores action output result for [AdMob - Show Interstitial Ad] action in Button widget.
  bool? interstitialAdSuccess1Copy;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  QuestionStudentRecord? readDone;
  Completer<int>? firestoreRequestCompleter;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
    timerController.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  Future waitForFirestoreRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = firestoreRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
