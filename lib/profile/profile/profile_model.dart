import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/logout_alert/logout_alert_widget.dart';
import '/components/no_connection_widget.dart';
import '/components/shimmer_effects/ticket_shimmer_comp/ticket_shimmer_comp_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/index.dart';
import 'profile_widget.dart' show ProfileWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ProfileModel extends FlutterFlowModel<ProfileWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for noConnection component.
  late NoConnectionModel noConnectionModel;

  @override
  void initState(BuildContext context) {
    noConnectionModel = createModel(context, () => NoConnectionModel());
  }

  @override
  void dispose() {
    noConnectionModel.dispose();
  }
}
