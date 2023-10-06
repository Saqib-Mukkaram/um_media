import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
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
      print(_talentController.categories);
      print(_roosterController.roosterList);
      print(_studioController.studios);
    } else {
      return Future.delayed(Duration(seconds: 2));
    }
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
            // // Once data is fetched, navigate to the HomeScreen
            // Map<String, dynamic> roosterJson = {
            //   "id": 1,
            //   "first_name": "John",
            //   "last_name": "Doe",
            //   "gender": "Male",
            //   "phone": "123456789",
            //   "email": "john.doe@example.com",
            //   "city": "New York",
            //   "state": "NY",
            //   "country": "USA",
            //   "dob": "1990-01-01",
            //   "profile_image": "",
            //   "interest": [],
            //   "gallery": []
            // };

            // Create a Rooster object
            // Rooster myRooster = Rooster.fromJson(roosterJson);
            return RegisterScreen();
          } else {
            // While data is being fetched, show the SplashScreen
            return SplashScreen();
          }
        },
      ),
    );
  }
}

// void main() {
//   // Ensure initialized
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   RoosterController _roosterController = Get.put(RoosterController());
//   TalentController _talentController = Get.put(TalentController());
//   StudioController _studioController = Get.put(StudioController());
//   EnquireListController _enquireListController = Get.put(EnquireListController());

//   bool _isLoading = true; // Track whether data is being fetched

//   Future<void> fetchData() async {
//     await _talentController.fetchAll();
//     await _studioController.fetchAll();
//     await _roosterController.fetchAll();

//     setState(() {
//       _isLoading = false; // Set loading indicator to false once data is fetched
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'UmMedia',
//       translations: Languages(),
//       locale: const Locale('en', 'US'),
//       fallbackLocale: const Locale('en', 'UK'),
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
//         useMaterial3: true,
//         fontFamily: "Poppins",
//       ),
//       home: _isLoading ? SplashScreen() : HomeScreen(), // Show SplashScreen while loading
//     );
//   }
// }
