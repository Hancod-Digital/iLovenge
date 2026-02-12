import '/components/no_connection_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'no_internet_screen_model.dart';
export 'no_internet_screen_model.dart';

class NoInternetScreenWidget extends StatefulWidget {
  const NoInternetScreenWidget({super.key});

  static String routeName = 'NoInternetScreen';
  static String routePath = '/noInternetScreen';

  @override
  State<NoInternetScreenWidget> createState() => _NoInternetScreenWidgetState();
}

class _NoInternetScreenWidgetState extends State<NoInternetScreenWidget> {
  late NoInternetScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoInternetScreenModel());

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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).tertiary,
          automaticallyImplyLeading: false,
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: wrapWithModel(
            model: _model.noConnectionModel,
            updateCallback: () => safeSetState(() {}),
            child: NoConnectionWidget(),
          ),
        ),
      ),
    );
  }
}
