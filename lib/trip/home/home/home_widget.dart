import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/no_connection_widget.dart';
import '/components/shimmer_effects/home_screen_loader/home_screen_loader_widget.dart';
import '/components/update_gate/update_gate_widget.dart';
import '/components/update_message/update_message_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/walkthroughs/add_your_first_trip.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dart:math' as math;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  static String routeName = 'home';
  static String routePath = '/home';

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> with TickerProviderStateMixin {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      safeSetState(() =>
          _model.addYourFirstTripController = createPageWalkthrough(context));
      _model.addYourFirstTripController?.show(context: context);
      _model.user = await UsersTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'id',
          currentUserUid,
        ),
      );
      if (!(_model.user?.firstOrNull?.name != null &&
          _model.user?.firstOrNull?.name != '')) {
        context.pushNamed(EnterNameWidget.routeName);
      }
      await UsersTable().update(
        data: {
          'fcm_token': FFAppState().fcmToken,
        },
        matchingRows: (rows) => rows.eqOrNull(
          'id',
          currentUserUid,
        ),
      );
      _model.gateNotAdded = await actions.addGateNumber();
      if (_model.gateNotAdded!) {
        if (functions.isDepartureWithinMinutes(FFAppState().depTime, 180) ==
            true) {
          await showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            isDismissible: false,
            enableDrag: false,
            useSafeArea: true,
            context: context,
            builder: (context) {
              return WebViewAware(
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  child: Padding(
                    padding: MediaQuery.viewInsetsOf(context),
                    child: UpdateGateWidget(
                      tripId: FFAppState().currentTripId,
                      updateState: () async {},
                    ),
                  ),
                ),
              );
            },
          ).then((value) => safeSetState(() {}));

          FFAppState().update(() {});
        }
      } else {
        if (functions.isDepartureWithinMinutes(FFAppState().depTime, 10)) {
          if (FFAppState().tripStatus == 'new') {
            await showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              isDismissible: false,
              enableDrag: false,
              useSafeArea: true,
              context: context,
              builder: (context) {
                return WebViewAware(
                  child: GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    child: Padding(
                      padding: MediaQuery.viewInsetsOf(context),
                      child: UpdateMessageWidget(
                        tripId: FFAppState().currentTripId,
                      ),
                    ),
                  ),
                );
              },
            ).then((value) => safeSetState(() {}));
          }
        }
      }

      await actions.handleIncomingShare(
        context,
      );
    });

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FlipEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 1.0,
            end: 2.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 590.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    // On page dispose action.
    () async {}();

    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).tertiary,
        body: SafeArea(
          top: true,
          child: Builder(
            builder: (context) {
              if (FFAppState().Internet) {
                return Visibility(
                  visible: responsiveVisibility(
                    context: context,
                    tabletLandscape: false,
                    desktop: false,
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: FutureBuilder<ApiCallResponse>(
                      future: SupabaseRPCGroup.useDashBoardCall.call(
                        userId: currentUserUid,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Container(
                            width: double.infinity,
                            height: double.infinity,
                            child: HomeScreenLoaderWidget(),
                          );
                        }
                        final containerUseDashBoardResponse = snapshot.data!;

                        return Container(
                          height: MediaQuery.sizeOf(context).height,
                          decoration: BoxDecoration(),
                          child: Container(
                            decoration: BoxDecoration(),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 10.0, 20.0, 20.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                if (UserHomeDataStruct.maybeFromMap(
                                                                containerUseDashBoardResponse
                                                                    .jsonBody)
                                                            ?.userNow
                                                            ?.profileUrl ==
                                                        null ||
                                                    UserHomeDataStruct.maybeFromMap(
                                                                containerUseDashBoardResponse
                                                                    .jsonBody)
                                                            ?.userNow
                                                            ?.profileUrl ==
                                                        '')
                                                  Container(
                                                    width: 45.0,
                                                    height: 45.0,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.network(
                                                      'https://picsum.photos/seed/405/600',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                if (UserHomeDataStruct.maybeFromMap(
                                                                containerUseDashBoardResponse
                                                                    .jsonBody)
                                                            ?.userNow
                                                            ?.profileUrl !=
                                                        null &&
                                                    UserHomeDataStruct.maybeFromMap(
                                                                containerUseDashBoardResponse
                                                                    .jsonBody)
                                                            ?.userNow
                                                            ?.profileUrl !=
                                                        '')
                                                  Container(
                                                    width: 45.0,
                                                    height: 45.0,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.network(
                                                      getJsonField(
                                                        containerUseDashBoardResponse
                                                            .jsonBody,
                                                        r'''$.userNow.profile_url''',
                                                      ).toString(),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                if (responsiveVisibility(
                                                  context: context,
                                                  phone: false,
                                                  tablet: false,
                                                  tabletLandscape: false,
                                                  desktop: false,
                                                ))
                                                  ToggleIcon(
                                                    onPressed: () async {
                                                      safeSetState(() =>
                                                          _model.isFav =
                                                              !_model.isFav);
                                                    },
                                                    value: _model.isFav,
                                                    onIcon: Icon(
                                                      Icons.check_box,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 24.0,
                                                    ),
                                                    offIcon: Icon(
                                                      Icons
                                                          .check_box_outline_blank,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 24.0,
                                                    ),
                                                  ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    FlutterFlowIconButton(
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderRadius: 8.0,
                                                      buttonSize: 40.0,
                                                      icon: Icon(
                                                        FFIcons.kvector1,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        size: 24.0,
                                                      ),
                                                      onPressed: () async {
                                                        context.pushNamed(
                                                            SearchPageWidget
                                                                .routeName);
                                                      },
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  5.0),
                                                      child:
                                                          FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 8.0,
                                                        buttonSize: 40.0,
                                                        icon: Icon(
                                                          FFIcons
                                                              .knotification1,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary,
                                                          size: 28.0,
                                                        ),
                                                        onPressed: () async {
                                                          context.pushNamed(
                                                            NotificationWidget
                                                                .routeName,
                                                            extra: <String,
                                                                dynamic>{
                                                              '__transition_info__':
                                                                  TransitionInfo(
                                                                hasTransition:
                                                                    true,
                                                                transitionType:
                                                                    PageTransitionType
                                                                        .rightToLeft,
                                                              ),
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 20.0, 0.0),
                                            child: Text(
                                              'Hi ${UserHomeDataStruct.maybeFromMap(containerUseDashBoardResponse.jsonBody)?.userNow?.name}',
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .titleLarge
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleLargeFamily,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    letterSpacing: 0.0,
                                                    useGoogleFonts:
                                                        !FlutterFlowTheme.of(
                                                                context)
                                                            .titleLargeIsCustom,
                                                  ),
                                            ),
                                          ),
                                          Builder(
                                            builder: (context) {
                                              if (UserHomeDataStruct.maybeFromMap(
                                                          containerUseDashBoardResponse
                                                              .jsonBody)
                                                      ?.hasTripNow() ??
                                                  false) {
                                                return Builder(
                                                  builder: (context) {
                                                    if (UserHomeDataStruct.maybeFromMap(
                                                                    containerUseDashBoardResponse
                                                                        .jsonBody)
                                                                ?.userNow
                                                                ?.dashboardMessage ==
                                                            null ||
                                                        UserHomeDataStruct.maybeFromMap(
                                                                    containerUseDashBoardResponse
                                                                        .jsonBody)
                                                                ?.userNow
                                                                ?.dashboardMessage ==
                                                            '') {
                                                      return Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    10.0,
                                                                    0.0,
                                                                    20.0),
                                                        child: Text(
                                                          'Ready to Fly ?',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineSmall
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .radley(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      );
                                                    } else {
                                                      return Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    10.0,
                                                                    0.0,
                                                                    20.0),
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            UserHomeDataStruct
                                                                    .maybeFromMap(
                                                                        containerUseDashBoardResponse
                                                                            .jsonBody)
                                                                ?.userNow
                                                                ?.dashboardMessage,
                                                            'N/A',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineSmall
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .radley(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      );
                                                    }
                                                  },
                                                );
                                              } else {
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(20.0, 10.0, 0.0,
                                                          20.0),
                                                  child: Text(
                                                    'No trips - time to relax or plan!',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineSmall
                                                        .override(
                                                          font: GoogleFonts
                                                              .radley(
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineSmall
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Stack(
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Container(
                                              width: double.infinity,
                                              height: 50.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Container(
                                              width: double.infinity,
                                              height: 60.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        child: Builder(
                                          builder: (context) {
                                            if (UserHomeDataStruct.maybeFromMap(
                                                            containerUseDashBoardResponse
                                                                .jsonBody)
                                                        ?.tripNow !=
                                                    null &&
                                                (UserHomeDataStruct.maybeFromMap(
                                                            containerUseDashBoardResponse
                                                                .jsonBody)
                                                        ?.tripNow)!
                                                    .isNotEmpty) {
                                              return Builder(
                                                builder: (context) {
                                                  final upComingTrips =
                                                      UserHomeDataStruct.maybeFromMap(
                                                                  containerUseDashBoardResponse
                                                                      .jsonBody)
                                                              ?.tripNow
                                                              ?.toList() ??
                                                          [];

                                                  return Container(
                                                    width: double.infinity,
                                                    height: 289.0,
                                                    child: Stack(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      40.0),
                                                          child:
                                                              PageView.builder(
                                                            controller: _model
                                                                    .pageViewController ??=
                                                                PageController(
                                                                    initialPage: max(
                                                                        0,
                                                                        min(
                                                                            0,
                                                                            upComingTrips.length -
                                                                                1))),
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            itemCount:
                                                                upComingTrips
                                                                    .length,
                                                            itemBuilder: (context,
                                                                upComingTripsIndex) {
                                                              final upComingTripsItem =
                                                                  upComingTrips[
                                                                      upComingTripsIndex];
                                                              return Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            6.58),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          18.0,
                                                                          0.0,
                                                                          15.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width: double
                                                                            .infinity,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Color(0xFFF9F9F9),
                                                                          borderRadius:
                                                                              BorderRadius.circular(24.0),
                                                                        ),
                                                                        child:
                                                                            Builder(
                                                                          builder:
                                                                              (context) {
                                                                            if ((functions.isDepartureWithinMinutes(upComingTripsItem.departureAt, 180) == false) &&
                                                                                (upComingTripsItem.gateNumber == null || upComingTripsItem.gateNumber == '')) {
                                                                              return Column(
                                                                                mainAxisSize: MainAxisSize.min,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsets.all(10.0),
                                                                                    child: Container(
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondary,
                                                                                        boxShadow: [
                                                                                          BoxShadow(
                                                                                            blurRadius: 5.0,
                                                                                            color: Color(0x33000000),
                                                                                            offset: Offset(
                                                                                              0.0,
                                                                                              1.0,
                                                                                            ),
                                                                                          )
                                                                                        ],
                                                                                        borderRadius: BorderRadius.circular(20.0),
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsets.all(14.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.min,
                                                                                          children: [
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Builder(
                                                                                                  builder: (context) {
                                                                                                    if (functions.isDepartureWithinMinutes(upComingTripsItem.departureAt, 240)) {
                                                                                                      return Container(
                                                                                                        width: 80.0,
                                                                                                        decoration: BoxDecoration(),
                                                                                                        child: AutoSizeText(
                                                                                                          dateTimeFormat("EEE dd", functions.parseDateTime(upComingTripsItem.departureDate)),
                                                                                                          textAlign: TextAlign.start,
                                                                                                          maxLines: 2,
                                                                                                          minFontSize: 14.0,
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                font: GoogleFonts.roboto(
                                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                ),
                                                                                                                color: FlutterFlowTheme.of(context).customColor1,
                                                                                                                fontSize: 14.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                              ),
                                                                                                        ),
                                                                                                      );
                                                                                                    } else {
                                                                                                      return Container(
                                                                                                        width: 80.0,
                                                                                                        decoration: BoxDecoration(),
                                                                                                        child: AutoSizeText(
                                                                                                          dateTimeFormat("EEE dd", functions.parseDateTime(upComingTripsItem.departureDate)),
                                                                                                          textAlign: TextAlign.start,
                                                                                                          maxLines: 2,
                                                                                                          minFontSize: 14.0,
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                font: GoogleFonts.roboto(
                                                                                                                  fontWeight: FontWeight.bold,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                ),
                                                                                                                color: Color(0xFF4C596C),
                                                                                                                fontSize: 16.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.bold,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                              ),
                                                                                                        ),
                                                                                                      );
                                                                                                    }
                                                                                                  },
                                                                                                ),
                                                                                                Builder(
                                                                                                  builder: (context) {
                                                                                                    if (functions.isDepartureWithinMinutes(upComingTripsItem.departureAt, 240)) {
                                                                                                      return Container(
                                                                                                        width: 80.0,
                                                                                                        decoration: BoxDecoration(),
                                                                                                        child: Align(
                                                                                                          alignment: AlignmentDirectional(1.0, 0.0),
                                                                                                          child: AutoSizeText(
                                                                                                            dateTimeFormat("EEE dd", functions.parseDateTime(upComingTripsItem.araivalDate)),
                                                                                                            textAlign: TextAlign.end,
                                                                                                            maxLines: 2,
                                                                                                            minFontSize: 14.0,
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  font: GoogleFonts.roboto(
                                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                  ),
                                                                                                                  color: FlutterFlowTheme.of(context).customColor1,
                                                                                                                  fontSize: 14.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    } else {
                                                                                                      return Container(
                                                                                                        width: 80.0,
                                                                                                        decoration: BoxDecoration(),
                                                                                                        child: Align(
                                                                                                          alignment: AlignmentDirectional(1.0, 0.0),
                                                                                                          child: AutoSizeText(
                                                                                                            dateTimeFormat("EEE dd", functions.parseDateTime(upComingTripsItem.araivalDate)),
                                                                                                            textAlign: TextAlign.end,
                                                                                                            maxLines: 2,
                                                                                                            minFontSize: 14.0,
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  font: GoogleFonts.roboto(
                                                                                                                    fontWeight: FontWeight.bold,
                                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                  ),
                                                                                                                  color: Color(0xFF4C596C),
                                                                                                                  fontSize: 16.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FontWeight.bold,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    }
                                                                                                  },
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Builder(
                                                                                                  builder: (context) {
                                                                                                    if (functions.isDepartureWithinMinutes(upComingTripsItem.departureAt, 240)) {
                                                                                                      return Container(
                                                                                                        width: 80.0,
                                                                                                        decoration: BoxDecoration(),
                                                                                                        child: AutoSizeText(
                                                                                                          dateTimeFormat("MMM yyyy", functions.parseDateTime(upComingTripsItem.departureDate)),
                                                                                                          textAlign: TextAlign.start,
                                                                                                          maxLines: 2,
                                                                                                          minFontSize: 14.0,
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                font: GoogleFonts.roboto(
                                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                ),
                                                                                                                color: FlutterFlowTheme.of(context).customColor1,
                                                                                                                fontSize: 12.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                              ),
                                                                                                        ),
                                                                                                      );
                                                                                                    } else {
                                                                                                      return Container(
                                                                                                        width: 80.0,
                                                                                                        decoration: BoxDecoration(),
                                                                                                        child: AutoSizeText(
                                                                                                          dateTimeFormat("MMM yyyy", functions.parseDateTime(upComingTripsItem.departureDate)),
                                                                                                          textAlign: TextAlign.start,
                                                                                                          maxLines: 2,
                                                                                                          minFontSize: 14.0,
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                font: GoogleFonts.roboto(
                                                                                                                  fontWeight: FontWeight.normal,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                ),
                                                                                                                color: Color(0xFF4C596C),
                                                                                                                fontSize: 12.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                              ),
                                                                                                        ),
                                                                                                      );
                                                                                                    }
                                                                                                  },
                                                                                                ),
                                                                                                Builder(
                                                                                                  builder: (context) {
                                                                                                    if (functions.isDepartureWithinMinutes(upComingTripsItem.departureAt, 240)) {
                                                                                                      return Container(
                                                                                                        width: 80.0,
                                                                                                        decoration: BoxDecoration(),
                                                                                                        child: Align(
                                                                                                          alignment: AlignmentDirectional(1.0, 0.0),
                                                                                                          child: AutoSizeText(
                                                                                                            dateTimeFormat("MMM yyyy", functions.parseDateTime(dateTimeFormat("MMM  yyyy", functions.parseDateTime(upComingTripsItem.araivalDate)))),
                                                                                                            textAlign: TextAlign.end,
                                                                                                            maxLines: 2,
                                                                                                            minFontSize: 14.0,
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  font: GoogleFonts.roboto(
                                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                  ),
                                                                                                                  color: FlutterFlowTheme.of(context).customColor1,
                                                                                                                  fontSize: 12.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    } else {
                                                                                                      return Container(
                                                                                                        width: 80.0,
                                                                                                        decoration: BoxDecoration(),
                                                                                                        child: Align(
                                                                                                          alignment: AlignmentDirectional(1.0, 0.0),
                                                                                                          child: AutoSizeText(
                                                                                                            dateTimeFormat("MMM yyyy", functions.parseDateTime(upComingTripsItem.araivalDate)),
                                                                                                            textAlign: TextAlign.end,
                                                                                                            maxLines: 2,
                                                                                                            minFontSize: 14.0,
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  font: GoogleFonts.roboto(
                                                                                                                    fontWeight: FontWeight.normal,
                                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                  ),
                                                                                                                  color: Color(0xFF4C596C),
                                                                                                                  fontSize: 12.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FontWeight.normal,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    }
                                                                                                  },
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                children: [
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      FlutterFlowIconButton(
                                                                                                        borderRadius: 38.0,
                                                                                                        buttonSize: 30.0,
                                                                                                        fillColor: Color(0xFFF1F3F6),
                                                                                                        icon: Icon(
                                                                                                          Icons.arrow_outward,
                                                                                                          color: Color(0xFF2D343F),
                                                                                                          size: 15.0,
                                                                                                        ),
                                                                                                        onPressed: () {
                                                                                                          print('IconButton pressed ...');
                                                                                                        },
                                                                                                      ),
                                                                                                      Builder(
                                                                                                        builder: (context) {
                                                                                                          if (functions.isDepartureWithinMinutes(upComingTripsItem.departureAt, 240)) {
                                                                                                            return Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                              child: Text(
                                                                                                                dateTimeFormat("Hm", functions.convertTimeToDateTime(upComingTripsItem.departureTime)),
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      font: GoogleFonts.roboto(
                                                                                                                        fontWeight: FontWeight.normal,
                                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                      ),
                                                                                                                      color: FlutterFlowTheme.of(context).customColor1,
                                                                                                                      fontSize: 18.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      fontWeight: FontWeight.normal,
                                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            );
                                                                                                          } else {
                                                                                                            return Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                              child: Text(
                                                                                                                dateTimeFormat("Hm", functions.convertTimeToDateTime(upComingTripsItem.departureTime)),
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      font: GoogleFonts.roboto(
                                                                                                                        fontWeight: FontWeight.normal,
                                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                      ),
                                                                                                                      color: Color(0xFF2D343F),
                                                                                                                      fontSize: 18.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      fontWeight: FontWeight.normal,
                                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            );
                                                                                                          }
                                                                                                        },
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Transform.rotate(
                                                                                                        angle: 90.0 * (math.pi / 180),
                                                                                                        child: FlutterFlowIconButton(
                                                                                                          borderRadius: 38.0,
                                                                                                          buttonSize: 30.0,
                                                                                                          fillColor: Color(0xFFF1F3F6),
                                                                                                          icon: Icon(
                                                                                                            Icons.arrow_outward,
                                                                                                            color: Color(0xFF2D343F),
                                                                                                            size: 15.0,
                                                                                                          ),
                                                                                                          onPressed: () {
                                                                                                            print('IconButton pressed ...');
                                                                                                          },
                                                                                                        ),
                                                                                                      ),
                                                                                                      Builder(
                                                                                                        builder: (context) {
                                                                                                          if (functions.isDepartureWithinMinutes(upComingTripsItem.departureAt, 240)) {
                                                                                                            return Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                              child: Text(
                                                                                                                dateTimeFormat("Hm", functions.convertTimeToDateTime(upComingTripsItem.arrivalTime)),
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      font: GoogleFonts.roboto(
                                                                                                                        fontWeight: FontWeight.normal,
                                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                      ),
                                                                                                                      color: FlutterFlowTheme.of(context).customColor1,
                                                                                                                      fontSize: 18.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      fontWeight: FontWeight.normal,
                                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            );
                                                                                                          } else {
                                                                                                            return Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                              child: Text(
                                                                                                                dateTimeFormat("Hm", functions.convertTimeToDateTime(upComingTripsItem.arrivalTime)),
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      font: GoogleFonts.roboto(
                                                                                                                        fontWeight: FontWeight.normal,
                                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                      ),
                                                                                                                      color: Color(0xFF2D343F),
                                                                                                                      fontSize: 18.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      fontWeight: FontWeight.normal,
                                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            );
                                                                                                          }
                                                                                                        },
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                children: [
                                                                                                  Builder(
                                                                                                    builder: (context) {
                                                                                                      if (functions.isDepartureWithinMinutes(upComingTripsItem.departureAt, 240) == true) {
                                                                                                        return Text(
                                                                                                          upComingTripsItem.departureAirport,
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                font: GoogleFonts.radley(
                                                                                                                  fontWeight: FontWeight.w600,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                ),
                                                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                                                                fontSize: 26.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w600,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                              ),
                                                                                                        );
                                                                                                      } else {
                                                                                                        return Text(
                                                                                                          upComingTripsItem.departureAirport,
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                font: GoogleFonts.radley(
                                                                                                                  fontWeight: FontWeight.w600,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                ),
                                                                                                                color: FlutterFlowTheme.of(context).customColor1,
                                                                                                                fontSize: 26.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w600,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                              ),
                                                                                                        );
                                                                                                      }
                                                                                                    },
                                                                                                  ),
                                                                                                  Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                                                                                                            child: Text(
                                                                                                              '-------',
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ),
                                                                                                          FaIcon(
                                                                                                            FontAwesomeIcons.plane,
                                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                                            size: 18.0,
                                                                                                          ),
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                                                                                                            child: Text(
                                                                                                              '-------',
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                        child: Text(
                                                                                                          upComingTripsItem.airline,
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                font: GoogleFonts.roboto(
                                                                                                                  fontWeight: FontWeight.w500,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                ),
                                                                                                                color: Color(0xFF4C596C),
                                                                                                                fontSize: 12.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w500,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                  Builder(
                                                                                                    builder: (context) {
                                                                                                      if (functions.isDepartureWithinMinutes(upComingTripsItem.departureAt, 240) == true) {
                                                                                                        return Text(
                                                                                                          upComingTripsItem.arrivalAirport,
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                font: GoogleFonts.radley(
                                                                                                                  fontWeight: FontWeight.w600,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                ),
                                                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                                                                fontSize: 26.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w600,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                              ),
                                                                                                        );
                                                                                                      } else {
                                                                                                        return Text(
                                                                                                          upComingTripsItem.arrivalAirport,
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                font: GoogleFonts.radley(
                                                                                                                  fontWeight: FontWeight.w600,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                ),
                                                                                                                color: FlutterFlowTheme.of(context).customColor1,
                                                                                                                fontSize: 26.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w600,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                              ),
                                                                                                        );
                                                                                                      }
                                                                                                    },
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Builder(
                                                                                              builder: (context) {
                                                                                                if (functions.isDepartureWithinMinutes(upComingTripsItem.departureAt, 240) == true) {
                                                                                                  return Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                    children: [
                                                                                                      Text(
                                                                                                        (String var1) {
                                                                                                          return 'Terminal ' + var1;
                                                                                                        }(upComingTripsItem.departureTerminal),
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              font: GoogleFonts.roboto(
                                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                              ),
                                                                                                              color: FlutterFlowTheme.of(context).tertiary,
                                                                                                              fontSize: 12.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                            ),
                                                                                                      ),
                                                                                                      Text(
                                                                                                        (String var1) {
                                                                                                          return 'Terminal ' + var1;
                                                                                                        }(upComingTripsItem.arrivalTerminal),
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              font: GoogleFonts.roboto(
                                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                              ),
                                                                                                              color: FlutterFlowTheme.of(context).tertiary,
                                                                                                              fontSize: 12.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  );
                                                                                                } else {
                                                                                                  return Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                    children: [
                                                                                                      Text(
                                                                                                        (String var1) {
                                                                                                          return 'Terminal ' + var1;
                                                                                                        }(upComingTripsItem.departureTerminal),
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              font: GoogleFonts.roboto(
                                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                              ),
                                                                                                              color: FlutterFlowTheme.of(context).customColor1,
                                                                                                              fontSize: 12.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                            ),
                                                                                                      ),
                                                                                                      Text(
                                                                                                        (String var1) {
                                                                                                          return 'Terminal ' + var1;
                                                                                                        }(upComingTripsItem.arrivalTerminal),
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              font: GoogleFonts.roboto(
                                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                              ),
                                                                                                              color: FlutterFlowTheme.of(context).customColor1,
                                                                                                              fontSize: 12.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  );
                                                                                                }
                                                                                              },
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 10.0),
                                                                                    child: InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        context.pushNamed(
                                                                                          TripDetailsWidget.routeName,
                                                                                          queryParameters: {
                                                                                            'currentTrip': serializeParam(
                                                                                              TripStruct(
                                                                                                pnrNumber: upComingTripsItem.pnrNumber,
                                                                                                departureDate: functions.parseDateTime(upComingTripsItem.departureDate),
                                                                                                airline: upComingTripsItem.airline,
                                                                                                flightNumber: upComingTripsItem.flightNumber,
                                                                                                flightClass: upComingTripsItem.flightClass,
                                                                                                departureAirport: upComingTripsItem.departureAirport,
                                                                                                departureTimezone: upComingTripsItem.departureTimezone,
                                                                                                departureTerminal: upComingTripsItem.departureTerminal,
                                                                                                seat: upComingTripsItem.seat,
                                                                                                gateNumber: upComingTripsItem.gateNumber,
                                                                                                arrivalAirport: upComingTripsItem.arrivalAirport,
                                                                                                arrivalTime: functions.convertTimeToDateTime(upComingTripsItem.arrivalTime),
                                                                                                arrivalTimezone: upComingTripsItem.arrivalTimezone,
                                                                                                arrivalTerminal: upComingTripsItem.arrivalTerminal,
                                                                                                createdAt: functions.parseDateTime(upComingTripsItem.createdAt),
                                                                                                updatedAt: functions.parseDateTime(upComingTripsItem.updatedAt),
                                                                                                id: upComingTripsItem.id,
                                                                                                departureTime: functions.convertTimeToDateTime(upComingTripsItem.departureTime),
                                                                                                araivalDate: functions.parseDateTime(upComingTripsItem.araivalDate),
                                                                                                arrivalAirportName: upComingTripsItem.arrivalAirportName,
                                                                                                departureAirportName: upComingTripsItem.departureAirportName,
                                                                                              ),
                                                                                              ParamType.DataStruct,
                                                                                            ),
                                                                                          }.withoutNulls,
                                                                                        );
                                                                                      },
                                                                                      child: Container(
                                                                                        height: 63.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsets.all(10.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            children: [
                                                                                              Icon(
                                                                                                FFIcons.kgroup3,
                                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                                size: 24.0,
                                                                                              ),
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                                    child: Text(
                                                                                                      'View Details',
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                            color: Color(0xB3FFFFFF),
                                                                                                            letterSpacing: 0.0,
                                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Icon(
                                                                                                    Icons.arrow_forward_ios,
                                                                                                    color: FlutterFlowTheme.of(context).secondary,
                                                                                                    size: 16.0,
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ).addWalkthrough(
                                                                                columnEoejvhev,
                                                                                _model.addYourFirstTripController,
                                                                              );
                                                                            } else {
                                                                              return Padding(
                                                                                padding: EdgeInsets.all(14.0),
                                                                                child: Container(
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    borderRadius: BorderRadius.circular(24.0),
                                                                                  ),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      if (functions.isWithinThreeHours(upComingTripsItem.departureTime, 60, upComingTripsItem.departureDate) &&
                                                                                          responsiveVisibility(
                                                                                            context: context,
                                                                                            tablet: false,
                                                                                          ))
                                                                                        Padding(
                                                                                          padding: EdgeInsets.all(4.0),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.min,
                                                                                            children: [
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                children: [
                                                                                                  Align(
                                                                                                    alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                                    child: ClipRRect(
                                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                                      child: Image.asset(
                                                                                                        'assets/images/Screw.png',
                                                                                                        width: 20.0,
                                                                                                        height: 20.0,
                                                                                                        fit: BoxFit.cover,
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Align(
                                                                                                    alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                                    child: ClipRRect(
                                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                                      child: Image.asset(
                                                                                                        'assets/images/Screw.png',
                                                                                                        width: 20.0,
                                                                                                        height: 20.0,
                                                                                                        fit: BoxFit.cover,
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                                                                  children: [
                                                                                                    Align(
                                                                                                      alignment: AlignmentDirectional(0.0, 1.0),
                                                                                                      child: Text(
                                                                                                        'Seat',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              font: GoogleFonts.roboto(
                                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                              ),
                                                                                                              color: Color(0xFF9C9C9C),
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 20.0, 0.0),
                                                                                                      child: ClipRRect(
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                        child: SvgPicture.asset(
                                                                                                          'assets/images/arrowOutward.svg',
                                                                                                          width: 70.0,
                                                                                                          height: 40.0,
                                                                                                          fit: BoxFit.contain,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 5.0),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      upComingTripsItem.seat,
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            font: GoogleFonts.roboto(
                                                                                                              fontWeight: FontWeight.w600,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                            ),
                                                                                                            fontSize: 45.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.w600,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                          ),
                                                                                                    ),
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          valueOrDefault<String>(
                                                                                                            (String gateNumber) {
                                                                                                              return 'Gate Number - ' + gateNumber;
                                                                                                            }(upComingTripsItem.gateNumber),
                                                                                                            'N/A',
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                font: GoogleFonts.roboto(
                                                                                                                  fontWeight: FontWeight.w300,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                ),
                                                                                                                color: Color(0xFF2D343F),
                                                                                                                fontSize: 24.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w300,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                              Align(
                                                                                                alignment: AlignmentDirectional(1.0, 0.0),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 5.0),
                                                                                                  child: InkWell(
                                                                                                    splashColor: Colors.transparent,
                                                                                                    focusColor: Colors.transparent,
                                                                                                    hoverColor: Colors.transparent,
                                                                                                    highlightColor: Colors.transparent,
                                                                                                    onTap: () async {
                                                                                                      context.pushNamed(
                                                                                                        TripDetailsWidget.routeName,
                                                                                                        queryParameters: {
                                                                                                          'currentTrip': serializeParam(
                                                                                                            TripStruct(
                                                                                                              pnrNumber: upComingTripsItem.pnrNumber,
                                                                                                              departureDate: functions.parseDateTime(upComingTripsItem.departureDate),
                                                                                                              airline: upComingTripsItem.airline,
                                                                                                              flightNumber: upComingTripsItem.flightNumber,
                                                                                                              flightClass: upComingTripsItem.flightClass,
                                                                                                              departureAirport: upComingTripsItem.departureAirport,
                                                                                                              departureTimezone: upComingTripsItem.departureTimezone,
                                                                                                              departureTerminal: upComingTripsItem.departureTerminal,
                                                                                                              seat: upComingTripsItem.seat,
                                                                                                              gateNumber: upComingTripsItem.gateNumber,
                                                                                                              arrivalAirport: upComingTripsItem.arrivalAirport,
                                                                                                              arrivalTime: functions.convertTimeToDateTime(upComingTripsItem.arrivalTime),
                                                                                                              arrivalTimezone: upComingTripsItem.arrivalTimezone,
                                                                                                              arrivalTerminal: upComingTripsItem.arrivalTerminal,
                                                                                                              createdAt: functions.parseDateTime(upComingTripsItem.createdAt),
                                                                                                              updatedAt: functions.parseDateTime(upComingTripsItem.updatedAt),
                                                                                                              id: upComingTripsItem.id,
                                                                                                              departureTime: functions.convertTimeToDateTime(upComingTripsItem.departureTime),
                                                                                                              araivalDate: functions.parseDateTime(upComingTripsItem.araivalDate),
                                                                                                              arrivalAirportName: upComingTripsItem.arrivalAirportName,
                                                                                                              departureAirportName: upComingTripsItem.departureAirportName,
                                                                                                            ),
                                                                                                            ParamType.DataStruct,
                                                                                                          ),
                                                                                                        }.withoutNulls,
                                                                                                      );
                                                                                                    },
                                                                                                    child: Text(
                                                                                                      'View Details',
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            font: GoogleFonts.roboto(
                                                                                                              fontWeight: FontWeight.w600,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                            ),
                                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.w600,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                children: [
                                                                                                  Align(
                                                                                                    alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                                    child: ClipRRect(
                                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                                      child: Image.asset(
                                                                                                        'assets/images/Screw.png',
                                                                                                        width: 20.0,
                                                                                                        height: 20.0,
                                                                                                        fit: BoxFit.cover,
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Align(
                                                                                                    alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                                    child: ClipRRect(
                                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                                      child: Image.asset(
                                                                                                        'assets/images/Screw.png',
                                                                                                        width: 20.0,
                                                                                                        height: 20.0,
                                                                                                        fit: BoxFit.cover,
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      if (!functions.isWithinThreeHours(upComingTripsItem.departureTime, 60, upComingTripsItem.departureDate) &&
                                                                                          responsiveVisibility(
                                                                                            context: context,
                                                                                            tablet: false,
                                                                                          ))
                                                                                        Padding(
                                                                                          padding: EdgeInsets.all(4.0),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.min,
                                                                                            children: [
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                children: [
                                                                                                  Align(
                                                                                                    alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                                    child: ClipRRect(
                                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                                      child: Image.asset(
                                                                                                        'assets/images/Screw.png',
                                                                                                        width: 20.0,
                                                                                                        height: 20.0,
                                                                                                        fit: BoxFit.cover,
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Align(
                                                                                                    alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                                    child: ClipRRect(
                                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                                      child: Image.asset(
                                                                                                        'assets/images/Screw.png',
                                                                                                        width: 20.0,
                                                                                                        height: 20.0,
                                                                                                        fit: BoxFit.cover,
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                              Align(
                                                                                                alignment: AlignmentDirectional(1.0, 0.0),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 20.0, 0.0),
                                                                                                  child: ClipRRect(
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                    child: SvgPicture.asset(
                                                                                                      'assets/images/arrowOutward.svg',
                                                                                                      width: 50.0,
                                                                                                      height: 40.0,
                                                                                                      fit: BoxFit.contain,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 5.0),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      ' Gate ',
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            font: GoogleFonts.roboto(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                            ),
                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                          ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      upComingTripsItem.gateNumber,
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            font: GoogleFonts.roboto(
                                                                                                              fontWeight: FontWeight.w900,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                            ),
                                                                                                            fontSize: 45.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.w900,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                          ),
                                                                                                    ),
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          (String var1) {
                                                                                                            return var1 + ' ';
                                                                                                          }(upComingTripsItem.departureAirport),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                font: GoogleFonts.roboto(
                                                                                                                  fontWeight: FontWeight.normal,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                ),
                                                                                                                fontSize: 16.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                              ),
                                                                                                        ),
                                                                                                        Text(
                                                                                                          upComingTripsItem.departureTerminal,
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                font: GoogleFonts.roboto(
                                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                ),
                                                                                                                fontSize: 18.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                              Align(
                                                                                                alignment: AlignmentDirectional(1.0, 0.0),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 5.0),
                                                                                                  child: InkWell(
                                                                                                    splashColor: Colors.transparent,
                                                                                                    focusColor: Colors.transparent,
                                                                                                    hoverColor: Colors.transparent,
                                                                                                    highlightColor: Colors.transparent,
                                                                                                    onTap: () async {
                                                                                                      context.pushNamed(
                                                                                                        TripDetailsWidget.routeName,
                                                                                                        queryParameters: {
                                                                                                          'currentTrip': serializeParam(
                                                                                                            TripStruct(
                                                                                                              pnrNumber: upComingTripsItem.pnrNumber,
                                                                                                              departureDate: functions.parseDateTime(upComingTripsItem.departureDate),
                                                                                                              airline: upComingTripsItem.airline,
                                                                                                              flightNumber: upComingTripsItem.flightNumber,
                                                                                                              flightClass: upComingTripsItem.flightClass,
                                                                                                              departureAirport: upComingTripsItem.departureAirport,
                                                                                                              departureTimezone: upComingTripsItem.departureTimezone,
                                                                                                              departureTerminal: upComingTripsItem.departureTerminal,
                                                                                                              seat: upComingTripsItem.seat,
                                                                                                              gateNumber: upComingTripsItem.gateNumber,
                                                                                                              arrivalAirport: upComingTripsItem.arrivalAirport,
                                                                                                              arrivalTime: functions.convertTimeToDateTime(upComingTripsItem.arrivalTime),
                                                                                                              arrivalTimezone: upComingTripsItem.arrivalTimezone,
                                                                                                              arrivalTerminal: upComingTripsItem.arrivalTerminal,
                                                                                                              createdAt: functions.parseDateTime(upComingTripsItem.createdAt),
                                                                                                              updatedAt: functions.parseDateTime(upComingTripsItem.updatedAt),
                                                                                                              id: upComingTripsItem.id,
                                                                                                              departureTime: functions.convertTimeToDateTime(upComingTripsItem.departureTime),
                                                                                                              araivalDate: functions.parseDateTime(upComingTripsItem.araivalDate),
                                                                                                              arrivalAirportName: upComingTripsItem.arrivalAirportName,
                                                                                                              departureAirportName: upComingTripsItem.departureAirportName,
                                                                                                            ),
                                                                                                            ParamType.DataStruct,
                                                                                                          ),
                                                                                                        }.withoutNulls,
                                                                                                      );
                                                                                                    },
                                                                                                    child: Text(
                                                                                                      'View Details',
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                                            letterSpacing: 0.0,
                                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                children: [
                                                                                                  Align(
                                                                                                    alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                                    child: ClipRRect(
                                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                                      child: Image.asset(
                                                                                                        'assets/images/Screw.png',
                                                                                                        width: 20.0,
                                                                                                        height: 20.0,
                                                                                                        fit: BoxFit.cover,
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Align(
                                                                                                    alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                                    child: ClipRRect(
                                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                                      child: Image.asset(
                                                                                                        'assets/images/Screw.png',
                                                                                                        width: 20.0,
                                                                                                        height: 20.0,
                                                                                                        fit: BoxFit.cover,
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      if (responsiveVisibility(
                                                                                        context: context,
                                                                                        phone: false,
                                                                                        tablet: false,
                                                                                        tabletLandscape: false,
                                                                                        desktop: false,
                                                                                      ))
                                                                                        Builder(
                                                                                          builder: (context) {
                                                                                            if (functions.isWithinThreeHours(upComingTripsItem.departureTime, 30, upComingTripsItem.departureDate)) {
                                                                                              return Padding(
                                                                                                padding: EdgeInsets.all(4.0),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                                  children: [
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                      children: [
                                                                                                        Align(
                                                                                                          alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                                          child: ClipRRect(
                                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                                            child: Image.asset(
                                                                                                              'assets/images/Screw.png',
                                                                                                              width: 20.0,
                                                                                                              height: 20.0,
                                                                                                              fit: BoxFit.cover,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Align(
                                                                                                          alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                                          child: ClipRRect(
                                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                                            child: Image.asset(
                                                                                                              'assets/images/Screw.png',
                                                                                                              width: 20.0,
                                                                                                              height: 20.0,
                                                                                                              fit: BoxFit.cover,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.end,
                                                                                                        children: [
                                                                                                          Align(
                                                                                                            alignment: AlignmentDirectional(0.0, 1.0),
                                                                                                            child: Text(
                                                                                                              'Seat',
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    font: GoogleFonts.roboto(
                                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                    ),
                                                                                                                    color: Color(0xFF9C9C9C),
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ),
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 20.0, 0.0),
                                                                                                            child: ClipRRect(
                                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                                              child: SvgPicture.asset(
                                                                                                                'assets/images/arrowOutward.svg',
                                                                                                                width: 70.0,
                                                                                                                height: 40.0,
                                                                                                                fit: BoxFit.contain,
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 5.0),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            upComingTripsItem.seat,
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  font: GoogleFonts.roboto(
                                                                                                                    fontWeight: FontWeight.w600,
                                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                  ),
                                                                                                                  fontSize: 45.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FontWeight.w600,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                ),
                                                                                                          ),
                                                                                                          Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                valueOrDefault<String>(
                                                                                                                  (String gateNumber) {
                                                                                                                    return 'Gate Number - ' + gateNumber;
                                                                                                                  }(upComingTripsItem.gateNumber),
                                                                                                                  'N/A',
                                                                                                                ),
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      font: GoogleFonts.roboto(
                                                                                                                        fontWeight: FontWeight.w300,
                                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                      ),
                                                                                                                      color: Color(0xFF2D343F),
                                                                                                                      fontSize: 24.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      fontWeight: FontWeight.w300,
                                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    Align(
                                                                                                      alignment: AlignmentDirectional(1.0, 0.0),
                                                                                                      child: Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 5.0),
                                                                                                        child: InkWell(
                                                                                                          splashColor: Colors.transparent,
                                                                                                          focusColor: Colors.transparent,
                                                                                                          hoverColor: Colors.transparent,
                                                                                                          highlightColor: Colors.transparent,
                                                                                                          onTap: () async {
                                                                                                            context.pushNamed(
                                                                                                              TripDetailsWidget.routeName,
                                                                                                              queryParameters: {
                                                                                                                'currentTrip': serializeParam(
                                                                                                                  TripStruct(
                                                                                                                    pnrNumber: upComingTripsItem.pnrNumber,
                                                                                                                    departureDate: functions.parseDateTime(upComingTripsItem.departureDate),
                                                                                                                    airline: upComingTripsItem.airline,
                                                                                                                    flightNumber: upComingTripsItem.flightNumber,
                                                                                                                    flightClass: upComingTripsItem.flightClass,
                                                                                                                    departureAirport: upComingTripsItem.departureAirport,
                                                                                                                    departureTimezone: upComingTripsItem.departureTimezone,
                                                                                                                    departureTerminal: upComingTripsItem.departureTerminal,
                                                                                                                    seat: upComingTripsItem.seat,
                                                                                                                    gateNumber: upComingTripsItem.gateNumber,
                                                                                                                    arrivalAirport: upComingTripsItem.arrivalAirport,
                                                                                                                    arrivalTime: functions.convertTimeToDateTime(upComingTripsItem.arrivalTime),
                                                                                                                    arrivalTimezone: upComingTripsItem.arrivalTimezone,
                                                                                                                    arrivalTerminal: upComingTripsItem.arrivalTerminal,
                                                                                                                    createdAt: functions.parseDateTime(upComingTripsItem.createdAt),
                                                                                                                    updatedAt: functions.parseDateTime(upComingTripsItem.updatedAt),
                                                                                                                    id: upComingTripsItem.id,
                                                                                                                    departureTime: functions.convertTimeToDateTime(upComingTripsItem.departureTime),
                                                                                                                    araivalDate: functions.parseDateTime(upComingTripsItem.araivalDate),
                                                                                                                    arrivalAirportName: upComingTripsItem.arrivalAirportName,
                                                                                                                    departureAirportName: upComingTripsItem.departureAirportName,
                                                                                                                  ),
                                                                                                                  ParamType.DataStruct,
                                                                                                                ),
                                                                                                              }.withoutNulls,
                                                                                                            );
                                                                                                          },
                                                                                                          child: Text(
                                                                                                            'View Details',
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  font: GoogleFonts.roboto(
                                                                                                                    fontWeight: FontWeight.w600,
                                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                  ),
                                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FontWeight.w600,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                      children: [
                                                                                                        Align(
                                                                                                          alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                                          child: ClipRRect(
                                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                                            child: Image.asset(
                                                                                                              'assets/images/Screw.png',
                                                                                                              width: 20.0,
                                                                                                              height: 20.0,
                                                                                                              fit: BoxFit.cover,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Align(
                                                                                                          alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                                          child: ClipRRect(
                                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                                            child: Image.asset(
                                                                                                              'assets/images/Screw.png',
                                                                                                              width: 20.0,
                                                                                                              height: 20.0,
                                                                                                              fit: BoxFit.cover,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              );
                                                                                            } else {
                                                                                              return Padding(
                                                                                                padding: EdgeInsets.all(4.0),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                                  children: [
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                      children: [
                                                                                                        Align(
                                                                                                          alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                                          child: ClipRRect(
                                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                                            child: Image.asset(
                                                                                                              'assets/images/Screw.png',
                                                                                                              width: 20.0,
                                                                                                              height: 20.0,
                                                                                                              fit: BoxFit.cover,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Align(
                                                                                                          alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                                          child: ClipRRect(
                                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                                            child: Image.asset(
                                                                                                              'assets/images/Screw.png',
                                                                                                              width: 20.0,
                                                                                                              height: 20.0,
                                                                                                              fit: BoxFit.cover,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                    Align(
                                                                                                      alignment: AlignmentDirectional(1.0, 0.0),
                                                                                                      child: Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 20.0, 0.0),
                                                                                                        child: ClipRRect(
                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                          child: SvgPicture.asset(
                                                                                                            'assets/images/arrowOutward.svg',
                                                                                                            width: 50.0,
                                                                                                            height: 40.0,
                                                                                                            fit: BoxFit.contain,
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 5.0),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            ' Gate ',
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  font: GoogleFonts.roboto(
                                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                  ),
                                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                ),
                                                                                                          ),
                                                                                                          Text(
                                                                                                            upComingTripsItem.gateNumber,
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  font: GoogleFonts.roboto(
                                                                                                                    fontWeight: FontWeight.w900,
                                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                  ),
                                                                                                                  fontSize: 45.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FontWeight.w900,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                ),
                                                                                                          ),
                                                                                                          Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                (String var1) {
                                                                                                                  return var1 + ' ';
                                                                                                                }(upComingTripsItem.departureAirport),
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      font: GoogleFonts.roboto(
                                                                                                                        fontWeight: FontWeight.normal,
                                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                      ),
                                                                                                                      fontSize: 16.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      fontWeight: FontWeight.normal,
                                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                    ),
                                                                                                              ),
                                                                                                              Text(
                                                                                                                upComingTripsItem.departureTerminal,
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      font: GoogleFonts.roboto(
                                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                      ),
                                                                                                                      fontSize: 18.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    Align(
                                                                                                      alignment: AlignmentDirectional(1.0, 0.0),
                                                                                                      child: Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 5.0),
                                                                                                        child: InkWell(
                                                                                                          splashColor: Colors.transparent,
                                                                                                          focusColor: Colors.transparent,
                                                                                                          hoverColor: Colors.transparent,
                                                                                                          highlightColor: Colors.transparent,
                                                                                                          onTap: () async {
                                                                                                            context.pushNamed(
                                                                                                              TripDetailsWidget.routeName,
                                                                                                              queryParameters: {
                                                                                                                'currentTrip': serializeParam(
                                                                                                                  TripStruct(
                                                                                                                    pnrNumber: upComingTripsItem.pnrNumber,
                                                                                                                    departureDate: functions.parseDateTime(upComingTripsItem.departureDate),
                                                                                                                    airline: upComingTripsItem.airline,
                                                                                                                    flightNumber: upComingTripsItem.flightNumber,
                                                                                                                    flightClass: upComingTripsItem.flightClass,
                                                                                                                    departureAirport: upComingTripsItem.departureAirport,
                                                                                                                    departureTimezone: upComingTripsItem.departureTimezone,
                                                                                                                    departureTerminal: upComingTripsItem.departureTerminal,
                                                                                                                    seat: upComingTripsItem.seat,
                                                                                                                    gateNumber: upComingTripsItem.gateNumber,
                                                                                                                    arrivalAirport: upComingTripsItem.arrivalAirport,
                                                                                                                    arrivalTime: functions.convertTimeToDateTime(upComingTripsItem.arrivalTime),
                                                                                                                    arrivalTimezone: upComingTripsItem.arrivalTimezone,
                                                                                                                    arrivalTerminal: upComingTripsItem.arrivalTerminal,
                                                                                                                    createdAt: functions.parseDateTime(upComingTripsItem.createdAt),
                                                                                                                    updatedAt: functions.parseDateTime(upComingTripsItem.updatedAt),
                                                                                                                    id: upComingTripsItem.id,
                                                                                                                    departureTime: functions.convertTimeToDateTime(upComingTripsItem.departureTime),
                                                                                                                    araivalDate: functions.parseDateTime(upComingTripsItem.araivalDate),
                                                                                                                    arrivalAirportName: upComingTripsItem.arrivalAirportName,
                                                                                                                    departureAirportName: upComingTripsItem.departureAirportName,
                                                                                                                  ),
                                                                                                                  ParamType.DataStruct,
                                                                                                                ),
                                                                                                              }.withoutNulls,
                                                                                                            );
                                                                                                          },
                                                                                                          child: Text(
                                                                                                            'View Details',
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                      children: [
                                                                                                        Align(
                                                                                                          alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                                          child: ClipRRect(
                                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                                            child: Image.asset(
                                                                                                              'assets/images/Screw.png',
                                                                                                              width: 20.0,
                                                                                                              height: 20.0,
                                                                                                              fit: BoxFit.cover,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Align(
                                                                                                          alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                                          child: ClipRRect(
                                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                                            child: Image.asset(
                                                                                                              'assets/images/Screw.png',
                                                                                                              width: 20.0,
                                                                                                              height: 20.0,
                                                                                                              fit: BoxFit.cover,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              );
                                                                                            }
                                                                                          },
                                                                                        ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            }
                                                                          },
                                                                        ),
                                                                      ).animateOnPageLoad(
                                                                              animationsMap['containerOnPageLoadAnimation1']!),
                                                                    ),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 1.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        16.0),
                                                            child: smooth_page_indicator
                                                                .SmoothPageIndicator(
                                                              controller: _model
                                                                      .pageViewController ??=
                                                                  PageController(
                                                                      initialPage: max(
                                                                          0,
                                                                          min(0,
                                                                              upComingTrips.length - 1))),
                                                              count:
                                                                  upComingTrips
                                                                      .length,
                                                              axisDirection: Axis
                                                                  .horizontal,
                                                              onDotClicked:
                                                                  (i) async {
                                                                await _model
                                                                    .pageViewController!
                                                                    .animateToPage(
                                                                  i,
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          500),
                                                                  curve: Curves
                                                                      .ease,
                                                                );
                                                                safeSetState(
                                                                    () {});
                                                              },
                                                              effect:
                                                                  smooth_page_indicator
                                                                      .SlideEffect(
                                                                spacing: 8.0,
                                                                radius: 8.0,
                                                                dotWidth: 8.0,
                                                                dotHeight: 8.0,
                                                                dotColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .accent1,
                                                                activeDotColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                paintStyle:
                                                                    PaintingStyle
                                                                        .fill,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              );
                                            } else {
                                              return Padding(
                                                padding: EdgeInsets.all(20.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.pushNamed(
                                                        AddNewTripWidget
                                                            .routeName);
                                                  },
                                                  child: Container(
                                                    height: 63.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(10.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Icon(
                                                            FFIcons.kplane,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary,
                                                            size: 24.0,
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                child: Text(
                                                                  'Plan Your Next Trip',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: Color(
                                                                            0xB3FFFFFF),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                                ),
                                                              ),
                                                              Icon(
                                                                Icons
                                                                    .arrow_forward_ios,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                                size: 16.0,
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
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 20.0, 20.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Lounges',
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumIsCustom,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 20.0),
                                            child: Text(
                                              'Featured',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.radley(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                    fontSize: 36.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ),
                                          if ((UserHomeDataStruct.maybeFromMap(
                                                              containerUseDashBoardResponse
                                                                  .jsonBody)
                                                          ?.loungesNow !=
                                                      null &&
                                                  (UserHomeDataStruct.maybeFromMap(
                                                              containerUseDashBoardResponse
                                                                  .jsonBody)
                                                          ?.loungesNow)!
                                                      .isNotEmpty) ==
                                              true)
                                            Builder(
                                              builder: (context) {
                                                final singleLounge =
                                                    UserHomeDataStruct.maybeFromMap(
                                                                containerUseDashBoardResponse
                                                                    .jsonBody)
                                                            ?.loungesNow
                                                            ?.toList() ??
                                                        [];

                                                return ListView.separated(
                                                  padding: EdgeInsets.fromLTRB(
                                                    0,
                                                    0,
                                                    0,
                                                    30.0,
                                                  ),
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      singleLounge.length,
                                                  separatorBuilder: (_, __) =>
                                                      SizedBox(height: 15.0),
                                                  itemBuilder: (context,
                                                      singleLoungeIndex) {
                                                    final singleLoungeItem =
                                                        singleLounge[
                                                            singleLoungeIndex];
                                                    return Container(
                                                      width: double.infinity,
                                                      height: 381.0,
                                                      child: custom_widgets
                                                          .HomeScreenLoungeCard(
                                                        width: double.infinity,
                                                        height: 381.0,
                                                        loungeDetails:
                                                            singleLoungeItem,
                                                        userCards: UserHomeDataStruct
                                                                .maybeFromMap(
                                                                    containerUseDashBoardResponse
                                                                        .jsonBody)!
                                                            .userCards,
                                                      ),
                                                    ).animateOnPageLoad(
                                                        animationsMap[
                                                            'containerOnPageLoadAnimation2']!);
                                                  },
                                                );
                                              },
                                            ),
                                          if ((UserHomeDataStruct.maybeFromMap(
                                                              containerUseDashBoardResponse
                                                                  .jsonBody)
                                                          ?.loungesNow !=
                                                      null &&
                                                  (UserHomeDataStruct.maybeFromMap(
                                                              containerUseDashBoardResponse
                                                                  .jsonBody)
                                                          ?.loungesNow)!
                                                      .isNotEmpty) ==
                                              false)
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.asset(
                                                        'assets/images/noTickets.png',
                                                        width: 200.0,
                                                        height: 200.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Text(
                                                      'No lounges found!',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          Container(
                                            width: double.infinity,
                                            height: 100.0,
                                            decoration: BoxDecoration(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              } else {
                return wrapWithModel(
                  model: _model.noConnectionModel,
                  updateCallback: () => safeSetState(() {}),
                  child: NoConnectionWidget(),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  TutorialCoachMark createPageWalkthrough(BuildContext context) =>
      TutorialCoachMark(
        targets: createWalkthroughTargets(context),
        onFinish: () async {
          safeSetState(() => _model.addYourFirstTripController = null);
        },
        onSkip: () {
          return true;
        },
      );
}
