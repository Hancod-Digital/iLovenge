// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:i_l_o_v_enge/auth/supabase_auth/auth_util.dart';

/// Returns true when the latest arrived trip has no belt set.
Future<bool> addBeltNumber() async {
  try {
    final nowUtc = DateTime.now().toUtc();

    final recentTrips = await TripsTable().queryRows(
      queryFn: (q) => q
          .eqOrNull('user_id', currentUserUid)
          .lteOrNull('arrival_at', nowUtc)
          .order('arrival_at', ascending: false),
      limit: 1,
    );

    if (recentTrips.isEmpty) {
      debugPrint('addBeltNumber: no arrived trips yet');
      return false;
    }

    final recent = recentTrips.first;
    final arrivalAt = recent.arrivalAt?.toUtc();
    if (arrivalAt == null || arrivalAt.isAfter(nowUtc)) {
      debugPrint('addBeltNumber: latest trip is not arrived yet');
      return false;
    }

    final seat = recent.seat?.trim() ?? '';
    final belt = recent.belt?.trim() ?? '';

    FFAppState().update(() {
      FFAppState().currentTripId = recent.id;
      FFAppState().tripStatus = recent.status ?? '';
      FFAppState().depDate = recent.departureAt?.toIso8601String() ?? '';
      FFAppState().depTime = recent.departureAt?.toIso8601String() ?? '';
      FFAppState().arrivalTime = arrivalAt.toIso8601String();
      FFAppState().arrivalAirportName =
          recent.arrivalAirportName ?? recent.arrivalAirport;
      FFAppState().arrivalAirport = recent.arrivalAirport;
      FFAppState().departureAirportName =
          recent.departureAirportName ?? recent.departureAirport;
      FFAppState().departureAirport = recent.departureAirport;
      FFAppState().departureTimezone = recent.departureTimezone ?? '';
      FFAppState().arrivalTimezone = recent.arrivalTimezone ?? '';
      FFAppState().departureTerminal = recent.departureTerminal ?? '';
      FFAppState().arrivalTerminal = recent.arrivalTerminal ?? '';
      FFAppState().airline = recent.airline;
      FFAppState().flightNumber = recent.flightNumber;
      FFAppState().flightClass = recent.flightClass ?? '';
      FFAppState().seat = recent.seat ?? '';
      FFAppState().gateNumber = recent.gateNumber ?? '';
      FFAppState().pnr = recent.pnrNumber;
      FFAppState().seatMissing = seat.isEmpty;
      FFAppState().beltNumber = belt;
    });

    final shouldShowPopup = belt.isEmpty;
    debugPrint(
      shouldShowPopup
          ? 'addBeltNumber: arrived trip is missing belt'
          : 'addBeltNumber: arrived trip already has belt',
    );
    return shouldShowPopup;
  } catch (e) {
    debugPrint('addBeltNumber error: $e');
    return false;
  }
}
