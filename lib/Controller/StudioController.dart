import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:um_media/AppConstants.dart';
import 'package:um_media/Controller/CacheController.dart';
import 'package:um_media/Models/Studio.dart'; // Import the Studio model
import 'package:http/http.dart' as http;
import 'package:um_media/Models/StudioList.dart';

class StudioController extends GetxController {
  List<Studio> studios = [];

  Future<bool> isDataFetched() {
    if (studios.isNotEmpty) {
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }

  @override
  void onInit() async {
    super.onInit();
    await getStudios();
  }

  Future<void> fetchAll() async {
    await getStudios();
    // await cachedData();
    kDebugMode ? print("Studios Fetched length ${studios.length}"): null;
  }

  Future<void> getStudios() async {
    try {
      var response = await http.post(
        Uri.parse(AppConstants.base_URL + AppConstants.studio_list),
        headers: AppConstants.httpHeader,
      );
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body)['data'];
        if (responseData != null && responseData is List) {
          studios = responseData
              .map((studioData) => Studio.fromJson(studioData))
              .toList();
        } else {
          print("Invalid or empty 'data' field in the response.");
        }
      } else {
        print("Failed to fetch data. Status Code: ${response.statusCode}");
      }
    } catch (error) {
      print("Error Fetching Studios List: $error");
    }
  }
}
