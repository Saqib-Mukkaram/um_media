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
          padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
          child: Text(
            "talents".tr.toUpperCase(),
            style: TextStyle(
                fontSize: 22,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
        Spacer(),
        InkWell(
          onTap: () {
            FIXME:
            "This is yet to be Implemented";
            print("View all is tapped");
          },
          child: Padding(
            padding:
                const EdgeInsets.fromLTRB(0, 0, 16, 0),
            child: Text(
              "viewall".tr,
              style: TextStyle(
                  color: AppConstants.siteSubColor),
            ),
          ),
        )
      ],
    );
  }
}