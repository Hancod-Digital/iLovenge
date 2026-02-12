import '/components/no_connection_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'mytickets_widget.dart' show MyticketsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyticketsModel extends FlutterFlowModel<MyticketsWidget> {
  ///  Local state fields for this page.

  DateTime? currentDate;

  DateTime? groupDate;

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
