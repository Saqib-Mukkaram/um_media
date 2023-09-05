import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:um_media/AppConstants.dart';
import 'package:um_media/Views/Login/Login.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 2), // Adjust the duration as needed
      () {
        Get.offAll(LoginScreen());
      },
    );
    FIXME:"If the User is Logged in It should login to home screen.";
    
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppConstants.white,
      child: Center(
        child: Image.asset(
          AppConstants.Logo,
          width: 100,
        ),
      ),
    );
  }
}
