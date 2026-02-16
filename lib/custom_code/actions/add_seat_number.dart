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
import 'package:i_l_o_v_enge/backend/api_requests/api_calls.dart';

/// Returns true when the current trip has no seat set so the UI can prompt.
Future<bool> addSeatNumber() async {
  try {
    final userDashData = await SupabaseRPCGroup.useDashBoardCall.call(
      userId: currentUserUid,
    );

    if (!userDashData.succeeded || userDashData.jsonBody == null) {
      debugPrint(
          'addSeatNumber: API failed or empty response: ${userDashData.exceptionMessage}');
      return false;
    }

    if (userDashData.jsonBody is! Map<String, dynamic>) {
      debugPrint('addSeatNumber: API body not a Map');
      return false;
    }

    final jsonData = userDashData.jsonBody as Map<String, dynamic>;
    if (!jsonData.containsKey('tripNow') || jsonData['tripNow'] is! List) {
      debugPrint('addSeatNumber: tripNow missing or not a list');
      return false;
    }

    final tripNowList = jsonData['tripNow'] as List<dynamic>;
    if (tripNowList.isEmpty) {
      debugPrint('addSeatNumber: no upcoming trips');
      return false;
    }

    final tripNowData = tripNowList.first as Map<String, dynamic>;

    // Track seat value in app state for other parts of the UI.
    if (tripNowData.containsKey('seat')) {
      final seat = tripNowData['seat'];
      final missingSeat = seat == null || (seat is String && seat.isEmpty);
      FFAppState().seatMissing = missingSeat;
      if (missingSeat) {
        debugPrint('addSeatNumber: seat is missing');
        return true;
      }
      debugPrint('addSeatNumber: seat already set');
      return false;
    }

    // Seat field not present: treat as missing.
    FFAppState().seatMissing = true;
    debugPrint('addSeatNumber: seat key missing; prompting user');
    return true;
  } catch (e) {
    debugPrint('addSeatNumber error: $e');
    return false;
  }
}
