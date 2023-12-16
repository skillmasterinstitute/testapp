// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_windowmanager/flutter_windowmanager.dart';

Future<void> blockScreenRecordingAndScreenshots() async {
  try {
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  } catch (e) {
    print('Failed to block screen recording and screenshots: $e');
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
