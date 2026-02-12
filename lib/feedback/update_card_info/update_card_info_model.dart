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
import 'update_card_info_widget.dart' show UpdateCardInfoWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UpdateCardInfoModel extends FlutterFlowModel<UpdateCardInfoWidget> {
  ///  Local state fields for this page.

  List<String> options = ['Yes', 'No'];
  void addToOptions(String item) => options.add(item);
  void removeFromOptions(String item) => options.remove(item);
  void removeAtIndexFromOptions(int index) => options.removeAt(index);
  void insertAtIndexInOptions(int index, String item) =>
      options.insert(index, item);
  void updateOptionsAtIndex(int index, Function(String) updateFn) =>
      options[index] = updateFn(options[index]);

  String? cartType;

  String? airlineCard;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for CardTypeDropdown widget.
  int? cardTypeDropdownValue;
  FormFieldController<int>? cardTypeDropdownValueController;
  // Stores action output result for [Backend Call - Query Rows] action in CardTypeDropdown widget.
  List<CardTypesRow>? cardName;
  // State field(s) for bankDropdown widget.
  String? bankDropdownValue;
  FormFieldController<String>? bankDropdownValueController;
  // State field(s) for cardDropdown widget.
  String? cardDropdownValue;
  FormFieldController<String>? cardDropdownValueController;
  // State field(s) for cardDropdownAirline widget.
  int? cardDropdownAirlineValue;
  FormFieldController<int>? cardDropdownAirlineValueController;
  // Stores action output result for [Backend Call - Query Rows] action in cardDropdownAirline widget.
  List<CardsViewRow>? airlineCardName;
  // State field(s) for LoungeQn widget.
  String? loungeQnValue;
  FormFieldController<String>? loungeQnValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
