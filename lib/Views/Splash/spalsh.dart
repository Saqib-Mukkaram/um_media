import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:um_media/AppConstants.dart';
import 'package:um_media/Controller/RoosterController.dart';
import 'package:um_media/Controller/StudioController.dart';
import 'package:um_media/Controller/TalentController.dart';
import 'package:um_media/Views/Homes/ClientHome/Home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SharedPreferences? prefs;

  Future<void> fetchData() async {
    // Future.delayed(Duration(seconds: 2));
    final RoosterController _roosterController = Get.find();
    final TalentController _talentController = Get.find();
    final StudioController _studioController = Get.find();
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

  @override
  void initState() {
    fetchData().then((value) => Get.off(HomeScreen()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppConstants.Logo,
              width: 300,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Powered by UM Media",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CircularProgressIndicator(
              color: AppConstants.siteSubColor,
            )
          ],
        ),
      ),
    );
  }
}
