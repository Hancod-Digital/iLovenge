import '/components/no_connection_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'no_internet_screen_widget.dart' show NoInternetScreenWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NoInternetScreenModel extends FlutterFlowModel<NoInternetScreenWidget> {
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
