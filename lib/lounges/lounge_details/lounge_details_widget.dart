import '/backend/supabase/supabase.dart';
import '/components/lounge_details_component/lounge_details_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'lounge_details_model.dart';
export 'lounge_details_model.dart';

class LoungeDetailsWidget extends StatefulWidget {
  const LoungeDetailsWidget({
    super.key,
    required this.loungeDetails,
  });

  final LoungesViewRow? loungeDetails;

  static String routeName = 'LoungeDetails';
  static String routePath = '/loungeDetails';

  @override
  State<LoungeDetailsWidget> createState() => _LoungeDetailsWidgetState();
}

class _LoungeDetailsWidgetState extends State<LoungeDetailsWidget> {
  late LoungeDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoungeDetailsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).tertiary,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(10.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).tertiary,
            automaticallyImplyLeading: false,
            actions: [],
            centerTitle: false,
            elevation: 2.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Visibility(
            visible: responsiveVisibility(
              context: context,
              phone: false,
              tablet: false,
              tabletLandscape: false,
              desktop: false,
            ),
            child: wrapWithModel(
              model: _model.loungeDetailsComponentModel,
              updateCallback: () => safeSetState(() {}),
              child: LoungeDetailsComponentWidget(
                loungeDetails: widget!.loungeDetails!,
                isAccepted: true,
                isFavoite: true,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
