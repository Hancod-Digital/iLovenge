import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'edit_trip_widget.dart' show EditTripWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class EditTripModel extends FlutterFlowModel<EditTripWidget> {
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

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (timeZones)] action in EditTrip widget.
  ApiCallResponse? apiResultgt0;
  bool isDataUploading_uploadData = false;
  FFUploadedFile uploadedLocalFile_uploadData =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadData = '';

  // Stores action output result for [Backend Call - API (getTicketDetails)] action in ButtonBefore widget.
  ApiCallResponse? ticketData1stUpload;
  bool isDataUploading_uploadData2 = false;
  FFUploadedFile uploadedLocalFile_uploadData2 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadData2 = '';

  // Stores action output result for [Backend Call - API (getTicketDetails)] action in ButtonAfter widget.
  ApiCallResponse? ticketDataReUpload;
  // State field(s) for pnrNumber widget.
  FocusNode? pnrNumberFocusNode;
  TextEditingController? pnrNumberTextController;
  String? Function(BuildContext, String?)? pnrNumberTextControllerValidator;
  String? _pnrNumberTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'PNR Number is required';
    }

    return null;
  }

  DateTime? datePicked1;
  // State field(s) for tripType widget.
  String? tripTypeValue;
  FormFieldController<String>? tripTypeValueController;
  DateTime? datePicked2;
  DateTime? datePicked3;
  // State field(s) for airline widget.
  FocusNode? airlineFocusNode;
  TextEditingController? airlineTextController;
  String? Function(BuildContext, String?)? airlineTextControllerValidator;
  String? _airlineTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Airline is required';
    }

    return null;
  }

  // State field(s) for flightNumberTextField widget.
  FocusNode? flightNumberTextFieldFocusNode;
  TextEditingController? flightNumberTextFieldTextController;
  String? Function(BuildContext, String?)?
      flightNumberTextFieldTextControllerValidator;
  String? _flightNumberTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Flight Number is required';
    }

    return null;
  }

  // State field(s) for seatClass widget.
  FocusNode? seatClassFocusNode;
  TextEditingController? seatClassTextController;
  String? Function(BuildContext, String?)? seatClassTextControllerValidator;
  // State field(s) for airportDepart widget.
  FocusNode? airportDepartFocusNode;
  TextEditingController? airportDepartTextController;
  String? Function(BuildContext, String?)? airportDepartTextControllerValidator;
  String? _airportDepartTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Departure Airport is required';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (getAirport)] action in airportDepart widget.
  ApiCallResponse? departureTimeZone;
  // State field(s) for DepartureTimeZone widget.
  String? departureTimeZoneValue;
  FormFieldController<String>? departureTimeZoneValueController;
  DateTime? datePicked4;
  DateTime? datePicked5;
  // State field(s) for terminalDep widget.
  FocusNode? terminalDepFocusNode;
  TextEditingController? terminalDepTextController;
  String? Function(BuildContext, String?)? terminalDepTextControllerValidator;
  // State field(s) for seat widget.
  FocusNode? seatFocusNode;
  TextEditingController? seatTextController;
  String? Function(BuildContext, String?)? seatTextControllerValidator;
  // State field(s) for gate widget.
  FocusNode? gateFocusNode;
  TextEditingController? gateTextController;
  String? Function(BuildContext, String?)? gateTextControllerValidator;
  // State field(s) for airportArrival widget.
  FocusNode? airportArrivalFocusNode;
  TextEditingController? airportArrivalTextController;
  String? Function(BuildContext, String?)?
      airportArrivalTextControllerValidator;
  String? _airportArrivalTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Airport is required';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (getAirport)] action in airportArrival widget.
  ApiCallResponse? arrTimeZone;
  // State field(s) for ArrivalTimeZone widget.
  String? arrivalTimeZoneValue;
  FormFieldController<String>? arrivalTimeZoneValueController;
  // State field(s) for terminalArr widget.
  FocusNode? terminalArrFocusNode;
  TextEditingController? terminalArrTextController;
  String? Function(BuildContext, String?)? terminalArrTextControllerValidator;
  DateTime? datePicked6;
  DateTime? datePicked7;
  DateTime? datePicked8;
  DateTime? datePicked9;

  @override
  void initState(BuildContext context) {
    pnrNumberTextControllerValidator = _pnrNumberTextControllerValidator;
    airlineTextControllerValidator = _airlineTextControllerValidator;
    flightNumberTextFieldTextControllerValidator =
        _flightNumberTextFieldTextControllerValidator;
    airportDepartTextControllerValidator =
        _airportDepartTextControllerValidator;
    airportArrivalTextControllerValidator =
        _airportArrivalTextControllerValidator;
  }

  @override
  void dispose() {
    pnrNumberFocusNode?.dispose();
    pnrNumberTextController?.dispose();

    airlineFocusNode?.dispose();
    airlineTextController?.dispose();

    flightNumberTextFieldFocusNode?.dispose();
    flightNumberTextFieldTextController?.dispose();

    seatClassFocusNode?.dispose();
    seatClassTextController?.dispose();

    airportDepartFocusNode?.dispose();
    airportDepartTextController?.dispose();

    terminalDepFocusNode?.dispose();
    terminalDepTextController?.dispose();

    seatFocusNode?.dispose();
    seatTextController?.dispose();

    gateFocusNode?.dispose();
    gateTextController?.dispose();

    airportArrivalFocusNode?.dispose();
    airportArrivalTextController?.dispose();

    terminalArrFocusNode?.dispose();
    terminalArrTextController?.dispose();
  }
}
