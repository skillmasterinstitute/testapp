import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'fast2sms_model.dart';
export 'fast2sms_model.dart';

class Fast2smsWidget extends StatefulWidget {
  const Fast2smsWidget({super.key});

  @override
  _Fast2smsWidgetState createState() => _Fast2smsWidgetState();
}

class _Fast2smsWidgetState extends State<Fast2smsWidget> {
  late Fast2smsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Fast2smsModel());

    _model.phoneNumberController1 ??= TextEditingController();
    _model.phoneNumberFocusNode1 ??= FocusNode();

    _model.phoneNumberController2 ??= TextEditingController();
    _model.phoneNumberFocusNode2 ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
          _model.phoneNumberController1?.text =
              FFLocalizations.of(context).getText(
            'gv9ja61q' /* +91 */,
          );
        }));
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
        body: Container(
          width: double.infinity,
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
          child: Align(
            alignment: const AlignmentDirectional(0.0, 1.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(30.0, 60.0, 30.0, 0.0),
                      child: Image.asset(
                        'assets/images/CITS_Exam_Logo_transparent.png',
                        width: 200.0,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Stack(
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                58.0, 78.0, 50.0, 0.0),
                            child: SizedBox(
                              width: MediaQuery.sizeOf(context).width * 0.3,
                              child: TextFormField(
                                controller: _model.phoneNumberController1,
                                focusNode: _model.phoneNumberFocusNode1,
                                autofillHints: const [
                                  AutofillHints.telephoneNumberCountryCode
                                ],
                                readOnly: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText:
                                      FFLocalizations.of(context).getText(
                                    '2orlfz52' /* Code */,
                                  ),
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Raleway',
                                        fontSize: 18.0,
                                      ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Raleway',
                                        fontSize: 16.0,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      width: 2.0,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(25.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(0.0),
                                      topRight: Radius.circular(0.0),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      width: 2.0,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(25.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(0.0),
                                      topRight: Radius.circular(0.0),
                                    ),
                                  ),
                                  errorBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(25.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(0.0),
                                      topRight: Radius.circular(0.0),
                                    ),
                                  ),
                                  focusedErrorBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(25.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(0.0),
                                      topRight: Radius.circular(0.0),
                                    ),
                                  ),
                                  filled: true,
                                  fillColor:
                                      FlutterFlowTheme.of(context).primary,
                                  contentPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          25.0, 24.0, 0.0, 24.0),
                                ),
                                style: FlutterFlowTheme.of(context).titleMedium,
                                maxLines: null,
                                keyboardType: TextInputType.phone,
                                validator: _model
                                    .phoneNumberController1Validator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                88.0, 78.0, 0.0, 0.0),
                            child: SizedBox(
                              width: MediaQuery.sizeOf(context).width * 0.51,
                              child: TextFormField(
                                controller: _model.phoneNumberController2,
                                focusNode: _model.phoneNumberFocusNode2,
                                autofillHints: const [AutofillHints.telephoneNumber],
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText:
                                      FFLocalizations.of(context).getText(
                                    'h93l86pq' /* Phone */,
                                  ),
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Raleway',
                                        fontSize: 18.0,
                                      ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Raleway',
                                        fontSize: 16.0,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      width: 2.0,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(0.0),
                                      topRight: Radius.circular(25.0),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      width: 2.0,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(0.0),
                                      topRight: Radius.circular(25.0),
                                    ),
                                  ),
                                  errorBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(0.0),
                                      topRight: Radius.circular(25.0),
                                    ),
                                  ),
                                  focusedErrorBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(0.0),
                                      topRight: Radius.circular(25.0),
                                    ),
                                  ),
                                  filled: true,
                                  fillColor:
                                      FlutterFlowTheme.of(context).primary,
                                  contentPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          43.0, 24.0, 0.0, 24.0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Raleway',
                                      fontSize: 16.0,
                                    ),
                                maxLines: null,
                                keyboardType: TextInputType.phone,
                                validator: _model
                                    .phoneNumberController2Validator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 170.0, 0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                var shouldSetState = false;
                                setState(() {
                                  _model.otp = random_data
                                      .randomInteger(1001, 9999)
                                      .toString();
                                });
                                _model.apiResultfan =
                                    await OPTVerificationGroup.smsApiCall.call(
                                  variablesValues: _model.otp,
                                  numbers: _model.phoneNumberController2.text,
                                );
                                shouldSetState = true;
                                if ((_model.apiResultfan?.succeeded ?? true)) {
                                  context.pushNamed(
                                    'fastotp',
                                    queryParameters: {
                                      'phoneNo': serializeParam(
                                        _model.otp,
                                        ParamType.String,
                                      ),
                                      'mobile': serializeParam(
                                        _model.phoneNumberController2.text,
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );

                                  setState(() {
                                    _model.otp = '';
                                  });
                                  if (shouldSetState) setState(() {});
                                  return;
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        OPTVerificationGroup.smsApiCall
                                            .message(
                                              (_model.apiResultfan?.jsonBody ??
                                                  ''),
                                            )
                                            .toString(),
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                        ),
                                      ),
                                      duration: const Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                    ),
                                  );
                                  if (shouldSetState) setState(() {});
                                  return;
                                }

                                if (shouldSetState) setState(() {});
                              },
                              text: FFLocalizations.of(context).getText(
                                'hc1s9b1w' /* Sign In */,
                              ),
                              icon: const Icon(
                                Icons.output,
                                size: 20.0,
                              ),
                              options: FFButtonOptions(
                                width: MediaQuery.sizeOf(context).width * 0.4,
                                height: 50.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
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
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
