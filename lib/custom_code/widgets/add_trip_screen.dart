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

import 'dart:io';

import 'package:percent_indicator/percent_indicator.dart';

import 'package:flutter/scheduler.dart';

import 'dart:async';

import 'package:google_fonts/google_fonts.dart';

import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';

import '/flutter_flow/flutter_flow_drop_down.dart';

import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';

import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';

import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:webviewx_plus/webviewx_plus.dart';

import 'package:intl/intl.dart';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:convert';

class AddTripModel extends FlutterFlowModel {
  // Form keys for validation
  final formKey1 = GlobalKey<FormState>(); // Flight type selection
  final formKey2 = GlobalKey<FormState>(); // Outbound flight details
  final formKey3 = GlobalKey<FormState>(); // Return flight details
  final formKey4 = GlobalKey<FormState>(); // Passenger details

  // Current step in the form
  int currentStep = 1;

  // Flight type selection
  String? flightType;
  String? tripType;

  // PDF upload state
  bool isUploading = false;
  double progressValue = 0.0;
  String? selectedFileName;
  FFUploadedFile? uploadedFile;
  String? uploadedFileUrl;

  // Flight details
  OcrTicketNewStruct ocrTicketNew = OcrTicketNewStruct(tripDetails: []);

  // API response data
  ApiCallResponse? ticketData;

  // Controllers for date and time fields
  TextEditingController departureDateController = TextEditingController();
  TextEditingController departureTimeController = TextEditingController();
  TextEditingController arrivalTimeController = TextEditingController();
  TextEditingController arrivalDateController = TextEditingController();

  // For connection flights
  bool hasConnection = false;

  // Store previous flight details for connections

  // Additional controllers for connection flights

  // Add these controllers to AddTripModel

  // Add these controllers for manual entry
  TextEditingController pnrController = TextEditingController();
  TextEditingController airlineController = TextEditingController();
  TextEditingController flightNumberController = TextEditingController();
  TextEditingController cabinClassController = TextEditingController();
  TextEditingController departureAirportController = TextEditingController();
  TextEditingController departureAirportNameController =
      TextEditingController();
  TextEditingController arrivalAirportController = TextEditingController();
  TextEditingController arrivalAirportNameController = TextEditingController();
  TextEditingController departureTerminalController = TextEditingController();
  TextEditingController arrivalTerminalController = TextEditingController();
  TextEditingController seatController = TextEditingController();
  // Add these controllers for manual entry

  // Controllers for outbound flight

  // Controllers for return flight

  // Controllers for outbound connection flights

  // Controllers for return connection flights

  // Add a constructor
  AddTripModel() : super();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    departureDateController.dispose();
    departureTimeController.dispose();
    arrivalTimeController.dispose();
    arrivalDateController.dispose();

    // Dispose connection controllers

    // Dispose new controllers
    pnrController.dispose();
    airlineController.dispose();
    flightNumberController.dispose();
    cabinClassController.dispose();
    departureAirportController.dispose();
    departureAirportNameController.dispose();
    arrivalAirportController.dispose();
    arrivalAirportNameController.dispose();
    departureTerminalController.dispose();
    arrivalTerminalController.dispose();
    seatController.dispose();
  }
}

class AddTripScreen extends StatefulWidget {
  const AddTripScreen({
    super.key,
    this.width,
    this.height,
    this.ticketDetails,
  });

  final double? width;
  final double? height;
  final TripStruct? ticketDetails;

  @override
  _AddTripScreenState createState() => _AddTripScreenState();
}

