import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'upload_study_material_model.dart';
export 'upload_study_material_model.dart';

class UploadStudyMaterialWidget extends StatefulWidget {
  const UploadStudyMaterialWidget({super.key});

  @override
  _UploadStudyMaterialWidgetState createState() =>
      _UploadStudyMaterialWidgetState();
}

class _UploadStudyMaterialWidgetState extends State<UploadStudyMaterialWidget>
    with TickerProviderStateMixin {
  late UploadStudyMaterialModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UploadStudyMaterialModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 1,
      initialIndex: 0,
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

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondary,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primary,
        automaticallyImplyLeading: false,
        title: AutoSizeText(
          FFLocalizations.of(context).getText(
            'qd6apxk5' /* CITS Exam Preparation App */,
          ),
          style: FlutterFlowTheme.of(context).headlineMedium.override(
                fontFamily: 'Outfit',
                color: FlutterFlowTheme.of(context).secondaryBackground,
                fontSize: 22.0,
                fontWeight: FontWeight.normal,
              ),
        ),
        actions: const [],
        centerTitle: true,
      ),
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
                        'kchrtmgz' /* Share Study Material */,
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
                    Form(
                      key: _model.formKey,
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
                                  onChanged: (val) =>
                                      setState(() => _model.tradesValue = val),
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
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                  hintText: FFLocalizations.of(context).getText(
                                    'zjl42e65' /* Select Trade... */,
                                  ),
                                  searchHintText:
                                      FFLocalizations.of(context).getText(
                                    'uyhiuk92' /* Search for an item... */,
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
                                  onChanged: (val) =>
                                      setState(() => _model.typesValue = val),
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
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                  hintText: FFLocalizations.of(context).getText(
                                    'yhfrpbw8' /* Study Material Type... */,
                                  ),
                                  searchHintText:
                                      FFLocalizations.of(context).getText(
                                    'tlmvocjx' /* Search for an item... */,
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
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 20.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                final selectedMedia = await selectMedia(
                                  mediaSource: MediaSource.photoGallery,
                                  multiImage: false,
                                );
                                if (selectedMedia != null &&
                                    selectedMedia.every((m) =>
                                        validateFileFormat(
                                            m.storagePath, context))) {
                                  setState(() => _model.isDataUploading = true);
                                  var selectedUploadedFiles =
                                      <FFUploadedFile>[];

                                  var downloadUrls = <String>[];
                                  try {
                                    selectedUploadedFiles = selectedMedia
                                        .map((m) => FFUploadedFile(
                                              name:
                                                  m.storagePath.split('/').last,
                                              bytes: m.bytes,
                                              height: m.dimensions?.height,
                                              width: m.dimensions?.width,
                                              blurHash: m.blurHash,
                                            ))
                                        .toList();

                                    downloadUrls = (await Future.wait(
                                      selectedMedia.map(
                                        (m) async => await uploadData(
                                            m.storagePath, m.bytes),
                                      ),
                                    ))
                                        .where((u) => u != null)
                                        .map((u) => u!)
                                        .toList();
                                  } finally {
                                    _model.isDataUploading = false;
                                  }
                                  if (selectedUploadedFiles.length ==
                                          selectedMedia.length &&
                                      downloadUrls.length ==
                                          selectedMedia.length) {
                                    setState(() {
                                      _model.uploadedLocalFile =
                                          selectedUploadedFiles.first;
                                      _model.uploadedFileUrl =
                                          downloadUrls.first;
                                    });
                                  } else {
                                    setState(() {});
                                    return;
                                  }
                                }
                              },
                              text: FFLocalizations.of(context).getText(
                                'k1pmjct4' /* Upload Files */,
                              ),
                              icon: const Icon(
                                Icons.upload_rounded,
                                size: 15.0,
                              ),
                              options: FFButtonOptions(
                                height: 57.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Raleway',
                                      color: Colors.white,
                                      fontSize: 18.0,
                                    ),
                                elevation: 3.0,
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.05),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 24.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  if (_model.formKey.currentState == null ||
                                      !_model.formKey.currentState!
                                          .validate()) {
                                    return;
                                  }
                                  if (_model.tradesValue == null) {
                                    return;
                                  }
                                  if (_model.typesValue == null) {
                                    return;
                                  }
                                  if (_model.uploadedFileUrl.isEmpty) {
                                    return;
                                  }

                                  await StudyMaterialRecord.collection
                                      .doc()
                                      .set(createStudyMaterialRecordData(
                                        type: _model.tradesValue,
                                        createdDate: getCurrentTimestamp,
                                        content: _model.typesValue,
                                        file: _model.uploadedFileUrl,
                                        studentRefernce: currentUserReference,
                                      ));
                                  setState(() {
                                    _model.typesValueController?.reset();
                                    _model.tradesValueController?.reset();
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Content Created!!!',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: const Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                    ),
                                  );
                                  triggerPushNotification(
                                    notificationTitle:
                                        'New Study Material Added by Student',
                                    notificationText:
                                        'Student Shared Study Material',
                                    notificationSound: 'default',
                                    userRefs:
                                        FFAppState().AuthorizedUser.toList(),
                                    initialPageName: 'StudyMaterial',
                                    parameterData: {
                                      'type': 2,
                                    },
                                  );
                                },
                                text: FFLocalizations.of(context).getText(
                                  'bq5b5plp' /* Submit */,
                                ),
                                icon: const Icon(
                                  Icons.save,
                                  size: 15.0,
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
      ),
    );
  }
}
