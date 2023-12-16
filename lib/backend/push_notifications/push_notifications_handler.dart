import 'dart:async';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({super.key, required this.child});

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? isWeb
          ? Container()
          : Container(
              color: FlutterFlowTheme.of(context).primary,
              child: Center(
                child: Image.asset(
                  'assets/images/Avaraniya_Education_(2).gif',
                  width: MediaQuery.sizeOf(context).width * 0.95,
                  fit: BoxFit.cover,
                ),
              ),
            )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => const ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'HomePage': ParameterData.none(),
  'SignUpPage': ParameterData.none(),
  'CreateTest': ParameterData.none(),
  'CreateQuestion': (data) async => ParameterData(
        allParams: {
          'testPara': getParameter<DocumentReference>(data, 'testPara'),
          'questions': getParameter<int>(data, 'questions'),
        },
      ),
  'ResultPage': (data) async => ParameterData(
        allParams: {
          'testRefrencePara':
              getParameter<DocumentReference>(data, 'testRefrencePara'),
          'marksSecured': getParameter<int>(data, 'marksSecured'),
          'totalQuestions': getParameter<int>(data, 'totalQuestions'),
          'studentTestPara':
              getParameter<DocumentReference>(data, 'studentTestPara'),
        },
      ),
  'EditTest': (data) async => ParameterData(
        allParams: {
          'testpara': getParameter<DocumentReference>(data, 'testpara'),
        },
      ),
  'TestPage': (data) async => ParameterData(
        allParams: {
          'testsetpara': getParameter<DocumentReference>(data, 'testsetpara'),
          'testduration': getParameter<int>(data, 'testduration'),
          'totalQuestion': getParameter<int>(data, 'totalQuestion'),
          'testname': getParameter<String>(data, 'testname'),
          'testStudent': getParameter<DocumentReference>(data, 'testStudent'),
          'marksPerQuestion': getParameter<int>(data, 'marksPerQuestion'),
        },
      ),
  'TestResult': (data) async => ParameterData(
        allParams: {
          'testStudent': getParameter<DocumentReference>(data, 'testStudent'),
          'totalQuestions': getParameter<int>(data, 'totalQuestions'),
        },
      ),
  'AddToChat': ParameterData.none(),
  'AllChat': ParameterData.none(),
  'SendNotification': ParameterData.none(),
  'PhoneLogin': ParameterData.none(),
  'ProfilePage': ParameterData.none(),
  'CreateSlides': ParameterData.none(),
  'EditTestimonials': ParameterData.none(),
  'ChatPage': (data) async => ParameterData(
        allParams: {
          'chatUser': await getDocumentParameter<UserRecord>(
              data, 'chatUser', UserRecord.fromSnapshot),
          'chatRef': getParameter<DocumentReference>(data, 'chatRef'),
        },
      ),
  'OTPLogin': (data) async => ParameterData(
        allParams: {
          'phoneNo': getParameter<String>(data, 'phoneNo'),
        },
      ),
  'TestSeries': (data) async => ParameterData(
        allParams: {
          'type': getParameter<int>(data, 'type'),
        },
      ),
  'Rank': ParameterData.none(),
  'ReportedQuestions': (data) async => ParameterData(
        allParams: {
          'img': getParameter<String>(data, 'img'),
        },
      ),
  'Dashboard': ParameterData.none(),
  'CreateFeedback': ParameterData.none(),
  'StudentPage': (data) async => ParameterData(
        allParams: {
          'refrence': getParameter<DocumentReference>(data, 'refrence'),
        },
      ),
  'SignUp': ParameterData.none(),
  'fast2sms': ParameterData.none(),
  'fastotp': (data) async => ParameterData(
        allParams: {
          'phoneNo': getParameter<String>(data, 'phoneNo'),
          'mobile': getParameter<String>(data, 'mobile'),
        },
      ),
  'StudyMaterial': (data) async => ParameterData(
        allParams: {
          'type': getParameter<int>(data, 'type'),
        },
      ),
  'PDFView': (data) async => ParameterData(
        allParams: {
          'pdfRefenrence': getParameter<String>(data, 'pdfRefenrence'),
        },
      ),
  'StudyView': (data) async => ParameterData(
        allParams: {
          'contentType': getParameter<String>(data, 'contentType'),
          'filterType': getParameter<String>(data, 'filterType'),
        },
      ),
  'CreateStudyMaterial': ParameterData.none(),
  'VideoView': (data) async => ParameterData(
        allParams: {
          'contentType': getParameter<String>(data, 'contentType'),
          'filterType': getParameter<String>(data, 'filterType'),
        },
      ),
  'VideoPlayer': (data) async => ParameterData(
        allParams: {
          'pdfRefenrence': getParameter<String>(data, 'pdfRefenrence'),
        },
      ),
  'UploadStudyMaterial': ParameterData.none(),
  'Experiment': ParameterData.none(),
  'Experiment2': (data) async => ParameterData(
        allParams: {
          'reference1': getParameter<DocumentReference>(data, 'reference1'),
        },
      ),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
