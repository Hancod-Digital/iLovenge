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

import 'package:supabase_flutter/supabase_flutter.dart';

Future<bool> confirmOtp(String token, String phone) async {
  // Add your function code here!
  // Get a reference your Supabase client
  var number;
  if (phone == '+919876543210') {
    number = '9876543210';
  } else {
    number = phone;
  }
  final supabase = Supabase.instance.client;
  try {
    await supabase.auth.verifyOTP(
      type: OtpType.sms,
      token: token,
      phone: number,
    );
    return true;
  } catch (error) {
    return false;
  }
}
