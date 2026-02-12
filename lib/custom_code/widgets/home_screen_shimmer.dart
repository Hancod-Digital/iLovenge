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

import 'package:shimmer/shimmer.dart';

class HomeScreenShimmer extends StatefulWidget {
  const HomeScreenShimmer({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<HomeScreenShimmer> createState() => _HomeScreenShimmerState();
}

class _HomeScreenShimmerState extends State<HomeScreenShimmer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 16.0),
        children: [
          Row(
            children: [
              shimmerContainer(width: 50, height: 50, borderRadius: 10),
              // const SizedBox(width: 16),
            ],
          ),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              shimmerContainer(width: 200, height: 30, borderRadius: 5),
              const SizedBox(height: 8),
              shimmerContainer(height: 30, borderRadius: 5),
            ],
          ),
          const SizedBox(height: 60),
          shimmerContainer(height: 100),
          const SizedBox(height: 60),
          // Row(
          //   children: [
          //     shimmerContainer(width: 100, height: 100),
          //     const SizedBox(width: 16),
          //     Expanded(
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           shimmerContainer(height: 20),
          //           const SizedBox(height: 8),
          //           shimmerContainer(height: 15),
          //           const SizedBox(height: 8),
          //           shimmerContainer(height: 15),
          //         ],
          //       ),
          //     ),
          //   ],
          // ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              shimmerContainer(width: 200, height: 30, borderRadius: 5),
              const SizedBox(height: 8),
              shimmerContainer(height: 30, borderRadius: 5),
            ],
          ),

          const SizedBox(height: 24),
          shimmerContainer(height: 400),
          const SizedBox(height: 24),
          shimmerContainer(height: 400),
        ],
      ),
    );
  }

  Widget shimmerContainer({
    double? width,
    required double height,
    double borderRadius = 8,
  }) {
    return Shimmer.fromColors(
      baseColor: Colors.blueGrey[100]!,
      highlightColor: Colors.white,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.blueGrey[100],
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
    // return Shimmer.fromColors(
    //   baseColor: Colors.grey[300]!,
    //   highlightColor: Colors.white,
    //   child: Container(
    //     height: height,
    //     color: Colors.grey[300],
    //   ),
    // );
  }
}
