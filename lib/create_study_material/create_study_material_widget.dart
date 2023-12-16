import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'create_study_material_model.dart';
export 'create_study_material_model.dart';

class CreateStudyMaterialWidget extends StatefulWidget {
  const CreateStudyMaterialWidget({super.key});

  @override
  _CreateStudyMaterialWidgetState createState() =>
      _CreateStudyMaterialWidgetState();
}

class _CreateStudyMaterialWidgetState extends State<CreateStudyMaterialWidget>
    with TickerProviderStateMixin {
  late CreateStudyMaterialModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateStudyMaterialModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode3 ??= FocusNode();

    _model.textController4 ??= TextEditingController();
    _model.textFieldFocusNode4 ??= FocusNode();

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

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primary,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primary,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          borderWidth: 1.0,
          buttonSize: 60.0,
          icon: const Icon(
            Icons.chevron_left_outlined,
            color: Colors.white,
            size: 30.0,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: Align(
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: Text(
            FFLocalizations.of(context).getText(
              '9osndaou' /* Create Study Material */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  fontSize: 22.0,
                  fontWeight: FontWeight.normal,
                ),
          ),
        ),
        actions: const [],
        centerTitle: true,
      ),
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            Align(
              alignment: const Alignment(0.0, 0),
              child: TabBar(
                labelColor: FlutterFlowTheme.of(context).tertiary,
                labelStyle: FlutterFlowTheme.of(context).titleMedium,
                unselectedLabelStyle: const TextStyle(),
                indicatorColor: FlutterFlowTheme.of(context).tertiary,
                padding: const EdgeInsets.all(4.0),
                tabs: [
                  Tab(
                    text: FFLocalizations.of(context).getText(
                      'd3hlabms' /* Subject */,
                    ),
                  ),
                  Tab(
                    text: FFLocalizations.of(context).getText(
                      'mesuop02' /* Trade */,
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
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      child: Form(
                        key: _model.formKey2,
                        autovalidateMode: AutovalidateMode.always,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20.0, 20.0, 20.0, 16.0),
                              child: StreamBuilder<List<TradesRecord>>(
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
                                  List<TradesRecord> subjectsTradesRecordList =
                                      snapshot.data!;
                                  return FlutterFlowDropDown<String>(
                                    controller:
                                        _model.subjectsValueController ??=
                                            FormFieldController<String>(null),
                                    options: [
                                      FFLocalizations.of(context).getText(
                                        'ql8ccpn3' /* WC&S */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        '3c8o5gzy' /* POT */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        '6ahimztx' /* Soft Skills */,
                                      )
                                    ],
                                    onChanged: (val) async {
                                      setState(
                                          () => _model.subjectsValue = val);
                                      setState(() {
                                        _model.dataToShow =
                                            _model.subjectsValue!;
                                      });
                                    },
                                    width: 300.0,
                                    height: 60.0,
                                    searchHintTextStyle:
                                        FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Raleway',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            ),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Raleway',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                        ),
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      '2d3mpm3v' /* Select Subject... */,
                                    ),
                                    searchHintText:
                                        FFLocalizations.of(context).getText(
                                      'ih3wmzvq' /* Search for an item... */,
                                    ),
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 2.0,
                                    borderColor:
                                        FlutterFlowTheme.of(context).accent4,
                                    borderWidth: 2.0,
                                    borderRadius: 8.0,
                                    margin: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 4.0, 16.0, 4.0),
                                    hidesUnderline: true,
                                    isSearchable: true,
                                    isMultiSelect: false,
                                  );
                                },
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                _model.dataToShow,
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 16.0),
                              child: StreamBuilder<List<TradesRecord>>(
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
                                      typesForSobjectTradesRecordList =
                                      snapshot.data!;
                                  return FlutterFlowDropDown<String>(
                                    controller: _model
                                            .typesForSobjectValueController ??=
                                        FormFieldController<String>(null),
                                    options: FFAppState().Content,
                                    onChanged: (val) async {
                                      setState(() =>
                                          _model.typesForSobjectValue = val);
                                      setState(() {
                                        _model.materialType =
                                            _model.typesForSobjectValue!;
                                      });
                                    },
                                    width: 300.0,
                                    height: 60.0,
                                    searchHintTextStyle:
                                        FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Raleway',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            ),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Raleway',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                        ),
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      'lepwsey8' /* Study Material Type... */,
                                    ),
                                    searchHintText:
                                        FFLocalizations.of(context).getText(
                                      'tv3t2sqi' /* Search for an item... */,
                                    ),
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 2.0,
                                    borderColor:
                                        FlutterFlowTheme.of(context).accent4,
                                    borderWidth: 2.0,
                                    borderRadius: 8.0,
                                    margin: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 4.0, 16.0, 4.0),
                                    hidesUnderline: true,
                                    isSearchable: true,
                                    isMultiSelect: false,
                                  );
                                },
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                _model.materialType,
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 16.0),
                              child: TextFormField(
                                controller: _model.textController1,
                                focusNode: _model.textFieldFocusNode1,
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText:
                                      FFLocalizations.of(context).getText(
                                    '4wf3nb57' /* Title  */,
                                  ),
                                  labelStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  hintStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                                validator: _model.textController1Validator
                                    .asValidator(context),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 16.0),
                              child: TextFormField(
                                controller: _model.textController2,
                                focusNode: _model.textFieldFocusNode2,
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText:
                                      FFLocalizations.of(context).getText(
                                    'k660y1ws' /* Link */,
                                  ),
                                  labelStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  hintStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                                validator: _model.textController2Validator
                                    .asValidator(context),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.05),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 24.0),
                                child: StreamBuilder<List<UserRecord>>(
                                  stream: queryUserRecord(),
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
                                    List<UserRecord> buttonUserRecordList =
                                        snapshot.data!;
                                    return FFButtonWidget(
                                      onPressed: () async {
                                        if (_model.formKey2.currentState ==
                                                null ||
                                            !_model.formKey2.currentState!
                                                .validate()) {
                                          return;
                                        }
                                        if (_model.subjectsValue == null) {
                                          return;
                                        }
                                        if (_model.typesForSobjectValue ==
                                            null) {
                                          return;
                                        }

                                        await StudyMaterialRecord.collection
                                            .doc()
                                            .set(createStudyMaterialRecordData(
                                              type: _model.subjectsValue,
                                              createdDate: getCurrentTimestamp,
                                              content:
                                                  _model.typesForSobjectValue,
                                              file: _model.textController2.text,
                                              title:
                                                  _model.textController1.text,
                                              studentRefernce:
                                                  currentUserReference,
                                            ));
                                        setState(() {
                                          _model.subjectsValueController
                                              ?.reset();
                                          _model.typesForSobjectValueController
                                              ?.reset();
                                          _model.typesValueController?.reset();
                                          _model.tradesValueController?.reset();
                                        });
                                        setState(() {
                                          _model.textController2?.clear();
                                          _model.textController1?.clear();
                                          _model.textController3?.clear();
                                          _model.textController4?.clear();
                                        });
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Content Created!!!',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                const Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                          ),
                                        );
                                        triggerPushNotification(
                                          notificationTitle:
                                              'New Study Material Added! 📚',
                                          notificationText:
                                              'New ${_model.materialType} Available for ${_model.dataToShow}',
                                          notificationSound: 'default',
                                          userRefs: buttonUserRecordList
                                              .map((e) => e.reference)
                                              .toList(),
                                          initialPageName: 'StudyMaterial',
                                          parameterData: {
                                            'type': valueOrDefault<int>(
                                              _model.dataToShow == 'POT'
                                                  ? 0
                                                  : 1,
                                              0,
                                            ),
                                          },
                                        );
                                        setState(() {
                                          _model.dataToShow = 'Sachin Saini';
                                          _model.materialType = '';
                                        });
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'zsj1ytc6' /* Add Study Material */,
                                      ),
                                      options: FFButtonOptions(
                                        width: 270.0,
                                        height: 50.0,
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: const Color(0xFF4B39EF),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily: 'Plus Jakarta Sans',
                                              color: Colors.white,
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        elevation: 2.0,
                                        borderSide: const BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      showLoadingIndicator: false,
                                    );
                                  },
                                ),
                              ),
                            ),
                            Container(
                              width: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Form(
                    key: _model.formKey1,
                    autovalidateMode: AutovalidateMode.always,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 20.0, 16.0),
                          child: StreamBuilder<List<TradesRecord>>(
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
                              List<TradesRecord> tradesTradesRecordList =
                                  snapshot.data!;
                              return FlutterFlowDropDown<String>(
                                controller: _model.tradesValueController ??=
                                    FormFieldController<String>(null),
                                options: tradesTradesRecordList
                                    .map((e) => e.trades)
                                    .toList(),
                                onChanged: (val) async {
                                  setState(() => _model.tradesValue = val);
                                  setState(() {
                                    _model.dataToShow = _model.tradesValue!;
                                  });
                                },
                                width: 300.0,
                                height: 60.0,
                                searchHintTextStyle:
                                    FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Raleway',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                        ),
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Raleway',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                hintText: FFLocalizations.of(context).getText(
                                  'zbjwi40b' /* Select Trade... */,
                                ),
                                searchHintText:
                                    FFLocalizations.of(context).getText(
                                  '51io2ryg' /* Search for an item... */,
                                ),
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                elevation: 2.0,
                                borderColor:
                                    FlutterFlowTheme.of(context).accent4,
                                borderWidth: 2.0,
                                borderRadius: 8.0,
                                margin: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 4.0, 16.0, 4.0),
                                hidesUnderline: true,
                                isSearchable: true,
                                isMultiSelect: false,
                              );
                            },
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            _model.dataToShow,
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 16.0),
                          child: StreamBuilder<List<TradesRecord>>(
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
                              List<TradesRecord> typesTradesRecordList =
                                  snapshot.data!;
                              return FlutterFlowDropDown<String>(
                                controller: _model.typesValueController ??=
                                    FormFieldController<String>(null),
                                options: FFAppState().Content,
                                onChanged: (val) async {
                                  setState(() => _model.typesValue = val);
                                  setState(() {
                                    _model.materialType = _model.typesValue!;
                                  });
                                },
                                width: 300.0,
                                height: 60.0,
                                searchHintTextStyle:
                                    FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Raleway',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                        ),
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Raleway',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                hintText: FFLocalizations.of(context).getText(
                                  'uqg4ycn5' /* Study Material Type... */,
                                ),
                                searchHintText:
                                    FFLocalizations.of(context).getText(
                                  '1gzegvkl' /* Search for an item... */,
                                ),
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                elevation: 2.0,
                                borderColor:
                                    FlutterFlowTheme.of(context).accent4,
                                borderWidth: 2.0,
                                borderRadius: 8.0,
                                margin: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 4.0, 16.0, 4.0),
                                hidesUnderline: true,
                                isSearchable: true,
                                isMultiSelect: false,
                              );
                            },
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            _model.materialType,
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 16.0),
                          child: TextFormField(
                            controller: _model.textController3,
                            focusNode: _model.textFieldFocusNode3,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: FFLocalizations.of(context).getText(
                                'ixbzoier' /* Title  */,
                              ),
                              labelStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              hintStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            validator: _model.textController3Validator
                                .asValidator(context),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 16.0),
                          child: TextFormField(
                            controller: _model.textController4,
                            focusNode: _model.textFieldFocusNode4,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: FFLocalizations.of(context).getText(
                                'st0c7s1e' /* Link */,
                              ),
                              labelStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              hintStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            validator: _model.textController4Validator
                                .asValidator(context),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.05),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 24.0),
                            child: StreamBuilder<List<UserRecord>>(
                              stream: queryUserRecord(
                                queryBuilder: (userRecord) => userRecord.where(
                                  'Trade',
                                  isEqualTo: _model.tradesValue,
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
                                List<UserRecord> buttonUserRecordList =
                                    snapshot.data!;
                                return FFButtonWidget(
                                  onPressed: () async {
                                    if (_model.formKey1.currentState == null ||
                                        !_model.formKey1.currentState!
                                            .validate()) {
                                      return;
                                    }
                                    if (_model.tradesValue == null) {
                                      return;
                                    }
                                    if (_model.typesValue == null) {
                                      return;
                                    }

                                    await StudyMaterialRecord.collection
                                        .doc()
                                        .set(createStudyMaterialRecordData(
                                          type: _model.tradesValue,
                                          createdDate: getCurrentTimestamp,
                                          content: _model.typesValue,
                                          file: _model.textController4.text,
                                          title: _model.textController3.text,
                                          studentRefernce: currentUserReference,
                                        ));
                                    setState(() {
                                      _model.subjectsValueController?.reset();
                                      _model.typesForSobjectValueController
                                          ?.reset();
                                      _model.typesValueController?.reset();
                                      _model.tradesValueController?.reset();
                                    });
                                    setState(() {
                                      _model.textController2?.clear();
                                      _model.textController1?.clear();
                                      _model.textController3?.clear();
                                      _model.textController4?.clear();
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Content Created!!!',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                        duration: const Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .tertiary,
                                      ),
                                    );
                                    triggerPushNotification(
                                      notificationTitle:
                                          'New Study Material Added! 📚',
                                      notificationText:
                                          'New ${_model.materialType} Available for your Trade',
                                      notificationSound: 'default',
                                      userRefs: buttonUserRecordList
                                          .map((e) => e.reference)
                                          .toList(),
                                      initialPageName: 'StudyMaterial',
                                      parameterData: {
                                        'type': 2,
                                      },
                                    );
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'mhcobr4d' /* Add Study Material */,
                                  ),
                                  options: FFButtonOptions(
                                    width: 270.0,
                                    height: 50.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: const Color(0xFF4B39EF),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily: 'Plus Jakarta Sans',
                                          color: Colors.white,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    elevation: 2.0,
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  showLoadingIndicator: false,
                                );
                              },
                            ),
                          ),
                        ),
                        Container(
                          width: 100.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
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
