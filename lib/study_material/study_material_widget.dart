import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/change_subject_widget.dart';
import '/components/share_test_link_widget.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/admob_util.dart' as admob;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'study_material_model.dart';
export 'study_material_model.dart';

class StudyMaterialWidget extends StatefulWidget {
  const StudyMaterialWidget({
    super.key,
    int? type,
  })  : type = type ?? 0;

  final int type;

  @override
  _StudyMaterialWidgetState createState() => _StudyMaterialWidgetState();
}

class _StudyMaterialWidgetState extends State<StudyMaterialWidget>
    with TickerProviderStateMixin {
  late StudyMaterialModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StudyMaterialModel());

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
              'cyyewhq7' /* Button */,
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
              'd4a4lack' /* Study Material */,
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
                            '2s3hhhdk' /* POT (TM) */,
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
                            'dug7u818' /* Trade Theory */,
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
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
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
                                            FFLocalizations.of(context).getText(
                                              'huo6ojja' /* Share */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  fontFamily: 'Raleway',
                                                  color: FlutterFlowTheme.of(
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
                                            color: FlutterFlowTheme.of(context)
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
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 50.0,
                                    showsTestAd: false,
                                    androidAdUnitID:
                                        'ca-app-pub-7315791677262365/9458121453',
                                  ),
                                ),
                              Expanded(
                                child: MasonryGridView.builder(
                                  gridDelegate:
                                      const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                  ),
                                  crossAxisSpacing: 2.0,
                                  itemCount: 6,
                                  itemBuilder: (context, index) {
                                    return [
                                      () => FutureBuilder<int>(
                                            future:
                                                queryStudyMaterialRecordCount(
                                              queryBuilder:
                                                  (studyMaterialRecord) =>
                                                      studyMaterialRecord
                                                          .where(
                                                            'Type',
                                                            isEqualTo: 'POT',
                                                          )
                                                          .where(
                                                            'Content',
                                                            isEqualTo:
                                                                'Lesson Plan',
                                                          ),
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
                                              int stackCount = snapshot.data!;
                                              return Stack(
                                                children: [
                                                  if (stackCount > 0)
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(10.0),
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
                                                          if ((valueOrDefault<
                                                                          bool>(
                                                                      currentUserDocument
                                                                          ?.isPremium,
                                                                      false) ==
                                                                  false) &&
                                                              (currentUserDocument!
                                                                      .premiumTill! <
                                                                  getCurrentTimestamp)) {
                                                            _model.interstitialAdSuccess1Copy5Copy =
                                                                await admob
                                                                    .showInterstitialAd();
                                                          } else {
                                                            await Future.delayed(
                                                                const Duration(
                                                                    milliseconds:
                                                                        0));
                                                          }

                                                          context.pushNamed(
                                                            'StudyView',
                                                            queryParameters: {
                                                              'contentType':
                                                                  serializeParam(
                                                                'Lesson Plan',
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'filterType':
                                                                  serializeParam(
                                                                'POT',
                                                                ParamType
                                                                    .String,
                                                              ),
                                                            }.withoutNulls,
                                                          );

                                                          setState(() {});
                                                        },
                                                        child: Container(
                                                          width: 250.0,
                                                          height: 100.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 4.0,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary,
                                                                offset: const Offset(
                                                                    0.0, 2.0),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                            shape: BoxShape
                                                                .rectangle,
                                                          ),
                                                          child: Stack(
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        0.0,
                                                                        -0.57),
                                                                child:
                                                                    Image.asset(
                                                                  'assets/images/book_(2).png',
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        0.0,
                                                                        0.9),
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    '${stackCount.toString()} Available',
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
                                                                              FlutterFlowTheme.of(context).accent2,
                                                                          fontSize:
                                                                              10.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        0.0,
                                                                        0.59),
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'twwa3lz2' /* Lesson Plan */,
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Ubuntu',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              15.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
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
                                              );
                                            },
                                          ),
                                      () => FutureBuilder<int>(
                                            future:
                                                queryStudyMaterialRecordCount(
                                              queryBuilder:
                                                  (studyMaterialRecord) =>
                                                      studyMaterialRecord
                                                          .where(
                                                            'Type',
                                                            isEqualTo: 'POT',
                                                          )
                                                          .where(
                                                            'Content',
                                                            isEqualTo:
                                                                'Demo Plan',
                                                          ),
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
                                              int stackCount = snapshot.data!;
                                              return Stack(
                                                children: [
                                                  if (stackCount > 0)
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(10.0),
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
                                                          if ((valueOrDefault<
                                                                          bool>(
                                                                      currentUserDocument
                                                                          ?.isPremium,
                                                                      false) ==
                                                                  false) &&
                                                              (currentUserDocument!
                                                                      .premiumTill! <
                                                                  getCurrentTimestamp)) {
                                                            _model.interstitialAdSuccess1Copy5CopyCopy =
                                                                await admob
                                                                    .showInterstitialAd();
                                                          } else {
                                                            await Future.delayed(
                                                                const Duration(
                                                                    milliseconds:
                                                                        0));
                                                          }

                                                          context.pushNamed(
                                                            'StudyView',
                                                            queryParameters: {
                                                              'contentType':
                                                                  serializeParam(
                                                                'Demo Plan',
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'filterType':
                                                                  serializeParam(
                                                                'POT',
                                                                ParamType
                                                                    .String,
                                                              ),
                                                            }.withoutNulls,
                                                          );

                                                          setState(() {});
                                                        },
                                                        child: Container(
                                                          height: 100.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 4.0,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary,
                                                                offset: const Offset(
                                                                    0.0, 2.0),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                            shape: BoxShape
                                                                .rectangle,
                                                          ),
                                                          child: Stack(
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        0.0,
                                                                        -0.57),
                                                                child:
                                                                    Image.asset(
                                                                  'assets/images/homework.png',
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        0.0,
                                                                        0.62),
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'dtpzxw01' /* Demo Plan */,
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Ubuntu',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              15.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        0.0,
                                                                        0.9),
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    '${stackCount.toString()} Available',
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
                                                                              FlutterFlowTheme.of(context).accent2,
                                                                          fontSize:
                                                                              10.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
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
                                              );
                                            },
                                          ),
                                      () => FutureBuilder<int>(
                                            future:
                                                queryStudyMaterialRecordCount(
                                              queryBuilder:
                                                  (studyMaterialRecord) =>
                                                      studyMaterialRecord
                                                          .where(
                                                            'Type',
                                                            isEqualTo: 'POT',
                                                          )
                                                          .where(
                                                            'Content',
                                                            isEqualTo: 'E-Book',
                                                          ),
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
                                              int stackCount = snapshot.data!;
                                              return Stack(
                                                children: [
                                                  if (stackCount > 0)
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(10.0),
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
                                                          if ((valueOrDefault<
                                                                          bool>(
                                                                      currentUserDocument
                                                                          ?.isPremium,
                                                                      false) ==
                                                                  false) &&
                                                              (currentUserDocument!
                                                                      .premiumTill! <
                                                                  getCurrentTimestamp)) {
                                                            _model.interstitialAdSuccess1Copy5CopyCopy2 =
                                                                await admob
                                                                    .showInterstitialAd();
                                                          } else {
                                                            await Future.delayed(
                                                                const Duration(
                                                                    milliseconds:
                                                                        0));
                                                          }

                                                          context.pushNamed(
                                                            'StudyView',
                                                            queryParameters: {
                                                              'contentType':
                                                                  serializeParam(
                                                                'E-Book',
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'filterType':
                                                                  serializeParam(
                                                                'POT',
                                                                ParamType
                                                                    .String,
                                                              ),
                                                            }.withoutNulls,
                                                          );

                                                          setState(() {});
                                                        },
                                                        child: Container(
                                                          width: 250.0,
                                                          height: 100.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 4.0,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary,
                                                                offset: const Offset(
                                                                    0.0, 2.0),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                            shape: BoxShape
                                                                .rectangle,
                                                          ),
                                                          child: Stack(
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        0.0,
                                                                        -0.57),
                                                                child:
                                                                    Image.asset(
                                                                  'assets/images/e-learning.png',
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        0.0,
                                                                        0.59),
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '8t2t70a8' /* E-Books */,
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Ubuntu',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              15.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        0.0,
                                                                        0.9),
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    '${stackCount.toString()} Available',
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
                                                                              FlutterFlowTheme.of(context).accent2,
                                                                          fontSize:
                                                                              10.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
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
                                              );
                                            },
                                          ),
                                      () => Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                if ((valueOrDefault<bool>(
                                                            currentUserDocument
                                                                ?.isPremium,
                                                            false) ==
                                                        false) &&
                                                    (currentUserDocument!
                                                            .premiumTill! <
                                                        getCurrentTimestamp)) {
                                                  _model.vvcvcvcx = await admob
                                                      .showInterstitialAd();
                                                } else {
                                                  await Future.delayed(
                                                      const Duration(
                                                          milliseconds: 0));
                                                }

                                                context.pushNamed(
                                                  'TestSeries',
                                                  queryParameters: {
                                                    'type': serializeParam(
                                                      0,
                                                      ParamType.int,
                                                    ),
                                                  }.withoutNulls,
                                                );

                                                setState(() {});
                                              },
                                              child: Container(
                                                width: 250.0,
                                                height: 100.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 4.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                      offset: const Offset(0.0, 2.0),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                  shape: BoxShape.rectangle,
                                                ),
                                                child: Stack(
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, -0.57),
                                                      child: Image.asset(
                                                        'assets/images/search.png',
                                                        width: 50.0,
                                                        height: 50.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, 0.59),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    0.0,
                                                                    5.0,
                                                                    0.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'aq64d5ua' /* Test Series */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Ubuntu',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 15.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, 0.9),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    0.0,
                                                                    5.0,
                                                                    0.0),
                                                        child:
                                                            FutureBuilder<int>(
                                                          future:
                                                              queryTestRecordCount(
                                                            queryBuilder:
                                                                (testRecord) =>
                                                                    testRecord
                                                                        .where(
                                                              'test_type',
                                                              isEqualTo: 'POT',
                                                            ),
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return const Center(
                                                                child: SizedBox(
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  child:
                                                                      SpinKitWave(
                                                                    color: Color(
                                                                        0xFFF6D96B),
                                                                    size: 50.0,
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            int textCount =
                                                                snapshot.data!;
                                                            return Text(
                                                              '${textCount.toString()} Available',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Raleway',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .accent2,
                                                                    fontSize:
                                                                        10.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                      () => FutureBuilder<int>(
                                            future:
                                                queryStudyMaterialRecordCount(
                                              queryBuilder:
                                                  (studyMaterialRecord) =>
                                                      studyMaterialRecord
                                                          .where(
                                                            'Type',
                                                            isEqualTo: 'POT',
                                                          )
                                                          .where(
                                                            'Content',
                                                            isEqualTo: 'Notes',
                                                          ),
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
                                              int stackCount = snapshot.data!;
                                              return Stack(
                                                children: [
                                                  if (stackCount > 0)
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(10.0),
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
                                                          if ((valueOrDefault<
                                                                          bool>(
                                                                      currentUserDocument
                                                                          ?.isPremium,
                                                                      false) ==
                                                                  false) &&
                                                              (currentUserDocument!
                                                                      .premiumTill! <
                                                                  getCurrentTimestamp)) {
                                                            _model.interstitialAdSuccess1Copy5CopyCopy3 =
                                                                await admob
                                                                    .showInterstitialAd();
                                                          } else {
                                                            await Future.delayed(
                                                                const Duration(
                                                                    milliseconds:
                                                                        0));
                                                          }

                                                          context.pushNamed(
                                                            'StudyView',
                                                            queryParameters: {
                                                              'contentType':
                                                                  serializeParam(
                                                                'Notes',
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'filterType':
                                                                  serializeParam(
                                                                'POT',
                                                                ParamType
                                                                    .String,
                                                              ),
                                                            }.withoutNulls,
                                                          );

                                                          setState(() {});
                                                        },
                                                        child: Container(
                                                          width: 250.0,
                                                          height: 100.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 4.0,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary,
                                                                offset: const Offset(
                                                                    0.0, 2.0),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                            shape: BoxShape
                                                                .rectangle,
                                                          ),
                                                          child: Stack(
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        0.0,
                                                                        -0.57),
                                                                child:
                                                                    Image.asset(
                                                                  'assets/images/notes.png',
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        0.0,
                                                                        0.59),
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'i7pbuysx' /* Notes */,
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Ubuntu',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              15.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        0.0,
                                                                        0.9),
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    '${stackCount.toString()} Available',
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
                                                                              FlutterFlowTheme.of(context).accent2,
                                                                          fontSize:
                                                                              10.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
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
                                              );
                                            },
                                          ),
                                      () => FutureBuilder<int>(
                                            future:
                                                queryStudyMaterialRecordCount(
                                              queryBuilder:
                                                  (studyMaterialRecord) =>
                                                      studyMaterialRecord
                                                          .where(
                                                            'Type',
                                                            isEqualTo: 'POT',
                                                          )
                                                          .where(
                                                            'Content',
                                                            isEqualTo: 'Video',
                                                          ),
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
                                              int stackCount = snapshot.data!;
                                              return Stack(
                                                children: [
                                                  if (stackCount > 0)
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(10.0),
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
                                                          if ((valueOrDefault<
                                                                          bool>(
                                                                      currentUserDocument
                                                                          ?.isPremium,
                                                                      false) ==
                                                                  false) &&
                                                              (currentUserDocument!
                                                                      .premiumTill! <
                                                                  getCurrentTimestamp)) {
                                                            _model.interstitialAdSuccess1Copy5CopyCopy4 =
                                                                await admob
                                                                    .showInterstitialAd();
                                                          } else {
                                                            await Future.delayed(
                                                                const Duration(
                                                                    milliseconds:
                                                                        0));
                                                          }

                                                          context.pushNamed(
                                                            'StudyView',
                                                            queryParameters: {
                                                              'contentType':
                                                                  serializeParam(
                                                                'Video',
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'filterType':
                                                                  serializeParam(
                                                                'POT',
                                                                ParamType
                                                                    .String,
                                                              ),
                                                            }.withoutNulls,
                                                          );

                                                          setState(() {});
                                                        },
                                                        child: Container(
                                                          width: 250.0,
                                                          height: 100.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 4.0,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary,
                                                                offset: const Offset(
                                                                    0.0, 2.0),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                            shape: BoxShape
                                                                .rectangle,
                                                          ),
                                                          child: Stack(
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        0.0,
                                                                        -0.57),
                                                                child:
                                                                    Image.asset(
                                                                  'assets/images/video-player.png',
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        0.0,
                                                                        0.59),
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '4tedxa6q' /* Videos */,
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Ubuntu',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              15.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        0.0,
                                                                        0.9),
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    '${stackCount.toString()} Available',
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
                                                                              FlutterFlowTheme.of(context).accent2,
                                                                          fontSize:
                                                                              10.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
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
                                              );
                                            },
                                          ),
                                    ][index]();
                                  },
                                ),
                              ),
                            ],
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
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
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
                                        ).then((value) => safeSetState(() {}));
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'uie5zcoa' /* Change */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
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
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
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
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 50.0,
                                    showsTestAd: false,
                                    androidAdUnitID:
                                        'ca-app-pub-7315791677262365/9458121453',
                                  ),
                                ),
                              Expanded(
                                child: MasonryGridView.builder(
                                  gridDelegate:
                                      const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                  ),
                                  crossAxisSpacing: 2.0,
                                  itemCount: 4,
                                  itemBuilder: (context, index) {
                                    return [
                                      () => AuthUserStreamWidget(
                                            builder: (context) =>
                                                FutureBuilder<int>(
                                              future:
                                                  queryStudyMaterialRecordCount(
                                                queryBuilder:
                                                    (studyMaterialRecord) =>
                                                        studyMaterialRecord
                                                            .where(
                                                              'Type',
                                                              isEqualTo:
                                                                  valueOrDefault<
                                                                      String>(
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
                                                            )
                                                            .where(
                                                              'Content',
                                                              isEqualTo:
                                                                  'E-Book',
                                                            ),
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
                                                int stackCount = snapshot.data!;
                                                return Stack(
                                                  children: [
                                                    if (stackCount > 0)
                                                      Padding(
                                                        padding: const EdgeInsets.all(
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
                                                            if ((valueOrDefault<
                                                                            bool>(
                                                                        currentUserDocument
                                                                            ?.isPremium,
                                                                        false) ==
                                                                    false) &&
                                                                (currentUserDocument!
                                                                        .premiumTill! <
                                                                    getCurrentTimestamp)) {
                                                              _model.interstitialAdSuccess1Cfopy5CopyCopy2 =
                                                                  await admob
                                                                      .showInterstitialAd();
                                                            } else {
                                                              await Future.delayed(
                                                                  const Duration(
                                                                      milliseconds:
                                                                          0));
                                                            }

                                                            context.pushNamed(
                                                              'StudyView',
                                                              queryParameters: {
                                                                'contentType':
                                                                    serializeParam(
                                                                  'E-Book',
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'filterType':
                                                                    serializeParam(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    () {
                                                                      if (valueOrDefault(
                                                                              currentUserDocument
                                                                                  ?.subjectType,
                                                                              0) ==
                                                                          1) {
                                                                        return 'WC&S';
                                                                      } else if (valueOrDefault(
                                                                              currentUserDocument?.subjectType,
                                                                              0) ==
                                                                          2) {
                                                                        return 'Soft Skills';
                                                                      } else {
                                                                        return '0';
                                                                      }
                                                                    }(),
                                                                    '0',
                                                                  ),
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );

                                                            setState(() {});
                                                          },
                                                          child: Container(
                                                            width: 250.0,
                                                            height: 100.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
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
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15.0),
                                                              shape: BoxShape
                                                                  .rectangle,
                                                            ),
                                                            child: Stack(
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          -0.57),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/e-learning.png',
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          0.59),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '9ksgtx66' /* E-Books */,
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Ubuntu',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize:
                                                                                15.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          0.9),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      '${stackCount.toString()} Available',
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
                                                                                FlutterFlowTheme.of(context).accent2,
                                                                            fontSize:
                                                                                10.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
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
                                                );
                                              },
                                            ),
                                          ),
                                      () => Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                if ((valueOrDefault<bool>(
                                                            currentUserDocument
                                                                ?.isPremium,
                                                            false) ==
                                                        false) &&
                                                    (currentUserDocument!
                                                            .premiumTill! <
                                                        getCurrentTimestamp)) {
                                                  _model.interstitialAdSuccccess1Copy5CopyCopy4Copy =
                                                      await admob
                                                          .showInterstitialAd();
                                                } else {
                                                  await Future.delayed(
                                                      const Duration(
                                                          milliseconds: 0));
                                                }

                                                context.pushNamed(
                                                  'TestSeries',
                                                  queryParameters: {
                                                    'type': serializeParam(
                                                      1,
                                                      ParamType.int,
                                                    ),
                                                  }.withoutNulls,
                                                );

                                                setState(() {});
                                              },
                                              child: Container(
                                                width: 250.0,
                                                height: 100.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 4.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                      offset: const Offset(0.0, 2.0),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                  shape: BoxShape.rectangle,
                                                ),
                                                child: Stack(
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, -0.57),
                                                      child: Image.asset(
                                                        'assets/images/search.png',
                                                        width: 50.0,
                                                        height: 50.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, 0.59),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    0.0,
                                                                    5.0,
                                                                    0.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '43v3o4ym' /* Test Series */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Ubuntu',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 15.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, 0.9),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    0.0,
                                                                    5.0,
                                                                    0.0),
                                                        child:
                                                            AuthUserStreamWidget(
                                                          builder: (context) =>
                                                              FutureBuilder<
                                                                  int>(
                                                            future:
                                                                queryTestRecordCount(
                                                              queryBuilder:
                                                                  (testRecord) =>
                                                                      testRecord
                                                                          .where(
                                                                'test_type',
                                                                isEqualTo:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  () {
                                                                    if (valueOrDefault(
                                                                            currentUserDocument
                                                                                ?.subjectType,
                                                                            0) ==
                                                                        1) {
                                                                      return 'WC';
                                                                    } else if (valueOrDefault(
                                                                            currentUserDocument?.subjectType,
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
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return const Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    child:
                                                                        SpinKitWave(
                                                                      color: Color(
                                                                          0xFFF6D96B),
                                                                      size:
                                                                          50.0,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              int textCount =
                                                                  snapshot
                                                                      .data!;
                                                              return Text(
                                                                '${textCount.toString()} Available',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Raleway',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent2,
                                                                      fontSize:
                                                                          10.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                      () => AuthUserStreamWidget(
                                            builder: (context) =>
                                                FutureBuilder<int>(
                                              future:
                                                  queryStudyMaterialRecordCount(
                                                queryBuilder:
                                                    (studyMaterialRecord) =>
                                                        studyMaterialRecord
                                                            .where(
                                                              'Type',
                                                              isEqualTo:
                                                                  valueOrDefault<
                                                                      String>(
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
                                                            )
                                                            .where(
                                                              'Content',
                                                              isEqualTo:
                                                                  'Notes',
                                                            ),
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
                                                int stackCount = snapshot.data!;
                                                return Stack(
                                                  children: [
                                                    if (stackCount > 0)
                                                      Padding(
                                                        padding: const EdgeInsets.all(
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
                                                            if ((valueOrDefault<
                                                                            bool>(
                                                                        currentUserDocument
                                                                            ?.isPremium,
                                                                        false) ==
                                                                    false) &&
                                                                (currentUserDocument!
                                                                        .premiumTill! <
                                                                    getCurrentTimestamp)) {
                                                              _model.interstitialAdbSucccess1Copy5CopyCopy3 =
                                                                  await admob
                                                                      .showInterstitialAd();
                                                            } else {
                                                              await Future.delayed(
                                                                  const Duration(
                                                                      milliseconds:
                                                                          0));
                                                            }

                                                            context.pushNamed(
                                                              'StudyView',
                                                              queryParameters: {
                                                                'contentType':
                                                                    serializeParam(
                                                                  'Notes',
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'filterType':
                                                                    serializeParam(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    () {
                                                                      if (valueOrDefault(
                                                                              currentUserDocument
                                                                                  ?.subjectType,
                                                                              0) ==
                                                                          1) {
                                                                        return 'WC&S';
                                                                      } else if (valueOrDefault(
                                                                              currentUserDocument?.subjectType,
                                                                              0) ==
                                                                          2) {
                                                                        return 'Soft Skills';
                                                                      } else {
                                                                        return '0';
                                                                      }
                                                                    }(),
                                                                    '0',
                                                                  ),
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );

                                                            setState(() {});
                                                          },
                                                          child: Container(
                                                            width: 250.0,
                                                            height: 100.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
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
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15.0),
                                                              shape: BoxShape
                                                                  .rectangle,
                                                            ),
                                                            child: Stack(
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          -0.57),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/notes.png',
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          0.59),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'snh2l6os' /* Notes */,
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Ubuntu',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize:
                                                                                15.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          0.9),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      '${stackCount.toString()} Available',
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
                                                                                FlutterFlowTheme.of(context).accent2,
                                                                            fontSize:
                                                                                10.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
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
                                                );
                                              },
                                            ),
                                          ),
                                      () => AuthUserStreamWidget(
                                            builder: (context) =>
                                                FutureBuilder<int>(
                                              future:
                                                  queryStudyMaterialRecordCount(
                                                queryBuilder:
                                                    (studyMaterialRecord) =>
                                                        studyMaterialRecord
                                                            .where(
                                                              'Type',
                                                              isEqualTo:
                                                                  valueOrDefault<
                                                                      String>(
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
                                                            )
                                                            .where(
                                                              'Content',
                                                              isEqualTo:
                                                                  'Video',
                                                            ),
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
                                                int stackCount = snapshot.data!;
                                                return Stack(
                                                  children: [
                                                    if (stackCount > 0)
                                                      Padding(
                                                        padding: const EdgeInsets.all(
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
                                                            if ((valueOrDefault<
                                                                            bool>(
                                                                        currentUserDocument
                                                                            ?.isPremium,
                                                                        false) ==
                                                                    false) &&
                                                                (currentUserDocument!
                                                                        .premiumTill! <
                                                                    getCurrentTimestamp)) {
                                                              _model.interstitialAdSuccvcvess1Copy5CopyCopy4 =
                                                                  await admob
                                                                      .showInterstitialAd();
                                                            } else {
                                                              await Future.delayed(
                                                                  const Duration(
                                                                      milliseconds:
                                                                          0));
                                                            }

                                                            context.pushNamed(
                                                              'StudyView',
                                                              queryParameters: {
                                                                'contentType':
                                                                    serializeParam(
                                                                  'Video',
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'filterType':
                                                                    serializeParam(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    () {
                                                                      if (valueOrDefault(
                                                                              currentUserDocument
                                                                                  ?.subjectType,
                                                                              0) ==
                                                                          1) {
                                                                        return 'WC&S';
                                                                      } else if (valueOrDefault(
                                                                              currentUserDocument?.subjectType,
                                                                              0) ==
                                                                          2) {
                                                                        return 'Soft Skills';
                                                                      } else {
                                                                        return '0';
                                                                      }
                                                                    }(),
                                                                    '0',
                                                                  ),
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );

                                                            setState(() {});
                                                          },
                                                          child: Container(
                                                            width: 250.0,
                                                            height: 100.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
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
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15.0),
                                                              shape: BoxShape
                                                                  .rectangle,
                                                            ),
                                                            child: Stack(
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          -0.57),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/video-player.png',
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          0.59),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'kqnpv2hx' /* Videos */,
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Ubuntu',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize:
                                                                                15.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          0.9),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      '${stackCount.toString()} Available',
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
                                                                                FlutterFlowTheme.of(context).accent2,
                                                                            fontSize:
                                                                                10.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
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
                                                );
                                              },
                                            ),
                                          ),
                                    ][index]();
                                  },
                                ),
                              ),
                            ],
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
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 4.0, 0.0),
                                            child: AuthUserStreamWidget(
                                              builder: (context) => Text(
                                                valueOrDefault(currentUserDocument?.trade, ''),
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
                                        ).then((value) => safeSetState(() {}));
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'vv5zaq5n' /* Change */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
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
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
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
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
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
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: MasonryGridView.builder(
                                  gridDelegate:
                                      const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                  ),
                                  crossAxisSpacing: 2.0,
                                  itemCount: 6,
                                  itemBuilder: (context, index) {
                                    return [
                                      () => AuthUserStreamWidget(
                                            builder: (context) =>
                                                FutureBuilder<int>(
                                              future:
                                                  queryStudyMaterialRecordCount(
                                                queryBuilder:
                                                    (studyMaterialRecord) =>
                                                        studyMaterialRecord
                                                            .where(
                                                              'Type',
                                                              isEqualTo:
                                                                  valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.trade,
                                                                      ''),
                                                            )
                                                            .where(
                                                              'Content',
                                                              isEqualTo:
                                                                  'Lesson Plan',
                                                            ),
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
                                                int stackCount = snapshot.data!;
                                                return Stack(
                                                  children: [
                                                    if (stackCount > 0)
                                                      Padding(
                                                        padding: const EdgeInsets.all(
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
                                                            if ((valueOrDefault<
                                                                            bool>(
                                                                        currentUserDocument
                                                                            ?.isPremium,
                                                                        false) ==
                                                                    false) &&
                                                                (currentUserDocument!
                                                                        .premiumTill! <
                                                                    getCurrentTimestamp)) {
                                                              _model.interstitialAdSuccess1CopDy5Copy =
                                                                  await admob
                                                                      .showInterstitialAd();
                                                            } else {
                                                              await Future.delayed(
                                                                  const Duration(
                                                                      milliseconds:
                                                                          0));
                                                            }

                                                            context.pushNamed(
                                                              'StudyView',
                                                              queryParameters: {
                                                                'contentType':
                                                                    serializeParam(
                                                                  'Lesson Plan',
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'filterType':
                                                                    serializeParam(
                                                                  valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.trade,
                                                                      ''),
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );

                                                            setState(() {});
                                                          },
                                                          child: Container(
                                                            width: 250.0,
                                                            height: 100.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
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
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15.0),
                                                              shape: BoxShape
                                                                  .rectangle,
                                                            ),
                                                            child: Stack(
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          -0.57),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/book_(2).png',
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          0.9),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      '${stackCount.toString()} Available',
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
                                                                                FlutterFlowTheme.of(context).accent2,
                                                                            fontSize:
                                                                                10.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          0.59),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'l87yaj3s' /* Lesson Plan */,
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Ubuntu',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize:
                                                                                15.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
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
                                                );
                                              },
                                            ),
                                          ),
                                      () => AuthUserStreamWidget(
                                            builder: (context) =>
                                                FutureBuilder<int>(
                                              future:
                                                  queryStudyMaterialRecordCount(
                                                queryBuilder:
                                                    (studyMaterialRecord) =>
                                                        studyMaterialRecord
                                                            .where(
                                                              'Type',
                                                              isEqualTo:
                                                                  valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.trade,
                                                                      ''),
                                                            )
                                                            .where(
                                                              'Content',
                                                              isEqualTo:
                                                                  'Demo Plan',
                                                            ),
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
                                                int stackCount = snapshot.data!;
                                                return Stack(
                                                  children: [
                                                    if (stackCount > 0)
                                                      Padding(
                                                        padding: const EdgeInsets.all(
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
                                                            if ((valueOrDefault<
                                                                            bool>(
                                                                        currentUserDocument
                                                                            ?.isPremium,
                                                                        false) ==
                                                                    false) &&
                                                                (currentUserDocument!
                                                                        .premiumTill! <
                                                                    getCurrentTimestamp)) {
                                                              _model.interstitialAdddSuccess1Copy5CopyCopy =
                                                                  await admob
                                                                      .showInterstitialAd();
                                                            } else {
                                                              await Future.delayed(
                                                                  const Duration(
                                                                      milliseconds:
                                                                          0));
                                                            }

                                                            context.pushNamed(
                                                              'StudyView',
                                                              queryParameters: {
                                                                'contentType':
                                                                    serializeParam(
                                                                  'Demo Plan',
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'filterType':
                                                                    serializeParam(
                                                                  valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.trade,
                                                                      ''),
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );

                                                            setState(() {});
                                                          },
                                                          child: Container(
                                                            height: 100.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
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
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15.0),
                                                              shape: BoxShape
                                                                  .rectangle,
                                                            ),
                                                            child: Stack(
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          -0.57),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/homework.png',
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          0.62),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'tqfg2er6' /* Demo Plan */,
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Ubuntu',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize:
                                                                                15.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          0.9),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      '${stackCount.toString()} Available',
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
                                                                                FlutterFlowTheme.of(context).accent2,
                                                                            fontSize:
                                                                                10.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
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
                                                );
                                              },
                                            ),
                                          ),
                                      () => AuthUserStreamWidget(
                                            builder: (context) =>
                                                FutureBuilder<int>(
                                              future:
                                                  queryStudyMaterialRecordCount(
                                                queryBuilder:
                                                    (studyMaterialRecord) =>
                                                        studyMaterialRecord
                                                            .where(
                                                              'Type',
                                                              isEqualTo:
                                                                  valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.trade,
                                                                      ''),
                                                            )
                                                            .where(
                                                              'Content',
                                                              isEqualTo:
                                                                  'E-Book',
                                                            ),
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
                                                int stackCount = snapshot.data!;
                                                return Stack(
                                                  children: [
                                                    if (stackCount > 0)
                                                      Padding(
                                                        padding: const EdgeInsets.all(
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
                                                            if ((valueOrDefault<
                                                                            bool>(
                                                                        currentUserDocument
                                                                            ?.isPremium,
                                                                        false) ==
                                                                    false) &&
                                                                (currentUserDocument!
                                                                        .premiumTill! <
                                                                    getCurrentTimestamp)) {
                                                              _model.interstitialAdSuccesxxvxs1Cfopy5CopyCopy2 =
                                                                  await admob
                                                                      .showInterstitialAd();
                                                            } else {
                                                              await Future.delayed(
                                                                  const Duration(
                                                                      milliseconds:
                                                                          0));
                                                            }

                                                            context.pushNamed(
                                                              'StudyView',
                                                              queryParameters: {
                                                                'contentType':
                                                                    serializeParam(
                                                                  'E-Book',
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'filterType':
                                                                    serializeParam(
                                                                  valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.trade,
                                                                      ''),
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );

                                                            setState(() {});
                                                          },
                                                          child: Container(
                                                            width: 250.0,
                                                            height: 100.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
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
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15.0),
                                                              shape: BoxShape
                                                                  .rectangle,
                                                            ),
                                                            child: Stack(
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          -0.57),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/e-learning.png',
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          0.59),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '413sqm09' /* E-Books */,
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Ubuntu',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize:
                                                                                15.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          0.9),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      '${stackCount.toString()} Available',
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
                                                                                FlutterFlowTheme.of(context).accent2,
                                                                            fontSize:
                                                                                10.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
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
                                                );
                                              },
                                            ),
                                          ),
                                      () => AuthUserStreamWidget(
                                            builder: (context) =>
                                                FutureBuilder<int>(
                                              future: queryTestRecordCount(
                                                queryBuilder: (testRecord) =>
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
                                                int stackCount = snapshot.data!;
                                                return Stack(
                                                  children: [
                                                    if (stackCount > 0)
                                                      Padding(
                                                        padding: const EdgeInsets.all(
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
                                                            if ((valueOrDefault<
                                                                            bool>(
                                                                        currentUserDocument
                                                                            ?.isPremium,
                                                                        false) ==
                                                                    false) &&
                                                                (currentUserDocument!
                                                                        .premiumTill! <
                                                                    getCurrentTimestamp)) {
                                                              _model.interstitialAdsdsdSuccccess1Copy5CopyCopy4Copy =
                                                                  await admob
                                                                      .showInterstitialAd();
                                                            } else {
                                                              await Future.delayed(
                                                                  const Duration(
                                                                      milliseconds:
                                                                          0));
                                                            }

                                                            context.pushNamed(
                                                              'TestSeries',
                                                              queryParameters: {
                                                                'type':
                                                                    serializeParam(
                                                                  2,
                                                                  ParamType.int,
                                                                ),
                                                              }.withoutNulls,
                                                            );

                                                            setState(() {});
                                                          },
                                                          child: Container(
                                                            width: 250.0,
                                                            height: 100.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
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
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15.0),
                                                              shape: BoxShape
                                                                  .rectangle,
                                                            ),
                                                            child: Stack(
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          -0.57),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/search.png',
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          0.59),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'gln0xt4w' /* Test Series */,
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Ubuntu',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize:
                                                                                15.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          0.9),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      '${stackCount.toString()} Available',
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
                                                                                FlutterFlowTheme.of(context).accent2,
                                                                            fontSize:
                                                                                10.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
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
                                                );
                                              },
                                            ),
                                          ),
                                      () => AuthUserStreamWidget(
                                            builder: (context) =>
                                                FutureBuilder<int>(
                                              future:
                                                  queryStudyMaterialRecordCount(
                                                queryBuilder:
                                                    (studyMaterialRecord) =>
                                                        studyMaterialRecord
                                                            .where(
                                                              'Type',
                                                              isEqualTo:
                                                                  valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.trade,
                                                                      ''),
                                                            )
                                                            .where(
                                                              'Content',
                                                              isEqualTo:
                                                                  'Notes',
                                                            ),
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
                                                int stackCount = snapshot.data!;
                                                return Stack(
                                                  children: [
                                                    if (stackCount > 0)
                                                      Padding(
                                                        padding: const EdgeInsets.all(
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
                                                            if ((valueOrDefault<
                                                                            bool>(
                                                                        currentUserDocument
                                                                            ?.isPremium,
                                                                        false) ==
                                                                    false) &&
                                                                (currentUserDocument!
                                                                        .premiumTill! <
                                                                    getCurrentTimestamp)) {
                                                              _model.interstitialAdbSucccessds1Copy5CopyCopy3 =
                                                                  await admob
                                                                      .showInterstitialAd();
                                                            } else {
                                                              await Future.delayed(
                                                                  const Duration(
                                                                      milliseconds:
                                                                          0));
                                                            }

                                                            context.pushNamed(
                                                              'StudyView',
                                                              queryParameters: {
                                                                'contentType':
                                                                    serializeParam(
                                                                  'Notes',
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'filterType':
                                                                    serializeParam(
                                                                  valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.trade,
                                                                      ''),
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );

                                                            setState(() {});
                                                          },
                                                          child: Container(
                                                            width: 250.0,
                                                            height: 100.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
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
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15.0),
                                                              shape: BoxShape
                                                                  .rectangle,
                                                            ),
                                                            child: Stack(
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          -0.57),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/notes.png',
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          0.59),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'i992wktl' /* Notes */,
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Ubuntu',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize:
                                                                                15.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          0.9),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      '${stackCount.toString()} Available',
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
                                                                                FlutterFlowTheme.of(context).accent2,
                                                                            fontSize:
                                                                                10.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
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
                                                );
                                              },
                                            ),
                                          ),
                                      () => AuthUserStreamWidget(
                                            builder: (context) =>
                                                FutureBuilder<int>(
                                              future:
                                                  queryStudyMaterialRecordCount(
                                                queryBuilder:
                                                    (studyMaterialRecord) =>
                                                        studyMaterialRecord
                                                            .where(
                                                              'Type',
                                                              isEqualTo:
                                                                  valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.trade,
                                                                      ''),
                                                            )
                                                            .where(
                                                              'Content',
                                                              isEqualTo:
                                                                  'Video',
                                                            ),
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
                                                int stackCount = snapshot.data!;
                                                return Stack(
                                                  children: [
                                                    if (stackCount > 0)
                                                      Padding(
                                                        padding: const EdgeInsets.all(
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
                                                            if ((valueOrDefault<
                                                                            bool>(
                                                                        currentUserDocument
                                                                            ?.isPremium,
                                                                        false) ==
                                                                    false) &&
                                                                (currentUserDocument!
                                                                        .premiumTill! <
                                                                    getCurrentTimestamp)) {
                                                              _model.interstitialAdSuccfdddvcvess1Copy5CopyCopy4 =
                                                                  await admob
                                                                      .showInterstitialAd();
                                                            } else {
                                                              await Future.delayed(
                                                                  const Duration(
                                                                      milliseconds:
                                                                          0));
                                                            }

                                                            context.pushNamed(
                                                              'StudyView',
                                                              queryParameters: {
                                                                'contentType':
                                                                    serializeParam(
                                                                  'Video',
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'filterType':
                                                                    serializeParam(
                                                                  valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.trade,
                                                                      ''),
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );

                                                            setState(() {});
                                                          },
                                                          child: Container(
                                                            width: 250.0,
                                                            height: 100.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
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
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15.0),
                                                              shape: BoxShape
                                                                  .rectangle,
                                                            ),
                                                            child: Stack(
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          -0.57),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/video-player.png',
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          0.59),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'zlwkt5sq' /* Videos */,
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Ubuntu',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize:
                                                                                15.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          0.9),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      '${stackCount.toString()} Available',
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
                                                                                FlutterFlowTheme.of(context).accent2,
                                                                            fontSize:
                                                                                10.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
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
                                                );
                                              },
                                            ),
                                          ),
                                    ][index]();
                                  },
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
    );
  }
}
