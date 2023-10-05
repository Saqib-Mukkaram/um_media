import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:um_media/AppConstants.dart';

class TalentsBar extends StatelessWidget {
  const TalentsBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
          child: Text(
            "Talents".toUpperCase(),
            style: TextStyle(
                fontSize: 22,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
        // Spacer(),
        // Padding(
        //   padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
        //   child: Text(
        //     "viewall".tr,
        //     style: TextStyle(color: AppConstants.siteSubColor),
        //   ),
        // )
      ],
    );
  }
}