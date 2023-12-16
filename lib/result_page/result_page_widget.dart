import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/certificate_share_widget.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/admob_util.dart' as admob;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'result_page_model.dart';
export 'result_page_model.dart';

class ResultPageWidget extends StatefulWidget {
  const ResultPageWidget({
    super.key,
    this.testRefrencePara,
    int? marksSecured,
    int? totalQuestions,
    required this.studentTestPara,
  })  : marksSecured = marksSecured ?? 0,
        totalQuestions = totalQuestions ?? 0;

  final DocumentReference? testRefrencePara;
  final int marksSecured;
  final int totalQuestions;
  final DocumentReference? studentTestPara;

  @override
  _ResultPageWidgetState createState() => _ResultPageWidgetState();
}

class _ResultPageWidgetState extends State<ResultPageWidget> {
  late ResultPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ResultPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.checkMarks = await queryQuestionStudentRecordCount(
        queryBuilder: (questionStudentRecord) => questionStudentRecord
            .where(
              'test_Reference',
              isEqualTo: widget.studentTestPara,
            )
            .where(
              'Marks',
              isGreaterThan: 0,
            ),
      );

      await currentUserReference!.update({
        ...mapToFirestore(
          {
            'GainedMarks': FieldValue.increment(_model.checkMarks! * 2),
          },
        ),
      });
      _model.checkedResult =
          await UserRecord.getDocumentOnce(currentUserReference!);

      await _model.checkedResult!.reference.update(createUserRecordData(
        skillPoints: valueOrDefault<double>(
          (valueOrDefault<int>(
                    _model.checkedResult?.gainedMarks,
                    0,
                  ) *
                  valueOrDefault<int>(
                    valueOrDefault(currentUserDocument?.testAttempted, 0),
                    0,
                  ) *
                  3)
              .toDouble(),
          0.0,
        ),
      ));
      await actions.inAppReview();

      admob.loadInterstitialAd(
        "",
        "ca-app-pub-7315791677262365/5564722872",
        false,
      );

      admob.loadInterstitialAd(
        "",
        "ca-app-pub-7315791677262365/5564722872",
        false,
      );

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

