import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:um_media/AppConstants.dart';
import 'package:um_media/CustomWidgets/ButtonCustom.dart';
import 'package:um_media/CustomWidgets/InputField.dart';
import 'package:um_media/Views/Reset/VerifyOTP.dart';

class ConfirmEmail extends StatefulWidget {
  const ConfirmEmail({super.key});

  @override
  State<ConfirmEmail> createState() => _ConfirmEmailState();
}

class _ConfirmEmailState extends State<ConfirmEmail> {
  final TextEditingController confirmEmailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    "confirm_email".tr,
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
              Text(
                "email_confirmation_descp".tr,
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
                  placeholderText: "enter_your_email".tr,
                  fieldController: confirmEmailController),
              ButtonCustom(
                  buttonText: "send_code".tr,
                  onPress: () {
                    Get.to(VerifyOTP());
                  })
            ],
          ),
        ),
      ),
    );
  }
}
