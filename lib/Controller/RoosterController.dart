import 'dart:convert';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:um_media/AppConstants.dart';
import 'package:um_media/Controller/CacheController.dart';
import 'package:um_media/Models/Rooster.dart';
import 'package:http/http.dart' as http;

class RoosterController extends GetxController {
  List<Rooster> roosterList = [];

// whenever calss is called it will be called first

  Future<bool> isDataFetched() {
    if (roosterList.isNotEmpty) {
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }

  Future<void> fetchAll() async {
    await fetchRoosterNumbers();
    // await cachedData();
    print("Roosters Fetched ${roosterList.length}}");
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

  // Future<void> cachedData() async {
  //   var imgList = roosterList
  //       .expand((element) => element.gallery)
  //       .map((element) => element.image)
  //       .toList();
  //   for (var element in imgList) {
  //     var image = await CacheController.cache.downloadFile(AppConstants.base_URL + element);
  //     images.add(image);
  //   }
  //   // cache.getFileFromCache(key);
  // }

  // Future<void> getRoosters({required int id}) async {
  //   var response = await http.post(
  //       Uri.parse(AppConstants.base_URL + AppConstants.rooster_details),
  //       headers: AppConstants.httpHeader,
  //       body: {"roster_id": "$id"});
  //   print('response fetched\n');

  //   var jsonData = jsonDecode(response.body)['data'];

  //   if (jsonData != null && jsonData is Map<String, dynamic>) {
  //     // Parse the jsonData into a single Rooster object
  //     var rooster = Rooster.fromJson(jsonData);

  //     // Add the parsed Rooster to the roosterList
  //     roosterList.add(rooster);

  //     //TODO: Remove the print statements
  //     print('Rooster Added\n');
  //     print('Current roosterList length: ${roosterList.length}');
  //   } else {
  //     // Handle the case where 'data' is not present or is not a valid JSON object
  //     print('Failed to parse JSON data or data is not a Map.');
  //   }
  // }
}

  // void fetchSpecificRoosters(String interest) {
  //   var specific = roosterList.first;
  //   //why value is null here?
  //   var roost = specific.interest?.first;
  //   roost?.forEach((key, value) {
  //     print(value);
  //   });
  // }

// Future<void> fetchRoostersImages() async {
  //   var response = await http.post(
  //       Uri.parse(AppConstants.base_URL + AppConstants.rooster_details),
  //       headers: AppConstants.httpHeader,
  //       body: {"roster_id": "2"});
  //   // print(response.body);
  //   var data = jsonDecode(response.body)['data']['gallery'] as List<dynamic>;
  //   roosterImages = data.map((e) => RoosterImages.fromjson(e)).toList();
  // }

  // Future<void> fetchRoostersInterests() async {
  //   var response = await http
  //       .post(Uri.parse(AppConstants.base_URL + AppConstants.rooster_details),
  //           headers: AppConstants.httpHeader,
  //           //FIXME: THIS IS TO BE FIXED.
  //           body: {"roster_id": "2"});

  //   // print(response.body);
  //   var roosdata =
  //       jsonDecode(response.body)['data']['interest'] as List<dynamic>;
  //   roosterInterests =
  //       roosdata.map((e) => RoosterInterests.fromJson(e)).toList();
  // }


   // Future<void> fetchSingleRoostersInterests({required int id}) async {
  //   var response = await http.post(
  //       Uri.parse(AppConstants.base_URL + AppConstants.rooster_details),
  //       headers: AppConstants.httpHeader,
  //       body: {"roster_id": "${id}"});

  //   var roosdata =
  //       jsonDecode(response.body)['data']['interest'] as List<dynamic>;
  //   _rooster_interests =
  //       roosdata.map((e) => RoosterInterests.fromJson(e)).toList();
  //   roosterInterests.add(_rooster_interests);
  // }

  // Future<void> fetchSingleRoostersImages({required int id}) async {
  //   var response = await http.post(
  //       Uri.parse(AppConstants.base_URL + AppConstants.rooster_details),
  //       headers: AppConstants.httpHeader,
  //       body: {"roster_id": "${id}"});
  //   // print(response.body);
  //   var data = jsonDecode(response.body)['data']['gallery'] as List<dynamic>;
  //   _roosterImages = data.map((e) => RoosterImages.fromjson(e)).toList();
  //   roosterGallery.add(_roosterImages);
  // }