    return FutureBuilder<int>(
      future: queryQuestionStudentRecordCount(
        queryBuilder: (questionStudentRecord) => questionStudentRecord
            .where(
              'test_Reference',
              isEqualTo: widget.studentTestPara,
            )
            .where(
              'Marks',
              isGreaterThan: 0,
            ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primary,
            body: const Center(
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
        int resultPageCount = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primary,
              body: SafeArea(
                top: true,
                child: Container(
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
                        height: MediaQuery.sizeOf(context).height * 0.1,
                        decoration: const BoxDecoration(),
                        child: Visibility(
                          visible: (valueOrDefault<bool>(
                                      currentUserDocument?.isPremium, false) ==
                                  false) &&
                              (currentUserDocument!.premiumTill! <
                                  getCurrentTimestamp),
                          child: AuthUserStreamWidget(
                            builder: (context) => FlutterFlowAdBanner(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 50.0,
                              showsTestAd: false,
                              androidAdUnitID:
                                  'ca-app-pub-7315791677262365/9458121453',
                            ),
                          ),
                        ),
                      ),
                      StreamBuilder<TestStudentRecord>(
                        stream: TestStudentRecord.getDocument(
                            widget.studentTestPara!),
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
                            height: MediaQuery.sizeOf(context).height * 0.8,
                            decoration: const BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Stack(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 24.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          StreamBuilder<TestStudentRecord>(
                                            stream:
                                                TestStudentRecord.getDocument(
                                                    widget.studentTestPara!),
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
                                              final textTestStudentRecord =
                                                  snapshot.data!;
                                              return GradientText(
                                                formatNumber(
                                                  (resultPageCount *
                                                          textTestStudentRecord
                                                              .marksPerQuestion) /
                                                      (widget.totalQuestions *
                                                          textTestStudentRecord
                                                              .marksPerQuestion),
                                                  formatType:
                                                      FormatType.percent,
                                                ),
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMedium
                                                        .override(
                                                          fontFamily: 'Ubuntu',
                                                          color: Colors.white,
                                                          fontSize: 90.0,
                                                          fontWeight:
                                                              FontWeight.w900,
                                                        ),
                                                colors: const [
                                                  Color(0xFF11998E),
                                                  Color(0xFF38EF7D)
                                                ],
                                                gradientDirection:
                                                    GradientDirection.btt,
                                                gradientType:
                                                    GradientType.linear,
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (((resultPageCount *
                                                    containerTestStudentRecord
                                                        .marksPerQuestion) /
                                                (widget.totalQuestions *
                                                    containerTestStudentRecord
                                                        .marksPerQuestion) *
                                                100) >
                                            30.0
                                        ? true
                                        : false)
                                      Lottie.asset(
                                        'assets/lottie_animations/Animation_-_1697555594289.json',
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 162.0,
                                        fit: BoxFit.cover,
                                        animate: true,
                                      ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    AuthUserStreamWidget(
                                      builder: (context) => Text(
                                        'Congratulations $currentUserDisplayName!',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .override(
                                              fontFamily: 'Outfit',
                                              color: Colors.white,
                                              fontSize: 19.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 3.0, 0.0, 0.0),
                                      child: Text(
                                        '${resultPageCount.toString()} ${resultPageCount <= 1 ? 'Question' : 'Questions'} out of ${widget.totalQuestions.toString()} are Correct',
                                        style: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Outfit',
                                              color: Colors.white,
                                              fontSize: 17.0,
                                              fontWeight: FontWeight.w300,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                if (((resultPageCount *
                                                containerTestStudentRecord
                                                    .marksPerQuestion) /
                                            (widget.totalQuestions *
                                                containerTestStudentRecord
                                                    .marksPerQuestion) *
                                            100) >
                                        30.0
                                    ? true
                                    : false)
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      var shouldSetState = false;
                                      if ((valueOrDefault<bool>(
                                                  currentUserDocument
                                                      ?.isPremium,
                                                  false) ==
                                              false) &&
                                          (currentUserDocument!.premiumTill! <
                                              getCurrentTimestamp)) {
                                        _model.interstitialAdSuccess =
                                            await admob.showInterstitialAd();

                                        shouldSetState = true;
                                      } else {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          context: context,
                                          builder: (context) {
                                            return WebViewAware(
                                                child: GestureDetector(
                                              onTap: () => _model.unfocusNode
                                                      .canRequestFocus
                                                  ? FocusScope.of(context)
                                                      .requestFocus(
                                                          _model.unfocusNode)
                                                  : FocusScope.of(context)
                                                      .unfocus(),
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: CertificateShareWidget(
                                                  marks: formatNumber(
                                                    (resultPageCount *
                                                            containerTestStudentRecord
                                                                .marksPerQuestion) /
                                                        (widget.totalQuestions *
                                                            containerTestStudentRecord
                                                                .marksPerQuestion),
                                                    formatType:
                                                        FormatType.percent,
                                                  ),
                                                  testName:
                                                      containerTestStudentRecord
                                                          .testName,
                                                ),
                                              ),
                                            ));
                                          },
                                        ).then((value) => safeSetState(() {}));

                                        if (shouldSetState) setState(() {});
                                        return;
                                      }

                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        context: context,
                                        builder: (context) {
                                          return WebViewAware(
                                              child: GestureDetector(
                                            onTap: () => _model
                                                    .unfocusNode.canRequestFocus
                                                ? FocusScope.of(context)
                                                    .requestFocus(
                                                        _model.unfocusNode)
                                                : FocusScope.of(context)
                                                    .unfocus(),
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: CertificateShareWidget(
                                                marks: formatNumber(
                                                  (resultPageCount *
                                                          containerTestStudentRecord
                                                              .marksPerQuestion) /
                                                      (widget.totalQuestions *
                                                          containerTestStudentRecord
                                                              .marksPerQuestion),
                                                  formatType:
                                                      FormatType.percent,
                                                ),
                                                testName:
                                                    containerTestStudentRecord
                                                        .testName,
                                              ),
                                            ),
                                          ));
                                        },
                                      ).then((value) => safeSetState(() {}));

                                      if (shouldSetState) setState(() {});
                                    },
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Lottie.asset(
                                          'assets/lottie_animations/animation_lnyr1mvx.json',
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.85,
                                          height: 250.0,
                                          fit: BoxFit.cover,
                                          animate: true,
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'zvja9trf' /* Share Certificate */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Raleway',
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 20.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      FFButtonWidget(
                                        onPressed: () async {
                                          var shouldSetState = false;
                                          if ((valueOrDefault<bool>(
                                                      currentUserDocument
                                                          ?.isPremium,
                                                      false) ==
                                                  false) &&
                                              (currentUserDocument!
                                                      .premiumTill! <
                                                  getCurrentTimestamp)) {
                                            _model.interstitialAdSuccess1 =
                                                await admob
                                                    .showInterstitialAd();

                                            shouldSetState = true;
                                          } else {
                                            context.pushNamed(
                                              'TestResult',
                                              queryParameters: {
                                                'testStudent': serializeParam(
                                                  widget.studentTestPara,
                                                  ParamType.DocumentReference,
                                                ),
                                                'totalQuestions':
                                                    serializeParam(
                                                  widget.totalQuestions,
                                                  ParamType.int,
                                                ),
                                              }.withoutNulls,
                                            );

                                            if (shouldSetState) {
                                              setState(() {});
                                            }
                                            return;
                                          }

                                          context.pushNamed(
                                            'TestResult',
                                            queryParameters: {
                                              'testStudent': serializeParam(
                                                widget.studentTestPara,
                                                ParamType.DocumentReference,
                                              ),
                                              'totalQuestions': serializeParam(
                                                widget.totalQuestions,
                                                ParamType.int,
                                              ),
                                            }.withoutNulls,
                                          );

                                          if (shouldSetState) setState(() {});
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'jo6jn13l' /* Solution */,
                                        ),
                                        options: FFButtonOptions(
                                          width: 130.0,
                                          height: 50.0,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .success,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Outfit',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                          elevation: 3.0,
                                          borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                        ),
                                      ),
                                      FFButtonWidget(
                                        onPressed: () async {
                                          var shouldSetState = false;

                                          context.goNamed(
                                            'TestSeries',
                                            queryParameters: {
                                              'type': serializeParam(
                                                0,
                                                ParamType.int,
                                              ),
                                            }.withoutNulls,
                                          );

                                          if ((valueOrDefault<bool>(
                                                      currentUserDocument
                                                          ?.isPremium,
                                                      false) ==
                                                  false) &&
                                              (currentUserDocument!
                                                      .premiumTill! <
                                                  getCurrentTimestamp)) {
                                            _model.interstitialAdSuccess2 =
                                                await admob
                                                    .showInterstitialAd();

                                            shouldSetState = true;
                                          } else {
                                            context.goNamed(
                                              'TestSeries',
                                              queryParameters: {
                                                'type': serializeParam(
                                                  0,
                                                  ParamType.int,
                                                ),
                                              }.withoutNulls,
                                            );

                                            if (shouldSetState) {
                                              setState(() {});
                                            }
                                            return;
                                          }

                                          context.goNamed(
                                            'TestSeries',
                                            queryParameters: {
                                              'type': serializeParam(
                                                0,
                                                ParamType.int,
                                              ),
                                            }.withoutNulls,
                                          );

                                          if (shouldSetState) setState(() {});
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'byl8ezfx' /* Back to Tests */,
                                        ),
                                        options: FFButtonOptions(
                                          width: 130.0,
                                          height: 50.0,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Colors.white,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Outfit',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                          elevation: 3.0,
                                          borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
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
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
