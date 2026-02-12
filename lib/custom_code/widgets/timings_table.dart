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

class TimingsTable extends StatefulWidget {
  const TimingsTable({
    super.key,
    this.width,
    this.height,
    required this.timesJson,
  });

  final double? width;
  final double? height;
  final String timesJson;

  @override
  State<TimingsTable> createState() => _TimingsTableState();
}

class _TimingsTableState extends State<TimingsTable> {
  @override
  Widget build(BuildContext context) {
    // Decode JSON string into a Map
    Map<String, dynamic> schedule = jsonDecode(widget.timesJson);

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // First Column (Days)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: schedule.keys.map((day) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  day,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Lato',
                        color: FlutterFlowTheme.of(context).tertiary,
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey('Lato'),
                      ),
                ),
              );
            }).toList(),
          ),

          const SizedBox(width: 16), // Space between columns

          // Second Column (Timings)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: schedule.entries.map((entry) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  "${entry.value['from']} - ${entry.value['to']}",
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Lato',
                        color: FlutterFlowTheme.of(context).tertiary,
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey('Lato'),
                      ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
