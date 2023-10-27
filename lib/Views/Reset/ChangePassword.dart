import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:um_media/AppConstants.dart';
import 'package:um_media/Controller/ForgetPasswordController.dart';
import 'package:um_media/Controller/UpdateController.dart';
import 'package:um_media/CustomWidgets/ButtonCustom.dart';
import 'package:um_media/CustomWidgets/InputField.dart';
import 'package:um_media/CustomWidgets/LabelText.dart';
import 'package:um_media/Views/Login/Login.dart';
import 'package:um_media/Views/Splash/spalsh.dart';

class ChangePassword extends StatefulWidget {
  final String email;

  const ChangePassword({required this.email, super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
  TextEditingController();
  final ForgetPasswordController _updatePasswordController =
  ForgetPasswordController();

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
                    fieldController: newPasswordController,
                    obscureText: true),
                InputField(
                    placeholderText: "confirm_password".tr,
                    fieldController: confirmPasswordController,
                    obscureText: true),
                ButtonCustom(
                  buttonText: "Change Password",
                  foregroundColor: AppConstants.siteSubColor,
                  backgroundColor: AppConstants.subTextGrey,
                  onPress: () async {
                    if (newPasswordController.text !=
                        confirmPasswordController.text) {
                      Get.defaultDialog(
                          title: "Mismatch", middleText: "Passwords Mismatch");
                    } else {
                      var x = await _updatePasswordController.updatePassword(
                          email: widget.email,
                          password: newPasswordController.text);
                      if (x == true) {
                        Get.defaultDialog(
                            title: "Password Changed",
                            middleText: "Login with your new Password.",
                            onWillPop: () {
                              Get.offAll(LoginScreen());
                              return Future.value(true);
                            });
                      } else {
                        Get.defaultDialog(
                            title: "Password Change Unsuccessfull",
                            middleText: "Something went wrong",
                            onWillPop: () {
                              Get.offAll(LoginScreen());
                              return Future.value(true);
                            });
                      }
                    }
                  },
                  elevation: 0,
                )
              ],
            )),
      ),
    );
  }
}
