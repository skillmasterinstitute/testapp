import '/components/start_chat_widget.dart';
import '/flutter_flow/chat/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'all_chat_model.dart';
export 'all_chat_model.dart';

class AllChatWidget extends StatefulWidget {
  const AllChatWidget({super.key});

  @override
  _AllChatWidgetState createState() => _AllChatWidgetState();
}

class _AllChatWidgetState extends State<AllChatWidget> {
  late AllChatModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllChatModel());

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
          'uid',
          isEqualTo: '/user/PXa4SMfMYpXdUXLo9nLgxqiP9853',
        ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
        List<UserRecord> allChatUserRecordList = snapshot.data!;
        final allChatUserRecord = allChatUserRecordList.isNotEmpty
            ? allChatUserRecordList.first
            : null;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primary,
            automaticallyImplyLeading: false,
            title: Text(
              FFLocalizations.of(context).getText(
                'ycbd7vjc' /* All Chats */,
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Raleway',
                    color: FlutterFlowTheme.of(context).primaryBtnText,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            actions: [
              Visibility(
                visible:
                    FFAppState().AuthorizedUser.contains(currentUserReference),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed('AddToChat');
                    },
                    child: Icon(
                      Icons.add_circle_rounded,
                      color: FlutterFlowTheme.of(context).primaryBtnText,
                      size: 30.0,
                    ),
                  ),
                ),
              ),
            ],
            centerTitle: true,
            elevation: 2.0,
          ),
          body: SafeArea(
            top: true,
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
              child: StreamBuilder<List<ChatsRecord>>(
                stream: queryChatsRecord(
                  queryBuilder: (chatsRecord) => chatsRecord
                      .where(
                        'users',
                        arrayContains: currentUserReference,
                      )
                      .orderBy('last_message_time', descending: true),
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
                  List<ChatsRecord> listViewChatsRecordList = snapshot.data!;
                  if (listViewChatsRecordList.isEmpty) {
                    return SizedBox(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 0.5,
                      child: const StartChatWidget(),
                    );
                  }
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewChatsRecordList.length,
                    itemBuilder: (context, listViewIndex) {
                      final listViewChatsRecord =
                          listViewChatsRecordList[listViewIndex];
                      return Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: StreamBuilder<FFChatInfo>(
                            stream: FFChatManager.instance
                                .getChatInfo(chatRecord: listViewChatsRecord),
                            builder: (context, snapshot) {
                              final chatInfo = snapshot.data ??
                                  FFChatInfo(listViewChatsRecord);
                              return FFChatPreview(
                                onTap: () => context.pushNamed(
                                  'ChatPage',
                                  queryParameters: {
                                    'chatUser': serializeParam(
                                      chatInfo.otherUsers.length == 1
                                          ? chatInfo.otherUsersList.first
                                          : null,
                                      ParamType.Document,
                                    ),
                                    'chatRef': serializeParam(
                                      chatInfo.chatRecord.reference,
                                      ParamType.DocumentReference,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'chatUser': chatInfo.otherUsers.length == 1
                                        ? chatInfo.otherUsersList.first
                                        : null,
                                  },
                                ),
                                lastChatText: chatInfo.chatPreviewMessage(),
                                lastChatTime:
                                    listViewChatsRecord.lastMessageTime,
                                seen: listViewChatsRecord.lastMessageSeenBy.contains(currentUserReference),
                                title: chatInfo.chatPreviewTitle(),
                                userProfilePic: chatInfo.chatPreviewPic(),
                                color: const Color(0x00000000),
                                unreadColor: const Color(0xFF26A0DA),
                                titleTextStyle: GoogleFonts.getFont(
                                  'DM Sans',
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                                dateTextStyle: GoogleFonts.getFont(
                                  'DM Sans',
                                  color: FlutterFlowTheme.of(context).accent3,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14.0,
                                ),
                                previewTextStyle: GoogleFonts.getFont(
                                  'DM Sans',
                                  color: FlutterFlowTheme.of(context).accent3,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14.0,
                                ),
                                contentPadding: const EdgeInsets.all(3.0),
                                borderRadius: BorderRadius.circular(10.0),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
