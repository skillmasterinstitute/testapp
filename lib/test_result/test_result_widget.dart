import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/admob_util.dart' as admob;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'test_result_model.dart';
export 'test_result_model.dart';

class TestResultWidget extends StatefulWidget {
  const TestResultWidget({
    super.key,
    required this.testStudent,
    required this.totalQuestions,
  });

  final DocumentReference? testStudent;
  final int? totalQuestions;

  @override
  _TestResultWidgetState createState() => _TestResultWidgetState();
}

class _TestResultWidgetState extends State<TestResultWidget> {
  late TestResultModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestResultModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      admob.loadInterstitialAd(
        "",
        "ca-app-pub-7315791677262365/5564722872",
        false,
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return StreamBuilder<List<QuestionStudentRecord>>(
      stream: queryQuestionStudentRecord(
        queryBuilder: (questionStudentRecord) => questionStudentRecord
            .where(
              'indexNo',
              isEqualTo: _model.pageNavigation,
            )
            .where(
              'test_Reference',
              isEqualTo: widget.testStudent,
            ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return const Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitWave(
                  color: Color(0xFFF6D96B),
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        List<QuestionStudentRecord> testResultQuestionStudentRecordList =
            snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final testResultQuestionStudentRecord =
            testResultQuestionStudentRecordList.isNotEmpty
                ? testResultQuestionStudentRecordList.first
                : null;
        return WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.white,
            body: StreamBuilder<TestStudentRecord>(
              stream: TestStudentRecord.getDocument(widget.testStudent!),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return const Center(
                    child: SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: SpinKitWave(
                        color: Color(0xFFF6D96B),
                        size: 50.0,
                      ),
                    ),
                  );
                }
                final containerTestStudentRecord = snapshot.data!;
                return Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        FlutterFlowTheme.of(context).primary,
                        FlutterFlowTheme.of(context).secondary
                      ],
                      stops: const [0.0, 1.0],
                      begin: const AlignmentDirectional(0.0, -1.0),
                      end: const AlignmentDirectional(0, 1.0),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 0.125,
                        decoration: const BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 50.0,
                              decoration: const BoxDecoration(),
                              child: Visibility(
                                visible: (valueOrDefault<bool>(
                                            currentUserDocument?.isPremium,
                                            false) ==
                                        false) &&
                                    (currentUserDocument!.premiumTill! <
                                        getCurrentTimestamp),
                                child: AuthUserStreamWidget(
                                  builder: (context) => FlutterFlowAdBanner(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 50.0,
                                    showsTestAd: false,
                                    androidAdUnitID:
                                        'ca-app-pub-7315791677262365/9458121453',
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  4.0, 5.0, 4.0, 5.0),
                              child: Text(
                                containerTestStudentRecord.testName,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Raleway',
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 0.745,
                        decoration: const BoxDecoration(),
                        child: SingleChildScrollView(
                          primary: false,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0.0, -1.0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  decoration: const BoxDecoration(),
                                  child: SizedBox(
                                    width: double.infinity,
                                    height:
                                        MediaQuery.sizeOf(context).height * 1.0,
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 40.0),
                                      child: PageView(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        controller:
                                            _model.pageViewController ??=
                                                PageController(initialPage: 0),
                                        scrollDirection: Axis.horizontal,
                                        children: [
                                          SingleChildScrollView(
                                            primary: false,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                SingleChildScrollView(
                                                  primary: false,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      SingleChildScrollView(
                                                        primary: false,
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15.0,
                                                                          15.0,
                                                                          15.0,
                                                                          0.0),
                                                              child: Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  boxShadow: const [
                                                                    BoxShadow(
                                                                      blurRadius:
                                                                          4.0,
                                                                      color: Color(
                                                                          0x33000000),
                                                                      offset: Offset(
                                                                          0.0,
                                                                          2.0),
                                                                    )
                                                                  ],
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .accent4,
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          3.0,
                                                                          8.0,
                                                                          3.0,
                                                                          8.0),
                                                                  child: Stack(
                                                                    children: [
                                                                      Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(10.0),
                                                                          child:
                                                                              Text(
                                                                            'Q. No. ${testResultQuestionStudentRecord?.indexNo.toString()}: ${testResultQuestionStudentRecord?.question}',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Raleway',
                                                                                  fontSize: 16.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, -1.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15.0,
                                                                          15.0,
                                                                          15.0,
                                                                          8.0),
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  setState(() {
                                                                    _model.aa =
                                                                        true;
                                                                    _model.bb =
                                                                        false;
                                                                    _model.cc =
                                                                        false;
                                                                    _model.dd =
                                                                        false;
                                                                  });
                                                                  if ((_model.aa ==
                                                                              true) &&
                                                                          (testResultQuestionStudentRecord.bol1 ==
                                                                              true)
                                                                      ? true
                                                                      : false) {
                                                                    setState(
                                                                        () {
                                                                      _model.markSecured =
                                                                          _model.markSecured +
                                                                              1;
                                                                    });
                                                                  }
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      1.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: () {
                                                                      if (testResultQuestionStudentRecord
                                                                              ?.bol1 ==
                                                                          true) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .customColor1;
                                                                      } else if ((testResultQuestionStudentRecord?.bol1 ==
                                                                              true) &&
                                                                          (testResultQuestionStudentRecord?.is1 ==
                                                                              true)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .customColor1;
                                                                      } else if ((testResultQuestionStudentRecord?.bol1 ==
                                                                              false) &&
                                                                          (testResultQuestionStudentRecord?.is1 ==
                                                                              true)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .error;
                                                                      } else {
                                                                        return const Color(
                                                                            0x00000000);
                                                                      }
                                                                    }(),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5.0),
                                                                    shape: BoxShape
                                                                        .rectangle,
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent3,
                                                                    ),
                                                                  ),
                                                                  child: Align(
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          3.0,
                                                                          10.0,
                                                                          3.0,
                                                                          10.0),
                                                                      child:
                                                                          Stack(
                                                                        alignment: const AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                        children: [
                                                                          if ((testResultQuestionStudentRecord?.bol1 == false) &&
                                                                              (testResultQuestionStudentRecord?.is1 == true))
                                                                            Align(
                                                                              alignment: const AlignmentDirectional(1.0, 0.0),
                                                                              child: Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                child: Icon(
                                                                                  Icons.cancel_rounded,
                                                                                  color: FlutterFlowTheme.of(context).info,
                                                                                  size: 24.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          Align(
                                                                            alignment:
                                                                                const AlignmentDirectional(-1.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(37.0, 0.0, 40.0, 0.0),
                                                                              child: Text(
                                                                                testResultQuestionStudentRecord!.op1,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Raleway',
                                                                                      fontSize: 14.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Card(
                                                                            clipBehavior:
                                                                                Clip.antiAliasWithSaveLayer,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).tertiary,
                                                                            shape:
                                                                                RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(25.0),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(8.0, 5.0, 8.0, 5.0),
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'ck30qxj1' /* A */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Raleway',
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      fontSize: 14.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          if (testResultQuestionStudentRecord.bol1 ==
                                                                              true)
                                                                            Align(
                                                                              alignment: const AlignmentDirectional(1.0, 0.0),
                                                                              child: Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                child: Icon(
                                                                                  Icons.check_circle,
                                                                                  color: FlutterFlowTheme.of(context).secondary,
                                                                                  size: 24.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15.0,
                                                                          0.0,
                                                                          15.0,
                                                                          8.0),
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  setState(() {
                                                                    _model.aa =
                                                                        false;
                                                                    _model.bb =
                                                                        true;
                                                                    _model.cc =
                                                                        false;
                                                                    _model.dd =
                                                                        false;
                                                                  });
                                                                  if ((_model.bb ==
                                                                              true) &&
                                                                          (testResultQuestionStudentRecord.bol2 ==
                                                                              true)
                                                                      ? true
                                                                      : false) {
                                                                    setState(
                                                                        () {
                                                                      _model.markSecured =
                                                                          _model.markSecured +
                                                                              1;
                                                                    });
                                                                  }
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      1.0,
                                                                  height: 70.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: () {
                                                                      if (testResultQuestionStudentRecord
                                                                              .bol2 ==
                                                                          true) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .customColor1;
                                                                      } else if ((testResultQuestionStudentRecord.bol2 ==
                                                                              true) &&
                                                                          (testResultQuestionStudentRecord.is2 ==
                                                                              true)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .customColor1;
                                                                      } else if ((testResultQuestionStudentRecord.bol2 ==
                                                                              false) &&
                                                                          (testResultQuestionStudentRecord.is2 ==
                                                                              true)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .error;
                                                                      } else {
                                                                        return const Color(
                                                                            0x00000000);
                                                                      }
                                                                    }(),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5.0),
                                                                    shape: BoxShape
                                                                        .rectangle,
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent4,
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            3.0,
                                                                            10.0,
                                                                            3.0,
                                                                            10.0),
                                                                    child:
                                                                        Stack(
                                                                      children: [
                                                                        Align(
                                                                          alignment: const AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                37.0,
                                                                                0.0,
                                                                                40.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              testResultQuestionStudentRecord.op2,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Raleway',
                                                                                    fontSize: 14.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        if ((testResultQuestionStudentRecord.bol2 ==
                                                                                false) &&
                                                                            (testResultQuestionStudentRecord.is2 ==
                                                                                true))
                                                                          Align(
                                                                            alignment:
                                                                                const AlignmentDirectional(1.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                              child: Icon(
                                                                                Icons.cancel,
                                                                                color: FlutterFlowTheme.of(context).info,
                                                                                size: 24.0,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        Align(
                                                                          alignment: const AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                          child:
                                                                              Card(
                                                                            clipBehavior:
                                                                                Clip.antiAliasWithSaveLayer,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).tertiary,
                                                                            shape:
                                                                                RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(25.0),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(8.0, 5.0, 8.0, 5.0),
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'qkxkv1y1' /* B */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Raleway',
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      fontSize: 14.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        if (testResultQuestionStudentRecord.bol2 ==
                                                                            true)
                                                                          Align(
                                                                            alignment:
                                                                                const AlignmentDirectional(1.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                              child: Icon(
                                                                                Icons.check_circle,
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                size: 24.0,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15.0,
                                                                          0.0,
                                                                          15.0,
                                                                          8.0),
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  setState(() {
                                                                    _model.aa =
                                                                        false;
                                                                    _model.bb =
                                                                        false;
                                                                    _model.cc =
                                                                        true;
                                                                    _model.dd =
                                                                        false;
                                                                  });
                                                                  if ((_model.cc ==
                                                                              true) &&
                                                                          (testResultQuestionStudentRecord.bol3 ==
                                                                              true)
                                                                      ? true
                                                                      : false) {
                                                                    setState(
                                                                        () {
                                                                      _model.markSecured =
                                                                          _model.markSecured +
                                                                              1;
                                                                    });
                                                                  }
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      1.0,
                                                                  height: 70.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: () {
                                                                      if (testResultQuestionStudentRecord
                                                                              .bol3 ==
                                                                          true) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .customColor1;
                                                                      } else if ((testResultQuestionStudentRecord.bol3 ==
                                                                              true) &&
                                                                          (testResultQuestionStudentRecord.is3 ==
                                                                              true)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .customColor1;
                                                                      } else if ((testResultQuestionStudentRecord.bol3 ==
                                                                              false) &&
                                                                          (testResultQuestionStudentRecord.is3 ==
                                                                              true)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .error;
                                                                      } else {
                                                                        return const Color(
                                                                            0x00000000);
                                                                      }
                                                                    }(),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5.0),
                                                                    shape: BoxShape
                                                                        .rectangle,
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent4,
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            3.0,
                                                                            10.0,
                                                                            3.0,
                                                                            10.0),
                                                                    child:
                                                                        Stack(
                                                                      children: [
                                                                        Align(
                                                                          alignment: const AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                37.0,
                                                                                0.0,
                                                                                40.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              testResultQuestionStudentRecord.op3,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Raleway',
                                                                                    fontSize: 14.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        if ((testResultQuestionStudentRecord.bol3 ==
                                                                                false) &&
                                                                            (testResultQuestionStudentRecord.is3 ==
                                                                                true))
                                                                          Align(
                                                                            alignment:
                                                                                const AlignmentDirectional(1.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                              child: Icon(
                                                                                Icons.cancel_rounded,
                                                                                color: FlutterFlowTheme.of(context).info,
                                                                                size: 24.0,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        Align(
                                                                          alignment: const AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                          child:
                                                                              Card(
                                                                            clipBehavior:
                                                                                Clip.antiAliasWithSaveLayer,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).tertiary,
                                                                            shape:
                                                                                RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(25.0),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(8.0, 5.0, 8.0, 5.0),
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'dblpch7k' /* C */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Raleway',
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      fontSize: 14.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        if (testResultQuestionStudentRecord.bol3 ==
                                                                            true)
                                                                          Align(
                                                                            alignment:
                                                                                const AlignmentDirectional(1.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                              child: Icon(
                                                                                Icons.check_circle,
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                size: 24.0,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15.0,
                                                                          0.0,
                                                                          15.0,
                                                                          8.0),
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  setState(() {
                                                                    _model.aa =
                                                                        false;
                                                                    _model.bb =
                                                                        false;
                                                                    _model.cc =
                                                                        false;
                                                                    _model.dd =
                                                                        true;
                                                                  });
                                                                  if ((_model.dd ==
                                                                              true) &&
                                                                          (testResultQuestionStudentRecord.bol4 ==
                                                                              true)
                                                                      ? true
                                                                      : false) {
                                                                    setState(
                                                                        () {
                                                                      _model.markSecured =
                                                                          _model.markSecured +
                                                                              1;
                                                                    });
                                                                  }
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      1.0,
                                                                  height: 70.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: () {
                                                                      if (testResultQuestionStudentRecord
                                                                              .bol4 ==
                                                                          true) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .customColor1;
                                                                      } else if ((testResultQuestionStudentRecord.bol4 ==
                                                                              true) &&
                                                                          (testResultQuestionStudentRecord.is4 ==
                                                                              true)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .customColor1;
                                                                      } else if ((testResultQuestionStudentRecord.bol4 ==
                                                                              false) &&
                                                                          (testResultQuestionStudentRecord.is4 ==
                                                                              true)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .error;
                                                                      } else {
                                                                        return const Color(
                                                                            0x00000000);
                                                                      }
                                                                    }(),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5.0),
                                                                    shape: BoxShape
                                                                        .rectangle,
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent4,
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            3.0,
                                                                            10.0,
                                                                            3.0,
                                                                            10.0),
                                                                    child:
                                                                        Stack(
                                                                      children: [
                                                                        Align(
                                                                          alignment: const AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                37.0,
                                                                                0.0,
                                                                                40.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              testResultQuestionStudentRecord.op4,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Raleway',
                                                                                    fontSize: 14.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        if ((testResultQuestionStudentRecord.bol4 ==
                                                                                false) &&
                                                                            (testResultQuestionStudentRecord.is4 ==
                                                                                true))
                                                                          Align(
                                                                            alignment:
                                                                                const AlignmentDirectional(1.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                              child: Icon(
                                                                                Icons.cancel_rounded,
                                                                                color: FlutterFlowTheme.of(context).info,
                                                                                size: 24.0,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        Align(
                                                                          alignment: const AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                          child:
                                                                              Card(
                                                                            clipBehavior:
                                                                                Clip.antiAliasWithSaveLayer,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).tertiary,
                                                                            shape:
                                                                                RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(25.0),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(8.0, 5.0, 8.0, 5.0),
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'c9nzmd9p' /* D */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Raleway',
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      fontSize: 14.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        if (testResultQuestionStudentRecord.bol4 ==
                                                                            true)
                                                                          Align(
                                                                            alignment:
                                                                                const AlignmentDirectional(1.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                              child: Icon(
                                                                                Icons.check_circle,
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                size: 24.0,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 0.13,
                        decoration: const BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  5.0, 0.0, 5.0, 5.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  if (_model.pageNavigation > 1)
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(-1.0, -1.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          await _model.pageViewController
                                              ?.previousPage(
                                            duration:
                                                const Duration(milliseconds: 300),
                                            curve: Curves.ease,
                                          );
                                          setState(() {
                                            _model.aa = false;
                                            _model.bb = false;
                                            _model.cc = false;
                                            _model.dd = false;
                                            _model.pageNavigation =
                                                _model.pageNavigation + -1;
                                          });
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'qf25auf4' /* Back */,
                                        ),
                                        icon: const Icon(
                                          Icons.chevron_left_rounded,
                                          size: 15.0,
                                        ),
                                        options: FFButtonOptions(
                                          width: 100.0,
                                          height: 50.0,
                                          padding: const EdgeInsets.all(0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Raleway',
                                                    color: Colors.white,
                                                    fontSize: 18.0,
                                                  ),
                                          elevation: 3.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  Align(
                                    alignment: const AlignmentDirectional(1.0, -1.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        if ((valueOrDefault<bool>(
                                                    currentUserDocument
                                                        ?.isPremium,
                                                    false) ==
                                                false) &&
                                            (currentUserDocument!.premiumTill! <
                                                getCurrentTimestamp)) {
                                          _model.interstitialAdSuccess1Copy =
                                              await admob.showInterstitialAd();
                                        } else {
                                          await Future.delayed(
                                              const Duration(milliseconds: 0));
                                        }

                                        context.safePop();

                                        setState(() {});
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        '6xy6sdxa' /* Close */,
                                      ),
                                      icon: const Icon(
                                        Icons.close_sharp,
                                        size: 15.0,
                                      ),
                                      options: FFButtonOptions(
                                        width: 100.0,
                                        height: 50.0,
                                        padding: const EdgeInsets.all(0.0),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .success,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Raleway',
                                              color: Colors.white,
                                              fontSize: 18.0,
                                            ),
                                        elevation: 3.0,
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                  if (_model.pageNavigation <
                                      widget.totalQuestions!)
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(0.0, -1.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          await _model.pageViewController
                                              ?.nextPage(
                                            duration:
                                                const Duration(milliseconds: 300),
                                            curve: Curves.ease,
                                          );
                                          setState(() {
                                            _model.aa = false;
                                            _model.bb = false;
                                            _model.cc = false;
                                            _model.dd = false;
                                            _model.pageNavigation =
                                                _model.pageNavigation + 1;
                                            _model.markSecured = 0;
                                          });
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          '87jwm4my' /* Next */,
                                        ),
                                        icon: const Icon(
                                          Icons.navigate_next_sharp,
                                          size: 15.0,
                                        ),
                                        options: FFButtonOptions(
                                          width: 100.0,
                                          height: 50.0,
                                          padding: const EdgeInsets.all(0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Raleway',
                                                    color: Colors.white,
                                                    fontSize: 18.0,
                                                  ),
                                          elevation: 3.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
