import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';
export '/backend/firebase_dynamic_links/firebase_dynamic_links.dart'
    show generateCurrentPageLink;

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => _RouteErrorBuilder(
        state: state,
        child: appStateNotifier.loggedIn ? const NavBarPage() : const GoogleSignUpWidget(),
      ),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? const NavBarPage() : const GoogleSignUpWidget(),
        ),
        FFRoute(
          name: 'HomePage',
          path: '/Home',
          requireAuth: true,
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'HomePage')
              : const HomePageWidget(),
        ),
        FFRoute(
          name: 'SignUpPage',
          path: '/SignUpPage',
          builder: (context, params) => const SignUpPageWidget(),
        ),
        FFRoute(
          name: 'CreateTest',
          path: '/createTest',
          requireAuth: true,
          builder: (context, params) => const CreateTestWidget(),
        ),
        FFRoute(
          name: 'CreateQuestion',
          path: '/createQuestion',
          requireAuth: true,
          builder: (context, params) => CreateQuestionWidget(
            testPara: params.getParam(
                'testPara', ParamType.DocumentReference, false, ['test']),
            questions: params.getParam('questions', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'ResultPage',
          path: '/resultPage',
          requireAuth: true,
          builder: (context, params) => ResultPageWidget(
            testRefrencePara: params.getParam('testRefrencePara',
                ParamType.DocumentReference, false, ['test']),
            marksSecured: params.getParam('marksSecured', ParamType.int),
            totalQuestions: params.getParam('totalQuestions', ParamType.int),
            studentTestPara: params.getParam('studentTestPara',
                ParamType.DocumentReference, false, ['test_Student']),
          ),
        ),
        FFRoute(
          name: 'EditTest',
          path: '/editTest',
          requireAuth: true,
          builder: (context, params) => EditTestWidget(
            testpara: params.getParam(
                'testpara', ParamType.DocumentReference, false, ['test']),
          ),
        ),
        FFRoute(
          name: 'TestPage',
          path: '/testPage',
          requireAuth: true,
          builder: (context, params) => TestPageWidget(
            testsetpara: params.getParam(
                'testsetpara', ParamType.DocumentReference, false, ['test']),
            testduration: params.getParam('testduration', ParamType.int),
            totalQuestion: params.getParam('totalQuestion', ParamType.int),
            testname: params.getParam('testname', ParamType.String),
            testStudent: params.getParam('testStudent',
                ParamType.DocumentReference, false, ['test_Student']),
            marksPerQuestion:
                params.getParam('marksPerQuestion', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'TestResult',
          path: '/testResult',
          requireAuth: true,
          builder: (context, params) => TestResultWidget(
            testStudent: params.getParam('testStudent',
                ParamType.DocumentReference, false, ['test_Student']),
            totalQuestions: params.getParam('totalQuestions', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'AddToChat',
          path: '/addToChat',
          requireAuth: true,
          builder: (context, params) => const AddToChatWidget(),
        ),
        FFRoute(
          name: 'AllChat',
          path: '/allChat',
          requireAuth: true,
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'AllChat')
              : const AllChatWidget(),
        ),
        FFRoute(
          name: 'SendNotification',
          path: '/sendNotification',
          requireAuth: true,
          builder: (context, params) => const SendNotificationWidget(),
        ),
        FFRoute(
          name: 'PhoneLogin',
          path: '/phoneLogin',
          builder: (context, params) => const PhoneLoginWidget(),
        ),
        FFRoute(
          name: 'ProfilePage',
          path: '/profilePage',
          requireAuth: true,
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'ProfilePage')
              : const ProfilePageWidget(),
        ),
        FFRoute(
          name: 'CreateSlides',
          path: '/createSlides',
          requireAuth: true,
          builder: (context, params) => const CreateSlidesWidget(),
        ),
        FFRoute(
          name: 'EditTestimonials',
          path: '/editTestimonials',
          requireAuth: true,
          builder: (context, params) => const EditTestimonialsWidget(),
        ),
        FFRoute(
          name: 'ChatPage',
          path: '/chatPage',
          requireAuth: true,
          asyncParams: {
            'chatUser': getDoc(['user'], UserRecord.fromSnapshot),
          },
          builder: (context, params) => ChatPageWidget(
            chatUser: params.getParam('chatUser', ParamType.Document),
            chatRef: params.getParam(
                'chatRef', ParamType.DocumentReference, false, ['chats']),
          ),
        ),
        FFRoute(
          name: 'OTPLogin',
          path: '/oTPLogin',
          builder: (context, params) => OTPLoginWidget(
            phoneNo: params.getParam('phoneNo', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'TestSeries',
          path: '/testSeries',
          requireAuth: true,
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'TestSeries')
              : TestSeriesWidget(
                  type: params.getParam('type', ParamType.int),
                ),
        ),
        FFRoute(
          name: 'Rank',
          path: '/rank',
          requireAuth: true,
          builder: (context, params) => const RankWidget(),
        ),
        FFRoute(
          name: 'ReportedQuestions',
          path: '/reportedQuestions',
          requireAuth: true,
          builder: (context, params) => ReportedQuestionsWidget(
            img: params.getParam('img', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'Dashboard',
          path: '/dashboard',
          requireAuth: true,
          builder: (context, params) => const DashboardWidget(),
        ),
        FFRoute(
          name: 'CreateFeedback',
          path: '/createFeedback',
          requireAuth: true,
          builder: (context, params) => const CreateFeedbackWidget(),
        ),
        FFRoute(
          name: 'StudentPage',
          path: '/studentPage',
          requireAuth: true,
          builder: (context, params) => StudentPageWidget(
            refrence: params.getParam(
                'refrence', ParamType.DocumentReference, false, ['user']),
          ),
        ),
        FFRoute(
          name: 'GoogleSignUp',
          path: '/googleSignUp',
          builder: (context, params) => const GoogleSignUpWidget(),
        ),
        FFRoute(
          name: 'fast2sms',
          path: '/fast2sms',
          builder: (context, params) => const Fast2smsWidget(),
        ),
        FFRoute(
          name: 'fastotp',
          path: '/fastotp',
          builder: (context, params) => FastotpWidget(
            phoneNo: params.getParam('phoneNo', ParamType.String),
            mobile: params.getParam('mobile', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'StudyMaterial',
          path: '/studyMaterial',
          requireAuth: true,
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'StudyMaterial')
              : StudyMaterialWidget(
                  type: params.getParam('type', ParamType.int),
                ),
        ),
        FFRoute(
          name: 'PDFView',
          path: '/pDFView',
          requireAuth: true,
          builder: (context, params) => PDFViewWidget(
            pdfRefenrence: params.getParam('pdfRefenrence', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'StudyView',
          path: '/studyView',
          requireAuth: true,
          builder: (context, params) => StudyViewWidget(
            contentType: params.getParam('contentType', ParamType.String),
            filterType: params.getParam('filterType', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'CreateStudyMaterial',
          path: '/createStudyMaterial',
          requireAuth: true,
          builder: (context, params) => const CreateStudyMaterialWidget(),
        ),
        FFRoute(
          name: 'VideoView',
          path: '/videoView',
          requireAuth: true,
          builder: (context, params) => VideoViewWidget(
            contentType: params.getParam('contentType', ParamType.String),
            filterType: params.getParam('filterType', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'VideoPlayer',
          path: '/videoPlayer',
          requireAuth: true,
          builder: (context, params) => VideoPlayerWidget(
            pdfRefenrence: params.getParam('pdfRefenrence', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'UploadStudyMaterial',
          path: '/shareMaterial',
          builder: (context, params) => const UploadStudyMaterialWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList,
        collectionNamePath: collectionNamePath);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/googleSignUp';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? isWeb
                  ? Container()
                  : Container(
                      color: FlutterFlowTheme.of(context).primary,
                      child: Center(
                        child: Image.asset(
                          'assets/images/Avaraniya_Education_(2).gif',
                          width: MediaQuery.sizeOf(context).width * 0.95,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(
        hasTransition: true,
        transitionType: PageTransitionType.fade,
        duration: Duration(milliseconds: 300),
      );
}

class _RouteErrorBuilder extends StatefulWidget {
  const _RouteErrorBuilder({
    required this.state,
    required this.child,
  });

  final GoRouterState state;
  final Widget child;

  @override
  State<_RouteErrorBuilder> createState() => _RouteErrorBuilderState();
}

class _RouteErrorBuilderState extends State<_RouteErrorBuilder> {
  @override
  void initState() {
    super.initState();
    // Handle erroneous links from Firebase Dynamic Links.
    if (widget.state.location.startsWith('/link') &&
        widget.state.location.contains('request_ip_version')) {
      SchedulerBinding.instance.addPostFrameCallback((_) => context.go('/'));
    }
  }

  @override
  Widget build(BuildContext context) => widget.child;
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouter.of(context).location;
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}
