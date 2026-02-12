import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/trip_delay_card/trip_delay_card_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/index.dart';
import 'selected_flight_widget.dart' show SelectedFlightWidget;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SelectedFlightModel extends FlutterFlowModel<SelectedFlightWidget> {
  ///  Local state fields for this page.

  DateTime? departureDate;

  DateTime? departureTime;

  DateTime? arrivalTime;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for TripDelayCard component.
  late TripDelayCardModel tripDelayCardModel;
  // State field(s) for flightStatus widget.
  String? flightStatusValue;
  FormFieldController<String>? flightStatusValueController;
  DateTime? datePicked1;
  DateTime? datePicked2;
  DateTime? datePicked3;
  DateTime? datePicked4;
  DateTime? datePicked5;
  DateTime? datePicked6;

  @override
  void initState(BuildContext context) {
    tripDelayCardModel = createModel(context, () => TripDelayCardModel());
  }

  @override
  void dispose() {
    tripDelayCardModel.dispose();
  }
}
