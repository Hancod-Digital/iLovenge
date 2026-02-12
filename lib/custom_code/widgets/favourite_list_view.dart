// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_animate/flutter_animate.dart';
import 'package:i_l_o_v_enge/flutter_flow/flutter_flow_animations.dart';

import 'package:cached_network_image/cached_network_image.dart';

// import 'package:i_l_o_v_enge/components/ticket_shimmer_comp/ticket_shimmer_comp_widget.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:i_l_o_v_enge/auth/supabase_auth/auth_util.dart';
import 'package:i_l_o_v_enge/flutter_flow/flutter_flow_toggle_icon.dart';
import 'package:i_l_o_v_enge/lounges/lounge_preview/lounge_preview_widget.dart';

class FavouriteListView extends StatefulWidget {
  const FavouriteListView({
    super.key,
    this.width,
    this.height,
    required this.favLounges,
  });

  final double? width;
  final double? height;
  final List<LoungesViewRow> favLounges;

  @override
  State<FavouriteListView> createState() => _FavouriteListViewState();
}

class _FavouriteListViewState extends State<FavouriteListView> {
  List<LoungesViewRow> loungesList = [];
  bool isLoading = true;
  final animationsMap = <String, AnimationInfo>{};
  @override
  void initState() {
    super.initState();
    fetchLounges();
    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
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
    }); // Fetch lounges initially
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  // Fetch lounges from Supabase
  Future<void> fetchLounges() async {
    setState(() {
      loungesList = widget.favLounges;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<UserCardsRow>>(
      future: UserCardsTable().queryRows(
        queryFn: (q) => q.eqOrNull('user_id', currentUserUid),
      ),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          // return Container(
          //     width: double.infinity,
          //     height: MediaQuery.sizeOf(context).height * 0.9,
          //     decoration: BoxDecoration(
          //       color: FlutterFlowTheme.of(context).secondary,
          //       borderRadius:
          //           const BorderRadius.vertical(top: Radius.circular(24.0)),
          //     ),
          //     child: const Padding(
          //       padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
          //       child: ShimmerEffect(
          //         height: 350.0,
          //       ),
          //     ));

          // return TicketShimmerCompWidget();
          return Container();
        }
        List<UserCardsRow> userCards = snapshot.data!;

        return Container(
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height * 0.9,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondary,
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(24.0)),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  // Lounges List (Dynamically Updates)
                  loungesList.isEmpty
                      ? SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.8,
                          width: MediaQuery.sizeOf(context).width,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 50.0, 0.0, 0.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    'assets/images/noTickets.png',
                                    width: 180.0,
                                    height: 180.0,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 25.0, 0.0, 0.0),
                                child: Text(
                                  'No lounges found',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey('Inter'),
                                      ),
                                ),
                              ),
                            ].divide(const SizedBox(height: 0.0)),
                          ),
                        )
                      : ListView.separated(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: loungesList.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 10.0),
                          itemBuilder: (context, index) {
                            final loungeItem = loungesList[index];
                            final cardAccepted = userCards.any((userCard) =>
                                loungeItem.cards?.any((loungeCard) =>
                                    loungeCard['card_id'] == userCard.cardId) ??
                                false);
                            return Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 10.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  final result = await context.pushNamed(
                                    LoungePreviewWidget.routeName,
                                    queryParameters: {
                                      'loungeData': serializeParam(
                                        loungeItem,
                                        ParamType.SupabaseRow,
                                      ),
                                      'isAccepted': serializeParam(
                                        cardAccepted,
                                        ParamType.bool,
                                      ),
                                    }.withoutNulls,
                                  );
                                  if (result != null && result is bool) {
                                    if (!result) {
                                      loungesList.removeAt(index);
                                    }
                                  }
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 400.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: CachedNetworkImageProvider(loungeItem
                                                      .verticalImage !=
                                                  null &&
                                              loungeItem.verticalImage != '' &&
                                              loungeItem
                                                  .verticalImage!.isNotEmpty
                                          ? loungeItem.verticalImage!
                                          : 'https://fjlihsqbnpyfaiktbuyt.supabase.co/storage/v1/object/public/amenitites/1740542949665'),
                                    ),
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      0.0, 0.0, 10.0, 0.0),
                                              child: Container(
                                                decoration: const BoxDecoration(
                                                  color: Color(0x80000000),
                                                  shape: BoxShape.circle,
                                                ),
                                                child: ToggleIcon(
                                                  onPressed: () async {
                                                    if (loungeItem
                                                            .isFavourite ??
                                                        false) {
                                                      await FavouriteLoungeTable()
                                                          .delete(
                                                        matchingRows: (rows) =>
                                                            rows
                                                                .eqOrNull(
                                                                  'user_id',
                                                                  currentUserUid,
                                                                )
                                                                .eqOrNull(
                                                                  'lounge_id',
                                                                  loungeItem
                                                                      .loungeId,
                                                                ),
                                                      );
                                                      setState(() {
                                                        loungesList
                                                            .removeAt(index);
                                                      });
                                                    }
                                                  },
                                                  value:
                                                      loungeItem.isFavourite ??
                                                          false,
                                                  onIcon: Icon(
                                                    Icons.favorite,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 24.0,
                                                  ),
                                                  offIcon: Icon(
                                                    Icons
                                                        .favorite_border_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                    size: 24.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Align(
                                              alignment:
                                                  const AlignmentDirectional(
                                                      0.0, 1.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    width: 75.0,
                                                    height: 33.0,
                                                    decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xE1161515),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              18.0),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .star_purple500_sharp,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 24.0,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  5.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                          child: Text(
                                                            loungeItem.ratingAvg
                                                                .toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Roboto Flex',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          'Roboto Flex'),
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 75.0,
                                                    height: 33.0,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      0.0, 15.0, 0.0, 0.0),
                                              child: Container(
                                                width: double.infinity,
                                                height: 100.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          20.0, 0.0, 0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(0.0,
                                                                0.0, 0.0, 5.0),
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            loungeItem
                                                                .loungeName,
                                                            'n/a',
                                                          ),
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Lato',
                                                                fontSize: 18.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        'Lato'),
                                                              ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(0.0,
                                                                5.0, 0.0, 0.0),
                                                        child: Text(
                                                          (String airport,
                                                                  String location) {
                                                            return '$airport-$location';
                                                          }(
                                                              loungeItem
                                                                  .airportCode!,
                                                              loungeItem
                                                                  .location!),
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Lato',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        'Lato'),
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ).animateOnPageLoad(
                                animationsMap['containerOnPageLoadAnimation']!);
                          },
                        ),
                  const SizedBox(height: 100.0),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
