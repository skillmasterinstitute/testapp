import '/flutter_flow/flutter_flow_util.dart';
import 'profile_page_widget.dart' show ProfilePageWidget;
import 'package:flutter/material.dart';

class ProfilePageModel extends FlutterFlowModel<ProfilePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Stores action output result for [AdMob - Show Interstitial Ad] action in IconButton widget.
  bool? interstitialAdSuccess1Copy;
  // Stores action output result for [AdMob - Show Interstitial Ad] action in IconButton widget.
  bool? interstitialAdSuccess1CopyCopy;
  // Stores action output result for [AdMob - Show Interstitial Ad] action in IconButton widget.
  bool? interstitialAdSuccess1Copywe;

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
