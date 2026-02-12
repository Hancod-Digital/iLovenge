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
import 'edit_trip_model.dart';
export 'edit_trip_model.dart';

class EditTripWidget extends StatefulWidget {
  const EditTripWidget({
    super.key,
    this.ticketDetails,
  });

  final TripStruct? ticketDetails;

  static String routeName = 'EditTrip';
  static String routePath = '/editTrip';

  @override
  State<EditTripWidget> createState() => _EditTripWidgetState();
}

class _EditTripWidgetState extends State<EditTripWidget>
    with TickerProviderStateMixin {
  late EditTripModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditTripModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.isUploading = true;
      safeSetState(() {});
      _model.apiResultgt0 = await TimeZonesCall.call();

      if ((_model.apiResultgt0?.succeeded ?? true)) {
        if (widget!.ticketDetails != null) {
          // pnr
          safeSetState(() {
            _model.pnrNumberTextController?.text =
                widget!.ticketDetails!.pnrNumber;
          });
          safeSetState(() {
            _model.gateTextController?.text = widget!.ticketDetails!.gateNumber;
          });
          // airline
          safeSetState(() {
            _model.airlineTextController?.text = widget!.ticketDetails!.airline;
          });
          // flightnbr
          safeSetState(() {
            _model.flightNumberTextFieldTextController?.text =
                widget!.ticketDetails!.flightNumber;
          });
          // class
          safeSetState(() {
            _model.seatClassTextController?.text =
                widget!.ticketDetails!.flightClass;
          });
          // departurAirport
          safeSetState(() {
            _model.airportDepartTextController?.text =
                widget!.ticketDetails!.departureAirport;
          });
          // depTerminal
          safeSetState(() {
            _model.terminalDepTextController?.text =
                widget!.ticketDetails!.departureTerminal;
          });
          // seat
          safeSetState(() {
            _model.seatTextController?.text = widget!.ticketDetails!.seat;
          });
          // gate
          safeSetState(() {
            _model.gateTextController?.text = widget!.ticketDetails!.gateNumber;
          });
          // arrAirport
          safeSetState(() {
            _model.airportArrivalTextController?.text =
                widget!.ticketDetails!.arrivalAirport;
          });
          // arivalTerminal
          safeSetState(() {
            _model.terminalArrTextController?.text =
                widget!.ticketDetails!.arrivalTerminal;
          });
          // ArrTimezon
          safeSetState(() {
            _model.arrivalTimeZoneValueController?.value =
                widget!.ticketDetails!.arrivalTimezone;
            _model.arrivalTimeZoneValue =
                widget!.ticketDetails!.arrivalTimezone;
          });
          safeSetState(() {
            _model.departureTimeZoneValueController?.value =
                widget!.ticketDetails!.departureTimezone;
            _model.departureTimeZoneValue =
                widget!.ticketDetails!.departureTimezone;
          });
          // depDate
          _model.departureDate = functions
              .parseDateTime(widget!.ticketDetails!.departureDate!.toString());
          safeSetState(() {});
          // depTime
          _model.departureTime = functions
              .parseDateTime(widget!.ticketDetails!.departureTime!.toString());
          safeSetState(() {});
          // arrDate
          _model.arrivalDate = functions
              .parseDateTime(widget!.ticketDetails!.araivalDate!.toString());
          safeSetState(() {});
          // arrTime
          _model.araivalTime = functions
              .parseDateTime(widget!.ticketDetails!.arrivalTime!.toString());
          safeSetState(() {});
          _model.departureAirportName =
              widget!.ticketDetails?.departureAirportName;
          safeSetState(() {});
          _model.arrivalAirportName = widget!.ticketDetails?.arrivalAirportName;
          safeSetState(() {});
          _model.isUploading = false;
          safeSetState(() {});
        } else {
          _model.isUploading = false;
          safeSetState(() {});
        }
      } else {
        _model.isUploading = false;
        safeSetState(() {});
      }
    });

    _model.pnrNumberTextController ??= TextEditingController();
    _model.pnrNumberFocusNode ??= FocusNode();

    _model.airlineTextController ??= TextEditingController();
    _model.airlineFocusNode ??= FocusNode();

    _model.flightNumberTextFieldTextController ??= TextEditingController();
    _model.flightNumberTextFieldFocusNode ??= FocusNode();

    _model.seatClassTextController ??= TextEditingController();
    _model.seatClassFocusNode ??= FocusNode();

    _model.airportDepartTextController ??= TextEditingController();
    _model.airportDepartFocusNode ??= FocusNode();

    _model.terminalDepTextController ??= TextEditingController();
    _model.terminalDepFocusNode ??= FocusNode();

    _model.seatTextController ??= TextEditingController();
    _model.seatFocusNode ??= FocusNode();

    _model.gateTextController ??= TextEditingController();
    _model.gateFocusNode ??= FocusNode();

    _model.airportArrivalTextController ??= TextEditingController();
    _model.airportArrivalFocusNode ??= FocusNode();

    _model.terminalArrTextController ??= TextEditingController();
    _model.terminalArrFocusNode ??= FocusNode();

    animationsMap.addAll({
      'buttonOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          TiltEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(-0.698, 0),
            end: Offset(0, 0),
          ),
        ],
      ),
      'buttonOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          TiltEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(-0.698, 0),
            end: Offset(0, 0),
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).tertiary,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).tertiary,
          automaticallyImplyLeading: false,
          leading: Padding(
            padding: EdgeInsets.all(8.0),
            child: FlutterFlowIconButton(
              borderColor: Color(0x4DFFFFFF),
              borderRadius: 12.0,
              borderWidth: 2.0,
              buttonSize: 48.0,
              fillColor: FlutterFlowTheme.of(context).tertiary,
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                color: FlutterFlowTheme.of(context).info,
                size: 12.0,
              ),
              onPressed: () async {
                context.safePop();
              },
            ),
          ),
          title: Text(
            'Edit Trip',
            style: FlutterFlowTheme.of(context).bodyLarge.override(
                  font: GoogleFonts.lato(
                    fontWeight:
                        FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                    fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).secondary,
                  letterSpacing: 0.0,
                  fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              SingleChildScrollView(
                primary: false,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (responsiveVisibility(
                      context: context,
                      tabletLandscape: false,
                      desktop: false,
                    ))
                      Form(
                        key: _model.formKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).secondary,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(26.0),
                              topRight: Radius.circular(26.0),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if (responsiveVisibility(
                                          context: context,
                                          phone: false,
                                          tablet: false,
                                          tabletLandscape: false,
                                          desktop: false,
                                        ))
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 20.0, 0.0, 0.0),
                                            child: Text(
                                              'Upload Ticket to autofill data',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelSmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelSmall
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .fontStyle,
                                                      ),
                                            ),
                                          ),
                                        if (responsiveVisibility(
                                          context: context,
                                          phone: false,
                                          tablet: false,
                                          tabletLandscape: false,
                                          desktop: false,
                                        ))
                                          Builder(
                                            builder: (context) {
                                              if (_model.selectedFileName ==
                                                      null ||
                                                  _model.selectedFileName ==
                                                      '') {
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(15.0, 20.0,
                                                          15.0, 0.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      // progressValueUpdate
                                                      _model.progressValue =
                                                          0.1;
                                                      safeSetState(() {});
                                                      _model.isUploading = true;
                                                      safeSetState(() {});
                                                      final selectedFiles =
                                                          await selectFiles(
                                                        storageFolderPath:
                                                            'tickets',
                                                        multiFile: false,
                                                      );
                                                      if (selectedFiles !=
                                                          null) {
                                                        safeSetState(() => _model
                                                                .isDataUploading_uploadData =
                                                            true);
                                                        var selectedUploadedFiles =
                                                            <FFUploadedFile>[];

                                                        var downloadUrls =
                                                            <String>[];
                                                        try {
                                                          selectedUploadedFiles =
                                                              selectedFiles
                                                                  .map((m) =>
                                                                      FFUploadedFile(
                                                                        name: m
                                                                            .storagePath
                                                                            .split('/')
                                                                            .last,
                                                                        bytes: m
                                                                            .bytes,
                                                                        originalFilename:
                                                                            m.originalFilename,
                                                                      ))
                                                                  .toList();

                                                          downloadUrls =
                                                              await uploadSupabaseStorageFiles(
                                                            bucketName:
                                                                'tickets',
                                                            selectedFiles:
                                                                selectedFiles,
                                                          );
                                                        } finally {
                                                          _model.isDataUploading_uploadData =
                                                              false;
                                                        }
                                                        if (selectedUploadedFiles
                                                                    .length ==
                                                                selectedFiles
                                                                    .length &&
                                                            downloadUrls
                                                                    .length ==
                                                                selectedFiles
                                                                    .length) {
                                                          safeSetState(() {
                                                            _model.uploadedLocalFile_uploadData =
                                                                selectedUploadedFiles
                                                                    .first;
                                                            _model.uploadedFileUrl_uploadData =
                                                                downloadUrls
                                                                    .first;
                                                          });
                                                        } else {
                                                          safeSetState(() {});
                                                          return;
                                                        }
                                                      }

                                                      // progressValueUpdate
                                                      _model.progressValue =
                                                          0.3;
                                                      safeSetState(() {});
                                                      _model.ticketData1stUpload =
                                                          await GetTicketDetailsCall
                                                              .call(
                                                        ticketLink: _model
                                                            .uploadedFileUrl_uploadData,
                                                      );

                                                      // progressValueUpdate
                                                      _model.progressValue =
                                                          0.35;
                                                      safeSetState(() {});
                                                      if ((_model
                                                              .ticketData1stUpload
                                                              ?.succeeded ??
                                                          true)) {
                                                        // progressValueUpdate
                                                        _model.progressValue =
                                                            0.5;
                                                        safeSetState(() {});
                                                        _model.selectedFileName =
                                                            'https://fjlihsqbnpyfaiktbuyt.supabase.co/storage/v1/object/public/tickets//roundtrip1.pdf';
                                                        safeSetState(() {});
                                                        // TripType
                                                        safeSetState(() {
                                                          _model
                                                              .tripTypeValueController
                                                              ?.value = OcrTicketNewStruct
                                                                  .maybeFromMap((_model
                                                                          .ticketData1stUpload
                                                                          ?.jsonBody ??
                                                                      ''))!
                                                              .tripType;
                                                          _model.tripTypeValue =
                                                              OcrTicketNewStruct
                                                                      .maybeFromMap((_model
                                                                              .ticketData1stUpload
                                                                              ?.jsonBody ??
                                                                          ''))!
                                                                  .tripType;
                                                        });
                                                        // pnr
                                                        safeSetState(() {
                                                          _model
                                                              .pnrNumberTextController
                                                              ?.text = OcrTicketStruct
                                                                  .maybeFromMap((_model
                                                                          .ticketData1stUpload
                                                                          ?.jsonBody ??
                                                                      ''))!
                                                              .pnr;
                                                        });
                                                        // progressValueUpdate
                                                        _model.progressValue =
                                                            0.6;
                                                        safeSetState(() {});
                                                        // airline
                                                        safeSetState(() {
                                                          _model
                                                              .airlineTextController
                                                              ?.text = OcrTicketNewStruct
                                                                  .maybeFromMap((_model
                                                                          .ticketData1stUpload
                                                                          ?.jsonBody ??
                                                                      ''))!
                                                              .tripDetails
                                                              .firstOrNull!
                                                              .airline;
                                                        });
                                                        // flightnbr
                                                        safeSetState(() {
                                                          _model
                                                              .flightNumberTextFieldTextController
                                                              ?.text = OcrTicketNewStruct
                                                                  .maybeFromMap((_model
                                                                          .ticketData1stUpload
                                                                          ?.jsonBody ??
                                                                      ''))!
                                                              .tripDetails
                                                              .firstOrNull!
                                                              .flightNumber;
                                                        });
                                                        // class
                                                        safeSetState(() {
                                                          _model
                                                              .seatClassTextController
                                                              ?.text = OcrTicketNewStruct
                                                                  .maybeFromMap((_model
                                                                          .ticketData1stUpload
                                                                          ?.jsonBody ??
                                                                      ''))!
                                                              .tripDetails
                                                              .firstOrNull!
                                                              .cabinClass;
                                                        });
                                                        // departurAirport
                                                        safeSetState(() {
                                                          _model
                                                              .airportDepartTextController
                                                              ?.text = OcrTicketNewStruct
                                                                  .maybeFromMap((_model
                                                                          .ticketData1stUpload
                                                                          ?.jsonBody ??
                                                                      ''))!
                                                              .tripDetails
                                                              .firstOrNull!
                                                              .departureAirport;
                                                        });
                                                        // progressValueUpdate
                                                        _model.progressValue =
                                                            0.7;
                                                        safeSetState(() {});
                                                        // depTerminal
                                                        safeSetState(() {
                                                          _model
                                                              .terminalDepTextController
                                                              ?.text = OcrTicketNewStruct
                                                                  .maybeFromMap((_model
                                                                          .ticketData1stUpload
                                                                          ?.jsonBody ??
                                                                      ''))!
                                                              .tripDetails
                                                              .firstOrNull!
                                                              .departureTerminal;
                                                        });
                                                        // seat
                                                        safeSetState(() {
                                                          _model
                                                              .seatTextController
                                                              ?.text = OcrTicketNewStruct
                                                                  .maybeFromMap((_model
                                                                          .ticketData1stUpload
                                                                          ?.jsonBody ??
                                                                      ''))!
                                                              .tripDetails
                                                              .firstOrNull!
                                                              .seat;
                                                        });
                                                        // gate
                                                        safeSetState(() {
                                                          _model
                                                              .gateTextController
                                                              ?.text = OcrTicketNewStruct
                                                                  .maybeFromMap((_model
                                                                          .ticketData1stUpload
                                                                          ?.jsonBody ??
                                                                      ''))!
                                                              .tripDetails
                                                              .firstOrNull!
                                                              .gate;
                                                        });
                                                        // progressValueUpdate
                                                        _model.progressValue =
                                                            0.8;
                                                        safeSetState(() {});
                                                        // arrAirport
                                                        safeSetState(() {
                                                          _model
                                                              .airportArrivalTextController
                                                              ?.text = OcrTicketNewStruct
                                                                  .maybeFromMap((_model
                                                                          .ticketData1stUpload
                                                                          ?.jsonBody ??
                                                                      ''))!
                                                              .tripDetails
                                                              .firstOrNull!
                                                              .arrivalAirport;
                                                        });
                                                        // arivalTerminal
                                                        safeSetState(() {
                                                          _model
                                                              .terminalArrTextController
                                                              ?.text = OcrTicketNewStruct
                                                                  .maybeFromMap((_model
                                                                          .ticketData1stUpload
                                                                          ?.jsonBody ??
                                                                      ''))!
                                                              .tripDetails
                                                              .firstOrNull!
                                                              .arrivalTerminal;
                                                        });
                                                        // ArrTimezon
                                                        safeSetState(() {
                                                          _model
                                                              .arrivalTimeZoneValueController
                                                              ?.value = OcrTicketNewStruct
                                                                  .maybeFromMap((_model
                                                                          .ticketData1stUpload
                                                                          ?.jsonBody ??
                                                                      ''))!
                                                              .tripDetails
                                                              .firstOrNull!
                                                              .arrivalAirportTimezone;
                                                          _model.arrivalTimeZoneValue =
                                                              OcrTicketNewStruct
                                                                      .maybeFromMap((_model
                                                                              .ticketData1stUpload
                                                                              ?.jsonBody ??
                                                                          ''))!
                                                                  .tripDetails
                                                                  .firstOrNull!
                                                                  .arrivalAirportTimezone;
                                                        });
                                                        // DepTimeZone
                                                        safeSetState(() {
                                                          _model
                                                              .departureTimeZoneValueController
                                                              ?.value = OcrTicketNewStruct
                                                                  .maybeFromMap((_model
                                                                          .ticketData1stUpload
                                                                          ?.jsonBody ??
                                                                      ''))!
                                                              .tripDetails
                                                              .firstOrNull!
                                                              .departureAirportTimezone;
                                                          _model.departureTimeZoneValue =
                                                              OcrTicketNewStruct
                                                                      .maybeFromMap((_model
                                                                              .ticketData1stUpload
                                                                              ?.jsonBody ??
                                                                          ''))!
                                                                  .tripDetails
                                                                  .firstOrNull!
                                                                  .departureAirportTimezone;
                                                        });
                                                        // progressValueUpdate
                                                        _model.progressValue =
                                                            0.9;
                                                        safeSetState(() {});
                                                        // depDate
                                                        _model.departureDate = functions
                                                            .parseDateTime(OcrTicketNewStruct
                                                                    .maybeFromMap((_model
                                                                            .ticketData1stUpload
                                                                            ?.jsonBody ??
                                                                        ''))!
                                                                .tripDetails
                                                                .firstOrNull!
                                                                .departureDateTime);
                                                        safeSetState(() {});
                                                        // depTime
                                                        _model.departureTime = functions
                                                            .parseDateTime(OcrTicketNewStruct
                                                                    .maybeFromMap((_model
                                                                            .ticketData1stUpload
                                                                            ?.jsonBody ??
                                                                        ''))!
                                                                .tripDetails
                                                                .firstOrNull!
                                                                .departureDateTime);
                                                        safeSetState(() {});
                                                        // arrDate
                                                        _model.arrivalDate = functions
                                                            .parseDateTime(OcrTicketNewStruct
                                                                    .maybeFromMap((_model
                                                                            .ticketData1stUpload
                                                                            ?.jsonBody ??
                                                                        ''))!
                                                                .tripDetails
                                                                .firstOrNull!
                                                                .arrivalDateTime);
                                                        safeSetState(() {});
                                                        // arrTime
                                                        _model.araivalTime = functions
                                                            .parseDateTime(OcrTicketNewStruct
                                                                    .maybeFromMap((_model
                                                                            .ticketData1stUpload
                                                                            ?.jsonBody ??
                                                                        ''))!
                                                                .tripDetails
                                                                .firstOrNull!
                                                                .arrivalDateTime);
                                                        safeSetState(() {});
                                                        _model.departureAirportName =
                                                            OcrTicketNewStruct
                                                                    .maybeFromMap(
                                                                        (_model.ticketData1stUpload?.jsonBody ??
                                                                            ''))
                                                                ?.tripDetails
                                                                ?.firstOrNull
                                                                ?.departureAirportName;
                                                        safeSetState(() {});
                                                        _model.arrivalAirportName =
                                                            OcrTicketNewStruct
                                                                    .maybeFromMap(
                                                                        (_model.ticketData1stUpload?.jsonBody ??
                                                                            ''))
                                                                ?.tripDetails
                                                                ?.firstOrNull
                                                                ?.arrivalAirportName;
                                                        safeSetState(() {});
                                                        // progressValueUpdate
                                                        _model.progressValue =
                                                            1.0;
                                                        safeSetState(() {});
                                                        _model.isUploading =
                                                            false;
                                                        safeSetState(() {});
                                                      } else {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'cant fill details',
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    4000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                          ),
                                                        );
                                                        _model.isUploading =
                                                            false;
                                                        safeSetState(() {});
                                                        // progressValueUpdate
                                                        _model.progressValue =
                                                            0.0;
                                                        safeSetState(() {});
                                                      }

                                                      safeSetState(() {});
                                                    },
                                                    text: 'Upload Ticket',
                                                    icon: Icon(
                                                      Icons.add_circle,
                                                      size: 15.0,
                                                    ),
                                                    options: FFButtonOptions(
                                                      width: double.infinity,
                                                      height: 48.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      iconColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      color: Color(0xFFF2F3F6),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                              ),
                                                      elevation: 0.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                );
                                              } else {
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(15.0, 20.0,
                                                          15.0, 0.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFF2F3F6),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        FFButtonWidget(
                                                          onPressed: () async {
                                                            _model.isUploading =
                                                                !_model
                                                                    .isUploading;
                                                            safeSetState(() {});
                                                            // progressValueUpdate
                                                            _model.progressValue =
                                                                0.1;
                                                            safeSetState(() {});
                                                            final selectedFiles =
                                                                await selectFiles(
                                                              storageFolderPath:
                                                                  'tickets',
                                                              allowedExtensions: [
                                                                'pdf'
                                                              ],
                                                              multiFile: false,
                                                            );
                                                            if (selectedFiles !=
                                                                null) {
                                                              safeSetState(() =>
                                                                  _model.isDataUploading_uploadData2 =
                                                                      true);
                                                              var selectedUploadedFiles =
                                                                  <FFUploadedFile>[];

                                                              var downloadUrls =
                                                                  <String>[];
                                                              try {
                                                                selectedUploadedFiles =
                                                                    selectedFiles
                                                                        .map((m) =>
                                                                            FFUploadedFile(
                                                                              name: m.storagePath.split('/').last,
                                                                              bytes: m.bytes,
                                                                              originalFilename: m.originalFilename,
                                                                            ))
                                                                        .toList();

                                                                downloadUrls =
                                                                    await uploadSupabaseStorageFiles(
                                                                  bucketName:
                                                                      'tickets',
                                                                  selectedFiles:
                                                                      selectedFiles,
                                                                );
                                                              } finally {
                                                                _model.isDataUploading_uploadData2 =
                                                                    false;
                                                              }
                                                              if (selectedUploadedFiles
                                                                          .length ==
                                                                      selectedFiles
                                                                          .length &&
                                                                  downloadUrls
                                                                          .length ==
                                                                      selectedFiles
                                                                          .length) {
                                                                safeSetState(
                                                                    () {
                                                                  _model.uploadedLocalFile_uploadData2 =
                                                                      selectedUploadedFiles
                                                                          .first;
                                                                  _model.uploadedFileUrl_uploadData2 =
                                                                      downloadUrls
                                                                          .first;
                                                                });
                                                              } else {
                                                                safeSetState(
                                                                    () {});
                                                                return;
                                                              }
                                                            }

                                                            // progressValueUpdate
                                                            _model.progressValue =
                                                                0.3;
                                                            safeSetState(() {});
                                                            _model.ticketDataReUpload =
                                                                await GetTicketDetailsCall
                                                                    .call(
                                                              ticketLink: _model
                                                                  .uploadedFileUrl_uploadData2,
                                                            );

                                                            // progressValueUpdate
                                                            _model.progressValue =
                                                                0.5;
                                                            safeSetState(() {});
                                                            // progressValueUpdate
                                                            _model.progressValue =
                                                                0.7;
                                                            safeSetState(() {});
                                                            if ((_model
                                                                    .ticketDataReUpload
                                                                    ?.succeeded ??
                                                                true)) {
                                                              // progressValueUpdate
                                                              _model.progressValue =
                                                                  0.5;
                                                              safeSetState(
                                                                  () {});
                                                              _model.selectedFileName =
                                                                  'https://fjlihsqbnpyfaiktbuyt.supabase.co/storage/v1/object/public/tickets//roundtrip1.pdf';
                                                              safeSetState(
                                                                  () {});
                                                              // TripType
                                                              safeSetState(() {
                                                                _model.tripTypeValueController
                                                                        ?.value =
                                                                    'One Way';
                                                                _model.tripTypeValue =
                                                                    'One Way';
                                                              });
                                                              // pnr
                                                              safeSetState(() {
                                                                _model
                                                                    .pnrNumberTextController
                                                                    ?.text = OcrTicketNewStruct.maybeFromMap((_model
                                                                            .ticketDataReUpload
                                                                            ?.jsonBody ??
                                                                        ''))!
                                                                    .pnr;
                                                              });
                                                              // progressValueUpdate
                                                              _model.progressValue =
                                                                  0.6;
                                                              safeSetState(
                                                                  () {});
                                                              // airline
                                                              safeSetState(() {
                                                                _model
                                                                    .airlineTextController
                                                                    ?.text = OcrTicketNewStruct.maybeFromMap((_model
                                                                            .ticketDataReUpload
                                                                            ?.jsonBody ??
                                                                        ''))!
                                                                    .tripDetails
                                                                    .firstOrNull!
                                                                    .airline;
                                                              });
                                                              // flightnbr
                                                              safeSetState(() {
                                                                _model
                                                                    .flightNumberTextFieldTextController
                                                                    ?.text = OcrTicketNewStruct.maybeFromMap((_model
                                                                            .ticketDataReUpload
                                                                            ?.jsonBody ??
                                                                        ''))!
                                                                    .tripDetails
                                                                    .firstOrNull!
                                                                    .flightNumber;
                                                              });
                                                              // class
                                                              safeSetState(() {
                                                                _model
                                                                    .seatClassTextController
                                                                    ?.text = OcrTicketNewStruct.maybeFromMap((_model
                                                                            .ticketDataReUpload
                                                                            ?.jsonBody ??
                                                                        ''))!
                                                                    .tripDetails
                                                                    .firstOrNull!
                                                                    .cabinClass;
                                                              });
                                                              // departurAirport
                                                              safeSetState(() {
                                                                _model
                                                                    .airportDepartTextController
                                                                    ?.text = OcrTicketNewStruct.maybeFromMap((_model
                                                                            .ticketDataReUpload
                                                                            ?.jsonBody ??
                                                                        ''))!
                                                                    .tripDetails
                                                                    .firstOrNull!
                                                                    .departureAirport;
                                                              });
                                                              // progressValueUpdate
                                                              _model.progressValue =
                                                                  0.7;
                                                              safeSetState(
                                                                  () {});
                                                              // depTerminal
                                                              safeSetState(() {
                                                                _model
                                                                    .terminalDepTextController
                                                                    ?.text = OcrTicketNewStruct.maybeFromMap((_model
                                                                            .ticketDataReUpload
                                                                            ?.jsonBody ??
                                                                        ''))!
                                                                    .tripDetails
                                                                    .firstOrNull!
                                                                    .departureTerminal;
                                                              });
                                                              // seat
                                                              safeSetState(() {
                                                                _model
                                                                    .seatTextController
                                                                    ?.text = OcrTicketNewStruct.maybeFromMap((_model
                                                                            .ticketDataReUpload
                                                                            ?.jsonBody ??
                                                                        ''))!
                                                                    .tripDetails
                                                                    .firstOrNull!
                                                                    .seat;
                                                              });
                                                              // gate
                                                              safeSetState(() {
                                                                _model
                                                                    .gateTextController
                                                                    ?.text = OcrTicketNewStruct.maybeFromMap((_model
                                                                            .ticketDataReUpload
                                                                            ?.jsonBody ??
                                                                        ''))!
                                                                    .tripDetails
                                                                    .firstOrNull!
                                                                    .gate;
                                                              });
                                                              // progressValueUpdate
                                                              _model.progressValue =
                                                                  0.8;
                                                              safeSetState(
                                                                  () {});
                                                              // arrAirport
                                                              safeSetState(() {
                                                                _model
                                                                    .airportArrivalTextController
                                                                    ?.text = OcrTicketNewStruct.maybeFromMap((_model
                                                                            .ticketDataReUpload
                                                                            ?.jsonBody ??
                                                                        ''))!
                                                                    .tripDetails
                                                                    .firstOrNull!
                                                                    .arrivalAirport;
                                                              });
                                                              // arivalTerminal
                                                              safeSetState(() {
                                                                _model
                                                                    .terminalArrTextController
                                                                    ?.text = OcrTicketNewStruct.maybeFromMap((_model
                                                                            .ticketDataReUpload
                                                                            ?.jsonBody ??
                                                                        ''))!
                                                                    .tripDetails
                                                                    .firstOrNull!
                                                                    .arrivalTerminal;
                                                              });
                                                              // ArrTimezon
                                                              safeSetState(() {
                                                                _model
                                                                    .arrivalTimeZoneValueController
                                                                    ?.value = OcrTicketNewStruct.maybeFromMap((_model
                                                                            .ticketDataReUpload
                                                                            ?.jsonBody ??
                                                                        ''))!
                                                                    .tripDetails
                                                                    .firstOrNull!
                                                                    .arrivalAirportTimezone;
                                                                _model
                                                                    .arrivalTimeZoneValue = OcrTicketNewStruct.maybeFromMap((_model
                                                                            .ticketDataReUpload
                                                                            ?.jsonBody ??
                                                                        ''))!
                                                                    .tripDetails
                                                                    .firstOrNull!
                                                                    .arrivalAirportTimezone;
                                                              });
                                                              // DepTimeZone
                                                              safeSetState(() {
                                                                _model
                                                                    .departureTimeZoneValueController
                                                                    ?.value = OcrTicketNewStruct.maybeFromMap((_model
                                                                            .ticketDataReUpload
                                                                            ?.jsonBody ??
                                                                        ''))!
                                                                    .tripDetails
                                                                    .firstOrNull!
                                                                    .departureAirportTimezone;
                                                                _model
                                                                    .departureTimeZoneValue = OcrTicketNewStruct.maybeFromMap((_model
                                                                            .ticketDataReUpload
                                                                            ?.jsonBody ??
                                                                        ''))!
                                                                    .tripDetails
                                                                    .firstOrNull!
                                                                    .departureAirportTimezone;
                                                              });
                                                              // progressValueUpdate
                                                              _model.progressValue =
                                                                  0.9;
                                                              safeSetState(
                                                                  () {});
                                                              // depDate
                                                              _model
                                                                  .departureDate = functions.parseDateTime(OcrTicketNewStruct
                                                                      .maybeFromMap((_model
                                                                              .ticketDataReUpload
                                                                              ?.jsonBody ??
                                                                          ''))!
                                                                  .tripDetails
                                                                  .firstOrNull!
                                                                  .departureDateTime);
                                                              safeSetState(
                                                                  () {});
                                                              // depTime
                                                              _model
                                                                  .departureTime = functions.parseDateTime(OcrTicketNewStruct
                                                                      .maybeFromMap((_model
                                                                              .ticketDataReUpload
                                                                              ?.jsonBody ??
                                                                          ''))!
                                                                  .tripDetails
                                                                  .firstOrNull!
                                                                  .departureDateTime);
                                                              safeSetState(
                                                                  () {});
                                                              // arrDate
                                                              _model
                                                                  .arrivalDate = functions.parseDateTime(OcrTicketNewStruct
                                                                      .maybeFromMap((_model
                                                                              .ticketData1stUpload
                                                                              ?.jsonBody ??
                                                                          ''))!
                                                                  .tripDetails
                                                                  .firstOrNull!
                                                                  .arrivalDateTime);
                                                              safeSetState(
                                                                  () {});
                                                              // arrTime
                                                              _model
                                                                  .araivalTime = functions.parseDateTime(OcrTicketNewStruct
                                                                      .maybeFromMap((_model
                                                                              .ticketDataReUpload
                                                                              ?.jsonBody ??
                                                                          ''))!
                                                                  .tripDetails
                                                                  .firstOrNull!
                                                                  .arrivalDateTime);
                                                              safeSetState(
                                                                  () {});
                                                              _model
                                                                  .arrivalAirportName = OcrTicketNewStruct
                                                                      .maybeFromMap(
                                                                          (_model.ticketDataReUpload?.jsonBody ??
                                                                              ''))
                                                                  ?.tripDetails
                                                                  ?.firstOrNull
                                                                  ?.arrivalAirportName;
                                                              safeSetState(
                                                                  () {});
                                                              _model
                                                                  .departureAirportName = OcrTicketNewStruct
                                                                      .maybeFromMap(
                                                                          (_model.ticketDataReUpload?.jsonBody ??
                                                                              ''))
                                                                  ?.tripDetails
                                                                  ?.firstOrNull
                                                                  ?.departureAirportName;
                                                              safeSetState(
                                                                  () {});
                                                              // progressValueUpdate
                                                              _model.progressValue =
                                                                  1.0;
                                                              safeSetState(
                                                                  () {});
                                                              _model.isUploading =
                                                                  !_model
                                                                      .isUploading;
                                                              safeSetState(
                                                                  () {});
                                                            } else {
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    'cant fill details',
                                                                    style:
                                                                        TextStyle(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                    ),
                                                                  ),
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          4000),
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                ),
                                                              );
                                                              _model.isUploading =
                                                                  !_model
                                                                      .isUploading;
                                                              safeSetState(
                                                                  () {});
                                                            }

                                                            safeSetState(() {});
                                                          },
                                                          text: 'Ticket',
                                                          icon: Icon(
                                                            FFIcons.kpdficon,
                                                            size: 25.0,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            width: 150.0,
                                                            height: 48.0,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            iconColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                            color: Color(
                                                                0xFFF2F3F6),
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .tertiary,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontStyle,
                                                                    ),
                                                            elevation: 0.0,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      15.0,
                                                                      0.0),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              safeSetState(() {
                                                                _model
                                                                    .departureTimeZoneValueController
                                                                    ?.reset();
                                                                _model.departureTimeZoneValue =
                                                                    null;
                                                                _model
                                                                    .arrivalTimeZoneValueController
                                                                    ?.reset();
                                                                _model.arrivalTimeZoneValue =
                                                                    null;
                                                              });
                                                              safeSetState(() {
                                                                _model
                                                                    .pnrNumberTextController
                                                                    ?.clear();
                                                                _model
                                                                    .airlineTextController
                                                                    ?.clear();
                                                                _model
                                                                    .flightNumberTextFieldTextController
                                                                    ?.clear();
                                                                _model
                                                                    .seatClassTextController
                                                                    ?.clear();
                                                                _model
                                                                    .airportDepartTextController
                                                                    ?.clear();
                                                                _model
                                                                    .terminalDepTextController
                                                                    ?.clear();
                                                                _model
                                                                    .seatTextController
                                                                    ?.clear();
                                                                _model
                                                                    .gateTextController
                                                                    ?.clear();
                                                                _model
                                                                    .airportArrivalTextController
                                                                    ?.clear();
                                                                _model
                                                                    .terminalArrTextController
                                                                    ?.clear();
                                                              });
                                                              _model.departureDate =
                                                                  null;
                                                              _model.departureTime =
                                                                  null;
                                                              _model.selectedFileName =
                                                                  '';
                                                              _model.araivalTime =
                                                                  null;
                                                              _model.arrivalDate =
                                                                  null;
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            child: Text(
                                                              'Remove',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                        if (responsiveVisibility(
                                          context: context,
                                          phone: false,
                                          tablet: false,
                                          tabletLandscape: false,
                                          desktop: false,
                                        ))
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 0.0),
                                            child: Text(
                                              'or',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                            ),
                                          ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 20.0, 20.0, 0.0),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: Color(0x0E0D1634),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(10.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    child: TextFormField(
                                                      controller: _model
                                                          .pnrNumberTextController,
                                                      focusNode: _model
                                                          .pnrNumberFocusNode,
                                                      autofocus: false,
                                                      textCapitalization:
                                                          TextCapitalization
                                                              .characters,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        isDense: false,
                                                        labelText: 'PNR Number',
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .fontStyle,
                                                                ),
                                                        hintText:
                                                            'Enter your PNR number',
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .roboto(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                        enabledBorder:
                                                            InputBorder.none,
                                                        focusedBorder:
                                                            InputBorder.none,
                                                        errorBorder:
                                                            InputBorder.none,
                                                        focusedErrorBorder:
                                                            InputBorder.none,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .roboto(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                      maxLength: 6,
                                                      buildCounter: (context,
                                                              {required currentLength,
                                                              required isFocused,
                                                              maxLength}) =>
                                                          null,
                                                      cursorColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      validator: _model
                                                          .pnrNumberTextControllerValidator
                                                          .asValidator(context),
                                                      inputFormatters: [
                                                        if (!isAndroid &&
                                                            !isiOS)
                                                          TextInputFormatter
                                                              .withFunction(
                                                                  (oldValue,
                                                                      newValue) {
                                                            return TextEditingValue(
                                                              selection: newValue
                                                                  .selection,
                                                              text: newValue
                                                                  .text
                                                                  .toCapitalization(
                                                                      TextCapitalization
                                                                          .characters),
                                                            );
                                                          }),
                                                        FilteringTextInputFormatter
                                                            .allow(RegExp(
                                                                '[a-zA-Z0-9]'))
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            if (responsiveVisibility(
                                              context: context,
                                              phone: false,
                                              tablet: false,
                                              tabletLandscape: false,
                                              desktop: false,
                                            ))
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 20.0, 20.0, 0.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    border: Border.all(
                                                      color: Color(0x0E0D1634),
                                                    ),
                                                  ),
                                                  child: Visibility(
                                                    visible:
                                                        responsiveVisibility(
                                                      context: context,
                                                      tablet: false,
                                                      tabletLandscape: false,
                                                      desktop: false,
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        15.0,
                                                                        10.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'Trip Type',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelSmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelSmall
                                                                          .fontStyle,
                                                                    ),
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      0.0,
                                                                      10.0),
                                                          child:
                                                              FlutterFlowDropDown<
                                                                  String>(
                                                            controller: _model
                                                                    .tripTypeValueController ??=
                                                                FormFieldController<
                                                                    String>(
                                                              _model.tripTypeValue ??=
                                                                  'One Way',
                                                            ),
                                                            options:
                                                                _model.tripType,
                                                            onChanged: (val) =>
                                                                safeSetState(() =>
                                                                    _model.tripTypeValue =
                                                                        val),
                                                            width:
                                                                double.infinity,
                                                            height: 40.0,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                            hintText:
                                                                'Trip Type',
                                                            icon: Icon(
                                                              Icons
                                                                  .keyboard_arrow_down_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 24.0,
                                                            ),
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            elevation: 2.0,
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderWidth: 0.0,
                                                            borderRadius: 8.0,
                                                            margin:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        0.0,
                                                                        12.0,
                                                                        0.0),
                                                            hidesUnderline:
                                                                true,
                                                            isOverButton: false,
                                                            isSearchable: false,
                                                            isMultiSelect:
                                                                false,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 20.0, 0.0, 0.0),
                                              child: Text(
                                                'Enter Departure Flight Details',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      fontSize: 12.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 20.0, 20.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  // DepDate
                                                  final _datePicked2Date =
                                                      await showDatePicker(
                                                    context: context,
                                                    initialDate:
                                                        getCurrentTimestamp,
                                                    firstDate:
                                                        getCurrentTimestamp,
                                                    lastDate: DateTime(2050),
                                                    builder: (context, child) {
                                                      return wrapInMaterialDatePickerTheme(
                                                        context,
                                                        child!,
                                                        headerBackgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        headerForegroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        headerTextStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineLarge
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineLargeFamily,
                                                                  fontSize:
                                                                      32.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineLargeIsCustom,
                                                                ),
                                                        pickerBackgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryBackground,
                                                        pickerForegroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        selectedDateTimeBackgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        selectedDateTimeForegroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        actionButtonForegroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        iconSize: 24.0,
                                                      );
                                                    },
                                                  );

                                                  if (_datePicked2Date !=
                                                      null) {
                                                    safeSetState(() {
                                                      _model.datePicked2 =
                                                          DateTime(
                                                        _datePicked2Date.year,
                                                        _datePicked2Date.month,
                                                        _datePicked2Date.day,
                                                      );
                                                    });
                                                  } else if (_model
                                                          .datePicked2 !=
                                                      null) {
                                                    safeSetState(() {
                                                      _model.datePicked2 =
                                                          getCurrentTimestamp;
                                                    });
                                                  }
                                                  _model.departureDate =
                                                      _model.datePicked2;
                                                  safeSetState(() {});
                                                },
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 60.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    border: Border.all(
                                                      color: Color(0x0E0D1634),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'Departure Date',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelSmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelSmall
                                                                          .fontStyle,
                                                                    ),
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                            Text(
                                                              dateTimeFormat(
                                                                  "dd-MM-yyyy",
                                                                  _model
                                                                      .departureDate),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                        Icon(
                                                          Icons
                                                              .calendar_today_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 24.0,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 20.0, 20.0, 0.0),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: Color(0x0E0D1634),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(10.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    child: TextFormField(
                                                      controller: _model
                                                          .airlineTextController,
                                                      focusNode: _model
                                                          .airlineFocusNode,
                                                      autofocus: false,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        isDense: false,
                                                        labelText: 'Airline',
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize:
                                                                      15.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .fontStyle,
                                                                ),
                                                        hintText:
                                                            'Enter your Airline',
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                        enabledBorder:
                                                            InputBorder.none,
                                                        focusedBorder:
                                                            InputBorder.none,
                                                        errorBorder:
                                                            InputBorder.none,
                                                        focusedErrorBorder:
                                                            InputBorder.none,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .roboto(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                      cursorColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      validator: _model
                                                          .airlineTextControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 20.0, 20.0, 0.0),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: Color(0x0E0D1634),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(10.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    child: TextFormField(
                                                      controller: _model
                                                          .flightNumberTextFieldTextController,
                                                      focusNode: _model
                                                          .flightNumberTextFieldFocusNode,
                                                      autofocus: false,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        isDense: false,
                                                        labelText:
                                                            'Flight Number',
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize:
                                                                      15.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .fontStyle,
                                                                ),
                                                        hintText:
                                                            'Enter your Flight Number',
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                        enabledBorder:
                                                            InputBorder.none,
                                                        focusedBorder:
                                                            InputBorder.none,
                                                        errorBorder:
                                                            InputBorder.none,
                                                        focusedErrorBorder:
                                                            InputBorder.none,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .roboto(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                      cursorColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      validator: _model
                                                          .flightNumberTextFieldTextControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 20.0, 20.0, 0.0),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: Color(0x0E0D1634),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(10.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    child: TextFormField(
                                                      controller: _model
                                                          .seatClassTextController,
                                                      focusNode: _model
                                                          .seatClassFocusNode,
                                                      autofocus: false,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        isDense: false,
                                                        labelText: 'Class',
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize:
                                                                      15.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .fontStyle,
                                                                ),
                                                        hintText:
                                                            'Enter your Class',
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                        enabledBorder:
                                                            InputBorder.none,
                                                        focusedBorder:
                                                            InputBorder.none,
                                                        errorBorder:
                                                            InputBorder.none,
                                                        focusedErrorBorder:
                                                            InputBorder.none,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                      cursorColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      validator: _model
                                                          .seatClassTextControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      23.0, 15.0, 0.0, 0.0),
                                              child: Text(
                                                'Departure',
                                                textAlign: TextAlign.start,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodySmall
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 20.0, 20.0, 0.0),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: Color(0x0E0D1634),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(10.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    child: TextFormField(
                                                      controller: _model
                                                          .airportDepartTextController,
                                                      focusNode: _model
                                                          .airportDepartFocusNode,
                                                      onChanged: (_) =>
                                                          EasyDebounce.debounce(
                                                        '_model.airportDepartTextController',
                                                        Duration(
                                                            milliseconds: 2000),
                                                        () async {
                                                          if (_model
                                                                  .airportDepartTextController
                                                                  .text
                                                                  .length ==
                                                              3) {
                                                            _model.departureTimeZone =
                                                                await GetAirportCall
                                                                    .call(
                                                              airport: _model
                                                                  .airportDepartTextController
                                                                  .text,
                                                            );

                                                            if ((_model
                                                                    .departureTimeZone
                                                                    ?.succeeded ??
                                                                true)) {
                                                              safeSetState(() {
                                                                _model
                                                                    .departureTimeZoneValueController
                                                                    ?.value = ((_model.departureTimeZone?.jsonBody ??
                                                                            '')
                                                                        .toList()
                                                                        .map<AirportDetailsStruct?>(
                                                                            AirportDetailsStruct.maybeFromMap)
                                                                        .toList() as Iterable<AirportDetailsStruct?>)
                                                                    .withoutNulls
                                                                    .firstOrNull!
                                                                    .timezone;
                                                                _model
                                                                    .departureTimeZoneValue = ((_model.departureTimeZone?.jsonBody ??
                                                                            '')
                                                                        .toList()
                                                                        .map<AirportDetailsStruct?>(
                                                                            AirportDetailsStruct.maybeFromMap)
                                                                        .toList() as Iterable<AirportDetailsStruct?>)
                                                                    .withoutNulls
                                                                    .firstOrNull!
                                                                    .timezone;
                                                              });
                                                              // departureTimeZoneValueUpdate
                                                              _model
                                                                  .departureTimezoneValue = ((_model
                                                                              .departureTimeZone
                                                                              ?.jsonBody ??
                                                                          '')
                                                                      .toList()
                                                                      .map<AirportDetailsStruct?>(
                                                                          AirportDetailsStruct
                                                                              .maybeFromMap)
                                                                      .toList() as Iterable<AirportDetailsStruct?>)
                                                                  .withoutNulls
                                                                  ?.firstOrNull
                                                                  ?.timezone;
                                                              safeSetState(
                                                                  () {});
                                                              // departureAirportNameUpdate
                                                              _model
                                                                  .departureAirportName = ((_model
                                                                              .departureTimeZone
                                                                              ?.jsonBody ??
                                                                          '')
                                                                      .toList()
                                                                      .map<AirportDetailsStruct?>(
                                                                          AirportDetailsStruct
                                                                              .maybeFromMap)
                                                                      .toList() as Iterable<AirportDetailsStruct?>)
                                                                  .withoutNulls
                                                                  ?.firstOrNull
                                                                  ?.name;
                                                              safeSetState(
                                                                  () {});
                                                            } else {
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    'Cannot get TimeZone',
                                                                    style: GoogleFonts
                                                                        .roboto(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      fontSize:
                                                                          14.0,
                                                                    ),
                                                                  ),
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          4000),
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                ),
                                                              );
                                                            }
                                                          }

                                                          safeSetState(() {});
                                                        },
                                                      ),
                                                      autofocus: false,
                                                      textCapitalization:
                                                          TextCapitalization
                                                              .characters,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        isDense: false,
                                                        labelText: 'Airport',
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize:
                                                                      15.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .fontStyle,
                                                                ),
                                                        hintText: 'eg:DXB',
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                        enabledBorder:
                                                            InputBorder.none,
                                                        focusedBorder:
                                                            InputBorder.none,
                                                        errorBorder:
                                                            InputBorder.none,
                                                        focusedErrorBorder:
                                                            InputBorder.none,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                      maxLength: 3,
                                                      buildCounter: (context,
                                                              {required currentLength,
                                                              required isFocused,
                                                              maxLength}) =>
                                                          null,
                                                      keyboardType:
                                                          TextInputType.name,
                                                      cursorColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      validator: _model
                                                          .airportDepartTextControllerValidator
                                                          .asValidator(context),
                                                      inputFormatters: [
                                                        if (!isAndroid &&
                                                            !isiOS)
                                                          TextInputFormatter
                                                              .withFunction(
                                                                  (oldValue,
                                                                      newValue) {
                                                            return TextEditingValue(
                                                              selection: newValue
                                                                  .selection,
                                                              text: newValue
                                                                  .text
                                                                  .toCapitalization(
                                                                      TextCapitalization
                                                                          .characters),
                                                            );
                                                          }),
                                                        FilteringTextInputFormatter
                                                            .allow(RegExp(
                                                                '[a-zA-Z]'))
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 20.0, 20.0, 0.0),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: Color(0x0E0D1634),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(10.0),
                                                  child: FlutterFlowDropDown<
                                                      String>(
                                                    controller: _model
                                                            .departureTimeZoneValueController ??=
                                                        FormFieldController<
                                                            String>(null),
                                                    options:
                                                        TimeZonesCall.times(
                                                      (_model.apiResultgt0
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!,
                                                    onChanged: (val) =>
                                                        safeSetState(() => _model
                                                                .departureTimeZoneValue =
                                                            val),
                                                    width: 200.0,
                                                    height: 40.0,
                                                    searchHintTextStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily,
                                                              letterSpacing:
                                                                  0.0,
                                                              useGoogleFonts:
                                                                  !FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumIsCustom,
                                                            ),
                                                    searchTextStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                              letterSpacing:
                                                                  0.0,
                                                              useGoogleFonts:
                                                                  !FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumIsCustom,
                                                            ),
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                    hintText: 'Timezone',
                                                    searchHintText: 'Search...',
                                                    icon: Icon(
                                                      Icons
                                                          .keyboard_arrow_down_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 24.0,
                                                    ),
                                                    fillColor: FlutterFlowTheme
                                                            .of(context)
                                                        .secondaryBackground,
                                                    elevation: 2.0,
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderWidth: 0.0,
                                                    borderRadius: 8.0,
                                                    margin:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                12.0, 0.0),
                                                    hidesUnderline: true,
                                                    isOverButton: false,
                                                    isSearchable: true,
                                                    isMultiSelect: false,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 20.0, 20.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  final _datePicked4Time =
                                                      await showTimePicker(
                                                    context: context,
                                                    initialTime:
                                                        TimeOfDay.fromDateTime(
                                                            getCurrentTimestamp),
                                                    builder: (context, child) {
                                                      return wrapInMaterialTimePickerTheme(
                                                        context,
                                                        child!,
                                                        headerBackgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        headerForegroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        headerTextStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineLarge
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineLargeFamily,
                                                                  fontSize:
                                                                      32.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineLargeIsCustom,
                                                                ),
                                                        pickerBackgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryBackground,
                                                        pickerForegroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        selectedDateTimeBackgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        selectedDateTimeForegroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        actionButtonForegroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        iconSize: 24.0,
                                                      );
                                                    },
                                                  );
                                                  if (_datePicked4Time !=
                                                      null) {
                                                    safeSetState(() {
                                                      _model.datePicked4 =
                                                          DateTime(
                                                        getCurrentTimestamp
                                                            .year,
                                                        getCurrentTimestamp
                                                            .month,
                                                        getCurrentTimestamp.day,
                                                        _datePicked4Time.hour,
                                                        _datePicked4Time.minute,
                                                      );
                                                    });
                                                  } else if (_model
                                                          .datePicked4 !=
                                                      null) {
                                                    safeSetState(() {
                                                      _model.datePicked4 =
                                                          getCurrentTimestamp;
                                                    });
                                                  }
                                                  _model.departureTime =
                                                      _model.datePicked4;
                                                  safeSetState(() {});
                                                },
                                                child: Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    border: Border.all(
                                                      color: Color(0x0E0D1634),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'DepartureTime',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelSmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelSmall
                                                                          .fontStyle,
                                                                    ),
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                            Text(
                                                              dateTimeFormat(
                                                                  "Hm",
                                                                  _model
                                                                      .departureTime),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                        FaIcon(
                                                          FontAwesomeIcons
                                                              .clock,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 24.0,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 20.0, 20.0, 0.0),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: Color(0x0E0D1634),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(10.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    child: TextFormField(
                                                      controller: _model
                                                          .terminalDepTextController,
                                                      focusNode: _model
                                                          .terminalDepFocusNode,
                                                      autofocus: false,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        isDense: false,
                                                        labelText: 'Terminal',
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: Color(
                                                                      0x7C252831),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .fontStyle,
                                                                ),
                                                        hintText: 'Terminal',
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                        enabledBorder:
                                                            InputBorder.none,
                                                        focusedBorder:
                                                            InputBorder.none,
                                                        errorBorder:
                                                            InputBorder.none,
                                                        focusedErrorBorder:
                                                            InputBorder.none,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                      maxLines: null,
                                                      cursorColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      validator: _model
                                                          .terminalDepTextControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 20.0, 20.0, 0.0),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: Color(0x0E0D1634),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(10.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    child: TextFormField(
                                                      controller: _model
                                                          .seatTextController,
                                                      focusNode:
                                                          _model.seatFocusNode,
                                                      autofocus: false,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        isDense: false,
                                                        labelText: 'Seat',
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: Color(
                                                                      0x7C252831),
                                                                  fontSize:
                                                                      15.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .fontStyle,
                                                                ),
                                                        hintText: 'Seat',
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                        enabledBorder:
                                                            InputBorder.none,
                                                        focusedBorder:
                                                            InputBorder.none,
                                                        errorBorder:
                                                            InputBorder.none,
                                                        focusedErrorBorder:
                                                            InputBorder.none,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .roboto(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                      cursorColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      validator: _model
                                                          .seatTextControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 20.0, 20.0, 0.0),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: Color(0x0E0D1634),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(10.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    child: TextFormField(
                                                      controller: _model
                                                          .gateTextController,
                                                      focusNode:
                                                          _model.gateFocusNode,
                                                      autofocus: false,
                                                      textCapitalization:
                                                          TextCapitalization
                                                              .characters,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        isDense: false,
                                                        labelText: 'Gate',
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: Color(
                                                                      0x7C252831),
                                                                  fontSize:
                                                                      15.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .fontStyle,
                                                                ),
                                                        hintText: 'Gate',
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                        enabledBorder:
                                                            InputBorder.none,
                                                        focusedBorder:
                                                            InputBorder.none,
                                                        errorBorder:
                                                            InputBorder.none,
                                                        focusedErrorBorder:
                                                            InputBorder.none,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                      maxLength: 5,
                                                      buildCounter: (context,
                                                              {required currentLength,
                                                              required isFocused,
                                                              maxLength}) =>
                                                          null,
                                                      cursorColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      validator: _model
                                                          .gateTextControllerValidator
                                                          .asValidator(context),
                                                      inputFormatters: [
                                                        if (!isAndroid &&
                                                            !isiOS)
                                                          TextInputFormatter
                                                              .withFunction(
                                                                  (oldValue,
                                                                      newValue) {
                                                            return TextEditingValue(
                                                              selection: newValue
                                                                  .selection,
                                                              text: newValue
                                                                  .text
                                                                  .toCapitalization(
                                                                      TextCapitalization
                                                                          .characters),
                                                            );
                                                          }),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      23.0, 15.0, 0.0, 0.0),
                                              child: Text(
                                                'Arrival',
                                                textAlign: TextAlign.start,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodySmall
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 20.0, 20.0, 0.0),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: Color(0x0E0D1634),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(10.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    child: TextFormField(
                                                      controller: _model
                                                          .airportArrivalTextController,
                                                      focusNode: _model
                                                          .airportArrivalFocusNode,
                                                      onChanged: (_) =>
                                                          EasyDebounce.debounce(
                                                        '_model.airportArrivalTextController',
                                                        Duration(
                                                            milliseconds: 2000),
                                                        () async {
                                                          if (_model
                                                                  .airportDepartTextController
                                                                  .text
                                                                  .length ==
                                                              3) {
                                                            _model.arrTimeZone =
                                                                await GetAirportCall
                                                                    .call(
                                                              airport: _model
                                                                  .airportArrivalTextController
                                                                  .text,
                                                            );

                                                            if ((_model
                                                                    .arrTimeZone
                                                                    ?.succeeded ??
                                                                true)) {
                                                              safeSetState(() {
                                                                _model
                                                                    .arrivalTimeZoneValueController
                                                                    ?.value = ((_model.arrTimeZone?.jsonBody ??
                                                                            '')
                                                                        .toList()
                                                                        .map<AirportDetailsStruct?>(
                                                                            AirportDetailsStruct.maybeFromMap)
                                                                        .toList() as Iterable<AirportDetailsStruct?>)
                                                                    .withoutNulls
                                                                    .firstOrNull!
                                                                    .timezone;
                                                                _model
                                                                    .arrivalTimeZoneValue = ((_model.arrTimeZone?.jsonBody ??
                                                                            '')
                                                                        .toList()
                                                                        .map<AirportDetailsStruct?>(
                                                                            AirportDetailsStruct.maybeFromMap)
                                                                        .toList() as Iterable<AirportDetailsStruct?>)
                                                                    .withoutNulls
                                                                    .firstOrNull!
                                                                    .timezone;
                                                              });
                                                              _model
                                                                  .arrivalTimezoneValue = ((_model
                                                                              .arrTimeZone
                                                                              ?.jsonBody ??
                                                                          '')
                                                                      .toList()
                                                                      .map<AirportDetailsStruct?>(
                                                                          AirportDetailsStruct
                                                                              .maybeFromMap)
                                                                      .toList() as Iterable<AirportDetailsStruct?>)
                                                                  .withoutNulls
                                                                  ?.firstOrNull
                                                                  ?.timezone;
                                                              safeSetState(
                                                                  () {});
                                                              _model
                                                                  .arrivalAirportName = ((_model
                                                                              .arrTimeZone
                                                                              ?.jsonBody ??
                                                                          '')
                                                                      .toList()
                                                                      .map<AirportDetailsStruct?>(
                                                                          AirportDetailsStruct
                                                                              .maybeFromMap)
                                                                      .toList() as Iterable<AirportDetailsStruct?>)
                                                                  .withoutNulls
                                                                  ?.firstOrNull
                                                                  ?.name;
                                                              safeSetState(
                                                                  () {});
                                                            } else {
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    (_model.arrTimeZone
                                                                            ?.exceptionMessage ??
                                                                        ''),
                                                                    style: GoogleFonts
                                                                        .roboto(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      fontSize:
                                                                          14.0,
                                                                    ),
                                                                  ),
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          4000),
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                ),
                                                              );
                                                            }
                                                          }

                                                          safeSetState(() {});
                                                        },
                                                      ),
                                                      autofocus: false,
                                                      textCapitalization:
                                                          TextCapitalization
                                                              .characters,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        isDense: false,
                                                        labelText: 'Airport',
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: Color(
                                                                      0x7C252831),
                                                                  fontSize:
                                                                      15.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .fontStyle,
                                                                ),
                                                        hintText: 'eg:DXB',
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                        enabledBorder:
                                                            InputBorder.none,
                                                        focusedBorder:
                                                            InputBorder.none,
                                                        errorBorder:
                                                            InputBorder.none,
                                                        focusedErrorBorder:
                                                            InputBorder.none,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .roboto(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                      maxLength: 3,
                                                      buildCounter: (context,
                                                              {required currentLength,
                                                              required isFocused,
                                                              maxLength}) =>
                                                          null,
                                                      cursorColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      validator: _model
                                                          .airportArrivalTextControllerValidator
                                                          .asValidator(context),
                                                      inputFormatters: [
                                                        if (!isAndroid &&
                                                            !isiOS)
                                                          TextInputFormatter
                                                              .withFunction(
                                                                  (oldValue,
                                                                      newValue) {
                                                            return TextEditingValue(
                                                              selection: newValue
                                                                  .selection,
                                                              text: newValue
                                                                  .text
                                                                  .toCapitalization(
                                                                      TextCapitalization
                                                                          .characters),
                                                            );
                                                          }),
                                                        FilteringTextInputFormatter
                                                            .allow(RegExp(
                                                                '[a-zA-Z]'))
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 20.0, 20.0, 0.0),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: Color(0x0E0D1634),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(10.0),
                                                  child: FlutterFlowDropDown<
                                                      String>(
                                                    controller: _model
                                                            .arrivalTimeZoneValueController ??=
                                                        FormFieldController<
                                                            String>(null),
                                                    options:
                                                        TimeZonesCall.times(
                                                      (_model.apiResultgt0
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!,
                                                    onChanged: (val) =>
                                                        safeSetState(() => _model
                                                                .arrivalTimeZoneValue =
                                                            val),
                                                    width: 200.0,
                                                    height: 40.0,
                                                    searchHintTextStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily,
                                                              letterSpacing:
                                                                  0.0,
                                                              useGoogleFonts:
                                                                  !FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumIsCustom,
                                                            ),
                                                    searchTextStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                              letterSpacing:
                                                                  0.0,
                                                              useGoogleFonts:
                                                                  !FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumIsCustom,
                                                            ),
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                    hintText: 'Timezone',
                                                    searchHintText: 'Search...',
                                                    icon: Icon(
                                                      Icons
                                                          .keyboard_arrow_down_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 24.0,
                                                    ),
                                                    fillColor: FlutterFlowTheme
                                                            .of(context)
                                                        .secondaryBackground,
                                                    elevation: 2.0,
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderWidth: 0.0,
                                                    borderRadius: 8.0,
                                                    margin:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                12.0, 0.0),
                                                    hidesUnderline: true,
                                                    isOverButton: false,
                                                    isSearchable: true,
                                                    isMultiSelect: false,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 20.0, 20.0, 0.0),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: Color(0x0E0D1634),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(10.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    child: TextFormField(
                                                      controller: _model
                                                          .terminalArrTextController,
                                                      focusNode: _model
                                                          .terminalArrFocusNode,
                                                      autofocus: false,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        isDense: false,
                                                        labelText: 'Terminal',
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: Color(
                                                                      0x7C252831),
                                                                  fontSize:
                                                                      15.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .fontStyle,
                                                                ),
                                                        hintText: 'Terminal',
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMediumIsCustom,
                                                                ),
                                                        enabledBorder:
                                                            InputBorder.none,
                                                        focusedBorder:
                                                            InputBorder.none,
                                                        errorBorder:
                                                            InputBorder.none,
                                                        focusedErrorBorder:
                                                            InputBorder.none,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .roboto(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                      maxLines: null,
                                                      cursorColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      validator: _model
                                                          .terminalArrTextControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 20.0, 20.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  final _datePicked6Time =
                                                      await showTimePicker(
                                                    context: context,
                                                    initialTime:
                                                        TimeOfDay.fromDateTime(
                                                            getCurrentTimestamp),
                                                    builder: (context, child) {
                                                      return wrapInMaterialTimePickerTheme(
                                                        context,
                                                        child!,
                                                        headerBackgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        headerForegroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        headerTextStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineLarge
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineLargeFamily,
                                                                  fontSize:
                                                                      32.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineLargeIsCustom,
                                                                ),
                                                        pickerBackgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryBackground,
                                                        pickerForegroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        selectedDateTimeBackgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        selectedDateTimeForegroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        actionButtonForegroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        iconSize: 24.0,
                                                      );
                                                    },
                                                  );
                                                  if (_datePicked6Time !=
                                                      null) {
                                                    safeSetState(() {
                                                      _model.datePicked6 =
                                                          DateTime(
                                                        getCurrentTimestamp
                                                            .year,
                                                        getCurrentTimestamp
                                                            .month,
                                                        getCurrentTimestamp.day,
                                                        _datePicked6Time.hour,
                                                        _datePicked6Time.minute,
                                                      );
                                                    });
                                                  } else if (_model
                                                          .datePicked6 !=
                                                      null) {
                                                    safeSetState(() {
                                                      _model.datePicked6 =
                                                          getCurrentTimestamp;
                                                    });
                                                  }
                                                  _model.araivalTime =
                                                      _model.datePicked6;
                                                  safeSetState(() {});
                                                },
                                                child: Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    border: Border.all(
                                                      color: Color(0x0E0D1634),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'ArrivalTime',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelSmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelSmall
                                                                          .fontStyle,
                                                                    ),
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                            Text(
                                                              dateTimeFormat(
                                                                  "Hm",
                                                                  _model
                                                                      .araivalTime),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .roboto(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                        FaIcon(
                                                          FontAwesomeIcons
                                                              .clock,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 24.0,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 20.0, 20.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  final _datePicked8Date =
                                                      await showDatePicker(
                                                    context: context,
                                                    initialDate:
                                                        getCurrentTimestamp,
                                                    firstDate:
                                                        getCurrentTimestamp,
                                                    lastDate: DateTime(2050),
                                                    builder: (context, child) {
                                                      return wrapInMaterialDatePickerTheme(
                                                        context,
                                                        child!,
                                                        headerBackgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        headerForegroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        headerTextStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineLarge
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineLargeFamily,
                                                                  fontSize:
                                                                      32.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineLargeIsCustom,
                                                                ),
                                                        pickerBackgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryBackground,
                                                        pickerForegroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        selectedDateTimeBackgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        selectedDateTimeForegroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        actionButtonForegroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        iconSize: 24.0,
                                                      );
                                                    },
                                                  );

                                                  if (_datePicked8Date !=
                                                      null) {
                                                    safeSetState(() {
                                                      _model.datePicked8 =
                                                          DateTime(
                                                        _datePicked8Date.year,
                                                        _datePicked8Date.month,
                                                        _datePicked8Date.day,
                                                      );
                                                    });
                                                  } else if (_model
                                                          .datePicked8 !=
                                                      null) {
                                                    safeSetState(() {
                                                      _model.datePicked8 =
                                                          getCurrentTimestamp;
                                                    });
                                                  }
                                                  _model.arrivalDate =
                                                      _model.datePicked8;
                                                  safeSetState(() {});
                                                },
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 60.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    border: Border.all(
                                                      color: Color(0x0E0D1634),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'Arrival Date',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelSmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelSmall
                                                                          .fontStyle,
                                                                    ),
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                            Text(
                                                              dateTimeFormat(
                                                                  "dd-MM-yyyy",
                                                                  _model
                                                                      .arrivalDate),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                        Icon(
                                                          Icons
                                                              .calendar_today_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 24.0,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    if (widget!.ticketDetails == null) {
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 16.0, 20.0, 10.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            if (_model.formKey.currentState ==
                                                    null ||
                                                !_model.formKey.currentState!
                                                    .validate()) {
                                              return;
                                            }
                                            if (_model.departureTimeZoneValue ==
                                                null) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Please Choose Departure TimeZone',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                ),
                                              );
                                              return;
                                            }
                                            if (_model.arrivalTimeZoneValue ==
                                                null) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Please add Arrival timezone',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                ),
                                              );
                                              return;
                                            }
                                            if ((_model.departureTimeZoneValue !=
                                                        null &&
                                                    _model.departureTimeZoneValue !=
                                                        '') &&
                                                (_model.arrivalTimeZoneValue !=
                                                        null &&
                                                    _model.arrivalTimeZoneValue !=
                                                        '')) {
                                              if (_model.departureDate !=
                                                  null) {
                                                if (_model.departureTime !=
                                                    null) {
                                                  if (_model.arrivalDate !=
                                                      null) {
                                                    if (_model.araivalTime !=
                                                        null) {
                                                      await TripsTable()
                                                          .insert({
                                                        'pnr_number': _model
                                                            .pnrNumberTextController
                                                            .text,
                                                        'departure_date':
                                                            supaSerialize<
                                                                    DateTime>(
                                                                _model
                                                                    .departureDate),
                                                        'airline': _model
                                                            .airlineTextController
                                                            .text,
                                                        'flight_number': _model
                                                            .flightNumberTextFieldTextController
                                                            .text,
                                                        'flight_class': _model
                                                            .seatClassTextController
                                                            .text,
                                                        'departure_airport': functions
                                                            .upperCaseConvertion(
                                                                _model
                                                                    .airportDepartTextController
                                                                    .text),
                                                        'departure_time': supaSerialize<
                                                                PostgresTime>(
                                                            PostgresTime(_model
                                                                .departureTime)),
                                                        'departure_timezone': _model
                                                            .departureTimeZoneValue,
                                                        'departure_terminal':
                                                            (String var1) {
                                                          return 'Terminal : ' +
                                                              var1;
                                                        }(_model.terminalDepTextController
                                                                .text),
                                                        'seat': _model
                                                            .seatTextController
                                                            .text,
                                                        'gate_number': _model
                                                            .gateTextController
                                                            .text,
                                                        'arrival_airport': functions
                                                            .upperCaseConvertion(
                                                                _model
                                                                    .airportArrivalTextController
                                                                    .text),
                                                        'arrival_time': supaSerialize<
                                                                PostgresTime>(
                                                            PostgresTime(_model
                                                                .araivalTime)),
                                                        'arrival_timezone': _model
                                                            .arrivalTimeZoneValue,
                                                        'arrival_terminal': (String
                                                            var1) {
                                                          return 'Terminal : ' +
                                                              var1;
                                                        }(_model
                                                            .terminalArrTextController
                                                            .text),
                                                        'user_id':
                                                            currentUserUid,
                                                        'araival_date':
                                                            supaSerialize<
                                                                    DateTime>(
                                                                _model
                                                                    .arrivalDate),
                                                        'trip_type': 'One Way',
                                                        'arrival_airport_name':
                                                            _model
                                                                .arrivalAirportName,
                                                        'departure_airport_name':
                                                            _model
                                                                .departureAirportName,
                                                      });
                                                      safeSetState(() {
                                                        _model
                                                            .pnrNumberTextController
                                                            ?.clear();
                                                        _model
                                                            .airlineTextController
                                                            ?.clear();
                                                        _model
                                                            .seatClassTextController
                                                            ?.clear();
                                                        _model
                                                            .airportDepartTextController
                                                            ?.clear();
                                                        _model
                                                            .terminalDepTextController
                                                            ?.clear();
                                                        _model
                                                            .seatTextController
                                                            ?.clear();
                                                        _model
                                                            .gateTextController
                                                            ?.clear();
                                                        _model
                                                            .airportArrivalTextController
                                                            ?.clear();
                                                        _model
                                                            .terminalArrTextController
                                                            ?.clear();
                                                        _model
                                                            .flightNumberTextFieldTextController
                                                            ?.clear();
                                                      });
                                                      _model.departureDate =
                                                          null;
                                                      _model.departureTime =
                                                          null;
                                                      _model.araivalTime = null;
                                                      _model.selectedFileName =
                                                          '';
                                                      _model.arrivalDate = null;
                                                      safeSetState(() {});
                                                      context.safePop();
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Ticket Updated Successfully',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                        ),
                                                      );
                                                    } else {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Please add ArrivalTime',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                        ),
                                                      );
                                                    }
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Please add ArrivalDate',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 4000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                      ),
                                                    );
                                                  }
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Please add DepartureTime',
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                    ),
                                                  );
                                                }
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Please add DepartureDate',
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                  ),
                                                );
                                              }
                                            } else {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return WebViewAware(
                                                    child: AlertDialog(
                                                      title: Text(
                                                          'Missing Fields'),
                                                      content: Text(
                                                          'Please enter all the details..!'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext),
                                                          child: Text('Ok'),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              );
                                            }
                                          },
                                          text: 'Submit',
                                          options: FFButtonOptions(
                                            width: double.infinity,
                                            height: 50.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      font: GoogleFonts.lato(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontStyle,
                                                      ),
                                                      color: Colors.white,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontStyle,
                                                    ),
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(3.0),
                                          ),
                                        ).animateOnPageLoad(animationsMap[
                                            'buttonOnPageLoadAnimation1']!),
                                      );
                                    } else {
                                      return Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 16.0, 20.0, 10.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              if (_model.formKey.currentState ==
                                                      null ||
                                                  !_model.formKey.currentState!
                                                      .validate()) {
                                                return;
                                              }
                                              if (_model
                                                      .departureTimeZoneValue ==
                                                  null) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Please Choose Departure TimeZone',
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                  ),
                                                );
                                                return;
                                              }
                                              if (_model.arrivalTimeZoneValue ==
                                                  null) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Please add Arrival timezone',
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                  ),
                                                );
                                                return;
                                              }
                                              if ((_model.departureTimeZoneValue !=
                                                          null &&
                                                      _model.departureTimeZoneValue !=
                                                          '') &&
                                                  (_model.arrivalTimeZoneValue !=
                                                          null &&
                                                      _model.arrivalTimeZoneValue !=
                                                          '')) {
                                                if (_model.departureDate !=
                                                    null) {
                                                  if (_model.departureTime !=
                                                      null) {
                                                    if (_model.arrivalDate !=
                                                        null) {
                                                      if (_model.araivalTime !=
                                                          null) {
                                                        await TripsTable()
                                                            .update(
                                                          data: {
                                                            'pnr_number': _model
                                                                .pnrNumberTextController
                                                                .text,
                                                            'departure_date':
                                                                supaSerialize<
                                                                        DateTime>(
                                                                    _model
                                                                        .departureDate),
                                                            'airline': _model
                                                                .airlineTextController
                                                                .text,
                                                            'flight_number': _model
                                                                .flightNumberTextFieldTextController
                                                                .text,
                                                            'flight_class': _model
                                                                .seatClassTextController
                                                                .text,
                                                            'departure_airport':
                                                                functions.upperCaseConvertion(
                                                                    _model
                                                                        .airportDepartTextController
                                                                        .text),
                                                            'departure_time':
                                                                supaSerialize<
                                                                        PostgresTime>(
                                                                    PostgresTime(
                                                                        _model
                                                                            .departureTime)),
                                                            'departure_timezone':
                                                                _model
                                                                    .departureTimeZoneValue,
                                                            'departure_terminal':
                                                                _model
                                                                    .terminalDepTextController
                                                                    .text,
                                                            'seat': _model
                                                                .seatTextController
                                                                .text,
                                                            'gate_number': _model
                                                                .gateTextController
                                                                .text,
                                                            'arrival_airport': functions
                                                                .upperCaseConvertion(
                                                                    _model
                                                                        .airportArrivalTextController
                                                                        .text),
                                                            'arrival_time': supaSerialize<
                                                                    PostgresTime>(
                                                                PostgresTime(_model
                                                                    .araivalTime)),
                                                            'arrival_timezone':
                                                                _model
                                                                    .arrivalTimeZoneValue,
                                                            'arrival_terminal':
                                                                _model
                                                                    .terminalArrTextController
                                                                    .text,
                                                            'user_id':
                                                                currentUserUid,
                                                            'araival_date':
                                                                supaSerialize<
                                                                        DateTime>(
                                                                    _model
                                                                        .arrivalDate),
                                                            'trip_type':
                                                                'One Way',
                                                            'arrival_airport_name':
                                                                _model
                                                                    .arrivalAirportName,
                                                            'departure_airport_name':
                                                                _model
                                                                    .departureAirportName,
                                                          },
                                                          matchingRows:
                                                              (rows) =>
                                                                  rows.eqOrNull(
                                                            'id',
                                                            widget!
                                                                .ticketDetails
                                                                ?.id,
                                                          ),
                                                        );
                                                        safeSetState(() {
                                                          _model
                                                              .pnrNumberTextController
                                                              ?.clear();
                                                          _model
                                                              .airlineTextController
                                                              ?.clear();
                                                          _model
                                                              .seatClassTextController
                                                              ?.clear();
                                                          _model
                                                              .airportDepartTextController
                                                              ?.clear();
                                                          _model
                                                              .terminalDepTextController
                                                              ?.clear();
                                                          _model
                                                              .seatTextController
                                                              ?.clear();
                                                          _model
                                                              .gateTextController
                                                              ?.clear();
                                                          _model
                                                              .airportArrivalTextController
                                                              ?.clear();
                                                          _model
                                                              .terminalArrTextController
                                                              ?.clear();
                                                          _model
                                                              .flightNumberTextFieldTextController
                                                              ?.clear();
                                                        });
                                                        _model.departureDate =
                                                            null;
                                                        _model.departureTime =
                                                            null;
                                                        _model.araivalTime =
                                                            null;
                                                        _model.selectedFileName =
                                                            '';
                                                        _model.arrivalDate =
                                                            null;
                                                        safeSetState(() {});
                                                        context.safePop();
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'Ticket Updated Successfully',
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    4000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                          ),
                                                        );
                                                      } else {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'Please add ArrivalTime',
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                              ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    4000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                          ),
                                                        );
                                                      }
                                                    } else {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Please add ArrivalDate',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                        ),
                                                      );
                                                    }
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Please add DepartureTime',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 4000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                      ),
                                                    );
                                                  }
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Please add DepartureDate',
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                    ),
                                                  );
                                                }
                                              } else {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        title: Text(
                                                            'Missing Fields'),
                                                        content: Text(
                                                            'Please enter all the details..!'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext),
                                                            child: Text('Ok'),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                );
                                              }
                                            },
                                            text: 'Update',
                                            options: FFButtonOptions(
                                              width: double.infinity,
                                              height: 50.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        font: GoogleFonts.lato(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontStyle,
                                                        ),
                                                        color: Colors.white,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontStyle,
                                                      ),
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(3.0),
                                            ),
                                          ).animateOnPageLoad(animationsMap[
                                              'buttonOnPageLoadAnimation2']!),
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              if (_model.isUploading)
                Container(
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.only(
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
                        alignment: AlignmentDirectional(0.0, 0.0),
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
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                        child: Container(
                          width: 150.0,
                          height: 150.0,
                          decoration: BoxDecoration(
                            color: Color(0x1A57636C),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              alignment: AlignmentDirectional(0.0, 0.0),
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
                        padding: EdgeInsetsDirectional.fromSTEB(
                            30.0, 0.0, 30.0, 0.0),
                        child: LinearPercentIndicator(
                          percent: _model.progressValue,
                          lineHeight: 8.0,
                          animation: true,
                          animateFromLastPercent: true,
                          progressColor: FlutterFlowTheme.of(context).primary,
                          backgroundColor:
                              FlutterFlowTheme.of(context).alternate,
                          barRadius: Radius.circular(10.0),
                          padding: EdgeInsets.zero,
                        ),
                      ),
                    ]
                        .divide(SizedBox(height: 50.0))
                        .addToStart(SizedBox(height: 30.0)),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
