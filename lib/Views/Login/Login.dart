import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:um_media/AppConstants.dart';
import 'package:um_media/Controller/LoginController.dart';
import 'package:um_media/CustomWidgets/ButtonCustom.dart';
import 'package:um_media/CustomWidgets/InputField.dart';
import 'package:um_media/CustomWidgets/LabelText.dart';
import 'package:um_media/CustomWidgets/TextWithDividers.dart';
import 'package:um_media/Views/Homes/ClientHome/Home.dart';
import 'package:um_media/Views/Homes/HomeArtisan/Home_artisan.dart';
import 'package:um_media/Views/Registeration/Register.dart';
import 'package:um_media/Views/Reset/ConfirmEmail.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool rememberMe = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "welcome_back_user".tr,
                        style: TextStyle(fontSize: 24),
                      ),
                      // Text(
                      //   "UserName",
                      //   style: TextStyle(
                      //     fontSize: 24,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
              Text(
                "welcome_back_descp".tr,
                style: TextStyle(fontSize: 18, color: AppConstants.login_text),
              ),
              SizedBox(
                height: 100,
              ),
              InputField(
                  placeholderText: "email".tr,
                  fieldController: emailController),
              InputField(
                placeholderText: "password".tr,
                fieldController: passwordController,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
              ),
              Row(
                children: [
                  Checkbox(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      value: rememberMe,
                      onChanged: (bool? value) {
                        setState(() {
                          rememberMe = value!;
                        });
                      }),
                  LabelText(
                      labelText: "remember_me".tr,
                      paddingleft: 0,
                      paddingbottom: 0,
                      paddingright: 0,
                      paddingtop: 0),
                  Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent, elevation: 0),
                    onPressed: () {
                      Get.to(HomeArtisanScreen());
                    },
                    child: Text(
                      "forget_password".tr,
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  )
                ],
              ),
              ButtonCustom(
                buttonText: "login".tr,
                onPress: () async {
                  FIXME:
                  "Simple Email Login";
                  //Verifying the User Cred
                  // var verified = await _controller.LoginRequest(body: {
                  //   "name": emailController.value.text,
                  //   "password": passwordController.value.text
                  // }, header: {
                  //   "Signature": "HelloAPI"
                  // });
                  // if (verified == 200) {
                  //   Get.offAll(HomeScreen());
                  // } else {
                  //   Get.offAll(HomeScreen());
                  // }
                  Get.offAll(HomeScreen());
                },
                backgroundColor: AppConstants.subTextGrey,
                foregroundColor: AppConstants.siteSubColor,
                elevation: 2,
              ),
              TextWithDividers(
                text: "or".tr,
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: 0,
                  ),
                  onPressed: () {
                    Get.to(RegisterScreen());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "no_account".tr,
                        style: TextStyle(color: Colors.grey, fontSize: 18),
                      ),
                      LabelText(
                        labelText: "register".tr,
                        paddingbottom: 0,
                        paddingleft: 0,
                        paddingright: 0,
                        paddingtop: 0,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
