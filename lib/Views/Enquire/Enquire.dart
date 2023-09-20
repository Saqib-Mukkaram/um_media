import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:um_media/AppConstants.dart';
import 'package:um_media/CustomWidgets/ButtonCustom.dart';
import 'package:um_media/CustomWidgets/CustomAppBar.dart';
import 'package:um_media/Views/Homes/ClientHome/Home.dart';

class Enquire extends StatelessWidget {
  Enquire({super.key});

  final scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(scaffoldkey: scaffoldkey),
      body: Column(
        children: [
          ButtonCustom(
            buttonText: "Back To Profile",
            onPress: () {
              Get.back();
            },
            backgroundColor: AppConstants.subTextGrey,
            foregroundColor: AppConstants.siteSubColor,
          ),
          ButtonCustom(
            buttonText: "Back To Home",
            onPress: () {
              Get.offAll(HomeScreen());
            },
            backgroundColor: AppConstants.subTextGrey,
            foregroundColor: AppConstants.siteSubColor,
          )

        ],
      ),
    );
  }
}
