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

import 'package:i_l_o_v_enge/trip/add_new_trip/add_new_trip_widget.dart';

import 'package:i_l_o_v_enge/custom_code/my_class.dart';

import 'dart:io';
import 'dart:convert'; // <-- IMPORTANT: Add this import for Base64
import 'package:receive_sharing_intent/receive_sharing_intent.dart';

/// To access FFAppStat
Future handleIncomingShare(BuildContext context) async {
  ShareIntentManager.initialize(context);
  final List<SharedMediaFile> sharedFiles =
      await ReceiveSharingIntent.instance.getInitialMedia();

  if (sharedFiles.isNotEmpty) {
    final sharedFile = sharedFiles.first;
    if (sharedFile.type == SharedMediaType.file) {
      try {
        final fileBytes = await File(sharedFile.path).readAsBytes();
        final fileName = sharedFile.path.split('/').last;

        // *** THIS IS THE KEY CHANGE ***
        // 1. Encode the bytes into a Base64 string.
        final String base64String = base64Encode(fileBytes);

        // 2. Store the Base64 string and file name in App State.
        FFAppState().update(() {
          FFAppState().sharedFileBase64 = base64String;
          FFAppState().sharedFileName = fileName;
        });

        // 3. Navigate to your page. This can be a standard FF "Navigate To" action.
        context.pushNamed(
            AddNewTripWidget.routeName); // Use your page's route name
      } catch (e) {
        print('Error handling shared file: $e');
      }
    }
  }
}
