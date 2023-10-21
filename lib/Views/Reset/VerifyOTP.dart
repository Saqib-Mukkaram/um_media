import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:um_media/AppConstants.dart';
import 'package:um_media/CustomWidgets/ButtonCustom.dart';
import 'package:um_media/CustomWidgets/InputField.dart';
import 'package:um_media/CustomWidgets/LabelText.dart';
import 'package:um_media/Views/Reset/ChangePassword.dart';

class VerifyOTP extends StatefulWidget {
  const VerifyOTP({super.key});

  @override
  State<VerifyOTP> createState() => _VerifyOTPState();
}

class _VerifyOTPState extends State<VerifyOTP> {
  final TextEditingController otpController1 = TextEditingController();
  final TextEditingController otpController2 = TextEditingController();
  final TextEditingController otpController3 = TextEditingController();
  final TextEditingController otpController4 = TextEditingController();
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
                    "verify_otp".tr,
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
              Text(
                "verify_otp_descp".tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: AppConstants.login_text,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InputField(
                    placeholderText: " ",
                    fieldController: otpController1,
                    width: 50,
                    keyboardType: TextInputType.number,
                  ),
                  InputField(
                    placeholderText: " ",
                    fieldController: otpController2,
                    width: 50,
                    keyboardType: TextInputType.number,
                  ),
                  InputField(
                    placeholderText: " ",
                    fieldController: otpController3,
                    width: 50,
                    keyboardType: TextInputType.number,
                  ),
                  InputField(
                    placeholderText: " ",
                    fieldController: otpController4,
                    width: 50,
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
              Text(
                "sent_code_to_email".tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: AppConstants.login_text,
                ),
              ),
              // Later For Localization
              Text(
                "Resend in XX:XX",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ButtonCustom(
                  buttonText: "continue_button".tr,
                  foregroundColor: AppConstants.siteSubColor,
                  backgroundColor: AppConstants.subTextGrey,
                  onPress: () {
                    Get.to(ChangePassword());
                  })
            ],
          ),
        ),
      ),
    );
  }
}
