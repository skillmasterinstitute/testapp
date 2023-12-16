import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'start_chat_model.dart';
export 'start_chat_model.dart';

class StartChatWidget extends StatefulWidget {
  const StartChatWidget({super.key});

  @override
  _StartChatWidgetState createState() => _StartChatWidgetState();
}

class _StartChatWidgetState extends State<StartChatWidget> {
  late StartChatModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StartChatModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<UserRecord>>(
      stream: queryUserRecord(
        queryBuilder: (userRecord) => userRecord.where(
          'uid',
          isEqualTo: FFAppState().AuthorizedUser.first.id,
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
        List<UserRecord> columnUserRecordList = snapshot.data!;
        final columnUserRecord =
            columnUserRecordList.isNotEmpty ? columnUserRecordList.first : null;
        return InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            context.pushNamed(
              'ChatPage',
              queryParameters: {
                'chatUser': serializeParam(
                  columnUserRecord,
                  ParamType.Document,
                ),
              }.withoutNulls,
              extra: <String, dynamic>{
                'chatUser': columnUserRecord,
              },
            );
          },
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/lottie_animations/animation_lnmj3m8e.json',
                width: 150.0,
                height: 181.0,
                fit: BoxFit.cover,
                animate: true,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        'bqukf5hu' /* Seems you don’t have any chat */,
                      ),
                      textAlign: TextAlign.center,
                      style:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                fontFamily: 'Raleway',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 18.0,
                              ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    context.pushNamed(
                      'ChatPage',
                      queryParameters: {
                        'chatUser': serializeParam(
                          columnUserRecord,
                          ParamType.Document,
                        ),
                      }.withoutNulls,
                      extra: <String, dynamic>{
                        'chatUser': columnUserRecord,
                      },
                    );
                  },
                  text: FFLocalizations.of(context).getText(
                    '8r5w7b2p' /* Chat with HelpDesk */,
                  ),
                  options: FFButtonOptions(
                    padding: const EdgeInsets.all(15.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).tertiary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Lexend Deca',
                          color: FlutterFlowTheme.of(context).primary,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                    elevation: 2.0,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
