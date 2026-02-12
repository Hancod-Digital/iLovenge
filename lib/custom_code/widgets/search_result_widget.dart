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

import 'package:easy_debounce/easy_debounce.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchResultWidget extends StatefulWidget {
  const SearchResultWidget({
    super.key,
    this.width,
    this.height,
    required this.currentUserUid,
  });

  final double? width;
  final double? height;
  final String currentUserUid;

  @override
  State<SearchResultWidget> createState() => _SearchResultWidgetState();
}

class _SearchResultWidgetState extends State<SearchResultWidget> {
  final TextEditingController _textController = TextEditingController();
  final FocusNode _textFieldFocusNode = FocusNode();
  String _searchTerm = '';

  // Store the lounges list so we can update it dynamically
  List<LoungesViewRow> loungesList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchLounges(); // Fetch lounges initially
  }

  // Fetch lounges from Supabase
  Future<void> fetchLounges() async {
    setState(() => isLoading = true); // Show loader

    final lounges = await LoungesViewTable().queryRows(
      queryFn: (q) {
        var query = q.eqOrNull('lounge_is_active', true);

        if (_searchTerm.isNotEmpty) {
          query = query.or(
              'airport_code.ilike.%$_searchTerm%, lounge_name.ilike.%$_searchTerm%');
        }

        return query;
      },
    );

    setState(() {
      loungesList = lounges;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<UserCardsRow>>(
      future: UserCardsTable().queryRows(
        queryFn: (q) => q.eqOrNull('user_id', widget.currentUserUid),
      ),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height * 0.9,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondary,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(24.0)),
              ),
              child: const Padding(
                padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                child: ShimmerEffect(
                  height: 400.0,
                ),
              ));
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
                  // Search Bar with Debounce
                  Stack(
                    children: [
                      TextFormField(
                        controller: _textController,
                        focusNode: _textFieldFocusNode,
                        onChanged: (value) => EasyDebounce.debounce(
                          '_textController',
                          const Duration(milliseconds: 500),
                          () {
                            setState(() {
                              _searchTerm = value.trim();
                            });
                            fetchLounges(); // Update list dynamically
                          },
                        ),
                        decoration: InputDecoration(
                          hintText: 'Search Here...',
                          filled: true,
                          fillColor: const Color(0xFFF2F2F2),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24.0),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 25.0, vertical: 15.0),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Lato',
                              useGoogleFonts:
                                  GoogleFonts.asMap().containsKey('Lato'),
                            ),
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        bottom: 0,
                        child: CircleAvatar(
                          backgroundColor: FlutterFlowTheme.of(context).primary,
                          radius: 25,
                          child: const FaIcon(FontAwesomeIcons.search,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16.0),

                  // Lounges List (Dynamically Updates)
                  isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : loungesList.isEmpty
                          ? Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 25.0, 0.0, 0.0),
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
                                      0.0, 50.0, 0.0, 0.0),
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
                                return LoungeCard(
                                  width: double.infinity,
                                  height: 400.0,
                                  userId: widget.currentUserUid,
                                  loungeDetails: loungeItem,
                                  userCards: userCards,
                                );
                              },
                            ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
