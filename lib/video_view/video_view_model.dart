import '/flutter_flow/flutter_flow_util.dart';
import 'video_view_widget.dart' show VideoViewWidget;
import 'package:flutter/material.dart';

class VideoViewModel extends FlutterFlowModel<VideoViewWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [AdMob - Show Interstitial Ad] action in IconButton widget.
  bool? interstitialAdSuccess1Copy5Copy;

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
