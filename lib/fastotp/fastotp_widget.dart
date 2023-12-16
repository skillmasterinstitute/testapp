import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'fastotp_model.dart';
export 'fastotp_model.dart';

class FastotpWidget extends StatefulWidget {
  const FastotpWidget({
    super.key,
    required this.phoneNo,
    required this.mobile,
  });

  final String? phoneNo;
  final String? mobile;

  @override
  _FastotpWidgetState createState() => _FastotpWidgetState();
}

class _FastotpWidgetState extends State<FastotpWidget> {
  late FastotpModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FastotpModel());

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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Container(
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
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 100.0, 0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  FFLocalizations.of(context).getText(
                    'ngivsujd' /* Verifying your Number */,
                  ),
                  style: FlutterFlowTheme.of(context).headlineSmall,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 8.0, 24.0, 6.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'hwofrtxo' /* Enter the One Time Password se... */,
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodySmall,
                  ),
                ),
                RichText(
                  textScaleFactor: MediaQuery.of(context).textScaleFactor,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: valueOrDefault<String>(
                          widget.mobile,
                          '0',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Raleway',
                              color: FlutterFlowTheme.of(context).alternate,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      TextSpan(
                        text: FFLocalizations.of(context).getText(
                          '8tesg3sd' /*  Wrong number? */,
                        ),
                        style: GoogleFonts.getFont(
                          'Raleway',
                          color: FlutterFlowTheme.of(context).tertiary,
                        ),
                        mouseCursor: SystemMouseCursors.click,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            context.goNamed('PhoneLogin');
                          },
                      )
                    ],
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                  child: PinCodeTextField(
                    autoDisposeControllers: false,
                    appContext: context,
                    length: 4,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Kurale',
                          color: FlutterFlowTheme.of(context).tertiary,
                          fontSize: 18.0,
                        ),
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    enableActiveFill: false,
                    autoFocus: true,
                    enablePinAutofill: true,
                    errorTextSpace: 0.0,
                    showCursor: false,
                    cursorColor: FlutterFlowTheme.of(context).primary,
                    obscureText: false,
                    hintCharacter: '-',
                    keyboardType: TextInputType.number,
                    pinTheme: PinTheme(
                      fieldHeight: 50.0,
                      fieldWidth: 40.0,
                      borderWidth: 2.0,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                      ),
                      shape: PinCodeFieldShape.circle,
                      activeColor: FlutterFlowTheme.of(context).tertiary,
                      inactiveColor: FlutterFlowTheme.of(context).accent4,
                      selectedColor: FlutterFlowTheme.of(context).tertiary,
                      activeFillColor: FlutterFlowTheme.of(context).tertiary,
                      inactiveFillColor: FlutterFlowTheme.of(context).accent4,
                      selectedFillColor: FlutterFlowTheme.of(context).tertiary,
                    ),
                    controller: _model.pinCodeController,
                    onChanged: (_) {},
                    onCompleted: (_) async {
                      if (_model.pinCodeController!.text == widget.phoneNo) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'OTP Verified',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                            duration: const Duration(milliseconds: 4000),
                            backgroundColor:
                                FlutterFlowTheme.of(context).secondary,
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Please Check OTP',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                            duration: const Duration(milliseconds: 4000),
                            backgroundColor:
                                FlutterFlowTheme.of(context).secondary,
                          ),
                        );
                      }

                      if (valueOrDefault<bool>(
                          currentUserDocument?.profileCompleteD, false)) {
                        context.goNamed('HomePage');
                      } else {
                        context.goNamed('SignUpPage');
                      }
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator:
                        _model.pinCodeControllerValidator.asValidator(context),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
