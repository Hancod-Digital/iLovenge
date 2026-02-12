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

import 'package:i_l_o_v_enge/auth/supabase_auth/auth_util.dart';

import 'package:i_l_o_v_enge/trip/edit_trip/edit_trip_widget.dart';

import 'package:i_l_o_v_enge/flutter_flow/flutter_flow_widgets.dart';

import 'package:flutter_animate/flutter_animate.dart';
import 'package:i_l_o_v_enge/flutter_flow/flutter_flow_animations.dart';

import 'package:i_l_o_v_enge/trip/add_new_trip/add_new_trip_widget.dart';

import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:i_l_o_v_enge/trip/trip_details/trip_details_widget.dart';

import 'package:i_l_o_v_enge/components/my_trip_tile/my_trip_tile_widget.dart';

import 'package:shimmer/shimmer.dart';

class GroupedListView extends StatefulWidget {
  const GroupedListView({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<GroupedListView> createState() => _GroupedListViewState();
}

class _GroupedListViewState extends State<GroupedListView>
    with SingleTickerProviderStateMixin {
//   late final controller = SlidableController(this);
//   static const int _pageSize = 10;
//   int _currentPage = 0;
//   bool _isLoading = false;
//   final ScrollController _scrollController = ScrollController();

//   // Add these variables
//   Map<String, List<TripStruct>> upcomingTrips = {};
//   Map<String, List<TripStruct>> historyTrips = {};
//   List<String> upcomingSortedDates = [];
//   List<String> historySortedDates = [];
//   bool _hasMoreItems = true;

//   // Add constants
//   static const double _shimmerBaseOpacity = 0.3;
//   static const double _shimmerHighlightOpacity = 0.1;
//   static const Duration _loadingDelay = Duration(milliseconds: 500);
//   static const double _scrollThreshold = 0.8;
//   final animationsMap = <String, AnimationInfo>{};
//   @override
//   void initState() {
//     super.initState();
//     _scrollController.addListener(_onScroll);
//     _organizeTrips();
//     animationsMap.addAll({
//       'containerOnPageLoadAnimation': AnimationInfo(
//         trigger: AnimationTrigger.onPageLoad,
//         effectsBuilder: () => [
//           MoveEffect(
//             curve: Curves.elasticOut,
//             delay: 0.0.ms,
//             duration: 1280.0.ms,
//             begin: const Offset(-100.0, 0.0),
//             end: const Offset(0.0, 0.0),
//           ),
//         ],
//       ),
//     });

//     WidgetsBinding.instance.addPostFrameCallback(
//         (_) => safeSetState(() {})); // New method to organize trips
//   }

//   @override
//   void dispose() {
//     _scrollController.removeListener(_onScroll);
//     _scrollController.dispose();
//     controller.dispose();
//     super.dispose();
//   }

//   void _onScroll() {
//     if (_scrollController.position.pixels >=
//             _scrollController.position.maxScrollExtent * 0.8 &&
//         !_isLoading) {
//       _loadMoreItems();
//     }
//   }

//   Future<void> _loadMoreItems() async {
//     if (_isLoading || !_hasMoreItems) return;

//     setState(() {
//       _isLoading = true;
//     });

//     await Future.delayed(const Duration(milliseconds: 500));

//     setState(() {
//       _currentPage++;
//       // Check if we've reached the end
//       if ((_currentPage + 1) * _pageSize >= historySortedDates.length) {
//         _hasMoreItems = false;
//       }
//       _isLoading = false;
//     });
//   }

//   void _organizeTrips() {
//     // Move trip organization logic here from build method
//     final today = DateTime(
//       DateTime.now().year,
//       DateTime.now().month,
//       DateTime.now().day,
//     );

//     // ... existing trip organization logic ...
//   }

//   Future<void> refreshTrips() async {
//     setState(() {
//       _currentPage = 0;
//       _hasMoreItems = true;
//       _isLoading = false;
//     });
//     _organizeTrips();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (widget.items == null || widget.items!.isEmpty) {
//       return SizedBox(
//         height: MediaQuery.of(context).size.height * 0.7,
//         child: Column(
//           mainAxisSize: MainAxisSize.max,
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(8.0),
//               child: Image.asset(
//                 'assets/images/noTickets.png',
//                 width: 180.0,
//                 height: 180.0,
//                 fit: BoxFit.contain,
//               ),
//             ),
//             Padding(
//               padding:
//                   const EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
//               child: Text(
//                 'No upcoming trips! Plan your next',
//                 style: FlutterFlowTheme.of(context).bodyMedium.override(
//                       fontFamily: 'Inter',
//                       letterSpacing: 0.0,
//                       useGoogleFonts: GoogleFonts.asMap().containsKey('Inter'),
//                     ),
//               ),
//             ),
//             Text(
//               'journey now.',
//               style: FlutterFlowTheme.of(context).bodyMedium.override(
//                     fontFamily: 'Inter',
//                     letterSpacing: 0.0,
//                     useGoogleFonts: GoogleFonts.asMap().containsKey('Inter'),
//                   ),
//             ),
//           ].divide(const SizedBox(height: 0.0)),
//         ),
//       );
//     }

//     // Grouping trips by date
//     else {
//       // Create maps for upcoming and history trips
//       Map<String, List<TripStruct>> upcomingTrips = {};
//       Map<String, List<TripStruct>> historyTrips = {};

//       // Get today's date without time
//       final nowUtc = DateTime.now().toUtc();

//       for (TripsRow singleTicketItem in widget.items ?? []) {
//         TripStruct trip = TripStruct(
//           airline: singleTicketItem.airline,
//           departureDate: singleTicketItem.departureDate,
//           flightNumber: singleTicketItem.flightNumber,
//           flightClass: singleTicketItem.flightClass,
//           departureAirport: singleTicketItem.departureAirport,
//           departureTimezone: singleTicketItem.departureTimezone,
//           departureTerminal: singleTicketItem.departureTerminal,
//           seat: singleTicketItem.seat,
//           gateNumber: singleTicketItem.gateNumber,
//           arrivalAirport: singleTicketItem.arrivalAirport,
//           arrivalTimezone: singleTicketItem.arrivalTimezone,
//           arrivalTerminal: singleTicketItem.arrivalTerminal,
//           arrivalTime: singleTicketItem.arrivalTime.time,
//           pnrNumber: singleTicketItem.pnrNumber,
//           departureTime: singleTicketItem.departureTime.time,
//           araivalDate: singleTicketItem.araivalDate,
//           createdAt: singleTicketItem.createdAt,
//           id: singleTicketItem.id,
//           updatedAt: singleTicketItem.updatedAt,
//           status: singleTicketItem.status,
//           arrivalAirportName: singleTicketItem.arrivalAirportName,
//           departureAirportName: singleTicketItem.departureAirportName,
//           departureAt: singleTicketItem.departureAt,
//           arrivalAt: singleTicketItem.arrivalAt,
//         );

//         if (trip != null && trip.departureAt != null) {
//           // The departureAt from the database is already in UTC
//           final departureAtUtc = trip.departureAt!.toUtc();

//           // Format date for grouping
//           String formattedDate =
//               DateFormat('yyyy-MM-dd HH:mm').format(departureAtUtc);

//           // Check if the trip is upcoming or history by comparing UTC times
//           if (departureAtUtc.isAfter(nowUtc) ||
//               departureAtUtc.isAtSameMomentAs(nowUtc)) {
//             // Upcoming trip
//             if (!upcomingTrips.containsKey(formattedDate)) {
//               upcomingTrips[formattedDate] = [];
//             }
//             upcomingTrips[formattedDate]!.add(trip);
//           } else {
//             // History trip
//             if (!historyTrips.containsKey(formattedDate)) {
//               historyTrips[formattedDate] = [];
//             }
//             historyTrips[formattedDate]!.add(trip);
//           }
//         }
//       }

//       // Sort dates for both maps
//       List<String> upcomingSortedDates = upcomingTrips.keys.toList()
//         ..sort((a, b) => a.compareTo(b));
//       List<String> historySortedDates = historyTrips.keys.toList()
//         ..sort((a, b) => b.compareTo(a)); // Reverse sort for history

//       return DefaultTabController(
//         length: 2, // Changed to 2 tabs
//         child: SizedBox(
//           height: MediaQuery.of(context).size.height * 0.8,
//           child: Column(
//             children: [
//               Container(
//                 color: FlutterFlowTheme.of(context).secondary,
//                 child: TabBar(
//                   labelColor: FlutterFlowTheme.of(context).primary,
//                   unselectedLabelColor:
//                       FlutterFlowTheme.of(context).secondaryText,
//                   indicator: BoxDecoration(
//                     color: const Color.fromRGBO(255, 252, 244, 1),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   // indicatorSize: TabBarIndicatorSize.tab,
//                   labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
//                         fontFamily: 'Inter',
//                         fontSize: 16.0,
//                         letterSpacing: 0.0,
//                         fontWeight: FontWeight.w700,
//                         useGoogleFonts:
//                             GoogleFonts.asMap().containsKey('Inter'),
//                       ),

//                   unselectedLabelStyle:
//                       FlutterFlowTheme.of(context).bodyMedium.override(
//                             fontFamily: 'Inter',
//                             fontSize: 16.0,
//                             letterSpacing: 0.0,
//                             fontWeight: FontWeight.w600,
//                             useGoogleFonts:
//                                 GoogleFonts.asMap().containsKey('Inter'),
//                           ),
//                   tabs: const [
//                     Tab(text: 'Upcoming'),
//                     Tab(text: 'History'),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 child: TabBarView(
//                   children: [
//                     // Upcoming Trips Tab
//                     RefreshIndicator(
//                       onRefresh: refreshTrips,
//                       child: ListView(
//                         children: [
//                           if (upcomingTrips.isNotEmpty)
//                             ListView.builder(
//                               shrinkWrap: true,
//                               physics: const NeverScrollableScrollPhysics(),
//                               itemCount: upcomingSortedDates.length,
//                               itemBuilder: (context, index) {
//                                 String date = upcomingSortedDates[index];
//                                 List<TripStruct> tripsForDate =
//                                     upcomingTrips[date]!
//                                       ..sort((a, b) => a.departureTime!
//                                           .compareTo(b.departureTime!));

//                                 return buildDateGroup(
//                                     context, date, tripsForDate, index);
//                               },
//                             )
//                           else
//                             Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 Image.asset(
//                                   'assets/images/noTickets.png',
//                                   width: 180.0,
//                                   height: 180.0,
//                                   fit: BoxFit.contain,
//                                 ),
//                                 const SizedBox(height: 30),
//                                 const Center(
//                                   child: Text('No Upcoming Trips'),
//                                 ),
//                               ],
//                             ),
//                         ],
//                       ),
//                     ),

//                     // History Trips Tab
//                     if (historyTrips.isNotEmpty)
//                       RefreshIndicator(
//                         onRefresh: refreshTrips,
//                         child: ListView(
//                           controller: _scrollController,
//                           children: [
//                             ListView.separated(
//                               shrinkWrap: true,
//                               physics: const NeverScrollableScrollPhysics(),
//                               itemCount: min(
//                                     historySortedDates.length,
//                                     (_currentPage + 1) * _pageSize,
//                                   ) +
//                                   (_isLoading ? 1 : 0),
//                               separatorBuilder: (context, index) =>
//                                   const SizedBox(height: 8),
//                               itemBuilder: (context, index) {
//                                 if (index >= historySortedDates.length) {
//                                   return _buildLoadingShimmer();
//                                 }

//                                 String date = historySortedDates[index];
//                                 List<TripStruct> tripsForDate =
//                                     historyTrips[date]!
//                                       ..sort((a, b) => b.departureTime!
//                                           .compareTo(a.departureTime!));

//                                 return buildDateGroup(
//                                     context, date, tripsForDate, index);
//                               },
//                             ),
//                           ],
//                         ),
//                       )
//                     else
//                       Center(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Image.asset(
//                               'assets/images/noTickets.png',
//                               width: 180.0,
//                               height: 180.0,
//                               fit: BoxFit.contain,
//                             ),
//                             const SizedBox(height: 30),
//                             const Center(
//                               child: Text('No Previous Trips'),
//                             ),
//                           ],
//                         ),
//                       ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 40.0),
//             ],
//           ),
//         ),
//       );
//     }
//   }

//   // Helper method to build date group
//   Widget buildDateGroup(BuildContext context, String date,
//       List<TripStruct> tripsForDate, int indexAnimation) {
//     if (date.isEmpty || tripsForDate.isEmpty) return const SizedBox.shrink();

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Text(
//             DateFormat('yyyy-MM-dd').format(DateTime.parse(date)) ==
//                     DateFormat('yyyy-MM-dd').format(DateTime.now())
//                 ? dateTimeFormat("\'Today\' - d MMMM yyyy", getCurrentTimestamp)
//                 : DateFormat('dd MMM yyyy').format(DateTime.parse(date)),
//             style: FlutterFlowTheme.of(context).bodyMedium.override(
//                   fontFamily: 'Inter',
//                   fontSize: 18.0,
//                   letterSpacing: 0.0,
//                   fontWeight: FontWeight.w600,
//                   useGoogleFonts: GoogleFonts.asMap().containsKey('Inter'),
//                 ),
//           ),
//         ),
//         Column(
//           children: List.generate(
//             tripsForDate.length,
//             (index) => buildTripTile(
//               context,
//               tripsForDate[index],
//             ).animateOnPageLoad(AnimationInfo(
//               trigger: AnimationTrigger.onPageLoad,
//               effectsBuilder: () => [
//                 MoveEffect(
//                   curve: Curves.elasticOut,
//                   delay: (indexAnimation * 20).ms,
//                   duration: 1280.0.ms,
//                   begin: const Offset(-100.0, 0.0),
//                   end: const Offset(0.0, 0.0),
//                 ),
//               ],
//             )),
//           ),
//         ),
//       ],
//     );
//   }

//   // Helper method to build trip tile
//   Widget buildTripTile(BuildContext context, TripStruct trip) {
//     try {
//       return Padding(
//         padding: const EdgeInsets.only(bottom: 8.0),
//         child: Slidable(
//           key: ValueKey(trip.id),
//           closeOnScroll: true,
//           endActionPane: ActionPane(
//             motion: const StretchMotion(),
//             children: [
//               // SlidableAction(
//               //   borderRadius: BorderRadius.circular(12),
//               //   onPressed: (_) {},
//               //   foregroundColor: Color.fromRGBO(37, 40, 49, 0.8),
//               //   icon: FFIcons.kdeleteOutline,
//               //   label: 'Delete',
//               //   backgroundColor:
//               //       const Color.fromRGBO(255, 251, 242, 1),
//               // ),
//               // Container(
//               //   width: 1,
//               //   height: 40,
//               //   color: Colors.grey.shade400, // Divider color
//               //   margin: const EdgeInsets.symmetric(vertical: 8),
//               // ),

//               Container(
//                 width: 150,
//                 height: 100,
//                 decoration: const BoxDecoration(
//                   color: Color.fromRGBO(255, 251, 242, 1),
//                   borderRadius: BorderRadius.only(
//                       topRight: Radius.circular(12),
//                       bottomRight: Radius.circular(12)),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     GestureDetector(
//                       onTap: () async {
//                         // final res = await showDialog<bool>(
//                         //   context: context,
//                         //   builder: (context) => AlertDialog(
//                         //     title: const Text('Delete Trip'),
//                         //     content: const Text(
//                         //         'Are you sure you want to delete this trip?'),
//                         //     actions: [
//                         //       TextButton(
//                         //         onPressed: () {
//                         //           controller.close();
//                         //           Navigator.pop(context, false);
//                         //         },
//                         //         child: Text(
//                         //           'Cancel',
//                         //           style: FlutterFlowTheme.of(context)
//                         //               .bodyMedium
//                         //               .override(
//                         //                 color: FlutterFlowTheme.of(context)
//                         //                     .tertiary,
//                         //                 fontFamily: 'Inter',
//                         //                 letterSpacing: 0.0,
//                         //                 fontWeight: FontWeight.w600,
//                         //                 useGoogleFonts: GoogleFonts.asMap()
//                         //                     .containsKey('Inter'),
//                         //               ),
//                         //         ),
//                         //       ),
//                         //       TextButton(
//                         //         onPressed: () {
//                         //           Navigator.pop(context, true);
//                         //         },
//                         //         child: Text(
//                         //           'Delete',
//                         //           style: FlutterFlowTheme.of(context)
//                         //               .bodyMedium
//                         //               .override(
//                         //                 color:
//                         //                     FlutterFlowTheme.of(context).error,
//                         //                 fontFamily: 'Inter',
//                         //                 letterSpacing: 0.0,
//                         //                 fontWeight: FontWeight.w600,
//                         //                 useGoogleFonts: GoogleFonts.asMap()
//                         //                     .containsKey('Inter'),
//                         //               ),
//                         //         ),
//                         //       ),
//                         //     ],
//                         //   ),
//                         // );
//                         final res = await showModalBottomSheet<bool>(
//                           context: context,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           builder: (context) {
//                             return Container(
//                               width: double.infinity,
//                               // height: 239.2,
//                               decoration: BoxDecoration(
//                                 color: FlutterFlowTheme.of(context)
//                                     .secondaryBackground,
//                                 borderRadius: const BorderRadius.only(
//                                   bottomLeft: Radius.circular(0.0),
//                                   bottomRight: Radius.circular(0.0),
//                                   topLeft: Radius.circular(20.0),
//                                   topRight: Radius.circular(20.0),
//                                 ),
//                               ),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(12.0),
//                                 child: Column(
//                                   mainAxisSize: MainAxisSize.min,
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Padding(
//                                       padding:
//                                           const EdgeInsetsDirectional.fromSTEB(
//                                               0.0, 20.0, 0.0, 20.0),
//                                       child: Text(
//                                         '🗑 Delete Trip?',
//                                         style: FlutterFlowTheme.of(context)
//                                             .bodyMedium
//                                             .override(
//                                               fontFamily: 'Inter',
//                                               fontSize: 16.0,
//                                               letterSpacing: 0.0,
//                                               fontWeight: FontWeight.w600,
//                                               useGoogleFonts:
//                                                   GoogleFonts.asMap()
//                                                       .containsKey('Inter'),
//                                             ),
//                                       ),
//                                     ),
//                                     Text(
//                                       'Are you sure you want to delete this trip from your calendar? ',
//                                       style: FlutterFlowTheme.of(context)
//                                           .bodyMedium
//                                           .override(
//                                             fontFamily: 'Lato',
//                                             color: const Color(0xFF525252),
//                                             letterSpacing: 0.0,
//                                             useGoogleFonts: GoogleFonts.asMap()
//                                                 .containsKey('Lato'),
//                                             lineHeight: 1.5,
//                                           ),
//                                     ),
//                                     Text(
//                                       'This action cannot be undone. ',
//                                       style: FlutterFlowTheme.of(context)
//                                           .bodyMedium
//                                           .override(
//                                             fontFamily: 'Lato',
//                                             color: const Color(0xFF525252),
//                                             letterSpacing: 0.0,
//                                             useGoogleFonts: GoogleFonts.asMap()
//                                                 .containsKey('Lato'),
//                                             lineHeight: 1.5,
//                                           ),
//                                     ),
//                                     Row(
//                                       mainAxisSize: MainAxisSize.max,
//                                       children: [
//                                         Expanded(
//                                           child: Padding(
//                                             padding: const EdgeInsetsDirectional
//                                                 .fromSTEB(0.0, 20.0, 0.0, 0.0),
//                                             child: FFButtonWidget(
//                                               onPressed: () {
//                                                 controller.close();
//                                                 Navigator.pop(context, false);
//                                               },
//                                               text: 'No',
//                                               options: FFButtonOptions(
//                                                 width: double.infinity,
//                                                 height: 40.0,
//                                                 padding:
//                                                     const EdgeInsetsDirectional
//                                                         .fromSTEB(
//                                                         16.0, 0.0, 16.0, 0.0),
//                                                 iconPadding:
//                                                     const EdgeInsetsDirectional
//                                                         .fromSTEB(
//                                                         0.0, 0.0, 0.0, 0.0),
//                                                 color:
//                                                     FlutterFlowTheme.of(context)
//                                                         .secondary,
//                                                 textStyle: FlutterFlowTheme.of(
//                                                         context)
//                                                     .titleSmall
//                                                     .override(
//                                                       fontFamily: 'Inter',
//                                                       color:
//                                                           FlutterFlowTheme.of(
//                                                                   context)
//                                                               .primary,
//                                                       letterSpacing: 0.0,
//                                                       fontWeight:
//                                                           FontWeight.w500,
//                                                       useGoogleFonts:
//                                                           GoogleFonts.asMap()
//                                                               .containsKey(
//                                                                   'Inter'),
//                                                     ),
//                                                 elevation: 0.0,
//                                                 borderSide: BorderSide(
//                                                   color: FlutterFlowTheme.of(
//                                                           context)
//                                                       .primary,
//                                                 ),
//                                                 borderRadius:
//                                                     BorderRadius.circular(3.0),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                         Expanded(
//                                           child: Padding(
//                                             padding: const EdgeInsetsDirectional
//                                                 .fromSTEB(0.0, 20.0, 0.0, 0.0),
//                                             child: FFButtonWidget(
//                                               onPressed: () {
//                                                 Navigator.pop(context, true);
//                                               },
//                                               text: 'Yes',
//                                               options: FFButtonOptions(
//                                                 width: double.infinity,
//                                                 height: 40.0,
//                                                 padding:
//                                                     const EdgeInsetsDirectional
//                                                         .fromSTEB(
//                                                         16.0, 0.0, 16.0, 0.0),
//                                                 iconPadding:
//                                                     const EdgeInsetsDirectional
//                                                         .fromSTEB(
//                                                         0.0, 0.0, 0.0, 0.0),
//                                                 color:
//                                                     FlutterFlowTheme.of(context)
//                                                         .primary,
//                                                 textStyle: FlutterFlowTheme.of(
//                                                         context)
//                                                     .titleSmall
//                                                     .override(
//                                                       fontFamily: 'Inter',
//                                                       color: Colors.white,
//                                                       letterSpacing: 0.0,
//                                                       fontWeight:
//                                                           FontWeight.w500,
//                                                       useGoogleFonts:
//                                                           GoogleFonts.asMap()
//                                                               .containsKey(
//                                                                   'Inter'),
//                                                     ),
//                                                 elevation: 0.0,
//                                                 borderRadius:
//                                                     BorderRadius.circular(3.0),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ].divide(const SizedBox(width: 7.0)),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             );
//                           },
//                         );
//                         if (res == true) {
//                           await TripsTable()
//                               .delete(
//                             matchingRows: (rows) => rows.eqOrNull(
//                               'id',
//                               trip.id,
//                             ),
//                           )
//                               .catchError((error) {
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               const SnackBar(
//                                 content: Text('Cannot delete trip'),
//                               ),
//                             );
//                           }).then((value) {
//                             setState(() {
//                               widget.items!.removeWhere(
//                                   (element) => element.id == trip.id);
//                             });
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               const SnackBar(
//                                 content: Text('Trip deleted successfully'),
//                               ),
//                             );
//                           });
//                         }
//                       },
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           const Icon(
//                             FFIcons.kdeleteOutline,
//                             color: Color.fromRGBO(37, 40, 49, 0.8),
//                           ),
//                           Text(
//                             'Delete',
//                             style: FlutterFlowTheme.of(context)
//                                 .bodyMedium
//                                 .override(
//                                   fontFamily: 'Inter',
//                                   letterSpacing: 0.0,
//                                   fontWeight: FontWeight.w500,
//                                   useGoogleFonts:
//                                       GoogleFonts.asMap().containsKey('Inter'),
//                                 ),
//                           )
//                         ],
//                       ),
//                     ),
//                     Container(
//                       width: 1,
//                       height: 40,
//                       color: Colors.grey.shade400, // Divider color
//                       margin: const EdgeInsets.symmetric(vertical: 8),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         controller.close();
//                         context.pushNamed(
//                           EditTripWidget.routeName,
//                           queryParameters: {
//                             'ticketDetails': serializeParam(
//                               trip,
//                               ParamType.DataStruct,
//                             ),
//                           }.withoutNulls,
//                         );
//                       },
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(
//                             FFIcons.keditOutline,
//                             color: FlutterFlowTheme.of(context).primary,
//                           ),
//                           Text(
//                             'Edit',
//                             style: FlutterFlowTheme.of(context)
//                                 .bodyMedium
//                                 .override(
//                                   fontFamily: 'Inter',
//                                   letterSpacing: 0.0,
//                                   fontWeight: FontWeight.w500,
//                                   useGoogleFonts:
//                                       GoogleFonts.asMap().containsKey('Inter'),
//                                 ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           child: InkWell(
//             onTap: () async {
//               context.pushNamed(
//                 TripDetailsWidget.routeName,
//                 queryParameters: {
//                   'currentTrip': serializeParam(
//                     trip,
//                     ParamType.DataStruct,
//                   ),
//                 }.withoutNulls,
//               );
//             },
//             child: MyTripTileWidget(
//               key: Key('Keyagu_${trip.id}'),
//               tripData: trip,
//             ),
//           ),
//         ),
//       );
//     } catch (e) {
//       return const SizedBox.shrink(); // Fallback widget
//     }
//   }

//   Widget _buildLoadingShimmer() {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Shimmer.fromColors(
//         baseColor: Colors.grey[300]!,
//         highlightColor: Colors.grey[100]!,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               width: 120,
//               height: 24,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(4),
//               ),
//             ),
//             const SizedBox(height: 16),
//             Container(
//               width: double.infinity,
//               height: 100,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

  late final controller = SlidableController(this);
  static const int _pageSize = 10;
  int _currentPage = 0;
  bool _isLoading = false;
  bool _isInitialLoading = true;
  final ScrollController _scrollController = ScrollController();

  // Data storage
  List<TripsRow> allTrips = [];
  Map<String, List<TripStruct>> upcomingTrips = {};
  Map<String, List<TripStruct>> historyTrips = {};
  List<String> upcomingSortedDates = [];
  List<String> historySortedDates = [];
  bool _hasMoreUpcoming = true;
  bool _hasMoreHistory = true;

  // Tab tracking
  int _currentTabIndex = 0;

  // Constants
  static const double _shimmerBaseOpacity = 0.3;
  static const double _shimmerHighlightOpacity = 0.1;
  static const Duration _loadingDelay = Duration(milliseconds: 500);
  static const double _scrollThreshold = 0.8;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _loadInitialData();
    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.elasticOut,
            delay: 0.0.ms,
            duration: 1280.0.ms,
            begin: const Offset(-100.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    controller.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent * _scrollThreshold &&
        !_isLoading) {
      if (_currentTabIndex == 0 && _hasMoreUpcoming) {
        _loadMoreUpcomingTrips();
      } else if (_currentTabIndex == 1 && _hasMoreHistory) {
        _loadMoreHistoryTrips();
      }
    }
  }

  Future<void> _loadInitialData() async {
    setState(() {
      _isInitialLoading = true;
    });

    try {
      // Fetch initial data from backend
      final trips = await TripsTable().queryRows(
        queryFn: (q) => q
            .eqOrNull(
              'user_id',
              currentUserUid,
            )
            .order('departure_at', ascending: false),
        limit: 30,
      );

      setState(() {
        allTrips = trips;
        _organizeTrips();
        _isInitialLoading = false;
      });
    } catch (e) {
      print('Error loading initial trips: $e');
      setState(() {
        _isInitialLoading = false;
      });
    }
  }

  Future<void> _loadMoreUpcomingTrips() async {
    if (_isLoading || !_hasMoreUpcoming) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final nowUtc = DateTime.now().toUtc();

      // Get the last departure date from upcoming trips for pagination
      DateTime? lastDate;
      if (upcomingTrips.isNotEmpty && upcomingSortedDates.isNotEmpty) {
        final lastDateString = upcomingSortedDates.last;
        final lastTrips = upcomingTrips[lastDateString];
        if (lastTrips != null && lastTrips.isNotEmpty) {
          lastDate = lastTrips.last.departureAt;
        }
      }

      final newTrips = await TripsTable().queryRows(
        queryFn: (q) {
          var query = q
              .eqOrNull('user_id', currentUserUid)
              .gte('departure_at', nowUtc.toIso8601String());

          if (lastDate != null) {
            query = query.gt('departure_at', lastDate.toIso8601String());
          }

          return query.order('departure_at', ascending: true);
        },
        limit: _pageSize,
      );

      setState(() {
        if (newTrips.isEmpty || newTrips.length < _pageSize) {
          _hasMoreUpcoming = false;
        }

        // Add new trips to allTrips
        for (var trip in newTrips) {
          if (!allTrips.any((t) => t.id == trip.id)) {
            allTrips.add(trip);
          }
        }

        _organizeTrips();
        _isLoading = false;
      });
    } catch (e) {
      print('Error loading more upcoming trips: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _loadMoreHistoryTrips() async {
    if (_isLoading || !_hasMoreHistory) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final nowUtc = DateTime.now().toUtc();

      // Get the last departure date from history trips for pagination
      DateTime? lastDate;
      if (historyTrips.isNotEmpty && historySortedDates.isNotEmpty) {
        final lastDateString = historySortedDates.last;
        final lastTrips = historyTrips[lastDateString];
        if (lastTrips != null && lastTrips.isNotEmpty) {
          lastDate = lastTrips.last.departureAt;
        }
      }

      final newTrips = await TripsTable().queryRows(
        queryFn: (q) {
          var query = q
              .eqOrNull('user_id', currentUserUid)
              .lt('departure_at', nowUtc.toIso8601String());

          if (lastDate != null) {
            query = query.lt('departure_at', lastDate.toIso8601String());
          }

          return query.order('departure_at', ascending: false);
        },
        limit: _pageSize,
      );

      setState(() {
        if (newTrips.isEmpty || newTrips.length < _pageSize) {
          _hasMoreHistory = false;
        }

        // Add new trips to allTrips
        for (var trip in newTrips) {
          if (!allTrips.any((t) => t.id == trip.id)) {
            allTrips.add(trip);
          }
        }

        _organizeTrips();
        _isLoading = false;
      });
    } catch (e) {
      print('Error loading more history trips: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _organizeTrips() {
    // Clear existing maps
    upcomingTrips.clear();
    historyTrips.clear();

    // Get current UTC time
    final nowUtc = DateTime.now().toUtc();

    for (TripsRow singleTicketItem in allTrips) {
      TripStruct trip = TripStruct(
        airline: singleTicketItem.airline,
        departureDate: singleTicketItem.departureDate,
        flightNumber: singleTicketItem.flightNumber,
        flightClass: singleTicketItem.flightClass,
        departureAirport: singleTicketItem.departureAirport,
        departureTimezone: singleTicketItem.departureTimezone,
        departureTerminal: singleTicketItem.departureTerminal,
        seat: singleTicketItem.seat,
        gateNumber: singleTicketItem.gateNumber,
        arrivalAirport: singleTicketItem.arrivalAirport,
        arrivalTimezone: singleTicketItem.arrivalTimezone,
        arrivalTerminal: singleTicketItem.arrivalTerminal,
        arrivalTime: singleTicketItem.arrivalTime.time,
        pnrNumber: singleTicketItem.pnrNumber,
        departureTime: singleTicketItem.departureTime.time,
        araivalDate: singleTicketItem.araivalDate,
        createdAt: singleTicketItem.createdAt,
        id: singleTicketItem.id,
        updatedAt: singleTicketItem.updatedAt,
        status: singleTicketItem.status,
        arrivalAirportName: singleTicketItem.arrivalAirportName,
        departureAirportName: singleTicketItem.departureAirportName,
        departureAt: singleTicketItem.departureAt,
        arrivalAt: singleTicketItem.arrivalAt,
      );

      if (trip.departureAt != null) {
        // The departureAt from the database is already in UTC
        final departureAtUtc = trip.departureAt!.toUtc();

        // Format date for grouping
        String formattedDate =
            DateFormat('yyyy-MM-dd HH:mm').format(departureAtUtc);

        // Check if the trip is upcoming or history by comparing UTC times
        if (departureAtUtc.isAfter(nowUtc) ||
            departureAtUtc.isAtSameMomentAs(nowUtc)) {
          // Upcoming trip
          if (!upcomingTrips.containsKey(formattedDate)) {
            upcomingTrips[formattedDate] = [];
          }
          upcomingTrips[formattedDate]!.add(trip);
        } else {
          // History trip
          if (!historyTrips.containsKey(formattedDate)) {
            historyTrips[formattedDate] = [];
          }
          historyTrips[formattedDate]!.add(trip);
        }
      }
    }

    // Sort dates for both maps
    upcomingSortedDates = upcomingTrips.keys.toList()
      ..sort((a, b) => a.compareTo(b));
    historySortedDates = historyTrips.keys.toList()
      ..sort((a, b) => b.compareTo(a)); // Reverse sort for history
  }

  Future<void> refreshTrips() async {
    setState(() {
      _currentPage = 0;
      _hasMoreUpcoming = true;
      _hasMoreHistory = true;
      _isLoading = false;
      allTrips.clear();
      upcomingTrips.clear();
      historyTrips.clear();
    });
    await _loadInitialData();
  }

  Future<void> _deleteTrip(TripStruct trip) async {
    try {
      await TripsTable().delete(
        matchingRows: (rows) => rows.eqOrNull(
          'id',
          trip.id,
        ),
      );

      setState(() {
        allTrips.removeWhere((element) => element.id == trip.id);
        _organizeTrips();
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Trip deleted successfully'),
        ),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Cannot delete trip'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isInitialLoading) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.7,
        child: Center(
          child: ListView.separated(
              itemBuilder: (context, index) => _buildLoadingShimmer(),
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemCount: 10),
        ),
      );
    }

    if (allTrips.isEmpty) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.7,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/noTickets.png',
                width: 180.0,
                height: 180.0,
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
              child: Text(
                'No upcoming trips! Plan your next',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey('Inter'),
                    ),
              ),
            ),
            Text(
              'journey now.',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    letterSpacing: 0.0,
                    useGoogleFonts: GoogleFonts.asMap().containsKey('Inter'),
                  ),
            ),
          ].divide(const SizedBox(height: 0.0)),
        ),
      );
    }

    return DefaultTabController(
      length: 2,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.8,
        child: Column(
          children: [
            Container(
              color: FlutterFlowTheme.of(context).secondary,
              child: TabBar(
                onTap: (index) {
                  setState(() {
                    _currentTabIndex = index;
                  });
                },
                labelColor: FlutterFlowTheme.of(context).primary,
                unselectedLabelColor:
                    FlutterFlowTheme.of(context).secondaryText,
                indicator: BoxDecoration(
                  color: const Color.fromRGBO(255, 252, 244, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w700,
                      useGoogleFonts: GoogleFonts.asMap().containsKey('Inter'),
                    ),
                unselectedLabelStyle: FlutterFlowTheme.of(context)
                    .bodyMedium
                    .override(
                      fontFamily: 'Inter',
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                      useGoogleFonts: GoogleFonts.asMap().containsKey('Inter'),
                    ),
                tabs: const [
                  Tab(text: 'Upcoming'),
                  Tab(text: 'History'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // Upcoming Trips Tab
                  RefreshIndicator(
                    onRefresh: refreshTrips,
                    child: ListView(
                      controller:
                          _currentTabIndex == 0 ? _scrollController : null,
                      children: [
                        if (upcomingTrips.isNotEmpty)
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: upcomingSortedDates.length +
                                (_isLoading && _currentTabIndex == 0 ? 1 : 0),
                            itemBuilder: (context, index) {
                              if (index >= upcomingSortedDates.length) {
                                return _buildLoadingShimmer();
                              }

                              String date = upcomingSortedDates[index];
                              List<TripStruct> tripsForDate =
                                  upcomingTrips[date]!
                                    ..sort((a, b) => a.departureTime!
                                        .compareTo(b.departureTime!));

                              return buildDateGroup(
                                  context, date, tripsForDate, index);
                            },
                          )
                        else
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.6,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  'assets/images/noTickets.png',
                                  width: 180.0,
                                  height: 180.0,
                                  fit: BoxFit.contain,
                                ),
                                const SizedBox(height: 30),
                                const Center(
                                  child: Text('No Upcoming Trips'),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),

                  // History Trips Tab
                  if (historyTrips.isNotEmpty)
                    RefreshIndicator(
                      onRefresh: refreshTrips,
                      child: ListView(
                        controller:
                            _currentTabIndex == 1 ? _scrollController : null,
                        children: [
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: historySortedDates.length +
                                (_isLoading && _currentTabIndex == 1 ? 1 : 0),
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 8),
                            itemBuilder: (context, index) {
                              if (index >= historySortedDates.length) {
                                return _buildLoadingShimmer();
                              }

                              String date = historySortedDates[index];
                              List<TripStruct> tripsForDate =
                                  historyTrips[date]!
                                    ..sort((a, b) => b.departureTime!
                                        .compareTo(a.departureTime!));

                              return buildDateGroup(
                                  context, date, tripsForDate, index);
                            },
                          ),
                        ],
                      ),
                    )
                  else
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/images/noTickets.png',
                            width: 180.0,
                            height: 180.0,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(height: 30),
                          const Center(
                            child: Text('No Previous Trips'),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 40.0),
          ],
        ),
      ),
    );
  }

  // Helper method to build date group
  Widget buildDateGroup(BuildContext context, String date,
      List<TripStruct> tripsForDate, int indexAnimation) {
    if (date.isEmpty || tripsForDate.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            DateFormat('yyyy-MM-dd').format(DateTime.parse(date)) ==
                    DateFormat('yyyy-MM-dd').format(DateTime.now())
                ? dateTimeFormat("\'Today\' - d MMMM yyyy", getCurrentTimestamp)
                : DateFormat('dd MMM yyyy').format(DateTime.parse(date)),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Inter',
                  fontSize: 18.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                  useGoogleFonts: GoogleFonts.asMap().containsKey('Inter'),
                ),
          ),
        ),
        Column(
          children: List.generate(
            tripsForDate.length,
            (index) => buildTripTile(
              context,
              tripsForDate[index],
            ).animateOnPageLoad(AnimationInfo(
              trigger: AnimationTrigger.onPageLoad,
              effectsBuilder: () => [
                MoveEffect(
                  curve: Curves.elasticOut,
                  delay: (indexAnimation * 20).ms,
                  duration: 1280.0.ms,
                  begin: const Offset(-100.0, 0.0),
                  end: const Offset(0.0, 0.0),
                ),
              ],
            )),
          ),
        ),
      ],
    );
  }

  // Helper method to build trip tile
  Widget buildTripTile(BuildContext context, TripStruct trip) {
    try {
      return Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Slidable(
          key: ValueKey(trip.id),
          closeOnScroll: true,
          endActionPane: ActionPane(
            motion: const StretchMotion(),
            children: [
              Container(
                width: 150,
                height: 100,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(255, 251, 242, 1),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12),
                      bottomRight: Radius.circular(12)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final res = await showModalBottomSheet<bool>(
                          context: context,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          builder: (context) {
                            return Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(0.0),
                                  bottomRight: Radius.circular(0.0),
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 20.0, 0.0, 20.0),
                                      child: Text(
                                        '🗑 Delete Trip?',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey('Inter'),
                                            ),
                                      ),
                                    ),
                                    Text(
                                      'Are you sure you want to delete this trip from your calendar? ',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lato',
                                            color: const Color(0xFF525252),
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey('Lato'),
                                            lineHeight: 1.5,
                                          ),
                                    ),
                                    Text(
                                      'This action cannot be undone. ',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lato',
                                            color: const Color(0xFF525252),
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey('Lato'),
                                            lineHeight: 1.5,
                                          ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0.0, 20.0, 0.0, 0.0),
                                            child: FFButtonWidget(
                                              onPressed: () {
                                                controller.close();
                                                Navigator.pop(context, false);
                                              },
                                              text: 'No',
                                              options: FFButtonOptions(
                                                width: double.infinity,
                                                height: 40.0,
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                iconPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      useGoogleFonts:
                                                          GoogleFonts.asMap()
                                                              .containsKey(
                                                                  'Inter'),
                                                    ),
                                                elevation: 0.0,
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(3.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0.0, 20.0, 0.0, 0.0),
                                            child: FFButtonWidget(
                                              onPressed: () {
                                                Navigator.pop(context, true);
                                              },
                                              text: 'Yes',
                                              options: FFButtonOptions(
                                                width: double.infinity,
                                                height: 40.0,
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                iconPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      color: Colors.white,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      useGoogleFonts:
                                                          GoogleFonts.asMap()
                                                              .containsKey(
                                                                  'Inter'),
                                                    ),
                                                elevation: 0.0,
                                                borderRadius:
                                                    BorderRadius.circular(3.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ].divide(const SizedBox(width: 7.0)),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                        if (res == true) {
                          await _deleteTrip(trip);
                        }
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            FFIcons.kdeleteOutline,
                            color: Color.fromRGBO(37, 40, 49, 0.8),
                          ),
                          Text(
                            'Delete',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts:
                                      GoogleFonts.asMap().containsKey('Inter'),
                                ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 40,
                      color: Colors.grey.shade400,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.close();
                        context.pushNamed(
                          EditTripWidget.routeName,
                          queryParameters: {
                            'ticketDetails': serializeParam(
                              trip,
                              ParamType.DataStruct,
                            ),
                          }.withoutNulls,
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FFIcons.keditOutline,
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                          Text(
                            'Edit',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts:
                                      GoogleFonts.asMap().containsKey('Inter'),
                                ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          child: InkWell(
            onTap: () async {
              context.pushNamed(
                TripDetailsWidget.routeName,
                queryParameters: {
                  'currentTrip': serializeParam(
                    trip,
                    ParamType.DataStruct,
                  ),
                }.withoutNulls,
              );
            },
            child: MyTripTileWidget(
              key: Key('Keyagu_${trip.id}'),
              tripData: trip,
            ),
          ),
        ),
      );
    } catch (e) {
      return const SizedBox.shrink(); // Fallback widget
    }
  }

  Widget _buildLoadingShimmer() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 120,
              height: 24,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
