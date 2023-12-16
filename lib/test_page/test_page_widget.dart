import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/report_question_widget.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/flutter_flow/admob_util.dart' as admob;
import 'dart:async';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'test_page_model.dart';
export 'test_page_model.dart';

class TestPageWidget extends StatefulWidget {
  const TestPageWidget({
    super.key,
    required this.testsetpara,
    int? testduration,
    int? totalQuestion,
    String? testname,
    required this.testStudent,
    required this.marksPerQuestion,
  })  : testduration = testduration ?? 0,
        totalQuestion = totalQuestion ?? 0,
        testname = testname ?? '0';

  final DocumentReference? testsetpara;
  final int testduration;
  final int totalQuestion;
  final String testname;
  final DocumentReference? testStudent;
  final int? marksPerQuestion;

  @override
  _TestPageWidgetState createState() => _TestPageWidgetState();
}

class _TestPageWidgetState extends State<TestPageWidget>
    with TickerProviderStateMixin {
  late TestPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasContainerTriggered1 = false;
  var hasContainerTriggered2 = false;
  var hasContainerTriggered3 = false;
  var hasContainerTriggered4 = false;
  var hasContainerTriggered5 = false;
  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      applyInitialState: false,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 120.ms,
          duration: 600.ms,
          begin: const Offset(17.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnActionTriggerAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: false,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(17.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      applyInitialState: false,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 160.ms,
          duration: 600.ms,
          begin: const Offset(17.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnActionTriggerAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: false,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 40.ms,
          duration: 600.ms,
          begin: const Offset(17.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      applyInitialState: false,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: const Offset(17.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnActionTriggerAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: false,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 80.ms,
          duration: 600.ms,
          begin: const Offset(17.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      applyInitialState: false,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 240.ms,
          duration: 600.ms,
          begin: const Offset(17.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnActionTriggerAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: false,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 120.ms,
          duration: 600.ms,
          begin: const Offset(17.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation5': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      applyInitialState: false,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 280.ms,
          duration: 600.ms,
          begin: const Offset(17.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnActionTriggerAnimation5': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: false,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 160.ms,
          duration: 600.ms,
          begin: const Offset(17.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      admob.loadInterstitialAd(
        "",
        "ca-app-pub-7315791677262365/5564722872",
        false,
      );

      _model.instantTimer = InstantTimer.periodic(
        duration: const Duration(milliseconds: 1000),
        callback: (timer) async {
          _model.timerController.onStartTimer();
        },
        startImmediately: true,
      );
    });

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    SchedulerBinding.instance.addPostFrameCallback((_) {
      animationsMap['containerOnPageLoadAnimation1']!
          .controller
          .forward(from: 0.0);
      animationsMap['containerOnPageLoadAnimation2']!
          .controller
          .forward(from: 0.0);
      animationsMap['containerOnPageLoadAnimation3']!
          .controller
          .forward(from: 0.0);
      animationsMap['containerOnPageLoadAnimation4']!
          .controller
          .forward(from: 0.0);
      animationsMap['containerOnPageLoadAnimation5']!
          .controller
          .forward(from: 0.0);
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

    return StreamBuilder<List<QuestionFinalRecord>>(
      stream: queryQuestionFinalRecord(
        queryBuilder: (questionFinalRecord) => questionFinalRecord
            .where(
              'test_Reference',
              isEqualTo: widget.testsetpara,
            )
            .where(
              'indexNo',
              isEqualTo: _model.pageNavigation,
            ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondary,
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
        List<QuestionFinalRecord> testPageQuestionFinalRecordList =
            snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final testPageQuestionFinalRecord =
            testPageQuestionFinalRecordList.isNotEmpty
                ? testPageQuestionFinalRecordList.first
                : null;
        return WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondary,
            body: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 0.125,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            FlutterFlowTheme.of(context).secondary,
                            FlutterFlowTheme.of(context).primary
                          ],
                          stops: const [0.0, 1.0],
                          begin: const AlignmentDirectional(0.0, -1.0),
                          end: const AlignmentDirectional(0, 1.0),
                        ),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).info,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                            child: Visibility(
                              visible: (valueOrDefault<bool>(
                                          currentUserDocument?.isPremium,
                                          false) ==
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
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 5.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 5.0, 10.0, 5.0),
                                          child: Text(
                                            'Q No. ${_model.pageNavigation.toString()} Out of ${widget.totalQuestion.toString()}',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Raleway',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 110.0,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 5.0, 10.0, 5.0),
                                          child: Icon(
                                            Icons.access_time_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 24.0,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 15.0, 0.0),
                                          child: FlutterFlowTimer(
                                            initialTime:
                                                _model.timerMilliseconds,
                                            getDisplayTime: (value) =>
                                                StopWatchTimer.getDisplayTime(
                                              value,
                                              hours: false,
                                              milliSecond: false,
                                            ),
                                            controller: _model.timerController,
                                            updateStateInterval:
                                                const Duration(milliseconds: 1000),
                                            onChanged: (value, displayTime,
                                                shouldUpdate) {
                                              _model.timerMilliseconds = value;
                                              _model.timerValue = displayTime;
                                              if (shouldUpdate) setState(() {});
                                            },
                                            onEnded: () async {
                                              setState(() {
                                                _model.timeEnd = true;
                                              });
                                            },
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .headlineSmall
                                                .override(
                                                  fontFamily: 'Raleway',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Builder(
                                    builder: (context) => InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await showAlignedDialog(
                                          context: context,
                                          isGlobal: true,
                                          avoidOverflow: false,
                                          targetAnchor: const AlignmentDirectional(
                                                  0.0, 0.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          followerAnchor: const AlignmentDirectional(
                                                  0.0, 0.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          builder: (dialogContext) {
                                            return Material(
                                              color: Colors.transparent,
                                              child: WebViewAware(
                                                  child: ReportQuestionWidget(
                                                testName: widget.testname,
                                                questionNo:
                                                    testPageQuestionFinalRecord!
                                                        .indexNo
                                                        .toString(),
                                                question:
                                                    testPageQuestionFinalRecord.question,
                                              )),
                                            );
                                          },
                                        ).then((value) => setState(() {}));
                                      },
                                      child: Icon(
                                        Icons.report,
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        size: 32.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          LinearPercentIndicator(
                            percent: valueOrDefault<double>(
                              _model.pageNavigation / widget.totalQuestion,
                              0.0,
                            ),
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            lineHeight: 4.0,
                            animation: true,
                            animateFromLastPercent: true,
                            progressColor:
                                FlutterFlowTheme.of(context).tertiary,
                            backgroundColor:
                                FlutterFlowTheme.of(context).secondary,
                            padding: EdgeInsets.zero,
                          ),
                        ],
                      ),
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 100),
                      curve: Curves.easeInOut,
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 0.795,
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
                          Align(
                            alignment: const AlignmentDirectional(0.0, -1.0),
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
                              child: SizedBox(
                                width: double.infinity,
                                height: MediaQuery.sizeOf(context).height * 1.0,
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 40.0),
                                  child: PageView(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    controller: _model.pageViewController ??=
                                        PageController(initialPage: 0),
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(15.0, 15.0,
                                                          15.0, 0.0),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 4.0,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary,
                                                          offset:
                                                              const Offset(0.0, 2.0),
                                                        )
                                                      ],
                                                      gradient: LinearGradient(
                                                        colors: [
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary
                                                        ],
                                                        stops: const [0.0, 1.0],
                                                        begin:
                                                            const AlignmentDirectional(
                                                                0.0, -1.0),
                                                        end:
                                                            const AlignmentDirectional(
                                                                0, 1.0),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets.all(
                                                                    10.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                testPageQuestionFinalRecord
                                                                    ?.question,
                                                                'Question',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Open Sans',
                                                                    fontSize:
                                                                        16.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        if (testPageQuestionFinalRecord
                                                                    ?.image !=
                                                                null &&
                                                            testPageQuestionFinalRecord
                                                                    ?.image !=
                                                                '')
                                                          Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          5.0,
                                                                          10.0),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child: Image
                                                                    .network(
                                                                  testPageQuestionFinalRecord!
                                                                      .image,
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.856,
                                                                  height: 206.0,
                                                                  fit: BoxFit
                                                                      .fill,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  )
                                                      .animateOnPageLoad(
                                                          animationsMap[
                                                              'containerOnPageLoadAnimation1']!)
                                                      .animateOnActionTrigger(
                                                          animationsMap[
                                                              'containerOnActionTriggerAnimation1']!,
                                                          hasBeenTriggered:
                                                              hasContainerTriggered1),
                                                ),
                                              ],
                                            ),
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, -1.0),
                                              child: StreamBuilder<
                                                  List<QuestionStudentRecord>>(
                                                stream:
                                                    queryQuestionStudentRecord(
                                                  queryBuilder:
                                                      (questionStudentRecord) =>
                                                          questionStudentRecord
                                                              .where(
                                                                'indexNo',
                                                                isEqualTo: _model
                                                                    .pageNavigation,
                                                              )
                                                              .where(
                                                                'test_Reference',
                                                                isEqualTo: widget
                                                                    .testStudent,
                                                              ),
                                                  singleRecord: true,
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return const Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child: SpinKitWave(
                                                          color:
                                                              Color(0xFFF6D96B),
                                                          size: 50.0,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<QuestionStudentRecord>
                                                      columnQuestionStudentRecordList =
                                                      snapshot.data!;
                                                  final columnQuestionStudentRecord =
                                                      columnQuestionStudentRecordList
                                                              .isNotEmpty
                                                          ? columnQuestionStudentRecordList
                                                              .first
                                                          : null;
                                                  return Column(
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
                                                                    20.0,
                                                                    15.0,
                                                                    10.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            var shouldSetState =
                                                                false;
                                                            setState(() {
                                                              _model.aa = true;
                                                              _model.bb = false;
                                                              _model.cc = false;
                                                              _model.dd = false;
                                                            });
                                                            if ((columnQuestionStudentRecord !=
                                                                    null) ==
                                                                true) {
                                                              await columnQuestionStudentRecord!
                                                                  .reference
                                                                  .update(
                                                                      createQuestionStudentRecordData(
                                                                is1: true,
                                                                is2: false,
                                                                is3: false,
                                                                is4: false,
                                                                marks: ((_model
                                                                                    .aa ==
                                                                                true) &&
                                                                            testPageQuestionFinalRecord.bol1) ||
                                                                        ((_model.bb ==
                                                                                true) &&
                                                                            testPageQuestionFinalRecord.bol2) ||
                                                                        ((_model.cc ==
                                                                                true) &&
                                                                            testPageQuestionFinalRecord.bol3) ||
                                                                        (_model.dd! &&
                                                                            testPageQuestionFinalRecord.bol4)
                                                                    ? 1
                                                                    : 0,
                                                              ));
                                                              if (shouldSetState) {
                                                                setState(() {});
                                                              }
                                                              return;
                                                            } else {
                                                              var questionStudentRecordReference =
                                                                  QuestionStudentRecord
                                                                      .collection
                                                                      .doc();
                                                              await questionStudentRecordReference
                                                                  .set(
                                                                      createQuestionStudentRecordData(
                                                                question:
                                                                    testPageQuestionFinalRecord
                                                                        .question,
                                                                op1:
                                                                    testPageQuestionFinalRecord
                                                                        .op1,
                                                                bol1:
                                                                    testPageQuestionFinalRecord
                                                                        .bol1,
                                                                op2:
                                                                    testPageQuestionFinalRecord
                                                                        .op2,
                                                                bol2:
                                                                    testPageQuestionFinalRecord
                                                                        .bol2,
                                                                op3:
                                                                    testPageQuestionFinalRecord
                                                                        .op3,
                                                                bol3:
                                                                    testPageQuestionFinalRecord
                                                                        .bol3,
                                                                op4:
                                                                    testPageQuestionFinalRecord
                                                                        .op4,
                                                                bol4:
                                                                    testPageQuestionFinalRecord
                                                                        .bol4,
                                                                indexNo:
                                                                    testPageQuestionFinalRecord
                                                                        .indexNo,
                                                                testReference:
                                                                    widget
                                                                        .testStudent,
                                                                is1: _model.aa,
                                                                is2: _model.bb,
                                                                is3: _model.cc,
                                                                is4: _model.dd,
                                                                marks: ((_model
                                                                                    .aa ==
                                                                                true) &&
                                                                            testPageQuestionFinalRecord.bol1) ||
                                                                        ((_model.bb ==
                                                                                true) &&
                                                                            testPageQuestionFinalRecord.bol2) ||
                                                                        ((_model.cc ==
                                                                                true) &&
                                                                            testPageQuestionFinalRecord.bol3) ||
                                                                        (_model.dd! &&
                                                                            testPageQuestionFinalRecord.bol4)
                                                                    ? 1
                                                                    : 0,
                                                                image:
                                                                    testPageQuestionFinalRecord
                                                                        .image,
                                                              ));
                                                              _model.questionCreated =
                                                                  QuestionStudentRecord
                                                                      .getDocumentFromData(
                                                                          createQuestionStudentRecordData(
                                                                            question:
                                                                                testPageQuestionFinalRecord.question,
                                                                            op1:
                                                                                testPageQuestionFinalRecord.op1,
                                                                            bol1:
                                                                                testPageQuestionFinalRecord.bol1,
                                                                            op2:
                                                                                testPageQuestionFinalRecord.op2,
                                                                            bol2:
                                                                                testPageQuestionFinalRecord.bol2,
                                                                            op3:
                                                                                testPageQuestionFinalRecord.op3,
                                                                            bol3:
                                                                                testPageQuestionFinalRecord.bol3,
                                                                            op4:
                                                                                testPageQuestionFinalRecord.op4,
                                                                            bol4:
                                                                                testPageQuestionFinalRecord.bol4,
                                                                            indexNo:
                                                                                testPageQuestionFinalRecord.indexNo,
                                                                            testReference:
                                                                                widget.testStudent,
                                                                            is1:
                                                                                _model.aa,
                                                                            is2:
                                                                                _model.bb,
                                                                            is3:
                                                                                _model.cc,
                                                                            is4:
                                                                                _model.dd,
                                                                            marks: ((_model.aa == true) && testPageQuestionFinalRecord.bol1) || ((_model.bb == true) && testPageQuestionFinalRecord.bol2) || ((_model.cc == true) && testPageQuestionFinalRecord.bol3) || (_model.dd! && testPageQuestionFinalRecord.bol4)
                                                                                ? 1
                                                                                : 0,
                                                                            image:
                                                                                testPageQuestionFinalRecord.image,
                                                                          ),
                                                                          questionStudentRecordReference);
                                                              shouldSetState =
                                                                  true;
                                                              if (shouldSetState) {
                                                                setState(() {});
                                                              }
                                                              return;
                                                            }

                                                            if (shouldSetState) {
                                                              setState(() {});
                                                            }
                                                          },
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                1.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  blurRadius:
                                                                      4.0,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary,
                                                                  offset:
                                                                      const Offset(
                                                                          0.0,
                                                                          2.0),
                                                                )
                                                              ],
                                                              gradient:
                                                                  LinearGradient(
                                                                colors: [
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary
                                                                ],
                                                                stops: const [
                                                                  0.0,
                                                                  1.0
                                                                ],
                                                                begin:
                                                                    const AlignmentDirectional(
                                                                        0.0,
                                                                        -1.0),
                                                                end:
                                                                    const AlignmentDirectional(
                                                                        0, 1.0),
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0),
                                                              shape: BoxShape
                                                                  .rectangle,
                                                            ),
                                                            child: Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding: const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        3.0,
                                                                        15.0,
                                                                        3.0,
                                                                        15.0),
                                                                child: Stack(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          -1.0,
                                                                          0.0),
                                                                  children: [
                                                                    if (columnQuestionStudentRecord
                                                                            ?.is1 ==
                                                                        true)
                                                                      Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            1.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              5.0,
                                                                              0.0,
                                                                              5.0,
                                                                              0.0),
                                                                          child:
                                                                              Icon(
                                                                            Icons.check_circle,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).tertiary,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    Align(
                                                                      alignment:
                                                                          const AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            42.0,
                                                                            0.0,
                                                                            40.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          testPageQuestionFinalRecord!
                                                                              .op1,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Open Sans',
                                                                                fontSize: 14.0,
                                                                                fontWeight: FontWeight.w600,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Card(
                                                                        clipBehavior:
                                                                            Clip.antiAliasWithSaveLayer,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiary,
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(25.0),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              5.0,
                                                                              8.0,
                                                                              5.0),
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'ho2npbwp' /* A */,
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
                                                                    if (_model
                                                                            .aa ??
                                                                        true)
                                                                      Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            1.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              5.0,
                                                                              0.0,
                                                                              5.0,
                                                                              0.0),
                                                                          child:
                                                                              Icon(
                                                                            Icons.check_circle,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).tertiary,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                            .animateOnPageLoad(
                                                                animationsMap[
                                                                    'containerOnPageLoadAnimation2']!)
                                                            .animateOnActionTrigger(
                                                                animationsMap[
                                                                    'containerOnActionTriggerAnimation2']!,
                                                                hasBeenTriggered:
                                                                    hasContainerTriggered2),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    15.0,
                                                                    0.0,
                                                                    15.0,
                                                                    10.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            var shouldSetState =
                                                                false;
                                                            setState(() {
                                                              _model.aa = false;
                                                              _model.bb = true;
                                                              _model.cc = false;
                                                              _model.dd = false;
                                                            });
                                                            if ((columnQuestionStudentRecord !=
                                                                    null) ==
                                                                true) {
                                                              await columnQuestionStudentRecord!
                                                                  .reference
                                                                  .update(
                                                                      createQuestionStudentRecordData(
                                                                is1: false,
                                                                is2: true,
                                                                is3: false,
                                                                is4: false,
                                                                marks: ((_model
                                                                                    .aa ==
                                                                                true) &&
                                                                            testPageQuestionFinalRecord.bol1) ||
                                                                        ((_model.bb ==
                                                                                true) &&
                                                                            testPageQuestionFinalRecord.bol2) ||
                                                                        ((_model.cc ==
                                                                                true) &&
                                                                            testPageQuestionFinalRecord.bol3) ||
                                                                        (_model.dd! &&
                                                                            testPageQuestionFinalRecord.bol4)
                                                                    ? 1
                                                                    : 0,
                                                              ));
                                                              if (shouldSetState) {
                                                                setState(() {});
                                                              }
                                                              return;
                                                            } else {
                                                              var questionStudentRecordReference =
                                                                  QuestionStudentRecord
                                                                      .collection
                                                                      .doc();
                                                              await questionStudentRecordReference
                                                                  .set(
                                                                      createQuestionStudentRecordData(
                                                                question:
                                                                    testPageQuestionFinalRecord
                                                                        .question,
                                                                op1:
                                                                    testPageQuestionFinalRecord
                                                                        .op1,
                                                                bol1:
                                                                    testPageQuestionFinalRecord
                                                                        .bol1,
                                                                op2:
                                                                    testPageQuestionFinalRecord
                                                                        .op2,
                                                                bol2:
                                                                    testPageQuestionFinalRecord
                                                                        .bol2,
                                                                op3:
                                                                    testPageQuestionFinalRecord
                                                                        .op3,
                                                                bol3:
                                                                    testPageQuestionFinalRecord
                                                                        .bol3,
                                                                op4:
                                                                    testPageQuestionFinalRecord
                                                                        .op4,
                                                                bol4:
                                                                    testPageQuestionFinalRecord
                                                                        .bol4,
                                                                indexNo:
                                                                    testPageQuestionFinalRecord
                                                                        .indexNo,
                                                                testReference:
                                                                    widget
                                                                        .testStudent,
                                                                is1: _model.aa,
                                                                is2: _model.bb,
                                                                is3: _model.cc,
                                                                is4: _model.dd,
                                                                marks: ((_model
                                                                                    .aa ==
                                                                                true) &&
                                                                            testPageQuestionFinalRecord.bol1) ||
                                                                        ((_model.bb ==
                                                                                true) &&
                                                                            testPageQuestionFinalRecord.bol2) ||
                                                                        ((_model.cc ==
                                                                                true) &&
                                                                            testPageQuestionFinalRecord.bol3) ||
                                                                        (_model.dd! &&
                                                                            testPageQuestionFinalRecord.bol4)
                                                                    ? 1
                                                                    : 0,
                                                                image:
                                                                    testPageQuestionFinalRecord
                                                                        .image,
                                                              ));
                                                              _model.questionCreated1 =
                                                                  QuestionStudentRecord
                                                                      .getDocumentFromData(
                                                                          createQuestionStudentRecordData(
                                                                            question:
                                                                                testPageQuestionFinalRecord.question,
                                                                            op1:
                                                                                testPageQuestionFinalRecord.op1,
                                                                            bol1:
                                                                                testPageQuestionFinalRecord.bol1,
                                                                            op2:
                                                                                testPageQuestionFinalRecord.op2,
                                                                            bol2:
                                                                                testPageQuestionFinalRecord.bol2,
                                                                            op3:
                                                                                testPageQuestionFinalRecord.op3,
                                                                            bol3:
                                                                                testPageQuestionFinalRecord.bol3,
                                                                            op4:
                                                                                testPageQuestionFinalRecord.op4,
                                                                            bol4:
                                                                                testPageQuestionFinalRecord.bol4,
                                                                            indexNo:
                                                                                testPageQuestionFinalRecord.indexNo,
                                                                            testReference:
                                                                                widget.testStudent,
                                                                            is1:
                                                                                _model.aa,
                                                                            is2:
                                                                                _model.bb,
                                                                            is3:
                                                                                _model.cc,
                                                                            is4:
                                                                                _model.dd,
                                                                            marks: ((_model.aa == true) && testPageQuestionFinalRecord.bol1) || ((_model.bb == true) && testPageQuestionFinalRecord.bol2) || ((_model.cc == true) && testPageQuestionFinalRecord.bol3) || (_model.dd! && testPageQuestionFinalRecord.bol4)
                                                                                ? 1
                                                                                : 0,
                                                                            image:
                                                                                testPageQuestionFinalRecord.image,
                                                                          ),
                                                                          questionStudentRecordReference);
                                                              shouldSetState =
                                                                  true;
                                                              if (shouldSetState) {
                                                                setState(() {});
                                                              }
                                                              return;
                                                            }

                                                            if (shouldSetState) {
                                                              setState(() {});
                                                            }
                                                          },
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                1.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  blurRadius:
                                                                      4.0,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary,
                                                                  offset:
                                                                      const Offset(
                                                                          0.0,
                                                                          2.0),
                                                                )
                                                              ],
                                                              gradient:
                                                                  LinearGradient(
                                                                colors: [
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary
                                                                ],
                                                                stops: const [
                                                                  0.0,
                                                                  1.0
                                                                ],
                                                                begin:
                                                                    const AlignmentDirectional(
                                                                        0.0,
                                                                        -1.0),
                                                                end:
                                                                    const AlignmentDirectional(
                                                                        0, 1.0),
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0),
                                                              shape: BoxShape
                                                                  .rectangle,
                                                            ),
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          3.0,
                                                                          15.0,
                                                                          3.0,
                                                                          15.0),
                                                              child: Stack(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          42.0,
                                                                          0.0,
                                                                          40.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        testPageQuestionFinalRecord.op2,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Open Sans',
                                                                              fontSize: 14.0,
                                                                              fontWeight: FontWeight.w600,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Card(
                                                                        clipBehavior:
                                                                            Clip.antiAliasWithSaveLayer,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiary,
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(25.0),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              5.0,
                                                                              8.0,
                                                                              5.0),
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'faf2dls3' /* B */,
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
                                                                  ),
                                                                  if (_model
                                                                          .bb ??
                                                                      true)
                                                                    Align(
                                                                      alignment:
                                                                          const AlignmentDirectional(
                                                                              1.0,
                                                                              0.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .check_circle,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).tertiary,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  if (columnQuestionStudentRecord
                                                                          ?.is2 ==
                                                                      true)
                                                                    Align(
                                                                      alignment:
                                                                          const AlignmentDirectional(
                                                                              1.0,
                                                                              0.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .check_circle,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).tertiary,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                            .animateOnPageLoad(
                                                                animationsMap[
                                                                    'containerOnPageLoadAnimation3']!)
                                                            .animateOnActionTrigger(
                                                                animationsMap[
                                                                    'containerOnActionTriggerAnimation3']!,
                                                                hasBeenTriggered:
                                                                    hasContainerTriggered3),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    15.0,
                                                                    0.0,
                                                                    15.0,
                                                                    10.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            var shouldSetState =
                                                                false;
                                                            setState(() {
                                                              _model.aa = false;
                                                              _model.bb = false;
                                                              _model.cc = true;
                                                              _model.dd = false;
                                                            });
                                                            if ((columnQuestionStudentRecord !=
                                                                    null) ==
                                                                true) {
                                                              await columnQuestionStudentRecord!
                                                                  .reference
                                                                  .update(
                                                                      createQuestionStudentRecordData(
                                                                is1: false,
                                                                is2: false,
                                                                is3: true,
                                                                is4: false,
                                                                marks: ((_model
                                                                                    .aa ==
                                                                                true) &&
                                                                            testPageQuestionFinalRecord.bol1) ||
                                                                        ((_model.bb ==
                                                                                true) &&
                                                                            testPageQuestionFinalRecord.bol2) ||
                                                                        ((_model.cc ==
                                                                                true) &&
                                                                            testPageQuestionFinalRecord.bol3) ||
                                                                        (_model.dd! &&
                                                                            testPageQuestionFinalRecord.bol4)
                                                                    ? 1
                                                                    : 0,
                                                              ));
                                                              if (shouldSetState) {
                                                                setState(() {});
                                                              }
                                                              return;
                                                            } else {
                                                              var questionStudentRecordReference =
                                                                  QuestionStudentRecord
                                                                      .collection
                                                                      .doc();
                                                              await questionStudentRecordReference
                                                                  .set(
                                                                      createQuestionStudentRecordData(
                                                                question:
                                                                    testPageQuestionFinalRecord
                                                                        .question,
                                                                op1:
                                                                    testPageQuestionFinalRecord
                                                                        .op1,
                                                                bol1:
                                                                    testPageQuestionFinalRecord
                                                                        .bol1,
                                                                op2:
                                                                    testPageQuestionFinalRecord
                                                                        .op2,
                                                                bol2:
                                                                    testPageQuestionFinalRecord
                                                                        .bol2,
                                                                op3:
                                                                    testPageQuestionFinalRecord
                                                                        .op3,
                                                                bol3:
                                                                    testPageQuestionFinalRecord
                                                                        .bol3,
                                                                op4:
                                                                    testPageQuestionFinalRecord
                                                                        .op4,
                                                                bol4:
                                                                    testPageQuestionFinalRecord
                                                                        .bol4,
                                                                indexNo:
                                                                    testPageQuestionFinalRecord
                                                                        .indexNo,
                                                                testReference:
                                                                    widget
                                                                        .testStudent,
                                                                is1: _model.aa,
                                                                is2: _model.bb,
                                                                is3: _model.cc,
                                                                is4: _model.dd,
                                                                marks: ((_model
                                                                                    .aa ==
                                                                                true) &&
                                                                            testPageQuestionFinalRecord.bol1) ||
                                                                        ((_model.bb ==
                                                                                true) &&
                                                                            testPageQuestionFinalRecord.bol2) ||
                                                                        ((_model.cc ==
                                                                                true) &&
                                                                            testPageQuestionFinalRecord.bol3) ||
                                                                        (_model.dd! &&
                                                                            testPageQuestionFinalRecord.bol4)
                                                                    ? 1
                                                                    : 0,
                                                                image:
                                                                    testPageQuestionFinalRecord
                                                                        .image,
                                                              ));
                                                              _model.questionCreated12 =
                                                                  QuestionStudentRecord
                                                                      .getDocumentFromData(
                                                                          createQuestionStudentRecordData(
                                                                            question:
                                                                                testPageQuestionFinalRecord.question,
                                                                            op1:
                                                                                testPageQuestionFinalRecord.op1,
                                                                            bol1:
                                                                                testPageQuestionFinalRecord.bol1,
                                                                            op2:
                                                                                testPageQuestionFinalRecord.op2,
                                                                            bol2:
                                                                                testPageQuestionFinalRecord.bol2,
                                                                            op3:
                                                                                testPageQuestionFinalRecord.op3,
                                                                            bol3:
                                                                                testPageQuestionFinalRecord.bol3,
                                                                            op4:
                                                                                testPageQuestionFinalRecord.op4,
                                                                            bol4:
                                                                                testPageQuestionFinalRecord.bol4,
                                                                            indexNo:
                                                                                testPageQuestionFinalRecord.indexNo,
                                                                            testReference:
                                                                                widget.testStudent,
                                                                            is1:
                                                                                _model.aa,
                                                                            is2:
                                                                                _model.bb,
                                                                            is3:
                                                                                _model.cc,
                                                                            is4:
                                                                                _model.dd,
                                                                            marks: ((_model.aa == true) && testPageQuestionFinalRecord.bol1) || ((_model.bb == true) && testPageQuestionFinalRecord.bol2) || ((_model.cc == true) && testPageQuestionFinalRecord.bol3) || (_model.dd! && testPageQuestionFinalRecord.bol4)
                                                                                ? 1
                                                                                : 0,
                                                                            image:
                                                                                testPageQuestionFinalRecord.image,
                                                                          ),
                                                                          questionStudentRecordReference);
                                                              shouldSetState =
                                                                  true;
                                                              if (shouldSetState) {
                                                                setState(() {});
                                                              }
                                                              return;
                                                            }

                                                            if (shouldSetState) {
                                                              setState(() {});
                                                            }
                                                          },
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                1.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  blurRadius:
                                                                      4.0,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary,
                                                                  offset:
                                                                      const Offset(
                                                                          0.0,
                                                                          2.0),
                                                                )
                                                              ],
                                                              gradient:
                                                                  LinearGradient(
                                                                colors: [
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary
                                                                ],
                                                                stops: const [
                                                                  0.0,
                                                                  1.0
                                                                ],
                                                                begin:
                                                                    const AlignmentDirectional(
                                                                        0.0,
                                                                        -1.0),
                                                                end:
                                                                    const AlignmentDirectional(
                                                                        0, 1.0),
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0),
                                                              shape: BoxShape
                                                                  .rectangle,
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          3.0,
                                                                          15.0,
                                                                          3.0,
                                                                          15.0),
                                                              child: Stack(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          42.0,
                                                                          0.0,
                                                                          40.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        testPageQuestionFinalRecord.op3,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Open Sans',
                                                                              fontSize: 14.0,
                                                                              fontWeight: FontWeight.w600,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  if (columnQuestionStudentRecord
                                                                          ?.is3 ==
                                                                      true)
                                                                    Align(
                                                                      alignment:
                                                                          const AlignmentDirectional(
                                                                              1.0,
                                                                              0.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .check_circle,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).tertiary,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  Align(
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Card(
                                                                        clipBehavior:
                                                                            Clip.antiAliasWithSaveLayer,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiary,
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(25.0),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              5.0,
                                                                              8.0,
                                                                              5.0),
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'jl0a0noa' /* C */,
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
                                                                  ),
                                                                  if (_model
                                                                          .cc ??
                                                                      true)
                                                                    Align(
                                                                      alignment:
                                                                          const AlignmentDirectional(
                                                                              1.0,
                                                                              0.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .check_circle,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).tertiary,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                            .animateOnPageLoad(
                                                                animationsMap[
                                                                    'containerOnPageLoadAnimation4']!)
                                                            .animateOnActionTrigger(
                                                                animationsMap[
                                                                    'containerOnActionTriggerAnimation4']!,
                                                                hasBeenTriggered:
                                                                    hasContainerTriggered4),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    15.0,
                                                                    0.0,
                                                                    15.0,
                                                                    200.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            var shouldSetState =
                                                                false;
                                                            setState(() {
                                                              _model.aa = false;
                                                              _model.bb = false;
                                                              _model.cc = false;
                                                              _model.dd = true;
                                                            });
                                                            if ((columnQuestionStudentRecord !=
                                                                    null) ==
                                                                true) {
                                                              await columnQuestionStudentRecord!
                                                                  .reference
                                                                  .update(
                                                                      createQuestionStudentRecordData(
                                                                is1: false,
                                                                is2: false,
                                                                is3: false,
                                                                is4: true,
                                                                marks: ((_model
                                                                                    .aa ==
                                                                                true) &&
                                                                            testPageQuestionFinalRecord.bol1) ||
                                                                        ((_model.bb ==
                                                                                true) &&
                                                                            testPageQuestionFinalRecord.bol2) ||
                                                                        ((_model.cc ==
                                                                                true) &&
                                                                            testPageQuestionFinalRecord.bol3) ||
                                                                        (_model.dd! &&
                                                                            testPageQuestionFinalRecord.bol4)
                                                                    ? 1
                                                                    : 0,
                                                              ));
                                                              if (shouldSetState) {
                                                                setState(() {});
                                                              }
                                                              return;
                                                            } else {
                                                              var questionStudentRecordReference =
                                                                  QuestionStudentRecord
                                                                      .collection
                                                                      .doc();
                                                              await questionStudentRecordReference
                                                                  .set(
                                                                      createQuestionStudentRecordData(
                                                                question:
                                                                    testPageQuestionFinalRecord
                                                                        .question,
                                                                op1:
                                                                    testPageQuestionFinalRecord
                                                                        .op1,
                                                                bol1:
                                                                    testPageQuestionFinalRecord
                                                                        .bol1,
                                                                op2:
                                                                    testPageQuestionFinalRecord
                                                                        .op2,
                                                                bol2:
                                                                    testPageQuestionFinalRecord
                                                                        .bol2,
                                                                op3:
                                                                    testPageQuestionFinalRecord
                                                                        .op3,
                                                                bol3:
                                                                    testPageQuestionFinalRecord
                                                                        .bol3,
                                                                op4:
                                                                    testPageQuestionFinalRecord
                                                                        .op4,
                                                                bol4:
                                                                    testPageQuestionFinalRecord
                                                                        .bol4,
                                                                indexNo:
                                                                    testPageQuestionFinalRecord
                                                                        .indexNo,
                                                                testReference:
                                                                    widget
                                                                        .testStudent,
                                                                is1: _model.aa,
                                                                is2: _model.bb,
                                                                is3: _model.cc,
                                                                is4: _model.dd,
                                                                marks: ((_model
                                                                                    .aa ==
                                                                                true) &&
                                                                            testPageQuestionFinalRecord.bol1) ||
                                                                        ((_model.bb ==
                                                                                true) &&
                                                                            testPageQuestionFinalRecord.bol2) ||
                                                                        ((_model.cc ==
                                                                                true) &&
                                                                            testPageQuestionFinalRecord.bol3) ||
                                                                        (_model.dd! &&
                                                                            testPageQuestionFinalRecord.bol4)
                                                                    ? 1
                                                                    : 0,
                                                                image:
                                                                    testPageQuestionFinalRecord
                                                                        .image,
                                                              ));
                                                              _model.questionCreated123 =
                                                                  QuestionStudentRecord
                                                                      .getDocumentFromData(
                                                                          createQuestionStudentRecordData(
                                                                            question:
                                                                                testPageQuestionFinalRecord.question,
                                                                            op1:
                                                                                testPageQuestionFinalRecord.op1,
                                                                            bol1:
                                                                                testPageQuestionFinalRecord.bol1,
                                                                            op2:
                                                                                testPageQuestionFinalRecord.op2,
                                                                            bol2:
                                                                                testPageQuestionFinalRecord.bol2,
                                                                            op3:
                                                                                testPageQuestionFinalRecord.op3,
                                                                            bol3:
                                                                                testPageQuestionFinalRecord.bol3,
                                                                            op4:
                                                                                testPageQuestionFinalRecord.op4,
                                                                            bol4:
                                                                                testPageQuestionFinalRecord.bol4,
                                                                            indexNo:
                                                                                testPageQuestionFinalRecord.indexNo,
                                                                            testReference:
                                                                                widget.testStudent,
                                                                            is1:
                                                                                _model.aa,
                                                                            is2:
                                                                                _model.bb,
                                                                            is3:
                                                                                _model.cc,
                                                                            is4:
                                                                                _model.dd,
                                                                            marks: ((_model.aa == true) && testPageQuestionFinalRecord.bol1) || ((_model.bb == true) && testPageQuestionFinalRecord.bol2) || ((_model.cc == true) && testPageQuestionFinalRecord.bol3) || (_model.dd! && testPageQuestionFinalRecord.bol4)
                                                                                ? 1
                                                                                : 0,
                                                                            image:
                                                                                testPageQuestionFinalRecord.image,
                                                                          ),
                                                                          questionStudentRecordReference);
                                                              shouldSetState =
                                                                  true;
                                                              if (shouldSetState) {
                                                                setState(() {});
                                                              }
                                                              return;
                                                            }

                                                            if (shouldSetState) {
                                                              setState(() {});
                                                            }
                                                          },
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                1.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  blurRadius:
                                                                      4.0,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary,
                                                                  offset:
                                                                      const Offset(
                                                                          0.0,
                                                                          2.0),
                                                                )
                                                              ],
                                                              gradient:
                                                                  LinearGradient(
                                                                colors: [
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary
                                                                ],
                                                                stops: const [
                                                                  0.0,
                                                                  1.0
                                                                ],
                                                                begin:
                                                                    const AlignmentDirectional(
                                                                        0.0,
                                                                        -1.0),
                                                                end:
                                                                    const AlignmentDirectional(
                                                                        0, 1.0),
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0),
                                                              shape: BoxShape
                                                                  .rectangle,
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          3.0,
                                                                          15.0,
                                                                          3.0,
                                                                          15.0),
                                                              child: Stack(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          42.0,
                                                                          0.0,
                                                                          40.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        testPageQuestionFinalRecord.op4,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Open Sans',
                                                                              fontSize: 14.0,
                                                                              fontWeight: FontWeight.w600,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  if (columnQuestionStudentRecord
                                                                          ?.is4 ==
                                                                      true)
                                                                    Align(
                                                                      alignment:
                                                                          const AlignmentDirectional(
                                                                              1.0,
                                                                              0.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .check_circle,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).tertiary,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  Align(
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Card(
                                                                        clipBehavior:
                                                                            Clip.antiAliasWithSaveLayer,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiary,
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(25.0),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              5.0,
                                                                              8.0,
                                                                              5.0),
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'ay656rjw' /* D */,
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
                                                                  ),
                                                                  if (_model
                                                                          .dd ??
                                                                      true)
                                                                    Align(
                                                                      alignment:
                                                                          const AlignmentDirectional(
                                                                              1.0,
                                                                              0.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .check_circle,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).tertiary,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                            .animateOnPageLoad(
                                                                animationsMap[
                                                                    'containerOnPageLoadAnimation5']!)
                                                            .animateOnActionTrigger(
                                                                animationsMap[
                                                                    'containerOnActionTriggerAnimation5']!,
                                                                hasBeenTriggered:
                                                                    hasContainerTriggered5),
                                                      ),
                                                    ],
                                                  );
                                                },
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
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 100),
                      curve: Curves.easeInOut,
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 0.08,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            FlutterFlowTheme.of(context).secondary,
                            FlutterFlowTheme.of(context).primary
                          ],
                          stops: const [0.0, 1.0],
                          begin: const AlignmentDirectional(0.0, -1.0),
                          end: const AlignmentDirectional(0, 1.0),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                5.0, 0.0, 5.0, 5.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if ((_model.pageNavigation > 1) &&
                                    (_model.timerMilliseconds > 1000))
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, -1.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 10.0, 0.0),
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
                                          if (animationsMap[
                                                  'containerOnActionTriggerAnimation1'] !=
                                              null) {
                                            setState(() =>
                                                hasContainerTriggered1 = true);
                                            SchedulerBinding.instance
                                                .addPostFrameCallback((_) async =>
                                                    await animationsMap[
                                                            'containerOnActionTriggerAnimation1']!
                                                        .controller
                                                        .forward(from: 0.0));
                                          }
                                          if (animationsMap[
                                                  'containerOnActionTriggerAnimation2'] !=
                                              null) {
                                            setState(() =>
                                                hasContainerTriggered2 = true);
                                            SchedulerBinding.instance
                                                .addPostFrameCallback((_) async =>
                                                    await animationsMap[
                                                            'containerOnActionTriggerAnimation2']!
                                                        .controller
                                                        .forward(from: 0.0));
                                          }
                                          if (animationsMap[
                                                  'containerOnActionTriggerAnimation3'] !=
                                              null) {
                                            setState(() =>
                                                hasContainerTriggered3 = true);
                                            SchedulerBinding.instance
                                                .addPostFrameCallback((_) async =>
                                                    await animationsMap[
                                                            'containerOnActionTriggerAnimation3']!
                                                        .controller
                                                        .forward(from: 0.0));
                                          }
                                          if (animationsMap[
                                                  'containerOnActionTriggerAnimation4'] !=
                                              null) {
                                            setState(() =>
                                                hasContainerTriggered4 = true);
                                            SchedulerBinding.instance
                                                .addPostFrameCallback((_) async =>
                                                    await animationsMap[
                                                            'containerOnActionTriggerAnimation4']!
                                                        .controller
                                                        .forward(from: 0.0));
                                          }
                                          if (animationsMap[
                                                  'containerOnActionTriggerAnimation5'] !=
                                              null) {
                                            setState(() =>
                                                hasContainerTriggered5 = true);
                                            SchedulerBinding.instance
                                                .addPostFrameCallback((_) async =>
                                                    await animationsMap[
                                                            'containerOnActionTriggerAnimation5']!
                                                        .controller
                                                        .forward(from: 0.0));
                                          }
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'e9dyga22' /* Previous */,
                                        ),
                                        icon: const Icon(
                                          Icons.chevron_left_rounded,
                                          size: 15.0,
                                        ),
                                        options: FFButtonOptions(
                                          width: 150.0,
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
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                if ((_model.pageNavigation <
                                        widget.totalQuestion) &&
                                    (_model.timerMilliseconds > 1000))
                                  Align(
                                    alignment: const AlignmentDirectional(1.0, -1.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: StreamBuilder<
                                          List<QuestionStudentRecord>>(
                                        stream: queryQuestionStudentRecord(
                                          queryBuilder:
                                              (questionStudentRecord) =>
                                                  questionStudentRecord
                                                      .where(
                                                        'indexNo',
                                                        isEqualTo: _model
                                                            .pageNavigation,
                                                      )
                                                      .where(
                                                        'test_Reference',
                                                        isEqualTo:
                                                            widget.testStudent,
                                                      ),
                                          singleRecord: true,
                                        ),
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
                                          List<QuestionStudentRecord>
                                              buttonQuestionStudentRecordList =
                                              snapshot.data!;
                                          final buttonQuestionStudentRecord =
                                              buttonQuestionStudentRecordList
                                                      .isNotEmpty
                                                  ? buttonQuestionStudentRecordList
                                                      .first
                                                  : null;
                                          return FFButtonWidget(
                                            onPressed: () async {
                                              if ((buttonQuestionStudentRecord !=
                                                      null) ==
                                                  true) {
                                                await Future.delayed(
                                                    const Duration(
                                                        milliseconds: 0));
                                              } else {
                                                var questionStudentRecordReference =
                                                    QuestionStudentRecord
                                                        .collection
                                                        .doc();
                                                await questionStudentRecordReference
                                                    .set(
                                                        createQuestionStudentRecordData(
                                                  question:
                                                      testPageQuestionFinalRecord
                                                          ?.question,
                                                  op1:
                                                      testPageQuestionFinalRecord
                                                          ?.op1,
                                                  bol1:
                                                      testPageQuestionFinalRecord
                                                          ?.bol1,
                                                  op2:
                                                      testPageQuestionFinalRecord
                                                          ?.op2,
                                                  bol2:
                                                      testPageQuestionFinalRecord
                                                          ?.bol2,
                                                  op3:
                                                      testPageQuestionFinalRecord
                                                          ?.op3,
                                                  bol3:
                                                      testPageQuestionFinalRecord
                                                          ?.bol3,
                                                  op4:
                                                      testPageQuestionFinalRecord
                                                          ?.op4,
                                                  bol4:
                                                      testPageQuestionFinalRecord
                                                          ?.bol4,
                                                  indexNo:
                                                      testPageQuestionFinalRecord
                                                          ?.indexNo,
                                                  testReference:
                                                      widget.testStudent,
                                                  is1: _model.aa,
                                                  is2: _model.bb,
                                                  is3: _model.cc,
                                                  is4: _model.dd,
                                                  marks: ((_model.aa ==
                                                                  true) &&
                                                              testPageQuestionFinalRecord!
                                                                  .bol1) ||
                                                          ((_model
                                                                      .bb ==
                                                                  true) &&
                                                              testPageQuestionFinalRecord!
                                                                  .bol2) ||
                                                          ((_model.cc ==
                                                                  true) &&
                                                              testPageQuestionFinalRecord!
                                                                  .bol3) ||
                                                          (_model.dd! &&
                                                              testPageQuestionFinalRecord!
                                                                  .bol4)
                                                      ? 1
                                                      : 0,
                                                  image:
                                                      testPageQuestionFinalRecord
                                                          ?.image,
                                                ));
                                                _model.questionCreated1234 =
                                                    QuestionStudentRecord
                                                        .getDocumentFromData(
                                                            createQuestionStudentRecordData(
                                                              question:
                                                                  testPageQuestionFinalRecord
                                                                      ?.question,
                                                              op1:
                                                                  testPageQuestionFinalRecord
                                                                      ?.op1,
                                                              bol1:
                                                                  testPageQuestionFinalRecord
                                                                      ?.bol1,
                                                              op2:
                                                                  testPageQuestionFinalRecord
                                                                      ?.op2,
                                                              bol2:
                                                                  testPageQuestionFinalRecord
                                                                      ?.bol2,
                                                              op3:
                                                                  testPageQuestionFinalRecord
                                                                      ?.op3,
                                                              bol3:
                                                                  testPageQuestionFinalRecord
                                                                      ?.bol3,
                                                              op4:
                                                                  testPageQuestionFinalRecord
                                                                      ?.op4,
                                                              bol4:
                                                                  testPageQuestionFinalRecord
                                                                      ?.bol4,
                                                              indexNo:
                                                                  testPageQuestionFinalRecord
                                                                      ?.indexNo,
                                                              testReference: widget
                                                                  .testStudent,
                                                              is1: _model.aa,
                                                              is2: _model.bb,
                                                              is3: _model.cc,
                                                              is4: _model.dd,
                                                              marks: ((_model
                                                                                  .aa ==
                                                                              true) &&
                                                                          testPageQuestionFinalRecord!
                                                                              .bol1) ||
                                                                      ((_model.bb ==
                                                                              true) &&
                                                                          testPageQuestionFinalRecord!
                                                                              .bol2) ||
                                                                      ((_model.cc ==
                                                                              true) &&
                                                                          testPageQuestionFinalRecord!
                                                                              .bol3) ||
                                                                      (_model.dd! &&
                                                                          testPageQuestionFinalRecord!
                                                                              .bol4)
                                                                  ? 1
                                                                  : 0,
                                                              image:
                                                                  testPageQuestionFinalRecord
                                                                      ?.image,
                                                            ),
                                                            questionStudentRecordReference);
                                              }

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
                                              });
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation1'] !=
                                                  null) {
                                                setState(() =>
                                                    hasContainerTriggered1 =
                                                        true);
                                                SchedulerBinding.instance
                                                    .addPostFrameCallback(
                                                        (_) async =>
                                                            await animationsMap[
                                                                    'containerOnActionTriggerAnimation1']!
                                                                .controller
                                                                .forward(
                                                                    from: 0.0));
                                              }
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation2'] !=
                                                  null) {
                                                setState(() =>
                                                    hasContainerTriggered2 =
                                                        true);
                                                SchedulerBinding.instance
                                                    .addPostFrameCallback(
                                                        (_) async =>
                                                            await animationsMap[
                                                                    'containerOnActionTriggerAnimation2']!
                                                                .controller
                                                                .forward(
                                                                    from: 0.0));
                                              }
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation3'] !=
                                                  null) {
                                                setState(() =>
                                                    hasContainerTriggered3 =
                                                        true);
                                                SchedulerBinding.instance
                                                    .addPostFrameCallback(
                                                        (_) async =>
                                                            await animationsMap[
                                                                    'containerOnActionTriggerAnimation3']!
                                                                .controller
                                                                .forward(
                                                                    from: 0.0));
                                              }
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation4'] !=
                                                  null) {
                                                setState(() =>
                                                    hasContainerTriggered4 =
                                                        true);
                                                SchedulerBinding.instance
                                                    .addPostFrameCallback(
                                                        (_) async =>
                                                            await animationsMap[
                                                                    'containerOnActionTriggerAnimation4']!
                                                                .controller
                                                                .forward(
                                                                    from: 0.0));
                                              }
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation5'] !=
                                                  null) {
                                                setState(() =>
                                                    hasContainerTriggered5 =
                                                        true);
                                                SchedulerBinding.instance
                                                    .addPostFrameCallback(
                                                        (_) async =>
                                                            await animationsMap[
                                                                    'containerOnActionTriggerAnimation5']!
                                                                .controller
                                                                .forward(
                                                                    from: 0.0));
                                              }

                                              setState(() {});
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'nwkoq8nx' /* Next */,
                                            ),
                                            icon: const Icon(
                                              Icons.navigate_next_sharp,
                                              size: 15.0,
                                            ),
                                            options: FFButtonOptions(
                                              width: 150.0,
                                              height: 50.0,
                                              padding: const EdgeInsets.all(0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                if ((_model.pageNavigation ==
                                        widget.totalQuestion) ||
                                    (_model.timerMilliseconds == 0))
                                  Align(
                                    alignment: const AlignmentDirectional(1.0, -1.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: FutureBuilder<int>(
                                        future: (_model
                                                    .firestoreRequestCompleter ??=
                                                Completer<int>()
                                                  ..complete(
                                                      queryQuestionStudentRecordCount(
                                                    queryBuilder:
                                                        (questionStudentRecord) =>
                                                            questionStudentRecord
                                                                .where(
                                                                  'test_Reference',
                                                                  isEqualTo: widget
                                                                      .testStudent,
                                                                )
                                                                .where(
                                                                  'Marks',
                                                                  isGreaterThan:
                                                                      0,
                                                                ),
                                                  )))
                                            .future,
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
                                          int buttonCount = snapshot.data!;
                                          return FFButtonWidget(
                                            onPressed: () async {
                                              if ((valueOrDefault<bool>(
                                                          currentUserDocument
                                                              ?.isPremium,
                                                          false) ==
                                                      false) &&
                                                  (currentUserDocument!
                                                          .premiumTill! <
                                                      getCurrentTimestamp)) {
                                                _model.interstitialAdSuccess1Copy =
                                                    await admob
                                                        .showInterstitialAd();
                                              } else {
                                                await Future.delayed(
                                                    const Duration(
                                                        milliseconds: 0));
                                              }

                                              _model.readDone =
                                                  await queryQuestionStudentRecordOnce(
                                                queryBuilder:
                                                    (questionStudentRecord) =>
                                                        questionStudentRecord
                                                            .where(
                                                              'indexNo',
                                                              isEqualTo: _model
                                                                  .pageNavigation,
                                                            )
                                                            .where(
                                                              'test_Reference',
                                                              isEqualTo: widget
                                                                  .testStudent,
                                                            ),
                                                singleRecord: true,
                                              ).then((s) => s.firstOrNull);
                                              if (_model.readDone?.question !=
                                                      null &&
                                                  _model.readDone?.question !=
                                                      '') {
                                                await Future.delayed(
                                                    const Duration(
                                                        milliseconds: 0));
                                              } else {
                                                await QuestionStudentRecord
                                                    .collection
                                                    .doc()
                                                    .set(
                                                        createQuestionStudentRecordData(
                                                      question:
                                                          testPageQuestionFinalRecord
                                                              ?.question,
                                                      op1:
                                                          testPageQuestionFinalRecord
                                                              ?.op1,
                                                      bol1:
                                                          testPageQuestionFinalRecord
                                                              ?.bol1,
                                                      op2:
                                                          testPageQuestionFinalRecord
                                                              ?.op2,
                                                      bol2:
                                                          testPageQuestionFinalRecord
                                                              ?.bol2,
                                                      op3:
                                                          testPageQuestionFinalRecord
                                                              ?.op3,
                                                      bol3:
                                                          testPageQuestionFinalRecord
                                                              ?.bol3,
                                                      op4:
                                                          testPageQuestionFinalRecord
                                                              ?.op4,
                                                      bol4:
                                                          testPageQuestionFinalRecord
                                                              ?.bol4,
                                                      indexNo:
                                                          testPageQuestionFinalRecord
                                                              ?.indexNo,
                                                      testReference:
                                                          widget.testStudent,
                                                      is1: _model.aa,
                                                      is2: _model.bb,
                                                      is3: _model.cc,
                                                      is4: _model.dd,
                                                      marks: ((_model.aa ==
                                                                      true) &&
                                                                  testPageQuestionFinalRecord!
                                                                      .bol1) ||
                                                              ((_model.bb ==
                                                                      true) &&
                                                                  testPageQuestionFinalRecord!
                                                                      .bol2) ||
                                                              ((_model.cc ==
                                                                      true) &&
                                                                  testPageQuestionFinalRecord!
                                                                      .bol3) ||
                                                              (_model.dd! &&
                                                                  testPageQuestionFinalRecord!
                                                                      .bol4)
                                                          ? 1
                                                          : 0,
                                                      image:
                                                          testPageQuestionFinalRecord
                                                              ?.image,
                                                    ));
                                              }

                                              await widget.testStudent!.update(
                                                  createTestStudentRecordData(
                                                isComplete: true,
                                              ));
                                              setState(() => _model
                                                      .firestoreRequestCompleter =
                                                  null);
                                              await _model
                                                  .waitForFirestoreRequestCompleted();

                                              await currentUserReference!
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'TotalMarks': FieldValue
                                                        .increment(widget
                                                                .totalQuestion *
                                                            widget
                                                                .marksPerQuestion!),
                                                    'TestAttempted':
                                                        FieldValue.increment(1),
                                                  },
                                                ),
                                              });

                                              context.goNamed(
                                                'ResultPage',
                                                queryParameters: {
                                                  'testRefrencePara':
                                                      serializeParam(
                                                    widget.testsetpara,
                                                    ParamType.DocumentReference,
                                                  ),
                                                  'totalQuestions':
                                                      serializeParam(
                                                    widget.totalQuestion,
                                                    ParamType.int,
                                                  ),
                                                  'studentTestPara':
                                                      serializeParam(
                                                    widget.testStudent,
                                                    ParamType.DocumentReference,
                                                  ),
                                                  'marksSecured':
                                                      serializeParam(
                                                    buttonCount,
                                                    ParamType.int,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  kTransitionInfoKey:
                                                      const TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType
                                                            .bottomToTop,
                                                  ),
                                                },
                                              );

                                              setState(() {});
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'bellxrrg' /* Submit */,
                                            ),
                                            icon: const Icon(
                                              Icons.save_outlined,
                                              size: 15.0,
                                            ),
                                            options: FFButtonOptions(
                                              width: 150.0,
                                              height: 50.0,
                                              padding: const EdgeInsets.all(0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .success,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Raleway',
                                                        color: Colors.white,
                                                        fontSize: 18.0,
                                                      ),
                                              elevation: 3.0,
                                              borderSide: const BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          );
                                        },
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
                if (_model.timeEnd)
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 0.87,
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
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).info,
                      ),
                    ),
                    child: Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Lottie.asset(
                              'assets/lottie_animations/animation_lnyq6kh4.json',
                              width: MediaQuery.sizeOf(context).width * 0.821,
                              height: 250.0,
                              fit: BoxFit.contain,
                              animate: true,
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 50.0, 0.0, 80.0),
                                child: GradientText(
                                  FFLocalizations.of(context).getText(
                                    '4flniihi' /* You are out of Time! */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .override(
                                        fontFamily: 'Raleway',
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.w900,
                                      ),
                                  colors: [
                                    FlutterFlowTheme.of(context).alternate,
                                    FlutterFlowTheme.of(context).tertiary
                                  ],
                                  gradientDirection: GradientDirection.rtl,
                                  gradientType: GradientType.linear,
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
        );
      },
    );
  }
}
