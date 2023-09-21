import 'dart:convert';

import 'package:get/get.dart';
import 'package:um_media/AppConstants.dart';
import 'package:um_media/Models/Rooster.dart';
import 'package:http/http.dart' as http;
import 'package:um_media/Models/RoosterImages.dart';
import 'package:um_media/Models/RoosterInterests.dart';

class RoosterController extends GetxController {
  List<RosterData> roosterList = [];
  List<RoosterImages> roosterImages = [];
  List<RoosterInterests> roosterInterests = [];

  Future<void> fetchRoostersImages() async {
    var response = await http.post(
        Uri.parse(AppConstants.base_URL + AppConstants.rooster_details),
        headers: AppConstants.httpHeader,
        body: {"roster_id": "2"});
    // print(response.body);
    var data = jsonDecode(response.body)['data']['gallery'] as List<dynamic>;
    roosterImages = data.map((e) => RoosterImages.fromjson(e)).toList();
  }

  Future<void> fetchRoostersInterests() async {
    var response = await http
        .post(Uri.parse(AppConstants.base_URL + AppConstants.rooster_details),
            headers: AppConstants.httpHeader,
            //FIXME: THIS IS TO BE FIXED.
            body: {"roster_id": "2"});

    // print(response.body);
    var roosdata =
        jsonDecode(response.body)['data']['interest'] as List<dynamic>;
    roosterInterests =
        roosdata.map((e) => RoosterInterests.fromJson(e)).toList();
  }

  Future<void> fetchRoosters() async {
    var response = await http
        .post(Uri.parse(AppConstants.base_URL + AppConstants.rooster_details),
            headers: AppConstants.httpHeader,
            //FIXME: THIS IS TO BE FIXED.
            body: {"roster_id": "2"});

    print(response.body);
    // var jsonData = ;
    roosterList.add(RosterData.fromJson(jsonDecode(response.body)['data']));
  }
}
