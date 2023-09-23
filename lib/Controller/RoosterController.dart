import 'dart:convert';

import 'package:get/get.dart';
import 'package:um_media/AppConstants.dart';
import 'package:um_media/Models/Rooster.dart';
import 'package:http/http.dart' as http;
import 'package:um_media/Models/RoosterImages.dart';
import 'package:um_media/Models/RoosterInterests.dart';

class RoosterController extends GetxController {
  List<RoosterData> roosterList = [];
  List<RoosterImages> _roosterImages = [];
  List<RoosterInterests> _rooster_interests = [];
  List<List<RoosterInterests>> roosterInterests = [];
  List<List<RoosterImages>> roosterGallery = [];

  Future<void> fetchAll() async {
    await getRoosters();
    // Future.delayed(Duration(milliseconds: 500));
    await fetchRoosterData();
    // Future.delayed(Duration(milliseconds: 500));
    var specific = roosterList.first.interest?.first;
    var value = specific?.entries.first;
    print(value?.value);
    // print(roosterList.first.interest.map((key, value) => ));
    // await fetchRoostersImages();
    // await fetchRoostersInterests();
  }

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

  Future<void> getRoosters() async {
    var response = await http.post(
      Uri.parse(AppConstants.base_URL + AppConstants.rooster_list),
      headers: AppConstants.httpHeader,
      //FIXME: THIS IS TO BE FIXED.
    );

    // print(response.body);
    var data = jsonDecode(response.body)['data'] as List<dynamic>;
    roosterList = data.map((e) => RoosterData.fromJson(e)).toList();

    print(" THis is the Fetched Roosters Length ${roosterList.length}");
  }

  Future<void> fetchSingleRoostersInterests({required int id}) async {
    var response = await http
        .post(Uri.parse(AppConstants.base_URL + AppConstants.rooster_details),
            headers: AppConstants.httpHeader,
            //FIXME: THIS IS TO BE FIXED.
            body: {"roster_id": "${id}"});

    // print(response.body);
    var roosdata =
        jsonDecode(response.body)['data']['interest'] as List<dynamic>;
    _rooster_interests =
        roosdata.map((e) => RoosterInterests.fromJson(e)).toList();
    roosterInterests.add(_rooster_interests);
  }

  Future<void> fetchSingleRoostersImages({required int id}) async {
    var response = await http.post(
        Uri.parse(AppConstants.base_URL + AppConstants.rooster_details),
        headers: AppConstants.httpHeader,
        body: {"roster_id": "${id}"});
    // print(response.body);
    var data = jsonDecode(response.body)['data']['gallery'] as List<dynamic>;
    _roosterImages = data.map((e) => RoosterImages.fromjson(e)).toList();
    roosterGallery.add(_roosterImages);
  }

  Future<void> fetchRoosterData() async {
    //TODO: STARTING FROM INDEX 1
    for (var x = 1; x <= roosterList.length; x++) {
      await fetchSingleRoostersImages(id: x);
      await fetchSingleRoostersInterests(id: x);
      print("Data Fetched Successfully $x");
    }
  }
}
