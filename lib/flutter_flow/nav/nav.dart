import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

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
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? NavBarPage() : SignUpPageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : SignUpPageWidget(),
        ),
        FFRoute(
          name: 'Explorepage',
          path: '/explorepage',
          builder: (context, params) => ExplorepageWidget(),
        ),
        FFRoute(
          name: 'Openingpage',
          path: '/openingpage',
          builder: (context, params) => OpeningpageWidget(),
        ),
        FFRoute(
          name: 'Avatarpage',
          path: '/avatarpage',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'Avatarpage')
              : AvatarpageWidget(
                  userName: params.getParam('userName', ParamType.String),
                  userEmail: params.getParam('userEmail', ParamType.String),
                ),
        ),
        FFRoute(
          name: 'settingspage',
          path: '/settingspage',
          builder: (context, params) => SettingspageWidget(),
        ),
        FFRoute(
          name: 'Camerapage',
          path: '/camerapage',
          builder: (context, params) => CamerapageWidget(),
        ),
        FFRoute(
          name: 'FriendsAdd',
          path: '/friendsAdd',
          builder: (context, params) => FriendsAddWidget(),
        ),
        FFRoute(
          name: 'SignUpPage',
          path: '/signUpPage',
          builder: (context, params) => SignUpPageWidget(),
        ),
        FFRoute(
          name: 'question2page',
          path: '/question2page',
          builder: (context, params) => Question2pageWidget(),
        ),
        FFRoute(
          name: 'question1page',
          path: '/question1page',
          builder: (context, params) => Question1pageWidget(
            newname: params.getParam('newname', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'homepagefinal',
          path: '/homepagefinal',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'homepagefinal')
              : HomepagefinalWidget(),
        ),
        FFRoute(
          name: 'MathA1',
          path: '/mathA1',
          builder: (context, params) => MathA1Widget(),
        ),
        FFRoute(
          name: 'WrongpageM',
          path: '/wrongpageM',
          builder: (context, params) => WrongpageMWidget(),
        ),
        FFRoute(
          name: 'MathA2',
          path: '/mathA2',
          builder: (context, params) => MathA2Widget(),
        ),
        FFRoute(
          name: 'MathA3',
          path: '/mathA3',
          builder: (context, params) => MathA3Widget(),
        ),
        FFRoute(
          name: 'MathA4',
          path: '/mathA4',
          builder: (context, params) => MathA4Widget(),
        ),
        FFRoute(
          name: 'MathA5',
          path: '/mathA5',
          builder: (context, params) => MathA5Widget(),
        ),
        FFRoute(
          name: 'EnglishA1',
          path: '/englishA1',
          builder: (context, params) => EnglishA1Widget(),
        ),
        FFRoute(
          name: 'EnglishA2',
          path: '/englishA2',
          builder: (context, params) => EnglishA2Widget(),
        ),
        FFRoute(
          name: 'EnglishA3',
          path: '/englishA3',
          builder: (context, params) => EnglishA3Widget(),
        ),
        FFRoute(
          name: 'EnglishA4',
          path: '/englishA4',
          builder: (context, params) => EnglishA4Widget(),
        ),
        FFRoute(
          name: 'EnglishA5',
          path: '/englishA5',
          builder: (context, params) => EnglishA5Widget(),
        ),
        FFRoute(
          name: 'WrongpageR',
          path: '/wrongpageR',
          builder: (context, params) => WrongpageRWidget(),
        ),
        FFRoute(
          name: 'ReadingA1',
          path: '/readingA1',
          builder: (context, params) => ReadingA1Widget(),
        ),
        FFRoute(
          name: 'ReadingA2',
          path: '/readingA2',
          builder: (context, params) => ReadingA2Widget(),
        ),
        FFRoute(
          name: 'ReadingA5',
          path: '/readingA5',
          builder: (context, params) => ReadingA5Widget(),
        ),
        FFRoute(
          name: 'ReadingA3',
          path: '/readingA3',
          builder: (context, params) => ReadingA3Widget(),
        ),
        FFRoute(
          name: 'ReadingA4',
          path: '/readingA4',
          builder: (context, params) => ReadingA4Widget(),
        ),
        FFRoute(
          name: 'SignInPage',
          path: '/signInPage',
          builder: (context, params) => SignInPageWidget(),
        ),
        FFRoute(
          name: 'Friendspage',
          path: '/friendspage',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'Friendspage')
              : FriendspageWidget(),
        ),
        FFRoute(
          name: 'editprofile',
          path: '/editprofile',
          builder: (context, params) => EditprofileWidget(
            newname: params.getParam('newname', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'Helppage',
          path: '/helppage',
          builder: (context, params) => HelppageWidget(
            newname: params.getParam('newname', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'MathA6',
          path: '/mathA6',
          builder: (context, params) => MathA6Widget(),
        ),
        FFRoute(
          name: 'MathA7',
          path: '/mathA7',
          builder: (context, params) => MathA7Widget(),
        ),
        FFRoute(
          name: 'MathA8',
          path: '/mathA8',
          builder: (context, params) => MathA8Widget(),
        ),
        FFRoute(
          name: 'MathA10',
          path: '/mathA10',
          builder: (context, params) => MathA10Widget(),
        ),
        FFRoute(
          name: 'MathA9',
          path: '/mathA9',
          builder: (context, params) => MathA9Widget(),
        ),
        FFRoute(
          name: 'MathA11',
          path: '/mathA11',
          builder: (context, params) => MathA11Widget(),
        ),
        FFRoute(
          name: 'MathA12',
          path: '/mathA12',
          builder: (context, params) => MathA12Widget(),
        ),
        FFRoute(
          name: 'MathA13',
          path: '/mathA13',
          builder: (context, params) => MathA13Widget(),
        ),
        FFRoute(
          name: 'MathA14',
          path: '/mathA14',
          builder: (context, params) => MathA14Widget(),
        ),
        FFRoute(
          name: 'MathA15',
          path: '/mathA15',
          builder: (context, params) => MathA15Widget(),
        ),
        FFRoute(
          name: 'MathA16',
          path: '/mathA16',
          builder: (context, params) => MathA16Widget(),
        ),
        FFRoute(
          name: 'MathA17',
          path: '/mathA17',
          builder: (context, params) => MathA17Widget(),
        ),
        FFRoute(
          name: 'MathA18',
          path: '/mathA18',
          builder: (context, params) => MathA18Widget(),
        ),
        FFRoute(
          name: 'MathA19',
          path: '/mathA19',
          builder: (context, params) => MathA19Widget(),
        ),
        FFRoute(
          name: 'MathA20',
          path: '/mathA20',
          builder: (context, params) => MathA20Widget(),
        ),
        FFRoute(
          name: 'EnglishA6',
          path: '/englishA6',
          builder: (context, params) => EnglishA6Widget(),
        ),
        FFRoute(
          name: 'EnglishA7',
          path: '/englishA7',
          builder: (context, params) => EnglishA7Widget(),
        ),
        FFRoute(
          name: 'EnglishA11',
          path: '/englishA11',
          builder: (context, params) => EnglishA11Widget(),
        ),
        FFRoute(
          name: 'EnglishA10',
          path: '/englishA10',
          builder: (context, params) => EnglishA10Widget(),
        ),
        FFRoute(
          name: 'EnglishA9',
          path: '/englishA9',
          builder: (context, params) => EnglishA9Widget(),
        ),
        FFRoute(
          name: 'EnglishA8',
          path: '/englishA8',
          builder: (context, params) => EnglishA8Widget(),
        ),
        FFRoute(
          name: 'EnglishA12',
          path: '/englishA12',
          builder: (context, params) => EnglishA12Widget(),
        ),
        FFRoute(
          name: 'EnglishA13',
          path: '/englishA13',
          builder: (context, params) => EnglishA13Widget(),
        ),
        FFRoute(
          name: 'EnglishA14',
          path: '/englishA14',
          builder: (context, params) => EnglishA14Widget(),
        ),
        FFRoute(
          name: 'EnglishA15',
          path: '/englishA15',
          builder: (context, params) => EnglishA15Widget(),
        ),
        FFRoute(
          name: 'WrongpageE',
          path: '/wrongpageE',
          builder: (context, params) => WrongpageEWidget(),
        ),
        FFRoute(
          name: 'EnglishA16',
          path: '/englishA16',
          builder: (context, params) => EnglishA16Widget(),
        ),
        FFRoute(
          name: 'EnglishA17',
          path: '/englishA17',
          builder: (context, params) => EnglishA17Widget(),
        ),
        FFRoute(
          name: 'EnglishA18',
          path: '/englishA18',
          builder: (context, params) => EnglishA18Widget(),
        ),
        FFRoute(
          name: 'EnglishA19',
          path: '/englishA19',
          builder: (context, params) => EnglishA19Widget(),
        ),
        FFRoute(
          name: 'EnglishA20',
          path: '/englishA20',
          builder: (context, params) => EnglishA20Widget(),
        ),
        FFRoute(
          name: 'ReadingA7',
          path: '/readingA7',
          builder: (context, params) => ReadingA7Widget(),
        ),
        FFRoute(
          name: 'ReadingA10',
          path: '/readingA10',
          builder: (context, params) => ReadingA10Widget(),
        ),
        FFRoute(
          name: 'ReadingA9',
          path: '/readingA9',
          builder: (context, params) => ReadingA9Widget(),
        ),
        FFRoute(
          name: 'ReadingA8',
          path: '/readingA8',
          builder: (context, params) => ReadingA8Widget(),
        ),
        FFRoute(
          name: 'ReadingA6',
          path: '/readingA6',
          builder: (context, params) => ReadingA6Widget(),
        ),
        FFRoute(
          name: 'ReadingA11',
          path: '/readingA11',
          builder: (context, params) => ReadingA11Widget(),
        ),
        FFRoute(
          name: 'ReadingA12',
          path: '/readingA12',
          builder: (context, params) => ReadingA12Widget(),
        ),
        FFRoute(
          name: 'ReadingA13',
          path: '/readingA13',
          builder: (context, params) => ReadingA13Widget(),
        ),
        FFRoute(
          name: 'ReadingA14',
          path: '/readingA14',
          builder: (context, params) => ReadingA14Widget(),
        ),
        FFRoute(
          name: 'ReadingA15',
          path: '/readingA15',
          builder: (context, params) => ReadingA15Widget(),
        ),
        FFRoute(
          name: 'ReadingA16',
          path: '/readingA16',
          builder: (context, params) => ReadingA16Widget(),
        ),
        FFRoute(
          name: 'ReadingA17',
          path: '/readingA17',
          builder: (context, params) => ReadingA17Widget(),
        ),
        FFRoute(
          name: 'ReadingA18',
          path: '/readingA18',
          builder: (context, params) => ReadingA18Widget(),
        ),
        FFRoute(
          name: 'ReadingA19',
          path: '/readingA19',
          builder: (context, params) => ReadingA19Widget(),
        ),
        FFRoute(
          name: 'ReadingA20',
          path: '/readingA20',
          builder: (context, params) => ReadingA20Widget(),
        ),
        FFRoute(
          name: 'ReadingA21',
          path: '/readingA21',
          builder: (context, params) => ReadingA21Widget(),
        ),
        FFRoute(
          name: 'Resetpoints',
          path: '/resetpoints',
          builder: (context, params) => ResetpointsWidget(),
        ),
        FFRoute(
          name: 'SATSelected',
          path: '/sATSelected',
          builder: (context, params) => SATSelectedWidget(),
        ),
        FFRoute(
          name: 'Question3pagee',
          path: '/question3pagee',
          builder: (context, params) => Question3pageeWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
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
            return '/signUpPage';
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
              ? Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/IMG_4840.jpeg',
                    fit: BoxFit.fill,
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
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

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
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
