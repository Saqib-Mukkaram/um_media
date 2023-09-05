import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:um_media/CustomWidgets/ButtonCustom.dart';
import 'package:um_media/Views/Login/Login.dart';

class SideBar extends StatelessWidget {
  const SideBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 8,
      child: Container(
        child: Column(
          children: [
            ButtonCustom(
                buttonText: "Logout",
                onPress: () {
                  Get.offAll(LoginScreen());
                })
          ],
        ),
      ),
    );
  }
}
