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

import 'dart:async';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

Future<void> globalInternetchecker() async {
  late Timer _timer;
  bool lastState = FFAppState().Internet;

  Future<void> checkInternet() async {
    try {
      // Check internet connectivity
      final bool isConnected = await InternetConnection().hasInternetAccess;

      // Update state if it changes
      if (lastState != isConnected) {
        lastState = isConnected;
        FFAppState().Internet = isConnected;
        FFAppState().notifyListeners();
        print('Internet connection status updated: $isConnected');
      }
    } catch (e) {
      // Handle any errors
      if (lastState != false) {
        lastState = false;
        FFAppState().Internet = false;
        FFAppState().notifyListeners();
        print('Error checking internet connection: $e');
      }
    }
  }

  // Periodic check every 1 second
  _timer = Timer.periodic(const Duration(seconds: 1), (_) async {
    await checkInternet();
  });
}
