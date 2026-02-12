import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/shimmer_effects/ticket_shimmer_comp/ticket_shimmer_comp_widget.dart';
import '/components/update_gate/update_gate_widget.dart';
import '/components/update_seat/update_seat_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'trip_details_widget.dart' show TripDetailsWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class TripDetailsModel extends FlutterFlowModel<TripDetailsWidget> {
  ///  Local state fields for this page.

  String? gate;

  String seat = 'N/A';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
