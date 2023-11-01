import 'dart:convert';

import 'package:get/get.dart';
import 'package:um_media/AppConstants.dart';
import 'package:um_media/Models/Client.dart';
import 'package:um_media/Models/EnquiredRooster.dart';
import 'package:um_media/Models/Rooster.dart';
import 'package:um_media/Models/Studio.dart';
import 'package:http/http.dart' as http;

class EnquireStudio {
  final Studio studio;

  EnquireStudio({required this.studio});
}

class EnquireListController extends GetxController {
  var roosterEnquireList = <EnquireRooster>[].obs;
  var studioList = <EnquireStudio>[].obs;

  //add these two in a single list

  Future<void> fetchAll() async {
    // print("EnquireRooster List Fetched ${roosterEnquireList.length}}");
    // print("Enquire List Fetched ${studioList.length}}");
  }

  Future<bool> EnquiredRoosterByClient(ClientEnquiry client) async {
    List<EnquireRooster> enquirelist = roosterEnquireList.toList();
    List<String> enquiredRoosterIds =
        enquirelist.map((element) => element.rooster.id.toString()).toList();
    print(enquiredRoosterIds);
    var response = await http.post(
        Uri.parse("${AppConstants.base_URL}${AppConstants.enquire_rooster}"),
        headers: AppConstants.httpHeader,
        body: {
          "name": client.name,
          "email": client.email,
          "phone": client.phone,
          "message": client.message,
          "rosters": jsonEncode(Map.fromIterable(
            enquiredRoosterIds,
            key: (roosterId) => roosterId,
            value: (roosterId) => {
              "message": "I Inquire this roster",
              "roster_id": roosterId,
              "start_date": "2023-09-20 00:00:00",
              "end_date": "2023-09-24 23:59:59",
            },
          )),
        });
    var xy = jsonDecode(response.body);
    if (response.statusCode == 200) {
      if (xy['status'] == true) {
        print(xy);
        return true;
      } else {
        return false;
      }
    } else {
      print(xy);
      return false;
    }
  }

  Future<bool> enquireStudios(ClientEnquiry client) async {
    List<EnquireStudio> enquirelist = studioList.toList();
    List<String> enquireStudio =
        enquirelist.map((e) => e.studio.id.toString()).toList();

    try {
      var response = await http.post(
          Uri.parse(AppConstants.base_URL + AppConstants.studio_enquire),
          headers: AppConstants.httpHeader,
          body: {
            "name": client.name,
            "email": client.email,
            "phone": client.phone,
            "message": client.message,
            "studios": jsonEncode(Map.fromIterable(
              enquireStudio,
              key: (studioId) => studioId,
              value: (studioId) => {
                "message": "I Inquire this studio",
                "studio_id": studioId,
                "studio_hours": 12,
                "start_date": "2023-09-20 00:00:00",
                "end_date": "2023-09-24 23:59:59",
              },
            )),
          });
      var xy = jsonDecode(response.body);
      print(response.body);
      print(xy);
      if (response.statusCode == 200) {
        if (xy['status'] == true) {
          print(xy);
          return true;
        } else {
          return false;
        }
      } else {
        print(xy);
        return false;
      }
    } catch (error) {
      print("Error Fetching Studios List: $error");
      return false;
    }
  }
}
