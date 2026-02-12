import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'new_shimmer_model.dart';
export 'new_shimmer_model.dart';

class NewShimmerWidget extends StatefulWidget {
  const NewShimmerWidget({super.key});

  @override
  State<NewShimmerWidget> createState() => _NewShimmerWidgetState();
}

class _NewShimmerWidgetState extends State<NewShimmerWidget> {
  late NewShimmerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewShimmerModel());

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
      height: 350.0,
      child: custom_widgets.ShimmerEffect(
        width: double.infinity,
        height: 350.0,
      ),
    );
  }
}
