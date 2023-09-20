import 'dart:convert';

import 'package:get/get.dart';
import 'package:um_media/AppConstants.dart';
import 'package:um_media/Models/Studio.dart'; // Import the Studio model
import 'package:http/http.dart' as http;
import 'package:um_media/Models/StudioList.dart';

class StudioController extends GetxController {
  List<Studio> studios = [];
  List<StudioList> studiosList = [];

  
  Future<void> getStudioList() async {
    try {
      var response = await http.post(
        Uri.parse(AppConstants.base_URL + AppConstants.studio_list),
        headers: AppConstants.httpHeader,
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body)['data'] as List<dynamic>;
        // print(data['gallery']);
        studiosList =
            data.map((studioData) => StudioList.fromJson(studioData)).toList();
      } else {
        print("failed to fetch data.${response.statusCode}");
      }
    } catch (error) {
      print("Error Fetching Studios List $error , ");
    }
  }

  Future<void> getStudios() async {
    try {
      var response = await http.post(
          Uri.parse(AppConstants.base_URL + AppConstants.studio_details),
          headers: AppConstants.httpHeader,
          //FIXME: "this is to be made Dynamic for now we have only one studio" a loop would suffice.
          body: {"studio_id": "1"});
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body)['data']['gallery'] as List<dynamic>;
        // print(data['gallery']);
        studios =
            data.map((studioData) => Studio.fromJson(studioData)).toList();
      } else {
        print("failed to fetch data.${response.statusCode}");
      }
    } catch (error) {
      print("Error Fetching Studios Gallery $error , ");
    }
  }
}
