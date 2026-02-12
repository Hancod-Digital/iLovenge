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

import 'package:cached_network_image/cached_network_image.dart';

import 'package:i_l_o_v_enge/auth/supabase_auth/auth_util.dart';

import 'package:i_l_o_v_enge/lounges/lounge_preview/lounge_preview_widget.dart';

import 'dart:ui';

import 'package:google_fonts/google_fonts.dart';
import 'package:i_l_o_v_enge/flutter_flow/flutter_flow_animations.dart';
import 'package:i_l_o_v_enge/flutter_flow/flutter_flow_toggle_icon.dart';

class HomeScreenLoungeCard extends StatefulWidget {
  const HomeScreenLoungeCard({
    super.key,
    this.width,
    this.height,
    required this.loungeDetails,
    required this.userCards,
  });

  final double? width;
  final double? height;
  final LoungesNowStruct loungeDetails;
  final List<UserCardsStruct> userCards;

  @override
  State<HomeScreenLoungeCard> createState() => _HomeScreenLoungeCardState();
}

class _HomeScreenLoungeCardState extends State<HomeScreenLoungeCard> {
  bool isFavourite = false;

  @override
  void initState() {
    super.initState();
    isFavourite = widget.loungeDetails.isFavourite ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final cardAccepted = widget.userCards.any((userCard) => widget
        .loungeDetails.cards
        .any((loungeCard) => loungeCard.cardId == userCard.cardId));
    return Container(
      width: double.infinity,
      height: 381.0,
      decoration: BoxDecoration(
        color: Color(0x89000000),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: CachedNetworkImageProvider(
            widget.loungeDetails.verticalImage ?? '',
          ),
        ),
        borderRadius: BorderRadius.circular(36.0),
      ),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          LoungesViewRow res = LoungesViewRow(widget.loungeDetails.toMap());
          res.isFavourite = isFavourite;
          final result = await context.pushNamed(
            LoungePreviewWidget.routeName,
            queryParameters: {
              'loungeData': serializeParam(
                res,
                ParamType.SupabaseRow,
              ),
              'isAccepted': serializeParam(
                cardAccepted,
                ParamType.bool,
              ),
            }.withoutNulls,
          );
          if (result != null && result is bool) {
            setState(() {
              isFavourite = result; // Update favorite status in HomeScreen
            });
          }
        },
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                FlutterFlowTheme.of(context).tertiary
              ],
              stops: const [0.0, 1.0],
              begin: const AlignmentDirectional(0.0, -1.0),
              end: const AlignmentDirectional(0, 1.0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          20.0, 20.0, 0.0, 0.0),
                      child: Container(
                        width: 136.0,
                        height: 41.0,
                        decoration: BoxDecoration(
                          color: const Color(0x53000000),
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100.0),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 5.0,
                              sigmaY: 5.0,
                            ),
                            child: cardAccepted
                                ? Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .success,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          Icons.done,
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          size: 24.0,
                                        ),
                                      ),
                                      Text(
                                        'Card Accepted',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Roboto',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey('Roboto'),
                                            ),
                                      ),
                                    ],
                                  )
                                : Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          Icons.close_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          size: 24.0,
                                        ),
                                      ),
                                      Text(
                                        'Card Rejected',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Roboto',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey('Roboto'),
                                            ),
                                      ),
                                    ],
                                  ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Color(0x80000000),
                        shape: BoxShape.circle,
                      ),
                      child: ToggleIcon(
                        onPressed: () async {
                          if (widget.loungeDetails.isFavourite ?? false) {
                            await FavouriteLoungeTable().delete(
                              matchingRows: (rows) => rows
                                  .eqOrNull(
                                    'user_id',
                                    currentUserUid,
                                  )
                                  .eqOrNull(
                                    'lounge_id',
                                    widget.loungeDetails.loungeId,
                                  ),
                            );
                          } else {
                            await FavouriteLoungeTable().insert({
                              'user_id': currentUserUid,
                              'lounge_id': widget.loungeDetails.loungeId,
                            });
                          }
                          setState(() {
                            isFavourite = !isFavourite;
                          });
                        },
                        value: isFavourite,
                        onIcon: Icon(
                          Icons.favorite,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 24.0,
                        ),
                        offIcon: Icon(
                          Icons.favorite_border_rounded,
                          color: FlutterFlowTheme.of(context).secondary,
                          size: 24.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Text(
                            widget.loungeDetails.loungeName ?? '',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Radley',
                                  color: FlutterFlowTheme.of(context).secondary,
                                  fontSize: 24.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts:
                                      GoogleFonts.asMap().containsKey('Radley'),
                                ),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.location_on_rounded,
                              size: 20.0,
                              color: FlutterFlowTheme.of(context).secondary,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 4.0),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Text(
                                  widget.loungeDetails.location ?? '',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey('Roboto'),
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100.0),
                      child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 9.0,
                            sigmaY: 9.0,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Icon(
                              FFIcons.karrowRight,
                              color: FlutterFlowTheme.of(context).secondary,
                              size: 28.0,
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
