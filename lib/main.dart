import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:um_media/Controller/Langauge.dart';

import 'package:um_media/AppBindings.dart';

import 'package:um_media/Views/Splash/spalsh.dart';

import 'AppTheme.dart';

// import 'package:webview_flutter/webview_flutter.dart';

// Okay this does not have GRADLE errors
//While compiling it may show the erros but it meta data i have on my
// computers due to other projects.
// if u face the meta data error feel free to go to build.gradle.
// to change the kotlin version
// if the issue still persistes change the gradle to 4. something.
void main() {
  // Ensure initialized
  WidgetsFlutterBinding.ensureInitialized();
  runApp(InitScreen());
}

class InitScreen extends StatelessWidget {
  InitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'UmMedia',
        initialBinding: AppBindings(),
        translations: Languages(),
        locale: const Locale('en', 'US'),
        fallbackLocale: const Locale('en', 'UK'),
        theme: AppTheme.theme,
        home: SplashScreen());
  }
}

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   Rooster? rooster;
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'UmMedia',
//         initialBinding: AppBindings(),
//         translations: Languages(),
//         locale: const Locale('en', 'US'),
//         fallbackLocale: const Locale('en', 'UK'),
//         theme: ThemeData(
//           colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
//           useMaterial3: true,
//           fontFamily: "Poppins",
//         ),
//         home: SplashScreen());
//   }
// }
// /*
// *
// * FutureBuilder(
//         future: Future.delayed(Duration(seconds: 2)),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//
//             return HomeScreen();
//             // return HomeArtisanScreen(rooster_id: 1);
//           } else {
//             // While data is being fetched, show the SplashScreen
//             return SplashScreen();
//           }
//         },
//       ),
// * */
