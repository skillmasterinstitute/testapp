import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'o_t_p_login_model.dart';
export 'o_t_p_login_model.dart';

class OTPLoginWidget extends StatefulWidget {
  const OTPLoginWidget({
    super.key,
    required this.phoneNo,
  });

  final String? phoneNo;

  @override
  _OTPLoginWidgetState createState() => _OTPLoginWidgetState();
}

class _OTPLoginWidgetState extends State<OTPLoginWidget> {
  late OTPLoginModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OTPLoginModel());

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
                    'e7s2mhlq' /* Verifying your Number */,
                  ),
                  style: FlutterFlowTheme.of(context).headlineSmall,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 8.0, 24.0, 6.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      '9ajjq8k7' /* Enter the One Time Password se... */,
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
                        text: widget.phoneNo!,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Raleway',
                              color: FlutterFlowTheme.of(context).alternate,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      TextSpan(
                        text: FFLocalizations.of(context).getText(
                          '02sjklqc' /*  Wrong number? */,
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
                    length: 6,
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
                      GoRouter.of(context).prepareAuthEvent();
                      final smsCodeVal = _model.pinCodeController!.text;
                      if (smsCodeVal.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Enter SMS verification code.'),
                          ),
                        );
                        return;
                      }
                      final phoneVerifiedUser = await authManager.verifySmsCode(
                        context: context,
                        smsCode: smsCodeVal,
                      );
                      if (phoneVerifiedUser == null) {
                        return;
                      }

                      if (valueOrDefault<bool>(
                          currentUserDocument?.profileCompleteD, false)) {
                        context.goNamedAuth('HomePage', context.mounted);
                      } else {
                        context.goNamedAuth('SignUpPage', context.mounted);
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
