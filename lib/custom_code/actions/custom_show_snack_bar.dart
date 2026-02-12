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

import 'package:google_fonts/google_fonts.dart';

Future customShowSnackBar(BuildContext context) async {
  // Add your function code here!
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        'This card is already added to your account. Please choose different card',
        style: GoogleFonts.getFont(
          'Montserrat',
          color: FlutterFlowTheme.of(context).secondary,
        ),
      ),
      duration: Duration(milliseconds: 4000),
      backgroundColor: FlutterFlowTheme.of(context).error,
    ),
  );
}
