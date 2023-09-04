import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:um_media/AppConstants.dart';
import 'package:um_media/CustomWidgets/ButtonCustom.dart';
import 'package:um_media/CustomWidgets/InputField.dart';
import 'package:um_media/CustomWidgets/LabelText.dart';
import 'package:um_media/CustomWidgets/TextWithDividers.dart';
import 'package:um_media/Views/Login/Login.dart';
import 'package:um_media/Views/Splash/spalsh.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool agreedToTerms = false;
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
                    "join_us".tr,
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
              Text(
                "join_us_descp".tr,
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
              InputField(
                placeholderText: "confirm_password".tr,
                fieldController: confirmPasswordController,
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
                      value: agreedToTerms,
                      onChanged: (bool? value) {
                        setState(() {
                          agreedToTerms = value!;
                        });
                      }),
                  LabelText(
                      labelText: "agree_to_terms".tr,
                      paddingleft: 0,
                      paddingbottom: 0,
                      paddingright: 0,
                      paddingtop: 0),
                ],
              ),
              ButtonCustom(
                buttonText: "register_button".tr,
                onPress: () {
                  Get.to(SplashScreen());
                },
                backgroundColor: AppConstants.loginButton,
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
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: AppConstants.dividerColor),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            AppConstants.google_icon,
                            width: 25,
                          ),
                        ),
                        Text(
                          "google_login".tr,
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ],
                    )),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                  onPressed: () {
                    Get.to(LoginScreen());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "no_account".tr,
                        style: TextStyle(color: Colors.grey, fontSize: 18),
                      ),
                      LabelText(
                        labelText: "login_button".tr,
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
