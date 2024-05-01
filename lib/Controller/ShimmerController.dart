import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shimmer/shimmer.dart';
import 'package:um_media/CustomWidgets/TalentCard.dart';

class ShimmerController extends GetxController {
  static Widget shimmer() {
    return SizedBox(
      width: 200.0,
      height: 100.0,
      child: Shimmer.fromColors(
          baseColor: Colors.red, highlightColor: Colors.yellow, child: Card()),
    );
  }

  static Widget shimmerList() {
    return Shimmer(
      child: Card(),
      gradient: LinearGradient(colors: [
        Colors.white,
        // Color.fromARGB(255, 196, 143, 27),
       Colors.grey,
        Colors.white
      ]),
      direction: ShimmerDirection.rtl,
      loop: 5,
      period: Duration(milliseconds: 1000),
    );
  }
}
