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
import 'package:flutter/services.dart';

const MethodChannel _iosShareChannel = MethodChannel('ilovenge/share_file');
bool _isIosShareListenerInitialized = false;
String? _lastHandledSharedPath;

/// To access FFAppStat
Future handleIncomingShare(BuildContext context) async {
  if (Platform.isIOS) {
    _initializeIosShareListener(context);
    await _handleInitialIosSharedFile(context);
    return;
  }

  // Keep Android and other platforms on receive_sharing_intent flow.
  ShareIntentManager.initialize(context);
}

void _initializeIosShareListener(BuildContext context) {
  if (_isIosShareListenerInitialized) {
    return;
  }
  _isIosShareListenerInitialized = true;

  _iosShareChannel.setMethodCallHandler((call) async {
    if (call.method != 'onSharedFilePath') {
      return;
    }
    final sharedPath = call.arguments as String?;
    if (sharedPath == null || sharedPath.isEmpty) {
      return;
    }
    await _storeSharedFileAndNavigate(sharedPath, context);
  });
}

Future<void> _handleInitialIosSharedFile(BuildContext context) async {
  try {
    final sharedPath =
        await _iosShareChannel.invokeMethod<String>('getInitialSharedFilePath');
    if (sharedPath == null || sharedPath.isEmpty) {
      return;
    }
    await _storeSharedFileAndNavigate(sharedPath, context);
  } catch (e) {
    print('Error getting initial iOS shared file path: $e');
  }
}

Future<void> _storeSharedFileAndNavigate(
    String filePath, BuildContext context) async {
  if (filePath.isEmpty || _lastHandledSharedPath == filePath) {
    return;
  }

  try {
    final file = File(filePath);
    if (!await file.exists()) {
      return;
    }

    final fileBytes = await file.readAsBytes();
    final String base64String = base64Encode(fileBytes);
    final fileName = file.path.split('/').last;

    FFAppState().update(() {
      FFAppState().sharedFileBase64 = base64String;
      FFAppState().sharedFileName = fileName;
    });

    _lastHandledSharedPath = filePath;

    if (context.mounted) {
      context.pushNamed(AddNewTripWidget.routeName);
    }
  } catch (e) {
    print('Error handling shared file: $e');
  }
}
