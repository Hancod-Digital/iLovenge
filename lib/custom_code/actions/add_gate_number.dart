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

Future<bool> addGateNumber() async {
  // Add your function code here!
  try {
    final userDashData = await SupabaseRPCGroup.useDashBoardCall.call(
      userId: currentUserUid,
    );

    if (userDashData.succeeded && userDashData.jsonBody != null) {
      // Check if the JSON data is a Map
      if (userDashData.jsonBody is Map<String, dynamic>) {
        final jsonData = userDashData.jsonBody as Map<String, dynamic>;

        // Check if 'tripNow' key exists and is a List
        if (jsonData.containsKey('tripNow') && jsonData['tripNow'] is List) {
          final tripNowList = jsonData['tripNow'] as List<dynamic>;

          // Check if the list of trips is not empty
          if (tripNowList.isNotEmpty) {
            // Get the first trip from the list (the soonest upcoming one)
            final tripNowData = tripNowList[0] as Map<String, dynamic>;

            // Extract id
            String? tripId = tripNowData.containsKey('id')
                ? tripNowData['id'] as String?
                : null;

            // Set id and other details in FFAppState for global access
            if (tripId != null) {
              FFAppState().update(() {
                FFAppState().currentTripId = tripId;
                FFAppState().tripStatus = tripNowData['status'];
                FFAppState().depDate = tripNowData['departure_at'];
                FFAppState().depTime = tripNowData['departure_at'];
                FFAppState().arrivalTime =
                    tripNowData['arrival_at']?.toString() ?? '';
                FFAppState().pnr = tripNowData['pnr_number'];
                // seat will be evaluated below; initialize to false first
                FFAppState().seatMissing = false;
              });
              print('Set id in FFAppState: $tripId');
            }

            // Detect seat missing
            if (tripNowData.containsKey('seat')) {
              final seat = tripNowData['seat'];
              final missingSeat =
                  seat == null || (seat is String && seat.isEmpty);
              FFAppState().seatMissing = missingSeat;
            } else {
              // No key means we should prompt for seat as well
              FFAppState().seatMissing = true;
            }

            // Check if 'gate_number' key exists
            if (tripNowData.containsKey('gate_number')) {
              final gateNumber = tripNowData['gate_number'];

              // Check if gate_number is null or an empty string
              if (gateNumber == null ||
                  (gateNumber is String && gateNumber.isEmpty)) {
                print('Gate number is null or empty. Returning true.');
                return true; // Return true to show the bottom sheet
              } else {
                print('Gate number found: $gateNumber. Returning false.');
                return false; // Gate number exists, return false
              }
            } else {
              print(
                  'Key "gate_number" not found in the first trip. Returning true.');
              return true; // 'gate_number' key is missing, meaning no gate number - return true
            }
          } else {
            print(
                'The "tripNow" list is empty. No upcoming trips. Returning false.');
            return false; // No upcoming trips, so nothing to do.
          }
        } else {
          print('Key "tripNow" not found or is not a List. Returning false.');
          return false; // 'tripNow' is missing or not a list, return false
        }
      } else {
        print('API response body is not a Map. Returning false.');
        return false; // The response is not a Map, return false
      }
    } else {
      // If the API call failed
      print(
          'API call failed or response body is null. Error: ${userDashData.exceptionMessage}');
      return false; // Return false on error
    }
  } catch (e) {
    // For any other errors
    print('An error occurred in addGateNumber action: $e');
    return false; // Return false on error
  }
}
