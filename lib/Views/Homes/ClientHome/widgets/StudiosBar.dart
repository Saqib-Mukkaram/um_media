import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:um_media/AppConstants.dart';

class StudiosBar extends StatelessWidget {
  const StudiosBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
          child: Text(
            "studio".tr.toUpperCase(),
            style: TextStyle(
                fontSize: 28,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
          child: Text(
            "viewall".tr,
            style: TextStyle(color: AppConstants.siteSubColor),
          ),
        )
      ],
    );
  }
}
