import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/no_connection_widget.dart';
import '/components/shimmer_effects/home_screen_loader/home_screen_loader_widget.dart';
import '/components/update_gate/update_gate_widget.dart';
import '/components/update_message/update_message_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/walkthroughs/add_your_first_trip.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dart:math' as math;
import 'home_widget.dart' show HomeWidget;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  Local state fields for this page.

  bool isFav = false;

  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? addYourFirstTripController;
  // Stores action output result for [Backend Call - Query Rows] action in home widget.
  List<UsersRow>? user;
  // Stores action output result for [Custom Action - addGateNumber] action in home widget.
  bool? gateNotAdded;
  bool? seatNotAdded;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for noConnection component.
  late NoConnectionModel noConnectionModel;

  @override
  void initState(BuildContext context) {
    noConnectionModel = createModel(context, () => NoConnectionModel());
  }

  @override
  void dispose() {
    addYourFirstTripController?.finish();
    noConnectionModel.dispose();
  }
}
