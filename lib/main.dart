import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:um_media/Controller/Langauge.dart';
import 'package:um_media/CustomWidgets/ProfileInfo.dart';
import 'package:um_media/CustomWidgets/TalentProfile.dart';
import 'package:um_media/CustomWidgets/TalentsView.dart';
import 'package:um_media/Views/Homes/ClientHome/Home.dart';
import 'package:um_media/Views/Homes/HomeArtisan/Home_artisan.dart';
import 'package:um_media/Views/Login/Login.dart';
import 'package:um_media/Views/Profile/ProfilePage.dart';
import 'package:um_media/Views/Registeration/Register.dart';
import 'package:um_media/Views/Splash/spalsh.dart';
import 'package:um_media/Views/Studio/StudioView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'UmMedia',
        translations: Languages(),
        locale: const Locale('en', 'US'),
        fallbackLocale: const Locale('en', 'UK'),
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
            useMaterial3: true,
            fontFamily: "Poppins"),
        home:HomeScreen());
  }
}
