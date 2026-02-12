import '/backend/supabase/supabase.dart';
import '/components/lounge_details_component/lounge_details_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'lounge_details_widget.dart' show LoungeDetailsWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoungeDetailsModel extends FlutterFlowModel<LoungeDetailsWidget> {
  ///  Local state fields for this page.

  int imageIndex = 0;

  ///  State fields for stateful widgets in this page.

  // Model for LoungeDetailsComponent component.
  late LoungeDetailsComponentModel loungeDetailsComponentModel;

  @override
  void initState(BuildContext context) {
    loungeDetailsComponentModel =
        createModel(context, () => LoungeDetailsComponentModel());
  }

  @override
  void dispose() {
    loungeDetailsComponentModel.dispose();
  }
}
