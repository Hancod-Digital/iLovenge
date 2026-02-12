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

import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MySingleCard extends StatefulWidget {
  const MySingleCard({
    super.key,
    this.width,
    this.height,
    this.loungesData,
    required this.userCard,
    this.onDelete,
  });

  final double? width;
  final double? height;
  final LoungesViewRow? loungesData;
  final UserCardViewRow userCard;
  final Future Function(UserCardViewRow userCard, bool isDelete)? onDelete;

  @override
  State<MySingleCard> createState() => _MySingleCardState();
}

class _MySingleCardState extends State<MySingleCard> {
  @override
  Widget build(BuildContext context) {
    if (widget.loungesData != null) {
      final cardAccepted = widget.loungesData?.cards?.any((loungeCard) =>
              loungeCard['card_id'] == widget.userCard.cardId) ??
          false;
      return Container(
        width: double.infinity,
        height: 100.0,
        decoration: BoxDecoration(
          color: cardAccepted
              ? const Color.fromRGBO(0, 255, 30, 0.1)
              : const Color(0x1AFF0000),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
              child: Container(
                width: 60.0,
                height: 45.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: FaIcon(
                    FontAwesomeIcons.creditCard,
                    color: cardAccepted
                        ? const Color.fromRGBO(16, 93, 56, 1)
                        : const Color.fromRGBO(255, 0, 0, 1),
                    size: 24.0,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.userCard.cardType == 'Credit / Debit Cards'
                          ? '${widget.userCard.cardName} | ${widget.userCard.cardBankName}' ??
                              ''
                          : widget.userCard.cardType == 'Airline Card'
                              ? '${widget.userCard.cardAirlineName} | ${widget.userCard.cardMembershipLevel}'
                              : '${widget.userCard.cardType} | ${widget.userCard.cardName}',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Lato',
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts:
                                GoogleFonts.asMap().containsKey('Lato'),
                          ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 7.0, 0.0, 0.0),
                      child: Text(
                        cardAccepted ? 'This Card is accepted' : 'Not accepted',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Lato',
                              color: FlutterFlowTheme.of(context).customColor1,
                              fontSize: 12.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              useGoogleFonts:
                                  GoogleFonts.asMap().containsKey('Lato'),
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return Slidable(
        key: ValueKey(widget.userCard.cardId),
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(12),
              onPressed: (_) async {
                try {
                  print('Deleting card ${widget.userCard.userCardId}');
                  final res = await showDialog<bool>(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Delete Card'),
                      content: const Text(
                          'Are you sure you want to delete this card?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context, false);
                          },
                          child: Text(
                            'Cancel',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts:
                                      GoogleFonts.asMap().containsKey('Inter'),
                                ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context, true);
                          },
                          child: Text(
                            'Delete',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  color: FlutterFlowTheme.of(context).error,
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts:
                                      GoogleFonts.asMap().containsKey('Inter'),
                                ),
                          ),
                        ),
                      ],
                    ),
                  );

                  //  await Supabase.instance.client.from('user_cards').delete().eq(
                  //         'id',
                  //         widget.userCard.userCardId!,
                  //       ).catchError((error) {
                  //             ScaffoldMessenger.of(context).showSnackBar(
                  //               const SnackBar(
                  //                 content: Text('Cannot delete trip'),
                  //               ),
                  //             );
                  //           });
                  // await UserCardsTable().delete(
                  //   matchingRows: (rows) => rows.eqOrNull(
                  //     'id',
                  //     widget.userCard.userCardId,
                  //   ),
                  // );
                  widget.onDelete?.call(widget.userCard, res ?? false);
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   SnackBar(
                  //     content: Text(
                  //       'Card deleted successfully',
                  //       style:
                  //           FlutterFlowTheme.of(context).labelMedium.override(
                  //                 fontFamily: FlutterFlowTheme.of(context)
                  //                     .labelMediumFamily,
                  //                 color: FlutterFlowTheme.of(context).secondary,
                  //                 letterSpacing: 0.0,
                  //                 useGoogleFonts: GoogleFonts.asMap()
                  //                     .containsKey(FlutterFlowTheme.of(context)
                  //                         .labelMediumFamily),
                  //               ),
                  //     ),
                  //     duration: Duration(milliseconds: 4000),
                  //     backgroundColor: FlutterFlowTheme.of(context).success,
                  //   ),
                  // );
                } catch (e) {
                  print('Error deleting card ${e}');
                  widget.onDelete?.call(widget.userCard, false);
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   SnackBar(
                  //     content: Text(
                  //       'Cannot delete card',
                  //       style:
                  //           FlutterFlowTheme.of(context).labelMedium.override(
                  //                 fontFamily: FlutterFlowTheme.of(context)
                  //                     .labelMediumFamily,
                  //                 color: FlutterFlowTheme.of(context).secondary,
                  //                 letterSpacing: 0.0,
                  //                 useGoogleFonts: GoogleFonts.asMap()
                  //                     .containsKey(FlutterFlowTheme.of(context)
                  //                         .labelMediumFamily),
                  //               ),
                  //     ),
                  //     backgroundColor: FlutterFlowTheme.of(context).error,
                  //   ),
                  // );
                }
              },
              foregroundColor: const Color.fromRGBO(37, 40, 49, 0.8),
              icon: FFIcons.kdeleteOutline,
              label: 'Delete',
              backgroundColor: const Color.fromRGBO(255, 251, 242, 1),
            ),
          ],
        ),
        child: Container(
          width: double.infinity,
          height: 100.0,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(139, 139, 139, 0.1),
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                child: Container(
                  width: 60.0,
                  height: 45.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: widget.userCard.cardIcon != null &&
                            widget.userCard.cardIcon != ''
                        ? CachedNetworkImage(
                            fadeInDuration: const Duration(milliseconds: 200),
                            fadeOutDuration: const Duration(milliseconds: 200),
                            imageUrl: widget.userCard.cardIcon!,
                            width: 60.0,
                            height: 45.0,
                            fit: BoxFit.fill,
                          )
                        : FaIcon(
                            FontAwesomeIcons.creditCard,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 24.0,
                          ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${widget.userCard.cardType}',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Lato',
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                              useGoogleFonts:
                                  GoogleFonts.asMap().containsKey('Lato'),
                            ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 7.0, 0.0, 0.0),
                        child: Text(
                          widget.userCard.cardType == 'Airline Card'
                              ? '${widget.userCard.cardMembershipLevel}  |  ${widget.userCard.cardAirlineName}'
                              : widget.userCard.cardType == 'Priority Pass'
                                  ? '${widget.userCard.cardName?.toUpperCase()}'
                                  : '${widget.userCard.cardBankName}  |  ${widget.userCard.cardName?.toUpperCase()}',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Lato',
                                color:
                                    FlutterFlowTheme.of(context).customColor1,
                                fontSize: 12.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts:
                                    GoogleFonts.asMap().containsKey('Lato'),
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
