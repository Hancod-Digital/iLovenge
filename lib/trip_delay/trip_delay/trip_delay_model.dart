import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/shimmer_effects/ticket_shimmer_comp/ticket_shimmer_comp_widget.dart';
import '/components/trip_delay_card/trip_delay_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'trip_delay_widget.dart' show TripDelayWidget;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TripDelayModel extends FlutterFlowModel<TripDelayWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for TripDelayCard dynamic component.
  late FlutterFlowDynamicModels<TripDelayCardModel> tripDelayCardModels;

  @override
  void initState(BuildContext context) {
    tripDelayCardModels = FlutterFlowDynamicModels(() => TripDelayCardModel());
  }

  @override
  void dispose() {
    tripDelayCardModels.dispose();
  }
}
