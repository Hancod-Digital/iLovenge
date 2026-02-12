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

import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';

Future getEmailOtp(BuildContext context, String email) async {
  try {
    // Get a reference your Supabase client
    final supabase = Supabase.instance.client;
    print(email);

    await supabase.auth.signInWithOtp(email: email);

    // Optionally, show success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('OTP Sent to ' + email)),
    );
  } catch (error) {
    // Handle the error and display a Snackbar with the error message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error sending OTP: $error')),
    );
  }
}
