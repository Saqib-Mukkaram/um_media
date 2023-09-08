
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:um_media/Controller/Langauge.dart';
import 'package:um_media/CustomWidgets/TalentProfile.dart';
import 'package:um_media/CustomWidgets/TalentsView.dart';
import 'package:um_media/Views/Home/Home.dart';

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
        fontFamily: "Poppins"
      ),
      home: HomeScreen()
    );
  }
}
