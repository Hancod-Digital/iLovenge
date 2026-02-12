import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'add_new_trip_widget.dart' show AddNewTripWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddNewTripModel extends FlutterFlowModel<AddNewTripWidget> {
  ///  Local state fields for this page.

  DateTime? departureDate;

  DateTime? departureTime;

  DateTime? araivalTime;

  /// uploaded file name
  String? selectedFileName = '';

  DateTime? arrivalDate;

  List<String> tripType = ['Round Trip', 'One Way'];
  void addToTripType(String item) => tripType.add(item);
  void removeFromTripType(String item) => tripType.remove(item);
  void removeAtIndexFromTripType(int index) => tripType.removeAt(index);
  void insertAtIndexInTripType(int index, String item) =>
      tripType.insert(index, item);
  void updateTripTypeAtIndex(int index, Function(String) updateFn) =>
      tripType[index] = updateFn(tripType[index]);

  DateTime? roundArrTime;

  DateTime? roundArrDate;

  DateTime? roundDepDate;

  DateTime? roundDepTime;

  bool isUploading = false;

  double progressValue = 0.0;

  String? departureTimezoneValue;

  String? arrivalTimezoneValue;

  String? departureAirportName;

  String? arrivalAirportName;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
