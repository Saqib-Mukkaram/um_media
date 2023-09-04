import 'package:flutter/material.dart';
import 'package:um_media/AppConstants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

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
