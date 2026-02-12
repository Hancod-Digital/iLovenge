// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:google_fonts/google_fonts.dart';

import 'package:dotted_border/dotted_border.dart';

class DottedBorderButton extends StatefulWidget {
  const DottedBorderButton({
    super.key,
    this.width,
    this.height,
    required this.text,
    required this.onPressed,
  });

  final double? width;
  final double? height;
  final String text;
  final Future Function() onPressed;

  @override
  State<DottedBorderButton> createState() => _DottedBorderButtonState();
}

class _DottedBorderButtonState extends State<DottedBorderButton> {
  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: Colors.black, // ✅ Change border color here
      strokeWidth: 1.5, // ✅ Border thickness
      borderType: BorderType.RRect, // ✅ Rounded rectangle border
      radius: const Radius.circular(12), // ✅ Corner radius
      dashPattern: const [4, 3], // ✅ Dash style
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: Center(
            child: Text(
          widget.text,
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Lato',
                color: FlutterFlowTheme.of(context).tertiary,
                fontSize: 14.0,
                letterSpacing: 0.0,
                fontWeight: FontWeight.w500,
                useGoogleFonts: GoogleFonts.asMap().containsKey('Lato'),
              ),
        )),
      ),
    );
  }
}
