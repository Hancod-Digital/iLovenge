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

class TimeZoneDropDown extends StatefulWidget {
  const TimeZoneDropDown({
    super.key,
    this.width,
    this.height,
    this.timeZones,
  });

  final double? width;
  final double? height;
  final List<String>? timeZones;

  @override
  State<TimeZoneDropDown> createState() => _TimeZoneDropDownState();
}

class _TimeZoneDropDownState extends State<TimeZoneDropDown> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
