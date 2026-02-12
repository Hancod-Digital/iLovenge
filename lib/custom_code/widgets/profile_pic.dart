// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePic extends StatefulWidget {
  const ProfilePic({
    super.key,
    this.width,
    this.height,
    required this.profilePic,
  });

  final double? width;
  final double? height;
  final String? profilePic;

  @override
  State<ProfilePic> createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (widget.profilePic == null || widget.profilePic == '') {
          return Container(
            width: 150.0,
            height: 150.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).alternate,
              shape: BoxShape.circle,
            ),
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: FaIcon(
                FontAwesomeIcons.user,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 84.0,
              ),
            ),
          );
        } else {
          return Container(
            width: 150.0,
            height: 150.0,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.network(
              widget.profilePic!,
              fit: BoxFit.cover,
            ),
          );
        }
      },
    );
  }
}
