import '/backend/supabase/supabase.dart';
import '/components/no_connection_widget.dart';
import '/components/shimmer_effects/new_shimmer/new_shimmer_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'favorite_widget.dart' show FavoriteWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FavoriteModel extends FlutterFlowModel<FavoriteWidget> {
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
