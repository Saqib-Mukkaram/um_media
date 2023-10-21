import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:um_media/AppConstants.dart';
import 'package:um_media/CustomWidgets/ButtonCustom.dart';
import 'package:um_media/CustomWidgets/InputField.dart';
import 'package:um_media/CustomWidgets/LabelText.dart';
import 'package:um_media/Views/Login/Login.dart';
import 'package:um_media/Views/Splash/spalsh.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool scCase = false;
  bool luCase = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppConstants.subTextGrey,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_outlined,
                color: Colors.white,
              ),
              onPressed: () {
                Get.back();
              }),
          title: Text(
            "Back",
            style: TextStyle(color: Colors.white),
          )),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(50, 50, 50, 10),
              child: Center(
                child: Text(
                  "strong_password".tr,
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
            Text(
              "strong_password_descp".tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: AppConstants.login_text,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            InputField(
                placeholderText: "new_password".tr,
                fieldController: newPasswordController),
            InputField(
                placeholderText: "confirm_password".tr,
                fieldController: confirmPasswordController),
            // LabelText(labelText: "must_have_password".tr),
            // Row(
            //   children: [
            //     Checkbox(
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.all(
            //             Radius.circular(5),
            //           ),
            //         ),
            //         value: luCase,
            //         onChanged: (bool? value) {
            //           setState(() {
            //             luCase = value!;
            //           });
            //         }),
            //     LabelText(
            //       labelText: "must_have_one".tr,
            //       paddingleft: 0,
            //       paddingbottom: 0,
            //       paddingright: 0,
            //       paddingtop: 0,
            //       TextColor: Colors.grey,
            //     ),
            //   ],
            // ),
            // Row(
            //   children: [
            //     Checkbox(
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.all(
            //             Radius.circular(5),
            //           ),
            //         ),
            //         value: scCase,
            //         onChanged: (bool? value) {
            //           setState(() {
            //             scCase = value!;
            //           });
            //         }),
            //     LabelText(
            //       labelText: "must_have_two".tr,
            //       paddingleft: 0,
            //       paddingbottom: 0,
            //       paddingright: 0,
            //       paddingtop: 0,
            //       TextColor: Colors.grey,
            //     ),
            //   ],
            // ),
            ButtonCustom(
              buttonText: "register".tr,
              foregroundColor: AppConstants.siteSubColor,
              backgroundColor: AppConstants.subTextGrey,
              onPress: () {
                Get.offAll(LoginScreen());
              },
              elevation: 0,
            )
          ],
        )),
      ),
    );
  }
}
