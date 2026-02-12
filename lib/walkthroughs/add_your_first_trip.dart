import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/components/info_box_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

// Focus widget keys for this walkthrough
final columnEoejvhev = GlobalKey();

/// Add Your First Trip
///
///
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: columnEoejvhev,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: FlutterFlowTheme.of(context).tertiary,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => InfoBoxWidget(
              title: 'Add Trip',
              content: 'This feature is under development.',
            ),
          ),
        ],
      ),
    ];
