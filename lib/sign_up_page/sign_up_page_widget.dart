import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/permissions_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'sign_up_page_model.dart';
export 'sign_up_page_model.dart';

class SignUpPageWidget extends StatefulWidget {
  const SignUpPageWidget({super.key});

  @override
  _SignUpPageWidgetState createState() => _SignUpPageWidgetState();
}

class _SignUpPageWidgetState extends State<SignUpPageWidget>
    with TickerProviderStateMixin {
  late SignUpPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'lottieAnimationOnPageLoadAnimation': AnimationInfo(
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
    _model = createModel(context, () => SignUpPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await requestPermission(cameraPermission);
      await requestPermission(notificationsPermission);
      await requestPermission(photoLibraryPermission);
    });

    _model.emailAddressController ??= TextEditingController();
    _model.emailAddressFocusNode ??= FocusNode();

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

    return StreamBuilder<List<UserRecord>>(
      stream: queryUserRecord(
        queryBuilder: (userRecord) => userRecord.where(
          'Trade',
          isEqualTo: _model.dropDownValue2,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
        List<UserRecord> signUpPageUserRecordList = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              body: Align(
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
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 30.0, 0.0, 15.0),
                          child: Container(
                            width: double.infinity,
                            height: 70.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                FFAppState().AppName,
                                textAlign: TextAlign.center,
                                style:
                                    FlutterFlowTheme.of(context).headlineMedium,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Lottie.network(
                              'https://assets4.lottiefiles.com/packages/lf20_nc1bp7st.json',
                              width: 150.0,
                              height: 150.0,
                              fit: BoxFit.contain,
                              animate: true,
                            ).animateOnPageLoad(animationsMap[
                                'lottieAnimationOnPageLoadAnimation']!),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            width: double.infinity,
                            constraints: const BoxConstraints(
                              maxWidth: 570.0,
                            ),
                            decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 4.0,
                                  color: Color(0x33000000),
                                  offset: Offset(0.0, 2.0),
                                )
                              ],
                              gradient: LinearGradient(
                                colors: [
                                  FlutterFlowTheme.of(context).secondary,
                                  FlutterFlowTheme.of(context).primary
                                ],
                                stops: const [0.0, 1.0],
                                begin: const AlignmentDirectional(0.0, -1.0),
                                end: const AlignmentDirectional(0, 1.0),
                              ),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsets.all(24.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '3vfn7dop' /* Create an account */,
                                          ),
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .displaySmall
                                              .override(
                                                fontFamily: 'Raleway',
                                                fontSize: 30.0,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 12.0, 0.0, 24.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'yaienss0' /* Let's get started by filling o... */,
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .labelLarge,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 16.0),
                                          child: SizedBox(
                                            width: double.infinity,
                                            child: TextFormField(
                                              controller:
                                                  _model.emailAddressController,
                                              focusNode:
                                                  _model.emailAddressFocusNode,
                                              autofillHints: const [
                                                AutofillHints.telephoneNumber
                                              ],
                                              textCapitalization:
                                                  TextCapitalization.none,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'axfb31cq' /* Phone No */,
                                                ),
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .override(
                                                          fontFamily: 'Raleway',
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .accent4,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          40.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiary,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          40.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          40.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          40.0),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                contentPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(30.0, 24.0,
                                                            24.0, 24.0),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge,
                                              keyboardType: TextInputType.phone,
                                              validator: _model
                                                  .emailAddressControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 16.0),
                                          child: StreamBuilder<
                                              List<CollegesRecord>>(
                                            stream: queryCollegesRecord(),
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
                                              List<CollegesRecord>
                                                  dropDownCollegesRecordList =
                                                  snapshot.data!;
                                              return FlutterFlowDropDown<
                                                  String>(
                                                controller: _model
                                                        .dropDownValueController1 ??=
                                                    FormFieldController<String>(
                                                        null),
                                                options:
                                                    dropDownCollegesRecordList
                                                        .map((e) => e.nsti)
                                                        .toList(),
                                                onChanged: (val) => setState(
                                                    () => _model
                                                        .dropDownValue1 = val),
                                                width: double.infinity,
                                                height: 60.0,
                                                searchHintTextStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                                hintText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'sy1cwmk2' /* Select NSTI */,
                                                ),
                                                searchHintText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'ykpiqqq3' /* Search for an State */,
                                                ),
                                                icon: Icon(
                                                  Icons
                                                      .keyboard_arrow_down_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24.0,
                                                ),
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                elevation: 2.0,
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .accent3,
                                                borderWidth: 2.0,
                                                borderRadius: 40.0,
                                                margin: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 4.0, 16.0, 4.0),
                                                hidesUnderline: true,
                                                isSearchable: true,
                                                isMultiSelect: false,
                                              );
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 16.0),
                                          child:
                                              StreamBuilder<List<TradesRecord>>(
                                            stream: queryTradesRecord(),
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
                                              List<TradesRecord>
                                                  dropDownTradesRecordList =
                                                  snapshot.data!;
                                              return FlutterFlowDropDown<
                                                  String>(
                                                controller: _model
                                                        .dropDownValueController2 ??=
                                                    FormFieldController<String>(
                                                        null),
                                                options:
                                                    dropDownTradesRecordList
                                                        .map((e) => e.trades)
                                                        .toList(),
                                                onChanged: (val) async {
                                                  setState(() => _model
                                                      .dropDownValue2 = val);
                                                  setState(() {});
                                                },
                                                width: double.infinity,
                                                height: 60.0,
                                                searchHintTextStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                                hintText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'ge3etv5t' /* Select Trade */,
                                                ),
                                                searchHintText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'lwcgdv33' /* Search for an State */,
                                                ),
                                                icon: Icon(
                                                  Icons
                                                      .keyboard_arrow_down_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24.0,
                                                ),
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                elevation: 2.0,
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .accent3,
                                                borderWidth: 2.0,
                                                borderRadius: 40.0,
                                                margin: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 4.0, 16.0, 4.0),
                                                hidesUnderline: true,
                                                isSearchable: true,
                                                isMultiSelect: false,
                                              );
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 16.0),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.989,
                                            height: 68.0,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                  FlutterFlowTheme.of(context)
                                                      .secondary
                                                ],
                                                stops: const [0.0, 1.0],
                                                begin: const AlignmentDirectional(
                                                    1.0, -1.0),
                                                end: const AlignmentDirectional(
                                                    -1.0, 1.0),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(35.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBtnText,
                                                width: 2.0,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Lottie.asset(
                                                    'assets/lottie_animations/animation_lnvrso0p.json',
                                                    width: 40.0,
                                                    height: 40.0,
                                                    fit: BoxFit.cover,
                                                    animate: _model
                                                        .lottieAnimationStatus2),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'mdcnn7wr' /* I'm Male */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Raleway',
                                                        fontSize: 12.0,
                                                      ),
                                                ),
                                                Switch(
                                                  value: _model.switchValue ??=
                                                      false,
                                                  onChanged: (newValue) async {
                                                    setState(() =>
                                                        _model.switchValue =
                                                            newValue);
                                                    if (newValue) {
                                                      setState(() => _model
                                                              .lottieAnimationStatus3 =
                                                          !_model
                                                              .lottieAnimationStatus3);
                                                    } else {
                                                      setState(() => _model
                                                              .lottieAnimationStatus2 =
                                                          !_model
                                                              .lottieAnimationStatus2);
                                                    }
                                                  },
                                                  activeColor:
                                                      const Color(0xFF863F38),
                                                  activeTrackColor:
                                                      const Color(0xFF863F38),
                                                  inactiveTrackColor:
                                                      const Color(0xFF005421),
                                                  inactiveThumbColor:
                                                      const Color(0xFF005421),
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '27gt5j6o' /* I'm Female */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Raleway',
                                                        fontSize: 12.0,
                                                      ),
                                                ),
                                                Lottie.asset(
                                                    'assets/lottie_animations/animation_lnvrsw33.json',
                                                    width: 40.0,
                                                    height: 40.0,
                                                    fit: BoxFit.cover,
                                                    animate: _model
                                                        .lottieAnimationStatus3),
                                              ],
                                            ),
                                          ),
                                        ),
                                        if (((_model.emailAddressController
                                                            .text !=
                                                        '') &&
                                                (_model.dropDownValue1 !=
                                                        null &&
                                                    _model.dropDownValue1 !=
                                                        '')) &&
                                            (_model.dropDownValue2 != null &&
                                                    _model.dropDownValue2 != ''
                                                ? true
                                                : false))
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 16.0),
                                              child: StreamBuilder<
                                                  List<TradesRecord>>(
                                                stream: queryTradesRecord(
                                                  queryBuilder:
                                                      (tradesRecord) =>
                                                          tradesRecord.where(
                                                    'TRADES',
                                                    isEqualTo:
                                                        _model.dropDownValue2,
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
                                                  List<TradesRecord>
                                                      buttonTradesRecordList =
                                                      snapshot.data!;
                                                  return FFButtonWidget(
                                                    onPressed: () async {
                                                      await currentUserReference!
                                                          .update(
                                                              createUserRecordData(
                                                        createdTime:
                                                            getCurrentTimestamp,
                                                        isPremium: false,
                                                        profileCompleteD: true,
                                                        nsti: _model
                                                            .dropDownValue1,
                                                        trade: _model
                                                            .dropDownValue2,
                                                        subjectType:
                                                            buttonTradesRecordList
                                                                .first.subject,
                                                        gender:
                                                            _model.switchValue ==
                                                                    true
                                                                ? 'Female'
                                                                : 'Male',
                                                        premiumTill:
                                                            getCurrentTimestamp,
                                                        phoneNumber: _model
                                                            .emailAddressController
                                                            .text,
                                                      ));
                                                      triggerPushNotification(
                                                        notificationTitle:
                                                            'New App Download',
                                                        notificationText:
                                                            '$currentUserDisplayName from ${_model.dropDownValue1} has Joined!',
                                                        notificationSound:
                                                            'default',
                                                        userRefs: FFAppState()
                                                            .AuthorizedUser
                                                            .toList(),
                                                        initialPageName:
                                                            'AddToChat',
                                                        parameterData: {},
                                                      );
                                                      triggerPushNotification(
                                                        notificationTitle:
                                                            'Your Friend Joined Us!',
                                                        notificationText:
                                                            '$currentUserDisplayName from ${_model.dropDownValue2} has Joined CITS Exam Preparation',
                                                        notificationSound:
                                                            'default',
                                                        userRefs:
                                                            signUpPageUserRecordList
                                                                .map((e) =>
                                                                    e.reference)
                                                                .toList(),
                                                        initialPageName:
                                                            'TestSeries',
                                                        parameterData: {
                                                          'type': 0,
                                                        },
                                                      );

                                                      context
                                                          .goNamed('HomePage');
                                                    },
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      '0mt0e8jd' /* Get Started */,
                                                    ),
                                                    icon: const Icon(
                                                      Icons.account_circle,
                                                      size: 15.0,
                                                    ),
                                                    options: FFButtonOptions(
                                                      width: 230.0,
                                                      height: 52.0,
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      iconPadding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Raleway',
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                      elevation: 3.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              40.0),
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
                              ],
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
        );
      },
    );
  }
}