class _AddTripScreenState extends State<AddTripScreen> {
  late AddTripModel _model;
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();
    _model = AddTripModel();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkForSharedFile();
    });
  }

  void _checkForSharedFile() {
    // Check if there is Base64 data in App State
    if (FFAppState().sharedFileBase64 != null &&
        FFAppState().sharedFileBase64!.isNotEmpty) {
      // Add the mounted check here
      if (mounted) {
        try {
          // *** THIS IS THE KEY CHANGE ***
          // 1. Decode the Base64 string back into bytes.
          final fileBytes = base64Decode(FFAppState().sharedFileBase64!);

          // 2. Reconstruct your SelectedFile object
          final sharedFile = SelectedFile(
            bytes: fileBytes,
            storagePath:
                'tickets/${DateFormat('yyyy-MM-dd_HH-mm-ss').format(DateTime.now())}${FFAppState().sharedFileName}',
            filePath: null, // Path is not needed since we have the bytes
          );

          // 3. CRUCIAL: Clear the App State so it's not processed again!
          FFAppState().update(() {
            FFAppState().sharedFileBase64 = '';
            FFAppState().sharedFileName = '';
          });

          // 4. Call your existing processing logic with the reconstructed file
          _handleTicketUpload(sharedFile); // Adapt this function if needed
        } catch (e) {
          // Clear the state even if there's an error
          FFAppState().update(() {
            FFAppState().sharedFileBase64 = '';
            FFAppState().sharedFileName = '';
          });
        }
      }
    }
  }

  // void _checkForSharedFile() {
  //   // Check if there is Base64 data in App State
  //   if (FFAppState().sharedFileBase64 != null &&
  //       FFAppState().sharedFileBase64!.isNotEmpty) {
  //     try {
  //       // *** THIS IS THE KEY CHANGE ***
  //       // 1. Decode the Base64 string back into bytes.
  //       final fileBytes = base64Decode(FFAppState().sharedFileBase64!);

  //       // 2. Reconstruct your SelectedFile object
  //       final sharedFile = SelectedFile(
  //         bytes: fileBytes,
  //         storagePath:
  //             'tickets/${FFAppState().sharedFileName}${DateFormat('yyyy-MM-dd_HH-mm-ss').format(DateTime.now())}',
  //         filePath: null, // Path is not needed since we have the bytes
  //       );

  //       // 3. CRUCIAL: Clear the App State so it's not processed again!
  //       FFAppState().update(() {
  //         FFAppState().sharedFileBase64 = '';
  //         FFAppState().sharedFileName = '';
  //       });

  //       // 4. Call your existing processing logic with the reconstructed file
  //       _handleTicketUpload(sharedFile); // Adapt this function if needed
  //     } catch (e) {
  //       // Clear the state even if there's an error
  //       FFAppState().update(() {
  //         FFAppState().sharedFileBase64 = '';
  //         FFAppState().sharedFileName = '';
  //       });
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: _scaffoldKey,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        behavior: HitTestBehavior.opaque,
        child: Scaffold(
          body: Stack(
            children: [
              _buildCurrentStep(),
              if (_model.isUploading)
                Container(
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(24.0),
                      topRight: Radius.circular(24.0),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          'Extracting Details',
                          style:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 50.0, 0.0, 0.0),
                        child: Container(
                          width: 150.0,
                          height: 150.0,
                          decoration: BoxDecoration(
                            color: const Color(0x1A57636C),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              image: Image.asset(
                                'assets/images/Airplane_loader.gif',
                              ).image,
                            ),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      Text(
                        'Our system is reading your\nticket and filling in your trip details.',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.inter(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              fontSize: 15.0,
                              letterSpacing: 0.2,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                              lineHeight: 2.0,
                            ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            30.0, 0.0, 30.0, 0.0),
                        child: LinearPercentIndicator(
                          percent: _model.progressValue,
                          lineHeight: 8.0,
                          animation: true,
                          animateFromLastPercent: true,
                          progressColor: FlutterFlowTheme.of(context).primary,
                          backgroundColor:
                              FlutterFlowTheme.of(context).alternate,
                          barRadius: const Radius.circular(10.0),
                          padding: EdgeInsets.zero,
                        ),
                      ),
                    ]
                        .divide(const SizedBox(height: 50.0))
                        .addToStart(const SizedBox(height: 30.0)),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCurrentStep() {
    switch (_model.currentStep) {
      case 1:
        return _buildFlightTypeSelection();
      case 2:
        return _buildOutboundFlightDetails();
      case 3:
        return _buildReturnFlightDetails();
      case 4:
        return _buildPreview();
      default:
        return _buildFlightTypeSelection();
    }
  }

  Widget _buildTicketSummary() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(255, 252, 246, 1),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _model.ocrTicketNew.tripDetails.length,
          itemBuilder: (context, index) {
            // Add layover text if this is not the last flight and it's a connection flight
            bool showLayover =
                index < (_model.ocrTicketNew.tripDetails.length) - 1 &&
                    _model.flightType == 'Connection Flight';
            final flight = _model.ocrTicketNew.tripDetails[index];
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // From and To Section
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // From Section

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'FROM',
                                  style: GoogleFonts.rubik(
                                    fontWeight: FontWeight.w500,
                                    color: const Color.fromARGB(
                                        255, 178, 178, 178),
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  flight.departureAirport,
                                  style: GoogleFonts.rubik(
                                    fontWeight: FontWeight.w500,
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  flight.departureAirportName,
                                  style: GoogleFonts.rubik(
                                    fontWeight: FontWeight.w400,
                                    color:
                                        const Color.fromRGBO(29, 32, 38, 0.841),
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  _formatDateTime(flight.departureDateTime),
                                  style: GoogleFonts.rubik(
                                    fontWeight: FontWeight.w400,
                                    color:
                                        const Color.fromRGBO(29, 32, 38, 0.841),
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  flight.departureTerminal,
                                  style: GoogleFonts.rubik(
                                    fontWeight: FontWeight.w400,
                                    color:
                                        const Color.fromRGBO(29, 32, 38, 0.841),
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Plane Icon
                          const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 24),
                              child: FaIcon(
                                FontAwesomeIcons.plane,
                                color: Color.fromARGB(255, 178, 178, 178),
                                size: 18.0,
                              )),

                          // To Section
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'TO',
                                  style: GoogleFonts.rubik(
                                    fontWeight: FontWeight.w500,
                                    color: const Color.fromARGB(
                                        255, 178, 178, 178),
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  flight.arrivalAirport,
                                  style: GoogleFonts.rubik(
                                    fontWeight: FontWeight.w500,
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  flight.arrivalAirportName,
                                  style: GoogleFonts.rubik(
                                    fontWeight: FontWeight.w400,
                                    color:
                                        const Color.fromRGBO(29, 32, 38, 0.841),
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  _formatDateTime(flight.arrivalDateTime),
                                  style: GoogleFonts.rubik(
                                    fontWeight: FontWeight.w400,
                                    color:
                                        const Color.fromRGBO(29, 32, 38, 0.841),
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  flight.arrivalTerminal,
                                  style: GoogleFonts.rubik(
                                    fontWeight: FontWeight.w400,
                                    color:
                                        const Color.fromRGBO(29, 32, 38, 0.841),
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 25),
                      const Divider(color: Color.fromARGB(255, 195, 198, 201)),
                      const SizedBox(height: 25),

                      // Class and Flight Number Section
                      Row(
                        children: [
                          // Class Section
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'CLASS',
                                  style: GoogleFonts.rubik(
                                    fontWeight: FontWeight.w500,
                                    color: const Color.fromARGB(
                                        255, 178, 178, 178),
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  flight.cabinClass,
                                  style: GoogleFonts.rubik(
                                    fontWeight: FontWeight.w500,
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Flight Number Section
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'FLIGHT',
                                  style: GoogleFonts.rubik(
                                    fontWeight: FontWeight.w500,
                                    color: const Color.fromARGB(
                                        255, 178, 178, 178),
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  flight.flightNumber,
                                  style: GoogleFonts.rubik(
                                    fontWeight: FontWeight.w500,
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Add layover information if needed
                if (showLayover)
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Color.fromARGB(255, 195, 198, 201),
                          width: 1,
                        ),
                        bottom: BorderSide(
                          color: Color.fromARGB(255, 195, 198, 201),
                          width: 1,
                        ),
                      ),
                    ),
                    child: Text(
                      _calculateLayover(
                        _model.ocrTicketNew.tripDetails[index],
                        _model.ocrTicketNew.tripDetails[index + 1],
                      ),
                      textAlign: TextAlign.center,
                      style: GoogleFonts.rubik(
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(29, 32, 38, 0.841),
                        fontSize: 14,
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  String _calculateLayover(
      TripDetailsStruct currentFlight, TripDetailsStruct nextFlight) {
    try {
      // Parse the datetime strings
      final currentArrival = DateTime.parse(currentFlight.arrivalDateTime);
      final nextDeparture = DateTime.parse(nextFlight.departureDateTime);

      // Calculate the difference
      final difference = nextDeparture.difference(currentArrival);

      // Convert to hours and minutes
      final hours = difference.inHours;
      final minutes = difference.inMinutes.remainder(60);

      // Get the layover location (arrival airport of current flight)
      final location = currentFlight.arrivalAirport ?? 'Unknown';

      return 'Layover: ${hours}h ${minutes}m at $location';
    } catch (e) {
      print('Error calculating layover: $e');
      return 'Layover at ${currentFlight.arrivalAirport ?? "Unknown"}';
    }
  }

  Widget _buildFlightTypeSelection() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _model.formKey1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Upload Ticket to autofill data',
                style: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'Inter',
                      color: const Color(0xFF6F7277),
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),

              // Upload Ticket Button
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F3F6),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: FFButtonWidget(
                  onPressed: () => _handleTicketUpload(),
                  text: 'Upload Ticket',
                  icon: Icon(
                    Icons.add_circle,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 15,
                  ),
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 48,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    color: const Color(0xFFF2F3F6),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Inter',
                          color: FlutterFlowTheme.of(context).tertiary,
                        ),
                    elevation: 0,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Row(
                  children: [
                    const Expanded(child: Divider()),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'or',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              color: const Color(0xFF6F7277),
                            ),
                      ),
                    ),
                    const Expanded(child: Divider()),
                  ],
                ),
              ),

              // PNR Number Field
              TextFormField(
                controller: _model.pnrController,
                decoration: InputDecoration(
                  labelText: 'PNR Number',
                  hintText: '285412552',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Color(0xFFE0E3E7)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Color(0xFFE0E3E7)),
                  ),
                ),
                validator: (value) =>
                    value?.isEmpty == true ? 'Please enter PNR number' : null,
              ),
              const SizedBox(height: 16),

              // Trip Type Dropdown
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFE0E3E7)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButtonFormField<String>(
                  // value: _model.tripType,
                  decoration: const InputDecoration(
                    labelText: 'Trip Type',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                  items: ['Round Trip', 'One Way']
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (val) => setState(() => _model.tripType = val),
                  validator: (val) =>
                      val == null ? 'Please select trip type' : null,
                ),
              ),
              const SizedBox(height: 16),

              // Flight Type Dropdown
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFE0E3E7)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButtonFormField<String>(
                  // value: _model.flightType,
                  decoration: const InputDecoration(
                    labelText: 'Flight Type',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                  items: ['Direct Flight', 'Connection Flight']
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (val) => setState(() => _model.flightType = val),
                  validator: (val) =>
                      val == null ? 'Please select flight type' : null,
                ),
              ),

              // Continue Button
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: FFButtonWidget(
                  onPressed: () {
                    if (_model.formKey1.currentState!.validate()) {
                      setState(() {
                        _model.ocrTicketNew.pnr = _model.pnrController.text;
                        _model.ocrTicketNew.tripType = _model.tripType;
                        _model.ocrTicketNew.flightType = _model.flightType;
                        _model.currentStep = 2;
                      });
                    }
                  },
                  text: 'Continue',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 50,
                    color: const Color(0xFFB8860B), // Golden color
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Inter',
                          color: Colors.white,
                        ),
                    elevation: 0,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Future<void> _handleTicketUpload([SelectedFile? incomingFile]) async {
  //   if (!mounted) return;
  //   setState(() {
  //     _model.isUploading = true;
  //     _model.progressValue = 0.1;
  //   });
  //   final selectedFiles = await selectFiles(
  //     storageFolderPath: 'tickets',
  //     allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png'],

  //     multiFile: false,
  //     // 10MB
  //   );

  //   if (selectedFiles != null) {
  //     final fileBytes = selectedFiles.first.bytes;
  //     const maxFileSizeInBytes = 10 * 1024 * 1024; // 10 MB

  //     if (fileBytes != null && fileBytes.length > maxFileSizeInBytes) {
  //       if (!mounted) return;

  //       setState(() {
  //         _model.isUploading = false;
  //         _model.progressValue = 0.0;
  //       });

  //       SchedulerBinding.instance.addPostFrameCallback((_) {
  //         if (!mounted) {
  //           print('Not mounted, cannot show snackbar.');
  //           return;
  //         }
  //         Future.delayed(const Duration(milliseconds: 100), () {
  //           if (!mounted) {
  //             print('Not mounted after delay, cannot show snackbar.');
  //             return;
  //           }
  //           final scaffoldMessenger = ScaffoldMessenger.maybeOf(context);
  //           if (scaffoldMessenger != null) {
  //             print(
  //                 'ScaffoldMessenger is available via context after delay. Showing snackbar...');
  //             scaffoldMessenger.hideCurrentSnackBar();

  //             scaffoldMessenger.showSnackBar(
  //               const SnackBar(
  //                 content: Text(
  //                   'File size exceeds the limit of 10MB.',
  //                   style: TextStyle(color: Colors.white),
  //                 ),
  //                 backgroundColor: Colors.red,
  //                 duration: Duration(seconds: 3),
  //               ),
  //             );
  //           } else {
  //             print(
  //                 'ScaffoldMessenger.maybeOf(context) returned null after delay. Cannot show snackbar.');
  //           }
  //         });
  //       });

  //       print('Scheduled snackbar for file size limit.');
  //       return;
  //     }
  //     setState(() => _model.progressValue = 0.2);

  //     try {
  //       final uploadedFile = selectedFiles.first;
  //       final downloadUrl = await uploadSupabaseStorageFiles(
  //         bucketName: 'tickets',
  //         selectedFiles: selectedFiles,
  //       );
  //       setState(() => _model.progressValue = 0.3);
  //       final ticketData = await GetTicketDetailsCall.call(
  //         ticketLink: downloadUrl.first,
  //       );
  //       setState(() => _model.progressValue = 0.4);
  //       if (ticketData.succeeded) {
  //         setState(() => _model.progressValue = 0.5);
  //         if (!mounted) return;
  //         setState(() {
  //           _model.progressValue = 0.6;
  //           _model.ocrTicketNew =
  //               OcrTicketNewStruct.fromMap(ticketData.jsonBody);
  //           _model.ticketData = ticketData;
  //           _model.selectedFileName = downloadUrl.first;
  //           setState(() => _model.progressValue = 0.7);
  //           _populateFormFields(ticketData);
  //         });
  //       } else {
  //         if (!mounted) return;
  //         _scaffoldKey.currentState?.showSnackBar(
  //           const SnackBar(
  //             content: Text('Failed to process ticket. Please try again.'),
  //             duration: Duration(seconds: 3),
  //           ),
  //         );
  //       }
  //     } catch (e) {
  //       if (!mounted) return;
  //       print('Error uploading ticket: ${e.toString()}'); // Debug log
  //       _scaffoldKey.currentState?.showSnackBar(
  //         SnackBar(
  //           content: Text('Error uploading ticket: ${e.toString()}'),
  //           duration: const Duration(seconds: 3),
  //         ),
  //       );
  //     } finally {
  //       if (!mounted) return;
  //       setState(() {
  //         _model.isUploading = false;
  //         _model.progressValue = 0.0;
  //       });
  //     }
  //   } else {
  //     setState(() {
  //       _model.isUploading = false;
  //       _model.progressValue = 0.0;
  //     });
  //   }
  // }

  Future<void> _handleTicketUpload([SelectedFile? incomingFile]) async {
    if (!mounted) return;

    // If a file was passed in directly (from the "Share to App" feature)
    if (incomingFile != null) {
      // Immediately start processing the provided file.
      await _processSelectedFile(incomingFile);
    } else {
      // If no file was passed, the user must have clicked the button.
      // Show the file picker to let the user select a file.
      final selectedFiles = await selectFiles(
        storageFolderPath: 'tickets',
        allowedExtensions:
            Platform.isAndroid ? ['pdf', 'jpg', 'jpeg', 'png'] : null,
        multiFile: false,
      );

      // If the user selected a file, start processing it.
      if (selectedFiles != null && selectedFiles.isNotEmpty) {
        await _processSelectedFile(selectedFiles.first);
      }
    }
  }

  Future<void> _processSelectedFile(SelectedFile fileToProcess) async {
    if (!mounted) return;

    // Start the loading animation
    setState(() {
      _model.isUploading = true;
      _model.progressValue = 0.1;
    });

    // --- From here, the logic is your original code, but using `fileToProcess` ---

    final fileBytes = fileToProcess.bytes;
    const maxFileSizeInBytes = 10 * 1024 * 1024; // 10 MB

    // A. Check file size
    if (fileBytes.length > maxFileSizeInBytes) {
      setState(() {
        _model.isUploading = false;
        _model.progressValue = 0.0;
      });

      // Your existing code to show the "file too large" snackbar
      SchedulerBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        final scaffoldMessenger = ScaffoldMessenger.maybeOf(context);
        if (scaffoldMessenger != null) {
          scaffoldMessenger.hideCurrentSnackBar();
          scaffoldMessenger.showSnackBar(
            const SnackBar(
              content: Text(
                'File size exceeds the limit of 10MB.',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.red,
              duration: Duration(seconds: 3),
            ),
          );
        }
      });
      return; // Stop processing
    }

    setState(() => _model.progressValue = 0.2);

    // B. Upload file and call API
    try {
      // Pass the single file inside a list, as the upload function expects a list
      final downloadUrl = await uploadSupabaseStorageFiles(
        bucketName: 'tickets',
        selectedFiles: [fileToProcess],
      );
      setState(() => _model.progressValue = 0.3);

      final ticketData = await GetTicketDetailsCall.call(
        ticketLink: downloadUrl.first,
      );
      setState(() => _model.progressValue = 0.4);

      if (ticketData.succeeded) {
        setState(() => _model.progressValue = 0.5);
        if (!mounted) return;
        setState(() {
          _model.progressValue = 0.6;
          _model.ocrTicketNew = OcrTicketNewStruct.fromMap(ticketData.jsonBody);
          _model.ticketData = ticketData;
          _model.selectedFileName = downloadUrl.first;
          _model.progressValue = 0.7; // set state once
        });
        _populateFormFields(ticketData);
      } else {
        if (!mounted) return;

        _scaffoldKey.currentState?.showSnackBar(
          const SnackBar(
            content: Text('Failed to process ticket. Please try again.'),
            duration: Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      if (!mounted) return;
      print('Error uploading ticket: ${e.toString()}');
      _scaffoldKey.currentState?.showSnackBar(
        SnackBar(
          content: Text('Error uploading ticket: ${e.toString()}'),
          duration: Duration(seconds: 3),
        ),
      );
    } finally {
      // C. Always stop the loading animation when done
      if (mounted) {
        setState(() {
          _model.isUploading = false;
          _model.progressValue = 0.0;
        });
      }
    }
  }

  String convertDateFormat(String inputDate) {
    try {
      // Parse the input date string
      final DateFormat inputFormat = DateFormat('yyyy-MM-dd hh:mm a');
      final DateTime dateTime = inputFormat.parse(inputDate);

      // Format to the desired output
      final DateFormat outputFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss");
      return outputFormat.format(dateTime);
    } catch (e) {
      return inputDate; // Return original string if parsing fails
    }
  }

  void _populateFormFields(ApiCallResponse ticketData) {
    final data = ticketData.jsonBody;

    if (data != null) {
      setState(() {
        _model.progressValue = 0.8;
        _model.tripType =
            data['tripType'] == 'Round Trip' ? 'Round Trip' : 'One Way';
        _model.flightType = data['flightType'] == 'Connection'
            ? 'Connection Flight'
            : 'Direct Flight';

        if (data['tripDetails'] != null &&
            (data['tripDetails'] as List).isNotEmpty) {
          setState(() => _model.progressValue = 0.9);

          // Initialize tripDetails if null
          if (_model.ocrTicketNew.tripDetails == null) {
            _model.ocrTicketNew.tripDetails = [];
          }

          // Store all flight details in a list
          _model.ocrTicketNew.tripDetails.clear(); // Clear existing details
          _model.ocrTicketNew.tripDetails.addAll((data['tripDetails'] as List)
              .map((flight) => TripDetailsStruct.fromMap(flight))
              .toList());

          // Populate first flight (outbound)
          if (_model.ocrTicketNew.tripDetails.isNotEmpty) {
            final outboundFlight = _model.ocrTicketNew.tripDetails[0];

            _model.pnrController.text = outboundFlight.pnr ?? '';
            _model.airlineController.text = outboundFlight.airline ?? '';
            _model.flightNumberController.text =
                outboundFlight.flightNumber ?? '';
            _model.cabinClassController.text = outboundFlight.cabinClass ?? '';
            _model.departureAirportController.text =
                outboundFlight.departureAirport ?? '';
            _model.arrivalAirportController.text =
                outboundFlight.arrivalAirport ?? '';
            _model.departureTerminalController.text =
                outboundFlight.departureTerminal ?? '';
            _model.arrivalTerminalController.text =
                outboundFlight.arrivalTerminal ?? '';
            _model.seatController.text = outboundFlight.seat ?? '';
            _model.arrivalAirportNameController.text =
                outboundFlight.arrivalAirportName ?? '';
            _model.departureAirportNameController.text =
                outboundFlight.departureAirportName ?? '';

            if (outboundFlight.departureDateTime != null) {
              try {
                final departureDateTime =
                    _parseDateTime(outboundFlight.departureDateTime);
                _model.departureDateController.text =
                    DateFormat('yyyy-MM-dd').format(departureDateTime);
                _model.departureTimeController.text =
                    DateFormat('HH:mm').format(departureDateTime);
              } catch (e) {
                print('Error parsing departure date: ${e.toString()}');
              }
            }

            if (outboundFlight.arrivalDateTime != null) {
              try {
                final arrivalDateTime =
                    _parseDateTime(outboundFlight.arrivalDateTime);
                _model.arrivalDateController.text =
                    DateFormat('yyyy-MM-dd').format(arrivalDateTime);
                _model.arrivalTimeController.text =
                    DateFormat('HH:mm').format(arrivalDateTime);
              } catch (e) {
                print('Error parsing arrival date: ${e.toString()}');
              }
            }
          }
          setState(() => _model.progressValue = 1.0);
          // Move to preview screen

          _model.currentStep = 4;
        }
      });
    }
  }

  DateTime _parseDateTime(String dateTimeStr) {
    try {
      // Try parsing ISO format first
      return DateTime.parse(dateTimeStr);
    } catch (e) {
      try {
        // Try parsing with different formats
        final formats = [
          'yyyy-MM-dd HH:mm',
          'yyyy-MM-dd HH:mm:ss',
          'dd-MM-yyyy HH:mm',
          'dd-MM-yyyy HH:mm:ss',
          'MM/dd/yyyy HH:mm',
          'MM/dd/yyyy HH:mm:ss',
          'yyyy/MM/dd HH:mm',
          'yyyy/MM/dd HH:mm:ss',
          'dd/MM/yyyy HH:mm',
          'dd/MM/yyyy HH:mm:ss'
        ];

        for (final format in formats) {
          try {
            final parsed = DateFormat(format).parse(dateTimeStr);

            return parsed;
          } catch (e) {
            continue;
          }
        }

        // If all formats fail, try to extract date and time separately

        final parts = dateTimeStr.split(' ');
        if (parts.length >= 2) {
          final datePart = parts[0];
          final timePart = parts[1];

          // Try different date formats
          final dateFormats = [
            'yyyy-MM-dd',
            'dd-MM-yyyy',
            'MM/dd/yyyy',
            'yyyy/MM/dd',
            'dd/MM/yyyy'
          ];
          DateTime? date;

          for (final format in dateFormats) {
            try {
              // Debug log
              date = DateFormat(format).parse(datePart);
              // Debug log
              break;
            } catch (e) {
              print('Failed to parse date with format: $format'); // Debug log
              continue;
            }
          }

          if (date != null) {
            // Parse time part
            // Debug log
            final timeParts = timePart.split(':');
            if (timeParts.length >= 2) {
              final hour = int.parse(timeParts[0]);
              final minute = int.parse(timeParts[1]);
              final result = DateTime(
                date.year,
                date.month,
                date.day,
                hour,
                minute,
              );
              // Debug log
              return result;
            }
          }
        }

        throw FormatException('Unable to parse date: $dateTimeStr');
      } catch (e) {
        print('Error parsing date: $dateTimeStr'); // Debug log
        print('Error details: ${e.toString()}'); // Debug log
        rethrow;
      }
    }
  }

  // Add this helper method to format datetime
  String _formatDateTime(String? dateTimeStr) {
    if (dateTimeStr == null || dateTimeStr.isEmpty) return '';

    try {
      // Parse the input datetime string (format: "2025-04-30 2:05 AM")
      final parts = dateTimeStr.split(' ');
      if (parts.length != 3) return dateTimeStr;

      final datePart = parts[0]; // "2025-04-30"
      final timePart = parts[1]; // "2:05"
      final amPmPart = parts[2].toUpperCase(); // "AM" or "PM"

      // Parse time
      final timeComponents = timePart.split(':');
      var hour = int.parse(timeComponents[0]);
      final minute = int.parse(timeComponents[1]);

      // Convert to 24-hour format
      if (amPmPart == 'PM' && hour != 12) {
        hour += 12;
      }
      if (amPmPart == 'AM' && hour == 12) {
        hour = 0;
      }

      // Parse date
      final dateComponents = datePart.split('-');
      final year = int.parse(dateComponents[0]);
      final month = int.parse(dateComponents[1]);
      final day = int.parse(dateComponents[2]);

      final dateTime = DateTime(year, month, day, hour, minute);

      // Format the time in 24-hour format
      final formattedTime =
          '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';

      // Get day of week abbreviation
      final weekDay = [
        'Mon',
        'Tue',
        'Wed',
        'Thu',
        'Fri',
        'Sat',
        'Sun'
      ][dateTime.weekday - 1];

      // Get month abbreviation
      final months = [
        'Jan',
        'Feb',
        'Mar',
        'Apr',
        'May',
        'Jun',
        'Jul',
        'Aug',
        'Sep',
        'Oct',
        'Nov',
        'Dec'
      ];
      final monthAbbr = months[dateTime.month - 1];

      // Combine all parts
      return '$formattedTime, $weekDay ${day.toString().padLeft(2, '0')} $monthAbbr';
    } catch (e) {
      return dateTimeStr;
    }
  }

  // Add this helper method to preprocess datetime string
  String _preprocessDateTime(String? dateTimeStr) {
    if (dateTimeStr == null || dateTimeStr.isEmpty) return '';

    try {
      // Remove the 'T' and convert to DateTime
      final dateTime = DateTime.parse(dateTimeStr);

      // Format to 24-hour time format
      final hour = dateTime.hour;
      final minute = dateTime.minute;

      // Create the formatted string
      return '${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')} ${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
    } catch (e) {
      return dateTimeStr;
    }
  }

  Widget _buildOutboundFlightDetails() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _model.formKey1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Upload Ticket Section

              _buildUploadSection(),

              if (_model.ocrTicketNew.tripDetails.isNotEmpty == true)
                _buildTicketSummary(),

              if (_model.tripType == 'Round Trip')
                Text(
                  'Outbound Flight Details',
                  style: FlutterFlowTheme.of(context).titleMedium.override(
                        fontFamily: 'Inter',
                        fontSize: 12,
                        color: const Color(0xFFB8860B),
                        fontWeight: FontWeight.w400,
                      ),
                ),
              if (_model.tripType == 'Round Trip') const SizedBox(height: 16),
              // PNR
              // _buildFormField(
              //   controller: _model.pnrController,
              //   label: 'PNR',
              //   hint: 'Enter PNR',
              //   validator: (value) =>
              //       value?.isEmpty == true ? 'Required' : null,
              // ),
              // Departure Date
              _buildDateField(
                controller: _model.departureDateController,
                label: 'Date',
                hint: 'Select Departure Date',
              ),
              // Airline
              _buildFormField(
                controller: _model.airlineController,
                label: 'Airline',
                hint: 'Enter Airline',
                validator: (value) =>
                    value?.isEmpty == true ? 'Required' : null,
              ),

              // Flight Number
              _buildFormField(
                controller: _model.flightNumberController,
                label: 'Flight Number',
                hint: 'Enter Flight Number',
                validator: (value) =>
                    value?.isEmpty == true ? 'Required' : null,
              ),

              // Class
              _buildFormField(
                controller: _model.cabinClassController,
                label: 'Class',
                hint: 'Enter Class',
                validator: (value) =>
                    value?.isEmpty == true ? 'Required' : null,
              ),

              // Departure Section
              _buildSectionTitle('Departure'),
              const SizedBox(height: 16),

              // Departure Airport
              _buildFormField(
                controller: _model.departureAirportController,
                label: 'Airport',
                isDepAirport: true,
                hint: 'Enter Departure Airport',
                validator: (value) =>
                    value?.isEmpty == true ? 'Required' : null,
              ),

              // Departure Time
              _buildTimeField(
                controller: _model.departureTimeController,
                label: 'Time',
                hint: 'Select Departure Time',
              ),

              // Seat
              _buildFormField(
                controller: _model.seatController,
                label: 'Seat',
                hint: 'Enter Seat Number',
                validator: (value) =>
                    value?.isEmpty == true ? 'Required' : null,
              ),

              // Departure Terminal
              _buildFormField(
                controller: _model.departureTerminalController,
                label: 'Terminal',
                hint: 'Enter Departure Terminal',
                validator: (value) =>
                    value?.isEmpty == true ? 'Required' : null,
              ),

              // Arrival Section
              _buildSectionTitle('Arrival'),
              const SizedBox(height: 16),

              // Arrival Airport
              _buildFormField(
                controller: _model.arrivalAirportController,
                label: 'Airport',
                isArrAirport: true,
                hint: 'Enter Arrival Airport',
                validator: (value) =>
                    value?.isEmpty == true ? 'Required' : null,
              ),

              // Arrival Date
              _buildDateField(
                controller: _model.arrivalDateController,
                label: 'Date',
                hint: 'Select Arrival Date',
              ),

              // Arrival Time
              _buildTimeField(
                controller: _model.arrivalTimeController,
                label: 'Time',
                hint: 'Select Arrival Time',
              ),

              // Arrival Terminal
              _buildFormField(
                controller: _model.arrivalTerminalController,
                label: 'Terminal',
                hint: 'Enter Arrival Terminal',
                validator: (value) =>
                    value?.isEmpty == true ? 'Required' : null,
              ),

              // Add Connection Button (only for connection flights)
              if (_model.flightType == 'Connection Flight') ...[
                const SizedBox(height: 16),
                InkWell(
                  onTap: () {
                    if (_model.formKey1.currentState!.validate()) {
                      setState(() {
                        // Store current flight details
                        _model.ocrTicketNew.tripDetails.add(TripDetailsStruct(
                          pnr: _model.pnrController.text,
                          airline: _model.airlineController.text,
                          flightNumber: _model.flightNumberController.text,
                          cabinClass: _model.cabinClassController.text,
                          departureAirport:
                              _model.departureAirportController.text,
                          arrivalAirport: _model.arrivalAirportController.text,
                          departureDateTime:
                              '${_model.departureDateController.text} ${_model.departureTimeController.text}',
                          arrivalDateTime:
                              '${_model.arrivalDateController.text} ${_model.arrivalTimeController.text}',
                          departureTerminal:
                              _model.departureTerminalController.text,
                          arrivalTerminal:
                              _model.arrivalTerminalController.text,
                          seat: _model.seatController.text,
                          departureAirportName:
                              _model.departureAirportNameController.text,
                          arrivalAirportName:
                              _model.arrivalAirportNameController.text,
                        ));

                        // Clear all controllers for next flight
                        _model.pnrController.clear();
                        _model.airlineController.clear();
                        _model.flightNumberController.clear();
                        _model.cabinClassController.clear();
                        _model.departureAirportController.clear();
                        _model.departureAirportNameController.clear();
                        _model.arrivalAirportController.clear();
                        _model.arrivalAirportNameController.clear();
                        _model.departureTerminalController.clear();
                        _model.arrivalTerminalController.clear();
                        _model.seatController.clear();
                        _model.departureDateController.clear();
                        _model.departureTimeController.clear();
                        _model.arrivalDateController.clear();
                        _model.arrivalTimeController.clear();
                      });
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: const Color(0xFFB8860B), width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.add, color: Color(0xFFB8860B)),
                        const SizedBox(width: 8),
                        Text(
                          '+ Add Connection',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    color: const Color(0xFFB8860B),
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],

              // Continue Button
              const SizedBox(height: 32),
              FFButtonWidget(
                onPressed: () {
                  if (_model.formKey1.currentState!.validate()) {
                    setState(() {
                      // Debug log

                      _model.ocrTicketNew.pnr = _model.pnrController.text;
                      _model.ocrTicketNew.tripType = _model.tripType;
                      _model.ocrTicketNew.flightType = _model.flightType;

                      // Create a new list if it doesn't exist
                      if (_model.ocrTicketNew.tripDetails == null) {
                        _model.ocrTicketNew.tripDetails = [];
                      }

                      // Add the flight details
                      final departureDateTime = convertDateFormat(
                          '${_model.departureDateController.text} ${_model.departureTimeController.text}');
                      final arrivalDateTime = convertDateFormat(
                          '${_model.arrivalDateController.text} ${_model.arrivalTimeController.text}');

                      // Debug log

                      _model.ocrTicketNew.tripDetails.add(TripDetailsStruct(
                        pnr: _model.pnrController.text,
                        airline: _model.airlineController.text,
                        flightNumber: _model.flightNumberController.text,
                        cabinClass: _model.cabinClassController.text,
                        departureAirport:
                            _model.departureAirportController.text,
                        arrivalAirport: _model.arrivalAirportController.text,
                        departureDateTime: departureDateTime,
                        arrivalDateTime: arrivalDateTime,
                        departureTerminal:
                            _model.departureTerminalController.text,
                        arrivalTerminal: _model.arrivalTerminalController.text,
                        seat: _model.seatController.text,
                        departureAirportName:
                            _model.departureAirportNameController.text,
                        arrivalAirportName:
                            _model.arrivalAirportNameController.text,
                      ));
                      if (_model.tripType == 'Round Trip') {
                        // Clear all controllers for next flight
                        _model.pnrController.clear();
                        _model.airlineController.clear();
                        _model.flightNumberController.clear();
                        _model.cabinClassController.clear();
                        _model.departureAirportController.clear();
                        _model.arrivalAirportController.clear();
                        _model.departureTerminalController.clear();
                        _model.arrivalTerminalController.clear();
                        _model.seatController.clear();
                        _model.departureDateController.clear();
                        _model.departureTimeController.clear();
                        _model.arrivalDateController.clear();
                        _model.arrivalTimeController.clear();
                        _model.departureAirportNameController.clear();
                        _model.arrivalAirportNameController.clear();
                      }

                      _model.currentStep =
                          _model.tripType == 'Round Trip' ? 3 : 4;
                    });
                  }
                },
                text: 'Continue',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 50,
                  color: const Color(0xFFB8860B),
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Inter',
                        color: Colors.white,
                      ),
                  elevation: 0,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReturnFlightDetails() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _model.formKey2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Upload Ticket Section
              _buildUploadSection(),

              if (_model.ocrTicketNew.tripDetails.isNotEmpty == true)
                _buildTicketSummary(),

              Text(
                'Enter Return Flight Details',
                style: FlutterFlowTheme.of(context).titleMedium.override(
                      fontFamily: 'Inter',
                      color: const Color(0xFFB8860B),
                      fontWeight: FontWeight.w400,
                    ),
              ),
              if (_model.tripType == 'Round Trip') const SizedBox(height: 16),
              // PNR
              // _buildFormField(
              //   controller: _model.pnrController,
              //   label: 'PNR',
              //   hint: 'Enter PNR',
              //       validator: (value) =>
              //           value?.isEmpty == true ? 'Required' : null,
              // ),

              // Departure Time
              _buildTimeField(
                controller: _model.departureTimeController,
                label: 'Time',
                hint: 'Select Departure Time',
              ),

              // Airline
              _buildFormField(
                controller: _model.airlineController,
                label: 'Airline',
                hint: 'Enter Airline',
                validator: (value) =>
                    value?.isEmpty == true ? 'Required' : null,
              ),

              // Flight Number
              _buildFormField(
                controller: _model.flightNumberController,
                label: 'Flight Number',
                hint: 'Enter Flight Number',
                validator: (value) =>
                    value?.isEmpty == true ? 'Required' : null,
              ),

              // Class
              _buildFormField(
                controller: _model.cabinClassController,
                label: 'Class',
                hint: 'Enter Class',
                validator: (value) =>
                    value?.isEmpty == true ? 'Required' : null,
              ),

              // Departure Section
              _buildSectionTitle('Departure'),
              const SizedBox(height: 16),

              // Departure Airport
              _buildFormField(
                controller: _model.departureAirportController,
                isDepAirport: true,
                label: 'Airport',
                hint: 'Enter Departure Airport',
                validator: (value) =>
                    value?.isEmpty == true ? 'Required' : null,
              ),

              // Departure Date
              _buildDateField(
                controller: _model.departureDateController,
                label: 'Date',
                hint: 'Select Departure Date',
              ),

              // Seat
              _buildFormField(
                controller: _model.seatController,
                label: 'Seat',
                hint: 'Enter Seat Number',
                validator: (value) =>
                    value?.isEmpty == true ? 'Required' : null,
              ),
              // Departure Terminal
              _buildFormField(
                controller: _model.departureTerminalController,
                label: 'Terminal',
                hint: 'Enter Departure Terminal',
                validator: (value) =>
                    value?.isEmpty == true ? 'Required' : null,
              ),

              // Arrival Section
              _buildSectionTitle('Arrival'),
              const SizedBox(height: 16),

              // Arrival Airport
              _buildFormField(
                controller: _model.arrivalAirportController,
                isArrAirport: true,
                label: 'Airport',
                hint: 'Enter Arrival Airport',
                validator: (value) =>
                    value?.isEmpty == true ? 'Required' : null,
              ),

              // Arrival Date
              _buildDateField(
                controller: _model.arrivalDateController,
                label: 'Date',
                hint: 'Select Arrival Date',
              ),

              // Arrival Time
              _buildTimeField(
                controller: _model.arrivalTimeController,
                label: 'Time',
                hint: 'Select Arrival Time',
              ),

              // Arrival Terminal
              _buildFormField(
                controller: _model.arrivalTerminalController,
                label: 'Terminal',
                hint: 'Enter Arrival Terminal',
                validator: (value) =>
                    value?.isEmpty == true ? 'Required' : null,
              ),
              // Add Connection Button (only for connection flights)
              if (_model.flightType == 'Connection Flight') ...[
                const SizedBox(height: 16),
                InkWell(
                  onTap: () {
                    if (_model.formKey1.currentState!.validate()) {
                      setState(() {
                        // Store current flight details
                        _model.ocrTicketNew.tripDetails.add(TripDetailsStruct(
                          pnr: _model.pnrController.text,
                          airline: _model.airlineController.text,
                          flightNumber: _model.flightNumberController.text,
                          cabinClass: _model.cabinClassController.text,
                          departureAirport:
                              _model.departureAirportController.text,
                          arrivalAirport: _model.arrivalAirportController.text,
                          departureDateTime: convertDateFormat(
                              '${_model.departureDateController.text} ${_model.departureTimeController.text}'),
                          arrivalDateTime: convertDateFormat(
                              '${_model.arrivalDateController.text} ${_model.arrivalTimeController.text}'),
                          departureTerminal:
                              _model.departureTerminalController.text,
                          arrivalTerminal:
                              _model.arrivalTerminalController.text,
                          seat: _model.seatController.text,
                          departureAirportName:
                              _model.departureAirportNameController.text,
                          arrivalAirportName:
                              _model.arrivalAirportNameController.text,
                        ));

                        // Clear all controllers for next flight
                        _model.pnrController.clear();
                        _model.airlineController.clear();
                        _model.flightNumberController.clear();
                        _model.cabinClassController.clear();
                        _model.departureAirportController.clear();
                        _model.departureAirportNameController.clear();
                        _model.arrivalAirportController.clear();
                        _model.arrivalAirportNameController.clear();
                        _model.departureTerminalController.clear();
                        _model.arrivalTerminalController.clear();
                        _model.seatController.clear();
                        _model.departureDateController.clear();
                        _model.departureTimeController.clear();
                        _model.arrivalDateController.clear();
                        _model.arrivalTimeController.clear();
                      });
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: const Color(0xFFB8860B), width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.add, color: Color(0xFFB8860B)),
                        const SizedBox(width: 8),
                        Text(
                          '+ Add Connection',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    color: const Color(0xFFB8860B),
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],

              // Continue Button
              const SizedBox(height: 32),
              FFButtonWidget(
                onPressed: () {
                  if (_model.formKey2.currentState!.validate()) {
                    setState(() {
                      _model.ocrTicketNew.pnr = _model.pnrController.text;
                      _model.ocrTicketNew.tripType = _model.tripType;
                      _model.ocrTicketNew.flightType = _model.flightType;
                      _model.ocrTicketNew.tripDetails.add(TripDetailsStruct(
                        pnr: _model.pnrController.text,
                        airline: _model.airlineController.text,
                        flightNumber: _model.flightNumberController.text,
                        cabinClass: _model.cabinClassController.text,
                        departureAirport:
                            _model.departureAirportController.text,
                        arrivalAirport: _model.arrivalAirportController.text,
                        departureDateTime:
                            '${_model.departureDateController.text} ${_model.departureTimeController.text}',
                        arrivalDateTime:
                            '${_model.arrivalDateController.text} ${_model.arrivalTimeController.text}',
                        departureTerminal:
                            _model.departureTerminalController.text,
                        arrivalTerminal: _model.arrivalTerminalController.text,
                        seat: _model.seatController.text,
                        departureAirportName:
                            _model.departureAirportNameController.text,
                        arrivalAirportName:
                            _model.arrivalAirportNameController.text,
                      ));

                      _model.currentStep = 4;
                    });
                  }
                },
                text: 'Continue',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 50,
                  color: const Color(0xFFB8860B),
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Inter',
                        color: Colors.white,
                      ),
                  elevation: 0,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUploadSection() {
    return Column(
      children: [
        Text(
          'Upload Ticket to autofill data',
          style: FlutterFlowTheme.of(context).labelMedium.override(
                fontFamily: 'Inter',
                color: const Color(0xFF6F7277),
              ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF2F3F6),
            borderRadius: BorderRadius.circular(8),
          ),
          child: FFButtonWidget(
            onPressed: () => _handleTicketUpload(),
            text: 'Upload Ticket',
            icon: Icon(
              Icons.add_circle,
              color: FlutterFlowTheme.of(context).primary,
              size: 15,
            ),
            options: FFButtonOptions(
              width: double.infinity,
              height: 48,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              color: const Color(0xFFF2F3F6),
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: 'Inter',
                    color: FlutterFlowTheme.of(context).tertiary,
                  ),
              elevation: 0,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Text(
            'or',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Inter',
                  color: const Color(0xFF6F7277),
                ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _buildFormField({
    required TextEditingController controller,
    required String label,
    required String hint,
    bool? isArrAirport = false,
    bool? isDepAirport = false,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: const Color(0x0E0D1634),
          ),
        ),
        child: TextFormField(
          onChanged: (_) {
            if (isArrAirport == true) {
              EasyDebounce.debounce(
                '_model.arrivalAirportController',
                const Duration(milliseconds: 2000),
                () async {
                  if (_model.arrivalAirportController.text.length == 3) {
                    final data = await GetAirportCall.call(
                      airport: _model.arrivalAirportController.text,
                    );
                    if (data.succeeded) {
                      // safeSetState(() {
                      // _model.arrivalTimeZoneValueController?.value =
                      //     ((_model.arrTimeZone?.jsonBody ?? '')
                      //             .toList()
                      //             .map<AirportDetailsStruct?>(
                      //                 AirportDetailsStruct.maybeFromMap)
                      //             .toList() as Iterable<AirportDetailsStruct?>)
                      //         .withoutNulls
                      //         .firstOrNull!
                      //         .timezone;
                      // });
                      // _model.arrivalTimezoneValue =
                      //     ((_model.arrTimeZone?.jsonBody ?? '')
                      //             .toList()
                      //             .map<AirportDetailsStruct?>(
                      //                 AirportDetailsStruct.maybeFromMap)
                      //             .toList() as Iterable<AirportDetailsStruct?>)
                      //         .withoutNulls
                      //         ?.firstOrNull
                      //         ?.timezone;

                      _model.arrivalAirportNameController.text =
                          ((data.jsonBody ?? '')
                                          .toList()
                                          .map<AirportDetailsStruct?>(
                                              AirportDetailsStruct.maybeFromMap)
                                          .toList()
                                      as Iterable<AirportDetailsStruct?>)
                                  .withoutNulls
                                  .firstOrNull
                                  ?.name ??
                              '';
                      //  safeSetState(() {});
                    } else {
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   SnackBar(
                      //     content: Text(
                      //       (_model.arrTimeZone?.exceptionMessage ?? ''),
                      //       style: GoogleFonts.getFont(
                      //         'Roboto',
                      //         color: FlutterFlowTheme.of(context).secondaryText,
                      //         fontWeight: FontWeight.normal,
                      //         fontSize: 14.0,
                      //       ),
                      //     ),
                      //     duration: Duration(milliseconds: 4000),
                      //     backgroundColor: FlutterFlowTheme.of(context).error,
                      //   ),
                      // );
                    }
                  }
                },
              );
            } else if (isDepAirport == true) {
              EasyDebounce.debounce(
                '_model.departureAirportController',
                const Duration(milliseconds: 2000),
                () async {
                  if (_model.departureAirportController.text.length == 3) {
                    final data = await GetAirportCall.call(
                      airport: _model.departureAirportController.text,
                    );
                    if (data.succeeded) {
                      // safeSetState(() {
                      // _model.arrivalTimeZoneValueController?.value =
                      //     ((_model.arrTimeZone?.jsonBody ?? '')
                      //             .toList()
                      //             .map<AirportDetailsStruct?>(
                      //                 AirportDetailsStruct.maybeFromMap)
                      //             .toList() as Iterable<AirportDetailsStruct?>)
                      //         .withoutNulls
                      //         .firstOrNull!
                      //         .timezone;
                      // });
                      // _model.arrivalTimezoneValue =
                      //     ((_model.arrTimeZone?.jsonBody ?? '')
                      //             .toList()
                      //             .map<AirportDetailsStruct?>(
                      //                 AirportDetailsStruct.maybeFromMap)
                      //             .toList() as Iterable<AirportDetailsStruct?>)
                      //         .withoutNulls
                      //         ?.firstOrNull
                      //         ?.timezone;

                      _model.departureAirportNameController.text =
                          ((data.jsonBody ?? '')
                                          .toList()
                                          .map<AirportDetailsStruct?>(
                                              AirportDetailsStruct.maybeFromMap)
                                          .toList()
                                      as Iterable<AirportDetailsStruct?>)
                                  .withoutNulls
                                  .firstOrNull
                                  ?.name ??
                              '';

                      //  safeSetState(() {});
                    } else {
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   SnackBar(
                      //     content: Text(
                      //       (_model.arrTimeZone?.exceptionMessage ?? ''),
                      //       style: GoogleFonts.getFont(
                      //         'Roboto',
                      //         color: FlutterFlowTheme.of(context).secondaryText,
                      //         fontWeight: FontWeight.normal,
                      //         fontSize: 14.0,
                      //       ),
                      //     ),
                      //     duration: Duration(milliseconds: 4000),
                      //     backgroundColor: FlutterFlowTheme.of(context).error,
                      //   ),
                      // );
                    }
                  }
                  safeSetState(() {});
                },
              );
            }
          },
          controller: controller,
          decoration: _getInputDecoration(hint, label: label),
          validator: validator,
        ),
      ),
    );
  }

  Widget _buildDateField({
    required TextEditingController controller,
    required String label,
    required String hint,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: const Color(0x0E0D1634),
          ),
        ),
        child: TextFormField(
          controller: controller,
          decoration: _getInputDecoration(
            hint,
            label: label,
            suffixIcon:
                const Icon(Icons.calendar_today, color: Color(0xFFB8860B)),
          ),
          validator: (value) => value?.isEmpty == true ? 'Required' : null,
          readOnly: true,
          onTap: () async {
            final date = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(const Duration(days: 365)),
            );
            if (date != null) {
              setState(() {
                controller.text = DateFormat('yyyy-MM-dd').format(date);
              });
            }
          },
        ),
      ),
    );
  }

  Widget _buildTimeField({
    required TextEditingController controller,
    required String label,
    required String hint,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: const Color(0x0E0D1634),
              ),
            ),
            child: TextFormField(
              controller: controller,
              decoration: _getInputDecoration(
                hint,
                label: label,
                suffixIcon:
                    const Icon(Icons.access_time, color: Color(0xFFB8860B)),
              ),
              validator: (value) => value?.isEmpty == true ? 'Required' : null,
              readOnly: true,
              onTap: () async {
                final time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (time != null) {
                  setState(() {
                    controller.text = time.format(context);
                  });
                }
              },
            ),
          ),
        ),
      ],
    );
  }

  InputDecoration _getInputDecoration(String hint,
      {Widget? suffixIcon, String? label}) {
    //  InputDecoration(
    //           isDense: false,
    //           labelText: 'Airline',
    //           labelStyle: FlutterFlowTheme.of(context).labelSmall.override(
    //                 fontFamily: 'Inter',
    //                 fontSize: 15.0,
    //                 letterSpacing: 0.0,
    //                 useGoogleFonts: GoogleFonts.asMap().containsKey('Inter'),
    //               ),
    //           hintText: 'Enter your Airline',
    //           hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
    //                 fontFamily: 'Inter',
    //                 letterSpacing: 0.0,
    //                 useGoogleFonts: GoogleFonts.asMap().containsKey('Inter'),
    //               ),
    //           enabledBorder: InputBorder.none,
    //           focusedBorder: InputBorder.none,
    //           errorBorder: InputBorder.none,
    //           focusedErrorBorder: InputBorder.none,
    //         ),

    return InputDecoration(
      labelText: label,
      labelStyle: FlutterFlowTheme.of(context).labelSmall.override(
            fontFamily: 'Inter',
            fontSize: 15.0,
            letterSpacing: 0.0,
            useGoogleFonts: GoogleFonts.asMap().containsKey('Inter'),
          ),
      hintText: hint,
      hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: 'Inter',
            color: const Color(0xFF6F7277),
          ),
      // enabledBorder: OutlineInputBorder(
      //   borderSide: BorderSide(
      //     color: Color(0xFFE0E0E0),
      //     width: 1,
      //   ),
      //   borderRadius: BorderRadius.circular(8),
      // ),
      // focusedBorder: OutlineInputBorder(
      //   borderSide: BorderSide(
      //     color: Color(0xFFB8860B),
      //     width: 1,
      //   ),
      //   borderRadius: BorderRadius.circular(8),
      // ),
      // errorBorder: OutlineInputBorder(
      //   borderSide: BorderSide(
      //     color: Color(0xFFFF0000),
      //     width: 1,
      //   ),
      //   borderRadius: BorderRadius.circular(8),
      // ),
      // focusedErrorBorder: OutlineInputBorder(
      //   borderSide: BorderSide(
      //     color: Color(0xFFFF0000),
      //     width: 1,
      //   ),
      //   borderRadius: BorderRadius.circular(8),
      // ),

      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      focusedErrorBorder: InputBorder.none,
      // filled: true,
      // fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      suffixIcon: suffixIcon,
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: FlutterFlowTheme.of(context).titleMedium.override(
            fontFamily: 'Inter',
            color: const Color(0xFFB8860B),
            fontWeight: FontWeight.w500,
          ),
    );
  }

  Widget _buildPreview() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // PNR Number
            Text(
              'PNR Number',
              style: GoogleFonts.rubik(
                fontWeight: FontWeight.w500,
                color: const Color.fromARGB(255, 178, 178, 178),
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              _model.ocrTicketNew.pnr ?? '',
              style: GoogleFonts.rubik(
                fontWeight: FontWeight.w500,
                color: const Color.fromARGB(255, 0, 0, 0),
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 24),

            // Trip Type
            Text(
              'Trip Type',
              style: GoogleFonts.rubik(
                fontWeight: FontWeight.w500,
                color: const Color.fromARGB(255, 178, 178, 178),
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              _model.tripType ?? '',
              style: GoogleFonts.rubik(
                fontWeight: FontWeight.w500,
                color: const Color.fromARGB(255, 0, 0, 0),
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 24),

            // Flight Type
            Text(
              'Flight Type',
              style: GoogleFonts.rubik(
                fontWeight: FontWeight.w500,
                color: const Color.fromARGB(255, 178, 178, 178),
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              _model.flightType ?? '',
              style: GoogleFonts.rubik(
                fontWeight: FontWeight.w500,
                color: const Color.fromARGB(255, 0, 0, 0),
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 32),

            // Outbound Flight Details
            Text(
              'Outbound Flight Details',
              style: GoogleFonts.rubik(
                fontWeight: FontWeight.w500,
                color: const Color(0xFFB8860B),
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 16),

            // Show outbound flights
            if (_model.ocrTicketNew.tripDetails != null)
              ..._buildFlightSection(_model.ocrTicketNew.tripDetails,
                  isOutbound: true),

            // Return Flight Details (if round trip)
            if (_model.tripType == 'Round Trip' &&
                _model.ocrTicketNew.tripDetails != null) ...[
              const SizedBox(height: 32),
              Text(
                'Return Flight Details',
                style: GoogleFonts.rubik(
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFFB8860B),
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 16),
              ..._buildFlightSection(_model.ocrTicketNew.tripDetails,
                  isOutbound: false),
            ],

            // Submit Button
            const SizedBox(height: 32),
            FFButtonWidget(
              onPressed: _handleSubmit,
              text: 'Submit',
              options: FFButtonOptions(
                width: double.infinity,
                height: 50,
                color: const Color(0xFFB8860B),
                textStyle: GoogleFonts.rubik(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontSize: 16,
                ),
                elevation: 0,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildFlightSection(List<TripDetailsStruct> flights,
      {required bool isOutbound}) {
    final widgets = <Widget>[];
    final flightDetails = isOutbound
        ? flights.take((flights.length + 1) ~/ 2).toList()
        : flights.skip((flights.length + 1) ~/ 2).toList();

    for (var i = 0; i < flightDetails.length; i++) {
      final flight = flightDetails[i];

      // Add flight details
      widgets.add(
        Container(
          decoration: BoxDecoration(
            color: const Color.fromRGBO(255, 252, 246, 1),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: _buildTicketDetailsNew(flight),
        ),
      );

      // Add layover information if it's a connection flight and not the last flight
      if (_model.flightType == 'Connection Flight' &&
          i < flightDetails.length - 1) {
        widgets.add(
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Color.fromARGB(255, 195, 198, 201)),
                bottom: BorderSide(color: Color.fromARGB(255, 195, 198, 201)),
              ),
            ),
            child: Text(
              _calculateLayover(
                _model.ocrTicketNew.tripDetails[i],
                _model.ocrTicketNew.tripDetails[i + 1],
              ),
              textAlign: TextAlign.center,
              style: GoogleFonts.rubik(
                fontWeight: FontWeight.w400,
                color: const Color.fromRGBO(29, 32, 38, 0.841),
                fontSize: 14,
              ),
            ),
          ),
        );
      }
    }

    return widgets;
  }

  Widget _buildTicketDetails(TripDetailsStruct flight) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // From and To Section
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // From Section
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'FROM',
                      style: GoogleFonts.rubik(
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(255, 178, 178, 178),
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      flight.departureAirport ?? '',
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      style: GoogleFonts.rubik(
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      flight.departureAirportName ?? '',
                      style: GoogleFonts.rubik(
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(29, 32, 38, 0.841),
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      DateFormat('HH:mm, EEE d MMM')
                          .format(DateTime.parse(flight.departureDateTime)),
                      // _formatDateTime(_preprocessDateTime(flight.departureDateTime)),
                      style: GoogleFonts.rubik(
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(29, 32, 38, 0.841),
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Terminal: ' + flight.departureTerminal ?? '',
                      style: GoogleFonts.rubik(
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(29, 32, 38, 0.841),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),

              // Plane Icon
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: FaIcon(
                  FontAwesomeIcons.plane,
                  color: Color.fromARGB(255, 178, 178, 178),
                  size: 18.0,
                ),
              ),

              // To Section
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'TO',
                      style: GoogleFonts.rubik(
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(255, 178, 178, 178),
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      textAlign: TextAlign.end,
                      flight.arrivalAirport ?? '',
                      style: GoogleFonts.rubik(
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      textAlign: TextAlign.end,
                      maxLines: 1,
                      flight.arrivalAirportName ?? '',
                      style: GoogleFonts.rubik(
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(29, 32, 38, 0.841),
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      DateFormat('HH:mm, EEE d MMM')
                          .format(DateTime.parse(flight.arrivalDateTime)),
                      // _formatDateTime(_preprocessDateTime(flight.arrivalDateTime)),
                      textAlign: TextAlign.end,
                      style: GoogleFonts.rubik(
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(29, 32, 38, 0.841),
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Terminal: ' + flight.arrivalTerminal ?? '',
                      style: GoogleFonts.rubik(
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(29, 32, 38, 0.841),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 25),
          const Divider(color: Color.fromARGB(255, 195, 198, 201)),
          const SizedBox(height: 25),

          // Class and Flight Number Section
          Row(
            children: [
              // Class Section
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CLASS',
                      style: GoogleFonts.rubik(
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(255, 178, 178, 178),
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      flight.cabinClass ?? '',
                      style: GoogleFonts.rubik(
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),

              // Flight Number Section
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'FLIGHT',
                      style: GoogleFonts.rubik(
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(255, 178, 178, 178),
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      flight.flightNumber ?? '',
                      style: GoogleFonts.rubik(
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTicketDetailsNew(TripDetailsStruct flight) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // From and To Section
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'FROM',
                    style: GoogleFonts.rubik(
                      fontWeight: FontWeight.w500,
                      color: const Color.fromARGB(255, 178, 178, 178),
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    flight.departureAirport ?? '',
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    style: GoogleFonts.rubik(
                      fontWeight: FontWeight.w500,
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    flight.departureAirportName ?? '',
                    style: GoogleFonts.rubik(
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(29, 32, 38, 0.841),
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    DateFormat('HH:mm, EEE d MMM')
                        .format(DateTime.parse(flight.departureDateTime)),
                    // _formatDateTime(_preprocessDateTime(flight.departureDateTime)),
                    style: GoogleFonts.rubik(
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(29, 32, 38, 0.841),
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Terminal: ' + flight.departureTerminal ?? '',
                    style: GoogleFonts.rubik(
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(29, 32, 38, 0.841),
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'TO',
                        style: GoogleFonts.rubik(
                          fontWeight: FontWeight.w500,
                          color: const Color.fromARGB(255, 178, 178, 178),
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        textAlign: TextAlign.end,
                        flight.arrivalAirport ?? '',
                        style: GoogleFonts.rubik(
                          fontWeight: FontWeight.w500,
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        textAlign: TextAlign.end,
                        maxLines: 1,
                        flight.arrivalAirportName ?? '',
                        style: GoogleFonts.rubik(
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(29, 32, 38, 0.841),
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        DateFormat('HH:mm, EEE d MMM')
                            .format(DateTime.parse(flight.arrivalDateTime)),
                        // _formatDateTime(_preprocessDateTime(flight.arrivalDateTime)),
                        textAlign: TextAlign.end,
                        style: GoogleFonts.rubik(
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(29, 32, 38, 0.841),
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Terminal: ' + flight.arrivalTerminal ?? '',
                        style: GoogleFonts.rubik(
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(29, 32, 38, 0.841),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 25),
          const Divider(color: Color.fromARGB(255, 195, 198, 201)),
          const SizedBox(height: 25),

          // Class and Flight Number Section
          Row(
            children: [
              // Class Section
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CLASS',
                      style: GoogleFonts.rubik(
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(255, 178, 178, 178),
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      flight.cabinClass ?? '',
                      style: GoogleFonts.rubik(
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),

              // Flight Number Section
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'FLIGHT',
                      style: GoogleFonts.rubik(
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(255, 178, 178, 178),
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      flight.flightNumber ?? '',
                      style: GoogleFonts.rubik(
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _handleSubmit() async {
    try {
      // print('Starting trip submission...'); // Debug log

      // Validate trip details
      if (_model.ocrTicketNew.tripDetails == null ||
          _model.ocrTicketNew.tripDetails.isEmpty) {
        throw Exception('No flight details found');
      }

      // Insert each flight in the trip
      for (var i = 0; i < _model.ocrTicketNew.tripDetails.length; i++) {
        final flight = _model.ocrTicketNew.tripDetails[i];

        // Validate required fields
        if (flight.departureDateTime == null ||
            flight.departureDateTime.isEmpty) {
          throw Exception('Departure date is required for flight ${i + 1}');
        }
        if (flight.arrivalDateTime == null || flight.arrivalDateTime.isEmpty) {
          throw Exception('Arrival date is required for flight ${i + 1}');
        }

        // Format date and time
        final departureDateTime = flight.departureDateTime.replaceAll('T', ' ');
        final arrivalDateTime = flight.arrivalDateTime.replaceAll('T', ' ');

        final insertData = <String, dynamic>{
          'pnr_number': flight.pnr,
          'departure_date': departureDateTime.split(' ')[0],
          'departure_time': departureDateTime.split(' ')[1],
          'araival_date': arrivalDateTime.split(' ')[0],
          'arrival_time': arrivalDateTime.split(' ')[1],
          'airline': flight.airline,
          'flight_number': flight.flightNumber,
          'flight_class': flight.cabinClass,
          'departure_airport': flight.departureAirport,
          'arrival_airport': flight.arrivalAirport,
          'trip_type': _model.tripType,
          'user_id': currentUser!.uid,
          'seat': flight.seat,
          'departure_terminal': flight.departureTerminal,
          'arrival_terminal': flight.arrivalTerminal,
          'departure_airport_name': flight.departureAirportName,
          'arrival_airport_name': flight.arrivalAirportName,
        };

// ✅ Add timezone ONLY if valid
        if (flight.departureAirportTimezone != null &&
            flight.departureAirportTimezone!.isNotEmpty) {
          insertData['departure_timezone'] = flight.departureAirportTimezone;
        }

        if (flight.arrivalAirportTimezone != null &&
            flight.arrivalAirportTimezone!.isNotEmpty) {
          insertData['arrival_timezone'] = flight.arrivalAirportTimezone;
        }

        final response = await Supabase.instance.client
            .from('trips')
            .insert(insertData)
            .select()
            .single();

        // print('Inserting flight ${i + 1}...'); // Debug log
        // final response = await Supabase.instance.client
        //     .from('trips')
        //     .insert({
        //       'pnr_number': flight.pnr,
        //       'departure_date': departureDateTime.split(' ')[0],
        //       'departure_time': departureDateTime.split(' ')[1],
        //       'araival_date': arrivalDateTime.split(' ')[0],
        //       'arrival_time': arrivalDateTime.split(' ')[1],
        //       'airline': flight.airline,
        //       'flight_number': flight.flightNumber,
        //       'flight_class': flight.cabinClass,
        //       'departure_airport': flight.departureAirport,
        //       'departure_timezone': flight.departureAirportTimezone,
        //       'arrival_airport': flight.arrivalAirport,
        //       'arrival_timezone': flight.arrivalAirportTimezone,
        //       'trip_type': _model.tripType,
        //       'user_id': currentUser!.uid,
        //       'seat': flight.seat,
        //       'departure_terminal': flight.departureTerminal,
        //       'arrival_terminal': flight.arrivalTerminal,
        //       'departure_airport_name': flight.departureAirportName,
        //       'arrival_airport_name': flight.arrivalAirportName,
        //     })
        //     .select()
        //     .single();

        // print(
        //     'Flight ${i + 1} inserted successfully: ${response['id']}'); // Debug log
      }

      // Navigate back after successful save
      if (mounted) {
        // print('Navigation back...'); // Debug log
        Navigator.pop(context);
      }
    } catch (e) {
      print('Error saving trip details: ${e.toString()}'); // Debug log
      if (mounted) {
        _scaffoldKey.currentState?.showSnackBar(
          SnackBar(
            content: Text('Error saving trip: ${e.toString()}'),
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }
  }
}
