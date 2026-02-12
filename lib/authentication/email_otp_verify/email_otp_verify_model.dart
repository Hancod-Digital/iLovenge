import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'email_otp_verify_widget.dart' show EmailOtpVerifyWidget;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EmailOtpVerifyModel extends FlutterFlowModel<EmailOtpVerifyWidget> {
  ///  Local state fields for this page.

  bool isLoading = false;

  bool isResend = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  FocusNode? pinCodeFocusNode;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
  String? _pinCodeControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'OTP is required';
    }
    if (val.length < 6) {
      return 'Requires 6 characters.';
    }
    return null;
  }

  // Stores action output result for [Validate Form] action in PinCode widget.
  bool? isValidated;
  // Stores action output result for [Custom Action - confirmEmailOtp] action in PinCode widget.
  bool? isConformOtp;
  // Stores action output result for [Custom Action - checkAuth] action in PinCode widget.
  bool? authCopy;
  // Stores action output result for [Backend Call - Query Rows] action in PinCode widget.
  List<UsersRow>? usersCopy;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? checkValidated;
  // Stores action output result for [Custom Action - confirmEmailOtp] action in Button widget.
  bool? isOtpValid;
  // Stores action output result for [Custom Action - checkAuth] action in Button widget.
  bool? auth;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<UsersRow>? users;
  // State field(s) for Timer widget.
  final timerInitialTimeMs = 60000;
  int timerMilliseconds = 60000;
  String timerValue = StopWatchTimer.getDisplayTime(
    60000,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
    pinCodeControllerValidator = _pinCodeControllerValidator;
  }

  @override
  void dispose() {
    pinCodeFocusNode?.dispose();
    pinCodeController?.dispose();

    timerController.dispose();
  }
}
