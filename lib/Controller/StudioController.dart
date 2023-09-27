import 'dart:convert';

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

  Future<void> fetchAll() async {
    await getStudios();
    // await cachedData();
    print("Studios Fetched length ${studios.length}");
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

  // Future<void> getStudios() async {
  //   try {
  //     var response = await http.post(
  //         Uri.parse(AppConstants.base_URL + AppConstants.studio_details),
  //         headers: AppConstants.httpHeader,
  //         //FIXME: "this is to be made Dynamic for now we have only one studio" a loop would suffice.
  //         body: {"studio_id": "1"});
  //     if (response.statusCode == 200) {
  //       var data =
  //           jsonDecode(response.body)['data']['gallery'] as List<dynamic>;
  //       // print(data['gallery']);
  //       studios =
  //           data.map((studioData) => Studio.fromJson(studioData)).toList();
  //     } else {
  //       print("failed to fetch data.${response.statusCode}");
  //     }
  //   } catch (error) {
  //     print("Error Fetching Studios Gallery $error , ");
  //   }
  // }
}
  // Future<void> cachedData() async {
  //   var studioImgList = studiosList.map((element) => element.image).toList();
  //   print("Studios List");
  //   print(studioImgList);
  //   for (var element in studioImgList) {
  //     var image = await CacheController.cache
  //         .downloadFile(AppConstants.base_URL + element);
  //     images.add(image);
  //   }
  //   // cache.getFileFromCache(key);
  // }
