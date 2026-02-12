import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_new_trip_model.dart';
export 'add_new_trip_model.dart';

class AddNewTripWidget extends StatefulWidget {
  const AddNewTripWidget({
    super.key,
    this.ticketDetails,
  });

  final TripStruct? ticketDetails;

  static String routeName = 'addNewTrip';
  static String routePath = '/addNewTrip';

  @override
  State<AddNewTripWidget> createState() => _AddNewTripWidgetState();
}

class _AddNewTripWidgetState extends State<AddNewTripWidget> {
  late AddNewTripModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddNewTripModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {});

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
            'Add New Trip',
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
          child: Visibility(
            visible: responsiveVisibility(
              context: context,
              tablet: false,
              tabletLandscape: false,
              desktop: false,
            ),
            child: custom_widgets.AddTripScreen(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height,
            ),
          ),
        ),
      ),
    );
  }
}
