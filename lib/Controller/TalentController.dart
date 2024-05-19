import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:um_media/AppConstants.dart';
import 'package:um_media/Controller/CacheController.dart';
import 'package:um_media/Models/TalentCategory.dart';
// Import the Category class

class TalentController extends GetxController {
  List<TalentCategory> categories =
      []; // Create a list to store Category objects
  var datafetched = false;

  Future<bool> isDataFetched() {
    while (datafetched == false) {
      Future.delayed(
        Duration(seconds: 1),
      );
    }
    return Future.value(true);
  }

  @override
  void onInit() async {
    super.onInit();
    await getCategories();
  }

  Future<void> fetchAll() async {
    await getCategories();
    // await cachedData();
    kDebugMode ?  print("Categories Fetched") : null;
  }

  Future<void> getCategories() async {
    try {
      var response = await http.post(
        Uri.parse(AppConstants.base_URL + AppConstants.rooster_categories),
        headers: AppConstants.httpHeader,
      );

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body)['data'];
        categories = data
            .map((categoryData) => TalentCategory.fromJson(categoryData))
            .toList();
        datafetched = true;
        // print(categories.length);
      } else {
        print(
            "Failed to fetch categories. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching categories: $e");
    }
  }
}

// Future<void> cachedData() async {
//   var studioImgList = categories.map((element) => element.photo).toList();
//   print("Studios List");
//   print(studioImgList);
//   for (var element in studioImgList) {
//     var image = await CacheController.cache
//         .downloadFile(AppConstants.base_URL + element);
//     images.add(image);
//   }
//   // cache.getFileFromCache(key);
// }
