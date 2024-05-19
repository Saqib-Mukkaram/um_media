import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:um_media/AppConstants.dart';
import 'package:um_media/Controller/CacheController.dart';
import 'package:um_media/Models/Rooster.dart';
import 'package:http/http.dart' as http;

class RoosterController extends GetxController {
  List<Rooster> roosterList = [];

// whenever calss is called it will be called first

  @override
  void onInit() {
    super.onInit();
    fetchAll();
  }

  Future<bool> isDataFetched() {
    // Future.delayed(Duration(seconds: 2));
    if (roosterList.isNotEmpty) {
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }

  Future<void> fetchAll() async {
    await fetchRoosterNumbers();
    // await cachedData();
    kDebugMode ? print("Roosters Fetched ${roosterList.length}") : null;
  }

  Future<void> fetchRoosterNumbers() async {
    var response = await http.post(
        Uri.parse(AppConstants.base_URL + AppConstants.rooster_list),
        headers: AppConstants.httpHeader);
    var jsonData = jsonDecode(response.body)['data'] as List<dynamic>;
    // roosterNumbers = jsonData.map((e) => RoosterData.fromJson(e)).toList();
    roosterList = jsonData.map((e) => Rooster.fromJson(e)).toList();

    // print('numbers fetched');
  }
}
