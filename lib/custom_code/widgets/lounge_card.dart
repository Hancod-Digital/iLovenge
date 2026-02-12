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
import 'package:i_l_o_v_enge/flutter_flow/flutter_flow_toggle_icon.dart';

import 'package:i_l_o_v_enge/lounges/lounge_preview/lounge_preview_widget.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:i_l_o_v_enge/flutter_flow/flutter_flow_icon_button.dart';
import 'package:i_l_o_v_enge/lounges/lounge_details/lounge_details_widget.dart';

class LoungeCard extends StatefulWidget {
  const LoungeCard({
    super.key,
    this.width,
    this.height,
    required this.loungeDetails,
    required this.userId,
    required this.userCards,
  });

  final double? width;
  final double? height;
  final LoungesViewRow loungeDetails;
  final String userId;
  final List<UserCardsRow> userCards;

  @override
  State<LoungeCard> createState() => _LoungeCardState();
}

class _LoungeCardState extends State<LoungeCard> {
  bool isFavourite = false;

  @override
  void initState() {
    super.initState();
    isFavourite = widget.loungeDetails.isFavourite ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final cardAccepted = widget.userCards.any((userCard) =>
        widget.loungeDetails.cards
            ?.any((loungeCard) => loungeCard['card_id'] == userCard.cardId) ??
        false);

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
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
                widget.loungeDetails,
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
          width: double.infinity,
          height: 400.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: CachedNetworkImageProvider(widget
                              .loungeDetails.verticalImage !=
                          null &&
                      widget.loungeDetails.verticalImage != '' &&
                      widget.loungeDetails.verticalImage!.isNotEmpty
                  ? widget.loungeDetails.verticalImage!
                  : 'https://fjlihsqbnpyfaiktbuyt.supabase.co/storage/v1/object/public/amenitites/1740542949665'),
            ),
            borderRadius: BorderRadius.circular(24.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 0.0, 10.0, 0.0),
                      child: Container(
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
                    ),
                    if (cardAccepted)
                      Container(
                        width: 45.0,
                        height: 45.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).success,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.check,
                          color: FlutterFlowTheme.of(context).info,
                          size: 20.0,
                        ),
                      ),
                    if (!cardAccepted)
                      Container(
                        width: 45.0,
                        height: 45.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).error,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.close_rounded,
                          color: FlutterFlowTheme.of(context).secondary,
                          size: 24.0,
                        ),
                      )
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0.0, 1.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 75.0,
                            height: 33.0,
                            decoration: BoxDecoration(
                              color: const Color(0xE1161515),
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.star_purple500_sharp,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 24.0,
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      5.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    widget.loungeDetails.ratingAvg.toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Roboto Flex',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey('Roboto Flex'),
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 75.0,
                            height: 33.0,
                            // decoration: BoxDecoration(
                            //   color: Color(0xE1161515),
                            //   borderRadius: BorderRadius.circular(18.0),
                            // ),
                            // child: Row(
                            //   mainAxisSize: MainAxisSize.max,
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     Text(
                            //       '1',
                            //       style: FlutterFlowTheme.of(context)
                            //           .bodyMedium
                            //           .override(
                            //             fontFamily: 'Roboto Flex',
                            //             color: FlutterFlowTheme.of(context)
                            //                 .secondaryBackground,
                            //             letterSpacing: 0.0,
                            //             fontWeight: FontWeight.bold,
                            //             useGoogleFonts: GoogleFonts.asMap()
                            //                 .containsKey('Roboto Flex'),
                            //           ),
                            //     ),
                            //     Padding(
                            //       padding: EdgeInsetsDirectional.fromSTEB(
                            //           5.0, 0.0, 5.0, 0.0),
                            //       child: Text(
                            //         'of',
                            //         style: FlutterFlowTheme.of(context)
                            //             .bodyMedium
                            //             .override(
                            //               fontFamily: 'Roboto Flex',
                            //               color: FlutterFlowTheme.of(context)
                            //                   .secondaryBackground,
                            //               letterSpacing: 0.0,
                            //               fontWeight: FontWeight.bold,
                            //               useGoogleFonts: GoogleFonts.asMap()
                            //                   .containsKey('Roboto Flex'),
                            //             ),
                            //       ),
                            //     ),
                            //     Text(
                            //       '10',
                            //       style: FlutterFlowTheme.of(context)
                            //           .bodyMedium
                            //           .override(
                            //             fontFamily: 'Roboto Flex',
                            //             color: FlutterFlowTheme.of(context)
                            //                 .secondaryBackground,
                            //             letterSpacing: 0.0,
                            //             fontWeight: FontWeight.bold,
                            //             useGoogleFonts: GoogleFonts.asMap()
                            //                 .containsKey('Roboto Flex'),
                            //           ),
                            //     ),
                            //   ],
                            // ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 15.0, 0.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 5.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    widget.loungeDetails.loungeName,
                                    'n/a',
                                  ),
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lato',
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey('Lato'),
                                      ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 0.0),
                                child: Text(
                                  (String airport, String location) {
                                    return '$airport-$location';
                                  }(widget.loungeDetails.airportCode!,
                                      widget.loungeDetails.location!),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lato',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey('Lato'),
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
    );
  }
}
