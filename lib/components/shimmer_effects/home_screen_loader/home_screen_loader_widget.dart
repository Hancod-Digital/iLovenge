import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_screen_loader_model.dart';
export 'home_screen_loader_model.dart';

class HomeScreenLoaderWidget extends StatefulWidget {
  const HomeScreenLoaderWidget({super.key});

  @override
  State<HomeScreenLoaderWidget> createState() => _HomeScreenLoaderWidgetState();
}

class _HomeScreenLoaderWidgetState extends State<HomeScreenLoaderWidget> {
  late HomeScreenLoaderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeScreenLoaderModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: custom_widgets.HomeScreenShimmer(
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
