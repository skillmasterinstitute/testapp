import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/change_subject_widget.dart';
import '/components/share_test_link_widget.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/admob_util.dart' as admob;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'test_series_model.dart';
export 'test_series_model.dart';

class TestSeriesWidget extends StatefulWidget {
  const TestSeriesWidget({
    super.key,
    int? type,
  })  : type = type ?? 0;

  final int type;

  @override
  _TestSeriesWidgetState createState() => _TestSeriesWidgetState();
}

class _TestSeriesWidgetState extends State<TestSeriesWidget>
    with TickerProviderStateMixin {
  late TestSeriesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'textOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'textOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'textOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestSeriesModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.tabBarController!.animateTo(
          widget.type,
          duration: const Duration(milliseconds: 300),
          curve: Curves.ease,
        );
      });

      admob.loadInterstitialAd(
        "",
        "ca-app-pub-7315791677262365/5564722872",
        false,
      );

      if (valueOrDefault<bool>(currentUserDocument?.profileCompleteD, false) ==
          null) {
        context.goNamed('SignUpPage');

        return;
      } else {
        return;
      }
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 1,
    )..addListener(() => setState(() {}));

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

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FFButtonWidget(
            onPressed: () async {
              context.pushNamed('HomePage');
            },
            text: FFLocalizations.of(context).getText(
              'uv2qibi2' /* Button */,
            ),
            icon: const Icon(
              Icons.arrow_back_outlined,
              size: 15.0,
            ),
            options: FFButtonOptions(
              height: 40.0,
              padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
              iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: FlutterFlowTheme.of(context).primary,
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: 'Raleway',
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
              elevation: 3.0,
              borderSide: const BorderSide(
                color: Colors.transparent,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              '1oimi6sf' /* Test Series */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Raleway',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Column(
                children: [
                  Align(
                    alignment: const Alignment(0.0, 0),
                    child: FlutterFlowButtonTabBar(
                      useToggleButtonStyle: false,
                      isScrollable: true,
                      labelStyle: FlutterFlowTheme.of(context).titleMedium,
                      unselectedLabelStyle:
                          FlutterFlowTheme.of(context).titleMedium,
                      labelColor: FlutterFlowTheme.of(context).tertiary,
                      unselectedLabelColor:
                          FlutterFlowTheme.of(context).accent4,
                      backgroundColor: FlutterFlowTheme.of(context).primary,
                      borderColor: FlutterFlowTheme.of(context).tertiary,
                      unselectedBorderColor: const Color(0xFF9E9E9E),
                      borderWidth: 2.0,
                      borderRadius: 12.0,
                      elevation: 0.0,
                      labelPadding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      buttonMargin:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 16.0, 0.0),
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      tabs: [
                        Tab(
                          text: FFLocalizations.of(context).getText(
                            'egavtph7' /* POT (TM) */,
                          ),
                        ),
                        AuthUserStreamWidget(
                          builder: (context) => Tab(
                            text: valueOrDefault<String>(
                              () {
                                if (valueOrDefault(
                                        currentUserDocument?.subjectType, 0) ==
                                    1) {
                                  return 'WC&S';
                                } else if (valueOrDefault(
                                        currentUserDocument?.subjectType, 0) ==
                                    2) {
                                  return 'Soft Skills';
                                } else {
                                  return '0';
                                }
                              }(),
                              '0',
                            ),
                          ),
                        ),
                        Tab(
                          text: FFLocalizations.of(context).getText(
                            '6nle9cjl' /* Trade Theory */,
                          ),
                        ),
                      ],
                      controller: _model.tabBarController,
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _model.tabBarController,
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 0.0,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF0F0C29),
                                Color(0xFF302B63),
                                Color(0xFF24243E)
                              ],
                              stops: [0.0, 1.0, 1.0],
                              begin: AlignmentDirectional(1.0, -1.0),
                              end: AlignmentDirectional(-1.0, 1.0),
                            ),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 4.0, 0.0),
                                              child: Text(
                                                'Training Methodology',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Raleway',
                                                          fontSize: 18.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(-1.0, 0.0),
                                            child: FutureBuilder<int>(
                                              future: queryTestRecordCount(
                                                queryBuilder: (testRecord) =>
                                                    testRecord.where(
                                                  'test_type',
                                                  isEqualTo: 'POT',
                                                ),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 10.0,
                                                      height: 10.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                int textCount = snapshot.data!;
                                                return Text(
                                                  '(${textCount.toString()})',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Raleway',
                                                        fontSize: 18.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ).animateOnPageLoad(animationsMap[
                                                    'textOnPageLoadAnimation1']!);
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 10.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '7expfntm' /* Share */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Raleway',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                      ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Icon(
                                              Icons.share_outlined,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              size: 18.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(
                                  thickness: 1.0,
                                  color: FlutterFlowTheme.of(context).accent4,
                                ),
                                if ((valueOrDefault<bool>(
                                            currentUserDocument?.isPremium,
                                            false) ==
                                        false) &&
                                    (currentUserDocument!.premiumTill! <
                                        getCurrentTimestamp))
                                  AuthUserStreamWidget(
                                    builder: (context) => FlutterFlowAdBanner(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 50.0,
                                      showsTestAd: false,
                                      androidAdUnitID:
                                          'ca-app-pub-7315791677262365/9458121453',
                                    ),
                                  ),
                                ListView(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 100.0),
                                      child: StreamBuilder<List<TestRecord>>(
                                        stream: queryTestRecord(
                                          queryBuilder: (testRecord) =>
                                              testRecord
                                                  .where(
                                                    'test_type',
                                                    isEqualTo: 'POT',
                                                  )
                                                  .orderBy('Index'),
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
                                          List<TestRecord>
                                              columnTestRecordList =
                                              snapshot.data!;
                                          return SingleChildScrollView(
                                            primary: false,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: List.generate(
                                                  columnTestRecordList.length,
                                                  (columnIndex) {
                                                final columnTestRecord =
                                                    columnTestRecordList[
                                                        columnIndex];
                                                return Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 5.0, 0.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return WebViewAware(
                                                              child:
                                                                  GestureDetector(
                                                            onTap: () => _model
                                                                    .unfocusNode
                                                                    .canRequestFocus
                                                                ? FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode)
                                                                : FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  ShareTestLinkWidget(
                                                                exam: columnTestRecord
                                                                    .testName,
                                                                link: columnTestRecord
                                                                    .reference
                                                                    .id,
                                                              ),
                                                            ),
                                                          ));
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    },
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
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
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          8.0),
                                                              child: Stack(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            1.0,
                                                                            0.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                                      child:
                                                                          FlutterFlowIconButton(
                                                                        borderColor:
                                                                            Colors.transparent,
                                                                        borderRadius:
                                                                            20.0,
                                                                        borderWidth:
                                                                            1.0,
                                                                        buttonSize:
                                                                            40.0,
                                                                        fillColor:
                                                                            FlutterFlowTheme.of(context).tertiary,
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .play_circle,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                        showLoadingIndicator:
                                                                            true,
                                                                        onPressed:
                                                                            () async {
                                                                          if ((valueOrDefault<bool>(currentUserDocument?.isPremium, false) == false) &&
                                                                              (currentUserDocument!.premiumTill! < getCurrentTimestamp)) {
                                                                            _model.interstitialAdSuccess1Copy5Copy =
                                                                                await admob.showInterstitialAd();
                                                                          } else {
                                                                            await Future.delayed(const Duration(milliseconds: 0));
                                                                          }

                                                                          var testStudentRecordReference = TestStudentRecord
                                                                              .collection
                                                                              .doc();
                                                                          await testStudentRecordReference
                                                                              .set(createTestStudentRecordData(
                                                                            testName:
                                                                                columnTestRecord.testName,
                                                                            totalQuestion:
                                                                                columnTestRecord.totalQuestion,
                                                                            duration:
                                                                                columnTestRecord.duration,
                                                                            marksPerQuestion:
                                                                                columnTestRecord.marksPerQuestion,
                                                                            testType:
                                                                                columnTestRecord.testType,
                                                                            time:
                                                                                getCurrentTimestamp,
                                                                            studentReference:
                                                                                currentUserReference,
                                                                            isComplete:
                                                                                false,
                                                                          ));
                                                                          _model.testCreated = TestStudentRecord.getDocumentFromData(
                                                                              createTestStudentRecordData(
                                                                                testName: columnTestRecord.testName,
                                                                                totalQuestion: columnTestRecord.totalQuestion,
                                                                                duration: columnTestRecord.duration,
                                                                                marksPerQuestion: columnTestRecord.marksPerQuestion,
                                                                                testType: columnTestRecord.testType,
                                                                                time: getCurrentTimestamp,
                                                                                studentReference: currentUserReference,
                                                                                isComplete: false,
                                                                              ),
                                                                              testStudentRecordReference);

                                                                          context
                                                                              .pushNamed(
                                                                            'TestPage',
                                                                            queryParameters:
                                                                                {
                                                                              'testsetpara': serializeParam(
                                                                                columnTestRecord.reference,
                                                                                ParamType.DocumentReference,
                                                                              ),
                                                                              'totalQuestion': serializeParam(
                                                                                columnTestRecord.totalQuestion,
                                                                                ParamType.int,
                                                                              ),
                                                                              'testname': serializeParam(
                                                                                columnTestRecord.totalQuestion.toString(),
                                                                                ParamType.String,
                                                                              ),
                                                                              'testStudent': serializeParam(
                                                                                _model.testCreated?.reference,
                                                                                ParamType.DocumentReference,
                                                                              ),
                                                                              'testduration': serializeParam(
                                                                                columnTestRecord.duration,
                                                                                ParamType.int,
                                                                              ),
                                                                              'marksPerQuestion': serializeParam(
                                                                                columnTestRecord.marksPerQuestion,
                                                                                ParamType.int,
                                                                              ),
                                                                            }.withoutNulls,
                                                                          );

                                                                          setState(
                                                                              () {});
                                                                        },
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
                                                                          67.0,
                                                                          10.0,
                                                                          110.0,
                                                                          10.0),
                                                                      child:
                                                                          Text(
                                                                        columnTestRecord
                                                                            .testName,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Raleway',
                                                                              fontSize: 18.0,
                                                                              fontWeight: FontWeight.w600,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            5.0,
                                                                            0.0,
                                                                            5.0),
                                                                    child: Image
                                                                        .asset(
                                                                      'assets/images/score.png',
                                                                      width:
                                                                          50.0,
                                                                      height:
                                                                          50.0,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            0.7,
                                                                            0.07),
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            49.0,
                                                                        height:
                                                                            41.0,
                                                                        decoration:
                                                                            const BoxDecoration(),
                                                                        alignment: const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Transform.rotate(
                                                                              angle: 0.192,
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                child: Image.asset(
                                                                                  'assets/images/trophy.png',
                                                                                  width: 20.0,
                                                                                  height: 20.0,
                                                                                  fit: BoxFit.cover,
                                                                                  alignment: const Alignment(1.0, 1.0),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            AuthUserStreamWidget(
                                                                              builder: (context) => Text(
                                                                                valueOrDefault<String>(
                                                                                  formatNumber(
                                                                                    valueOrDefault<int>(
                                                                                              valueOrDefault<int>(
                                                                                                    columnTestRecord.totalQuestion * columnTestRecord.marksPerQuestion,
                                                                                                    0,
                                                                                                  ) +
                                                                                                  valueOrDefault<int>(
                                                                                                    valueOrDefault(currentUserDocument?.gainedMarks, 0),
                                                                                                    0,
                                                                                                  ),
                                                                                              0,
                                                                                            ) *
                                                                                            valueOrDefault<int>(
                                                                                              valueOrDefault(currentUserDocument?.testAttempted, 0) + 1,
                                                                                              0,
                                                                                            ) *
                                                                                            3 -
                                                                                        valueOrDefault(currentUserDocument?.skillPoints, 0.0),
                                                                                    formatType: FormatType.custom,
                                                                                    format: '###',
                                                                                    locale: '',
                                                                                  ),
                                                                                  '0',
                                                                                ),
                                                                                textAlign: TextAlign.center,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Raleway',
                                                                                      color: FlutterFlowTheme.of(context).tertiary,
                                                                                      fontSize: 16.0,
                                                                                      fontWeight: FontWeight.w600,
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
                                                          ),
                                                          Divider(
                                                            height: 5.0,
                                                            thickness: 1.0,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .accent4,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 100.0,
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
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 4.0, 0.0),
                                              child: AuthUserStreamWidget(
                                                builder: (context) => Text(
                                                  valueOrDefault<String>(
                                                    () {
                                                      if (valueOrDefault(
                                                              currentUserDocument
                                                                  ?.subjectType,
                                                              0) ==
                                                          1) {
                                                        return 'WC&S';
                                                      } else if (valueOrDefault(
                                                              currentUserDocument
                                                                  ?.subjectType,
                                                              0) ==
                                                          2) {
                                                        return 'Soft Skills';
                                                      } else {
                                                        return '0';
                                                      }
                                                    }(),
                                                    '0',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Raleway',
                                                        fontSize: 18.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(-1.0, 0.0),
                                            child: AuthUserStreamWidget(
                                              builder: (context) =>
                                                  FutureBuilder<int>(
                                                future: queryTestRecordCount(
                                                  queryBuilder: (testRecord) =>
                                                      testRecord.where(
                                                    'test_type',
                                                    isEqualTo:
                                                        valueOrDefault<String>(
                                                      () {
                                                        if (valueOrDefault(
                                                                currentUserDocument
                                                                    ?.subjectType,
                                                                0) ==
                                                            1) {
                                                          return 'WC';
                                                        } else if (valueOrDefault(
                                                                currentUserDocument
                                                                    ?.subjectType,
                                                                0) ==
                                                            2) {
                                                          return 'SS';
                                                        } else {
                                                          return '0';
                                                        }
                                                      }(),
                                                      '0',
                                                    ),
                                                  ),
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 10.0,
                                                        height: 10.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          valueColor:
                                                              AlwaysStoppedAnimation<
                                                                  Color>(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  int textCount =
                                                      snapshot.data!;
                                                  return Text(
                                                    '(${textCount.toString()})',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Raleway',
                                                          fontSize: 18.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ).animateOnPageLoad(animationsMap[
                                                      'textOnPageLoadAnimation2']!);
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 10.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
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
                                                  child: const ChangeSubjectWidget(),
                                                ),
                                              ));
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'ybeauzar' /* Change */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodySmall
                                                  .override(
                                                    fontFamily: 'Raleway',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiary,
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Icon(
                                                Icons.arrow_drop_down,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                size: 20.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(
                                  thickness: 1.0,
                                  color: FlutterFlowTheme.of(context).accent4,
                                ),
                                if ((valueOrDefault<bool>(
                                            currentUserDocument?.isPremium,
                                            false) ==
                                        false) &&
                                    (currentUserDocument!.premiumTill! <
                                        getCurrentTimestamp))
                                  AuthUserStreamWidget(
                                    builder: (context) => FlutterFlowAdBanner(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 50.0,
                                      showsTestAd: false,
                                      androidAdUnitID:
                                          'ca-app-pub-7315791677262365/9458121453',
                                    ),
                                  ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 100.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) =>
                                        StreamBuilder<List<TestRecord>>(
                                      stream: queryTestRecord(
                                        queryBuilder: (testRecord) => testRecord
                                            .where(
                                              'test_type',
                                              isEqualTo: valueOrDefault<String>(
                                                () {
                                                  if (valueOrDefault(
                                                          currentUserDocument
                                                              ?.subjectType,
                                                          0) ==
                                                      1) {
                                                    return 'WC';
                                                  } else if (valueOrDefault(
                                                          currentUserDocument
                                                              ?.subjectType,
                                                          0) ==
                                                      2) {
                                                    return 'SS';
                                                  } else {
                                                    return '0';
                                                  }
                                                }(),
                                                '0',
                                              ),
                                            )
                                            .orderBy('Index'),
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
                                        List<TestRecord>
                                            listViewTestRecordList =
                                            snapshot.data!;
                                        if (listViewTestRecordList.isEmpty) {
                                          return Center(
                                            child: Image.asset(
                                              'assets/images/bill.png',
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.5,
                                              fit: BoxFit.contain,
                                            ),
                                          );
                                        }
                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              listViewTestRecordList.length,
                                          itemBuilder:
                                              (context, listViewIndex) {
                                            final listViewTestRecord =
                                                listViewTestRecordList[
                                                    listViewIndex];
                                            return Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 0.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    enableDrag: false,
                                                    context: context,
                                                    builder: (context) {
                                                      return WebViewAware(
                                                          child:
                                                              GestureDetector(
                                                        onTap: () => _model
                                                                .unfocusNode
                                                                .canRequestFocus
                                                            ? FocusScope.of(
                                                                    context)
                                                                .requestFocus(_model
                                                                    .unfocusNode)
                                                            : FocusScope.of(
                                                                    context)
                                                                .unfocus(),
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child:
                                                              ShareTestLinkWidget(
                                                            exam:
                                                                listViewTestRecord
                                                                    .testName,
                                                            link: '',
                                                          ),
                                                        ),
                                                      ));
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));
                                                },
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
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
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      8.0,
                                                                      0.0,
                                                                      8.0),
                                                          child: Stack(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        1.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                                  child:
                                                                      FlutterFlowIconButton(
                                                                    borderColor:
                                                                        Colors
                                                                            .transparent,
                                                                    borderRadius:
                                                                        20.0,
                                                                    borderWidth:
                                                                        1.0,
                                                                    buttonSize:
                                                                        40.0,
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .tertiary,
                                                                    icon: Icon(
                                                                      Icons
                                                                          .play_circle,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                    showLoadingIndicator:
                                                                        true,
                                                                    onPressed:
                                                                        () async {
                                                                      if ((valueOrDefault<bool>(currentUserDocument?.isPremium, false) ==
                                                                              false) &&
                                                                          (currentUserDocument!.premiumTill! <
                                                                              getCurrentTimestamp)) {
                                                                        _model.interstitialAdSuccess1Copy2 =
                                                                            await admob.showInterstitialAd();
                                                                      } else {
                                                                        await Future.delayed(const Duration(
                                                                            milliseconds:
                                                                                0));
                                                                      }

                                                                      var testStudentRecordReference = TestStudentRecord
                                                                          .collection
                                                                          .doc();
                                                                      await testStudentRecordReference
                                                                          .set(
                                                                              createTestStudentRecordData(
                                                                        testName:
                                                                            listViewTestRecord.testName,
                                                                        totalQuestion:
                                                                            listViewTestRecord.totalQuestion,
                                                                        duration:
                                                                            listViewTestRecord.duration,
                                                                        marksPerQuestion:
                                                                            listViewTestRecord.marksPerQuestion,
                                                                        testType:
                                                                            listViewTestRecord.testType,
                                                                        time:
                                                                            getCurrentTimestamp,
                                                                        studentReference:
                                                                            currentUserReference,
                                                                        isComplete:
                                                                            false,
                                                                      ));
                                                                      _model.testCreated2 = TestStudentRecord.getDocumentFromData(
                                                                          createTestStudentRecordData(
                                                                            testName:
                                                                                listViewTestRecord.testName,
                                                                            totalQuestion:
                                                                                listViewTestRecord.totalQuestion,
                                                                            duration:
                                                                                listViewTestRecord.duration,
                                                                            marksPerQuestion:
                                                                                listViewTestRecord.marksPerQuestion,
                                                                            testType:
                                                                                listViewTestRecord.testType,
                                                                            time:
                                                                                getCurrentTimestamp,
                                                                            studentReference:
                                                                                currentUserReference,
                                                                            isComplete:
                                                                                false,
                                                                          ),
                                                                          testStudentRecordReference);

                                                                      context
                                                                          .pushNamed(
                                                                        'TestPage',
                                                                        queryParameters:
                                                                            {
                                                                          'testsetpara':
                                                                              serializeParam(
                                                                            listViewTestRecord.reference,
                                                                            ParamType.DocumentReference,
                                                                          ),
                                                                          'totalQuestion':
                                                                              serializeParam(
                                                                            listViewTestRecord.totalQuestion,
                                                                            ParamType.int,
                                                                          ),
                                                                          'testname':
                                                                              serializeParam(
                                                                            listViewTestRecord.testName,
                                                                            ParamType.String,
                                                                          ),
                                                                          'testStudent':
                                                                              serializeParam(
                                                                            _model.testCreated2?.reference,
                                                                            ParamType.DocumentReference,
                                                                          ),
                                                                          'testduration':
                                                                              serializeParam(
                                                                            listViewTestRecord.duration,
                                                                            ParamType.int,
                                                                          ),
                                                                          'marksPerQuestion':
                                                                              serializeParam(
                                                                            listViewTestRecord.marksPerQuestion,
                                                                            ParamType.int,
                                                                          ),
                                                                        }.withoutNulls,
                                                                      );

                                                                      setState(
                                                                          () {});
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          67.0,
                                                                          10.0,
                                                                          110.0,
                                                                          10.0),
                                                                  child: Text(
                                                                    listViewTestRecord
                                                                        .testName,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Raleway',
                                                                          fontSize:
                                                                              18.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            5.0,
                                                                            0.0,
                                                                            5.0),
                                                                child:
                                                                    Image.asset(
                                                                  'assets/images/score.png',
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        0.7,
                                                                        0.07),
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width: 49.0,
                                                                    height:
                                                                        41.0,
                                                                    decoration:
                                                                        const BoxDecoration(),
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Transform
                                                                            .rotate(
                                                                          angle:
                                                                              0.192,
                                                                          child:
                                                                              ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            child:
                                                                                Image.asset(
                                                                              'assets/images/trophy.png',
                                                                              width: 20.0,
                                                                              height: 20.0,
                                                                              fit: BoxFit.cover,
                                                                              alignment: const Alignment(1.0, 1.0),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            formatNumber(
                                                                              valueOrDefault<int>(
                                                                                        valueOrDefault<int>(
                                                                                              listViewTestRecord.totalQuestion * listViewTestRecord.marksPerQuestion,
                                                                                              0,
                                                                                            ) +
                                                                                            valueOrDefault<int>(
                                                                                              valueOrDefault(currentUserDocument?.gainedMarks, 0),
                                                                                              0,
                                                                                            ),
                                                                                        0,
                                                                                      ) *
                                                                                      valueOrDefault<int>(
                                                                                        valueOrDefault(currentUserDocument?.testAttempted, 0) + 1,
                                                                                        0,
                                                                                      ) *
                                                                                      3 -
                                                                                  valueOrDefault(currentUserDocument?.skillPoints, 0.0),
                                                                              formatType: FormatType.custom,
                                                                              format: '###',
                                                                              locale: '',
                                                                            ),
                                                                            '0',
                                                                          ),
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Raleway',
                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                                fontSize: 16.0,
                                                                                fontWeight: FontWeight.w600,
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
                                                      ),
                                                      Divider(
                                                        height: 5.0,
                                                        thickness: 1.0,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent4,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 100.0,
                          height: 100.0,
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
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 4.0, 0.0),
                                              child: AuthUserStreamWidget(
                                                builder: (context) => Text(
                                                  valueOrDefault(currentUserDocument?.trade, ''),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Raleway',
                                                        fontSize: 18.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 12.0, 0.0),
                                              child: AuthUserStreamWidget(
                                                builder: (context) =>
                                                    FutureBuilder<int>(
                                                  future: queryTestRecordCount(
                                                    queryBuilder:
                                                        (testRecord) =>
                                                            testRecord.where(
                                                      'test_type',
                                                      isEqualTo: valueOrDefault(
                                                          currentUserDocument
                                                              ?.trade,
                                                          ''),
                                                    ),
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 10.0,
                                                          height: 10.0,
                                                          child:
                                                              CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .tertiary,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    int textCount =
                                                        snapshot.data!;
                                                    return Text(
                                                      '(${textCount.toString()})',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodySmall
                                                          .override(
                                                            fontFamily:
                                                                'Raleway',
                                                            fontSize: 18.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ).animateOnPageLoad(
                                                        animationsMap[
                                                            'textOnPageLoadAnimation3']!);
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 10.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
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
                                                  child: const ChangeSubjectWidget(),
                                                ),
                                              ));
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'c16tczaq' /* Change */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodySmall
                                                  .override(
                                                    fontFamily: 'Raleway',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiary,
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Icon(
                                                Icons.arrow_drop_down,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                size: 20.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(
                                  thickness: 1.0,
                                  color: FlutterFlowTheme.of(context).accent4,
                                ),
                                if ((valueOrDefault<bool>(
                                            currentUserDocument?.isPremium,
                                            false) ==
                                        false) &&
                                    (currentUserDocument!.premiumTill! <
                                        getCurrentTimestamp))
                                  AuthUserStreamWidget(
                                    builder: (context) => FlutterFlowAdBanner(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 50.0,
                                      showsTestAd: false,
                                      androidAdUnitID:
                                          'ca-app-pub-7315791677262365/9458121453',
                                    ),
                                  ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 5.0, 0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: false,
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
                                              child: const ShareTestLinkWidget(
                                                exam: '',
                                                link: '',
                                              ),
                                            ),
                                          ));
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 100.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) =>
                                        StreamBuilder<List<TestRecord>>(
                                      stream: queryTestRecord(
                                        queryBuilder: (testRecord) => testRecord
                                            .where(
                                              'test_type',
                                              isEqualTo: valueOrDefault(
                                                  currentUserDocument?.trade,
                                                  ''),
                                            )
                                            .orderBy('Index'),
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
                                        List<TestRecord>
                                            listViewTestRecordList =
                                            snapshot.data!;
                                        if (listViewTestRecordList.isEmpty) {
                                          return Center(
                                            child: Image.asset(
                                              'assets/images/bill.png',
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.5,
                                              fit: BoxFit.contain,
                                            ),
                                          );
                                        }
                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              listViewTestRecordList.length,
                                          itemBuilder:
                                              (context, listViewIndex) {
                                            final listViewTestRecord =
                                                listViewTestRecordList[
                                                    listViewIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  enableDrag: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return WebViewAware(
                                                        child: GestureDetector(
                                                      onTap: () => _model
                                                              .unfocusNode
                                                              .canRequestFocus
                                                          ? FocusScope.of(
                                                                  context)
                                                              .requestFocus(_model
                                                                  .unfocusNode)
                                                          : FocusScope.of(
                                                                  context)
                                                              .unfocus(),
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child:
                                                            ShareTestLinkWidget(
                                                          exam:
                                                              listViewTestRecord
                                                                  .testName,
                                                          link: '',
                                                        ),
                                                      ),
                                                    ));
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));
                                              },
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  8.0,
                                                                  0.0,
                                                                  8.0),
                                                      child: Stack(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    1.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                              child:
                                                                  FlutterFlowIconButton(
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    20.0,
                                                                borderWidth:
                                                                    1.0,
                                                                buttonSize:
                                                                    40.0,
                                                                fillColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .tertiary,
                                                                icon: Icon(
                                                                  Icons
                                                                      .play_circle,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  size: 24.0,
                                                                ),
                                                                showLoadingIndicator:
                                                                    true,
                                                                onPressed:
                                                                    () async {
                                                                  if ((valueOrDefault<bool>(
                                                                              currentUserDocument
                                                                                  ?.isPremium,
                                                                              false) ==
                                                                          false) &&
                                                                      (currentUserDocument!
                                                                              .premiumTill! <
                                                                          getCurrentTimestamp)) {
                                                                    _model.interstitialAdSuccess1Copy3 =
                                                                        await admob
                                                                            .showInterstitialAd();
                                                                  } else {
                                                                    await Future.delayed(const Duration(
                                                                        milliseconds:
                                                                            0));
                                                                  }

                                                                  var testStudentRecordReference =
                                                                      TestStudentRecord
                                                                          .collection
                                                                          .doc();
                                                                  await testStudentRecordReference
                                                                      .set(
                                                                          createTestStudentRecordData(
                                                                    testName:
                                                                        listViewTestRecord
                                                                            .testName,
                                                                    totalQuestion:
                                                                        listViewTestRecord
                                                                            .totalQuestion,
                                                                    duration:
                                                                        listViewTestRecord
                                                                            .duration,
                                                                    marksPerQuestion:
                                                                        listViewTestRecord
                                                                            .marksPerQuestion,
                                                                    testType:
                                                                        listViewTestRecord
                                                                            .testType,
                                                                    time:
                                                                        getCurrentTimestamp,
                                                                    studentReference:
                                                                        currentUserReference,
                                                                    isComplete:
                                                                        false,
                                                                  ));
                                                                  _model.testCreated1 =
                                                                      TestStudentRecord.getDocumentFromData(
                                                                          createTestStudentRecordData(
                                                                            testName:
                                                                                listViewTestRecord.testName,
                                                                            totalQuestion:
                                                                                listViewTestRecord.totalQuestion,
                                                                            duration:
                                                                                listViewTestRecord.duration,
                                                                            marksPerQuestion:
                                                                                listViewTestRecord.marksPerQuestion,
                                                                            testType:
                                                                                listViewTestRecord.testType,
                                                                            time:
                                                                                getCurrentTimestamp,
                                                                            studentReference:
                                                                                currentUserReference,
                                                                            isComplete:
                                                                                false,
                                                                          ),
                                                                          testStudentRecordReference);

                                                                  context
                                                                      .pushNamed(
                                                                    'TestPage',
                                                                    queryParameters:
                                                                        {
                                                                      'testsetpara':
                                                                          serializeParam(
                                                                        listViewTestRecord
                                                                            .reference,
                                                                        ParamType
                                                                            .DocumentReference,
                                                                      ),
                                                                      'totalQuestion':
                                                                          serializeParam(
                                                                        listViewTestRecord
                                                                            .totalQuestion,
                                                                        ParamType
                                                                            .int,
                                                                      ),
                                                                      'testname':
                                                                          serializeParam(
                                                                        listViewTestRecord
                                                                            .totalQuestion
                                                                            .toString(),
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'testStudent':
                                                                          serializeParam(
                                                                        _model
                                                                            .testCreated1
                                                                            ?.reference,
                                                                        ParamType
                                                                            .DocumentReference,
                                                                      ),
                                                                      'testduration':
                                                                          serializeParam(
                                                                        listViewTestRecord
                                                                            .duration,
                                                                        ParamType
                                                                            .int,
                                                                      ),
                                                                      'marksPerQuestion':
                                                                          serializeParam(
                                                                        listViewTestRecord
                                                                            .marksPerQuestion,
                                                                        ParamType
                                                                            .int,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );

                                                                  setState(
                                                                      () {});
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          67.0,
                                                                          10.0,
                                                                          110.0,
                                                                          10.0),
                                                              child: Text(
                                                                listViewTestRecord
                                                                    .testName,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Raleway',
                                                                      fontSize:
                                                                          18.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        5.0,
                                                                        0.0,
                                                                        5.0),
                                                            child: Image.asset(
                                                              'assets/images/score.png',
                                                              width: 50.0,
                                                              height: 50.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    0.7, 0.07),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Container(
                                                                width: 49.0,
                                                                height: 41.0,
                                                                decoration:
                                                                    const BoxDecoration(),
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Transform
                                                                        .rotate(
                                                                      angle:
                                                                          0.192,
                                                                      child:
                                                                          ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                        child: Image
                                                                            .asset(
                                                                          'assets/images/trophy.png',
                                                                          width:
                                                                              20.0,
                                                                          height:
                                                                              20.0,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                          alignment: const Alignment(
                                                                              1.0,
                                                                              1.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        formatNumber(
                                                                          valueOrDefault<int>(
                                                                                    valueOrDefault<int>(
                                                                                          listViewTestRecord.totalQuestion * listViewTestRecord.marksPerQuestion,
                                                                                          0,
                                                                                        ) +
                                                                                        valueOrDefault<int>(
                                                                                          valueOrDefault(currentUserDocument?.gainedMarks, 0),
                                                                                          0,
                                                                                        ),
                                                                                    0,
                                                                                  ) *
                                                                                  valueOrDefault<int>(
                                                                                    valueOrDefault(currentUserDocument?.testAttempted, 0) + 1,
                                                                                    0,
                                                                                  ) *
                                                                                  3 -
                                                                              valueOrDefault(currentUserDocument?.skillPoints, 0.0),
                                                                          formatType:
                                                                              FormatType.custom,
                                                                          format:
                                                                              '###',
                                                                          locale:
                                                                              '',
                                                                        ),
                                                                        '0',
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Raleway',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).tertiary,
                                                                            fontSize:
                                                                                16.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
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
                                                  ),
                                                  Divider(
                                                    height: 5.0,
                                                    thickness: 1.0,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .accent4,
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
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
    );
  }
}
