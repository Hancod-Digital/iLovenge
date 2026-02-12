import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'add_card_widget.dart' show AddCardWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddCardModel extends FlutterFlowModel<AddCardWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for CardTypeDropdown widget.
  int? cardTypeDropdownValue;
  FormFieldController<int>? cardTypeDropdownValueController;
  // State field(s) for bankDropdown widget.
  int? bankDropdownValue;
  FormFieldController<int>? bankDropdownValueController;
  // State field(s) for cardDropdown widget.
  int? cardDropdownValue;
  FormFieldController<int>? cardDropdownValueController;
  // State field(s) for airlineDropdown widget.
  int? airlineDropdownValue;
  FormFieldController<int>? airlineDropdownValueController;
  // State field(s) for airlineMemberDropdown widget.
  int? airlineMemberDropdownValue;
  FormFieldController<int>? airlineMemberDropdownValueController;
  // State field(s) for priorityCard widget.
  int? priorityCardValue;
  FormFieldController<int>? priorityCardValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
