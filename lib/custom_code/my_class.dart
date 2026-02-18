import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';

// It's good practice to import the App State and routing files
// to ensure FlutterFlow knows about the dependencies.
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/nav/nav.dart';

class ShareIntentManager {
  // --- Private Static Variables ---
  // A flag to ensure we only initialize the listener once.
  static bool _isInitialized = false;

  // The stream subscription that needs to live for the app's lifetime.
  static late StreamSubscription _intentDataStreamSubscription;
  static String? _lastHandledSharedPath;

  // Private constructor to prevent someone from creating a new instance.
  ShareIntentManager._();

  // --- Public Static Method ---
  // This is the only method you will call from FlutterFlow.
  static void initialize(BuildContext context) {
    // If the listener is already running, do nothing.
    if (_isInitialized) {
      return;
    }

    // Mark as initialized to prevent this code from running again.
    _isInitialized = true;
    print('ShareIntentManager: Initializing listeners...');

    // 1. Handle the intent that launched the app from a terminated state.
    ReceiveSharingIntent.instance
        .getInitialMedia()
        .then((List<SharedMediaFile> value) async {
      if (value.isNotEmpty) {
        print('ShareIntentManager: Received initial media.');
        await _handleSharedFiles(value, context);
      }
    });

    // 2. Handle intents that are received while the app is running.
    _intentDataStreamSubscription = ReceiveSharingIntent.instance
        .getMediaStream()
        .listen((List<SharedMediaFile> value) async {
      if (value.isNotEmpty) {
        print('ShareIntentManager: Received media from stream.');
        await _handleSharedFiles(value, context);
      }
    }, onError: (err) {
      print("ShareIntentManager Error: $err");
    });
  }

  // --- Private Helper Method ---
  // This contains the logic to process the file and navigate.
  static Future<void> _handleSharedFiles(
      List<SharedMediaFile> sharedFiles, BuildContext context) async {
    final sharedFile = sharedFiles.first;
    if (sharedFile.type != SharedMediaType.file) {
      await ReceiveSharingIntent.instance.reset();
      return;
    }

    final path = sharedFile.path;
    if (path.isEmpty || _lastHandledSharedPath == path) {
      await ReceiveSharingIntent.instance.reset();
      return;
    }

    try {
      final fileBytes = await File(path).readAsBytes();
      final fileName = path.split('/').last;

      // Encode the bytes into a Base64 string.
      final String base64String = base64Encode(fileBytes);

      // Store the Base64 string and file name in App State.
      FFAppState().update(() {
        FFAppState().sharedFileBase64 = base64String;
        FFAppState().sharedFileName = fileName;
      });

      _lastHandledSharedPath = path;

      // Navigate to your Add New Trip page.
      // Make sure 'addNewTrip' is the correct route name for your AddNewTripWidget.
      if (context.mounted) {
        context.pushNamed('addNewTrip');
      }
    } catch (e) {
      print('ShareIntentManager: Error handling shared file: $e');
    } finally {
      await ReceiveSharingIntent.instance.reset();
    }
  }
}
