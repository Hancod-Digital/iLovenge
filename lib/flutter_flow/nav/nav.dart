import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';

import '/auth/base_auth_user_provider.dart';

import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

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
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? NavBarPage() : OnboardingWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : OnboardingWidget(),
        ),
        FFRoute(
          name: OnboardingWidget.routeName,
          path: OnboardingWidget.routePath,
          builder: (context, params) => OnboardingWidget(),
        ),
        FFRoute(
          name: PhoneAuthenticationWidget.routeName,
          path: PhoneAuthenticationWidget.routePath,
          builder: (context, params) => PhoneAuthenticationWidget(),
        ),
        FFRoute(
          name: HomeWidget.routeName,
          path: HomeWidget.routePath,
          builder: (context, params) =>
              params.isEmpty ? NavBarPage(initialPage: 'home') : HomeWidget(),
        ),
        FFRoute(
          name: ShouldAddCardWidget.routeName,
          path: ShouldAddCardWidget.routePath,
          builder: (context, params) => ShouldAddCardWidget(),
        ),
        FFRoute(
          name: OtpPageWidget.routeName,
          path: OtpPageWidget.routePath,
          builder: (context, params) => OtpPageWidget(
            phoneNumber: params.getParam(
              'phoneNumber',
              ParamType.String,
            ),
            countryCode: params.getParam(
              'countryCode',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: EnterNameWidget.routeName,
          path: EnterNameWidget.routePath,
          builder: (context, params) => EnterNameWidget(),
        ),
        FFRoute(
          name: AddCardWidget.routeName,
          path: AddCardWidget.routePath,
          builder: (context, params) => AddCardWidget(
            updateCardInfo: params.getParam(
              'updateCardInfo',
              ParamType.bool,
            ),
            loungId: params.getParam(
              'loungId',
              ParamType.int,
            ),
            initial: params.getParam(
              'initial',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: AddNewTripWidget.routeName,
          path: AddNewTripWidget.routePath,
          builder: (context, params) => AddNewTripWidget(
            ticketDetails: params.getParam(
              'ticketDetails',
              ParamType.DataStruct,
              isList: false,
              structBuilder: TripStruct.fromSerializableMap,
            ),
          ),
        ),
        FFRoute(
          name: TravelplansWidget.routeName,
          path: TravelplansWidget.routePath,
          builder: (context, params) => TravelplansWidget(),
        ),
        FFRoute(
          name: MyticketsWidget.routeName,
          path: MyticketsWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'mytickets')
              : MyticketsWidget(),
        ),
        FFRoute(
          name: FavoriteWidget.routeName,
          path: FavoriteWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'favorite')
              : FavoriteWidget(),
        ),
        FFRoute(
          name: ProfileWidget.routeName,
          path: ProfileWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'profile')
              : ProfileWidget(),
        ),
        FFRoute(
          name: TripDetailsWidget.routeName,
          path: TripDetailsWidget.routePath,
          builder: (context, params) => TripDetailsWidget(
            currentTrip: params.getParam(
              'currentTrip',
              ParamType.DataStruct,
              isList: false,
              structBuilder: TripStruct.fromSerializableMap,
            ),
            currentGroup: params.getParam(
              'currentGroup',
              ParamType.DataStruct,
              isList: false,
              structBuilder: TripViewStruct.fromSerializableMap,
            ),
          ),
        ),
        FFRoute(
          name: LoungePreviewWidget.routeName,
          path: LoungePreviewWidget.routePath,
          builder: (context, params) => LoungePreviewWidget(
            isAccepted: params.getParam(
              'isAccepted',
              ParamType.bool,
            ),
            loungeData: params.getParam<LoungesViewRow>(
              'loungeData',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: LoungeDetailsWidget.routeName,
          path: LoungeDetailsWidget.routePath,
          builder: (context, params) => LoungeDetailsWidget(
            loungeDetails: params.getParam<LoungesViewRow>(
              'loungeDetails',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: FeedbackScreenWidget.routeName,
          path: FeedbackScreenWidget.routePath,
          builder: (context, params) => FeedbackScreenWidget(
            loungeId: params.getParam(
              'loungeId',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: WriteFeedbackWidget.routeName,
          path: WriteFeedbackWidget.routePath,
          builder: (context, params) => WriteFeedbackWidget(
            loungeId: params.getParam(
              'loungeId',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: MyCardsWidget.routeName,
          path: MyCardsWidget.routePath,
          builder: (context, params) => MyCardsWidget(
            loungeDetails: params.getParam<LoungesViewRow>(
              'loungeDetails',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: SearchPageWidget.routeName,
          path: SearchPageWidget.routePath,
          builder: (context, params) => SearchPageWidget(),
        ),
        FFRoute(
          name: UpdateCardInfoWidget.routeName,
          path: UpdateCardInfoWidget.routePath,
          builder: (context, params) => UpdateCardInfoWidget(
            loungId: params.getParam(
              'loungId',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: EditProfileWidget.routeName,
          path: EditProfileWidget.routePath,
          builder: (context, params) => EditProfileWidget(
            userData: params.getParam<UsersRow>(
              'userData',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: UserFeedBackWidget.routeName,
          path: UserFeedBackWidget.routePath,
          builder: (context, params) => UserFeedBackWidget(),
        ),
        FFRoute(
          name: NotificationWidget.routeName,
          path: NotificationWidget.routePath,
          builder: (context, params) => NotificationWidget(),
        ),
        FFRoute(
          name: HelpWidget.routeName,
          path: HelpWidget.routePath,
          builder: (context, params) => HelpWidget(),
        ),
        FFRoute(
          name: SupportScreenWidget.routeName,
          path: SupportScreenWidget.routePath,
          builder: (context, params) => SupportScreenWidget(),
        ),
        FFRoute(
          name: FaqWidget.routeName,
          path: FaqWidget.routePath,
          builder: (context, params) => FaqWidget(),
        ),
        FFRoute(
          name: NotificationSettingsWidget.routeName,
          path: NotificationSettingsWidget.routePath,
          builder: (context, params) => NotificationSettingsWidget(),
        ),
        FFRoute(
          name: TermsandServicesWidget.routeName,
          path: TermsandServicesWidget.routePath,
          builder: (context, params) => TermsandServicesWidget(),
        ),
        FFRoute(
          name: PrivacyPolicyWidget.routeName,
          path: PrivacyPolicyWidget.routePath,
          builder: (context, params) => PrivacyPolicyWidget(),
        ),
        FFRoute(
          name: EditTripWidget.routeName,
          path: EditTripWidget.routePath,
          builder: (context, params) => EditTripWidget(
            ticketDetails: params.getParam(
              'ticketDetails',
              ParamType.DataStruct,
              isList: false,
              structBuilder: TripStruct.fromSerializableMap,
            ),
          ),
        ),
        FFRoute(
          name: CustomizationWidget.routeName,
          path: CustomizationWidget.routePath,
          builder: (context, params) => CustomizationWidget(),
        ),
        FFRoute(
          name: AddCustomTextWidget.routeName,
          path: AddCustomTextWidget.routePath,
          builder: (context, params) => AddCustomTextWidget(),
        ),
        FFRoute(
          name: TripDelayWidget.routeName,
          path: TripDelayWidget.routePath,
          builder: (context, params) => TripDelayWidget(
            pnrNumber: params.getParam(
              'pnrNumber',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: SelectedFlightWidget.routeName,
          path: SelectedFlightWidget.routePath,
          builder: (context, params) => SelectedFlightWidget(
            tripData: params.getParam(
              'tripData',
              ParamType.DataStruct,
              isList: false,
              structBuilder: TripStruct.fromSerializableMap,
            ),
          ),
        ),
        FFRoute(
          name: NoInternetScreenWidget.routeName,
          path: NoInternetScreenWidget.routePath,
          builder: (context, params) => NoInternetScreenWidget(),
        ),
        FFRoute(
          name: PhoneAuthenticationCopyWidget.routeName,
          path: PhoneAuthenticationCopyWidget.routePath,
          builder: (context, params) => PhoneAuthenticationCopyWidget(),
        ),
        FFRoute(
          name: EmailOtpWidget.routeName,
          path: EmailOtpWidget.routePath,
          builder: (context, params) => EmailOtpWidget(),
        ),
        FFRoute(
          name: EmailOtpVerifyWidget.routeName,
          path: EmailOtpVerifyWidget.routePath,
          builder: (context, params) => EmailOtpVerifyWidget(
            email: params.getParam(
              'email',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: TestWidget.routeName,
          path: TestWidget.routePath,
          builder: (context, params) => TestWidget(),
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
    ..addAll(uri.queryParameters)
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
      (state.allParams.length == 1 &&
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
    ParamType type, {
    bool isList = false,
    StructBuilder<T>? structBuilder,
  }) {
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
    return deserializeParam<T>(
      param,
      type,
      isList,
      structBuilder: structBuilder,
    );
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
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/onboarding';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.black,
                  child: Image.asset(
                    'assets/images/Splash.png',
                    fit: BoxFit.cover,
                  ),
                )
              : page;

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

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
