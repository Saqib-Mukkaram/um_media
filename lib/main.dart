import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:um_media/Controller/EnquireListController.dart';
import 'package:um_media/Controller/Langauge.dart';
import 'package:um_media/Controller/LoginController.dart';
import 'package:um_media/Controller/RoosterController.dart';
import 'package:um_media/Controller/StudioController.dart';
import 'package:um_media/Controller/TalentController.dart';
import 'package:um_media/Models/Register.dart';
import 'package:um_media/Models/Rooster.dart';
import 'package:um_media/Models/Studio.dart';
import 'package:um_media/Views/Homes/ClientHome/Home.dart';
import 'package:um_media/Views/Homes/HomeArtisan/Home_artisan.dart';
import 'package:um_media/Views/Login/Login.dart';
import 'package:um_media/Views/Profile/ProfilePage.dart';
import 'package:um_media/Views/Registeration/Register.dart';
import 'package:um_media/Views/Registeration/RegisterProfilePage.dart';
import 'package:um_media/Views/Splash/spalsh.dart';


// Okay this does not have GRADLE errors
//While compiling it may show the erros but it meta data i have on my
// computers due to other projects.
// if u face the meta data error feel free to go to build.gradle.
// to change the kotlin version
// if the issue still persistes change the gradle to 4. something.
void main() {
  // Ensure initialized
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final RoosterController _roosterController = Get.put(RoosterController());
  final TalentController _talentController = Get.put(TalentController());
  final StudioController _studioController = Get.put(StudioController());
  final EnquireListController _enquireListController =
      Get.put(EnquireListController());
  final LoginController _loginController = Get.put(LoginController());
  SharedPreferences? prefs;
  Rooster? rooster;

  Future<void> fetchData() async {
    if (_talentController.categories.isEmpty ||
        _roosterController.roosterList.isEmpty ||
        _studioController.studios.isEmpty) {
      print(_talentController.categories);
      print(_roosterController.roosterList);
      print(_studioController.studios);
      await _talentController.fetchAll();
      await _studioController.fetchAll();
      await _roosterController.fetchAll();
      prefs = await SharedPreferences.getInstance();
      print(_talentController.categories);
      print(_roosterController.roosterList);
      print(_studioController.studios);
    } else {
      return Future.delayed(Duration(seconds: 2));
    }
  }

  Future<Rooster?> getRooster() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final roosterJson = prefs.getString('rooster');
    if (roosterJson != null) {
      final roosterMap = json.decode(roosterJson);
      return Rooster.fromJson(roosterMap);
    }
    return null; // Return null if the rooster data is not found in SharedPreferences
  }

  @override
  void initState() {
    super.initState();
  }

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
        fontFamily: "Poppins",
      ),
      home: FutureBuilder(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // bool isLoggedIn = prefs?.getBool('isLoggedIn') ?? false;
            // if (isLoggedIn) {
            //   rooster =
            //       jsonDecode(prefs?.getString('rooster') as String);
            // }
            // print("Logged ? $isLoggedIn");
            //
            // return isLoggedIn == true && rooster != null
            //     ? HomeArtisanScreen(
            //         rooster: rooster as Rooster,
            //       )
            //     : HomeScreen();
            return HomeScreen();
            // return HomeArtisanScreen(rooster_id: 1);
          } else {
            // While data is being fetched, show the SplashScreen
            return SplashScreen();
          }
        },
      ),
    );
  }
}
