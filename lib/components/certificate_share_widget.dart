import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'certificate_share_model.dart';
export 'certificate_share_model.dart';

class CertificateShareWidget extends StatefulWidget {
  const CertificateShareWidget({
    super.key,
    required this.marks,
    this.testName,
  });

  final String? marks;
  final String? testName;

  @override
  _CertificateShareWidgetState createState() => _CertificateShareWidgetState();
}

class _CertificateShareWidgetState extends State<CertificateShareWidget> {
  late CertificateShareModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CertificateShareModel());

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

    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: 550.0,
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
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: AuthUserStreamWidget(
              builder: (context) => SizedBox(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: 550.0,
                child: custom_widgets.Certificate(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 550.0,
                  name: currentUserDisplayName,
                  marks: widget.marks!,
                  testName: widget.testName!,
                  sa: 'I\'m Preparing for CITS Exams 2024',
                  img:
                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/b-h-r01-aayra-institute-ts1xj9/assets/jn8etbyf4d4f/White_modern_corporate_Certificate.png',
                ),
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(1.0, -1.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 20.0, 0.0),
              child: Icon(
                Icons.share_rounded,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 40.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
