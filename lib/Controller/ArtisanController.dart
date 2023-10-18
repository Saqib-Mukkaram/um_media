import 'dart:convert';

import 'package:get/get.dart';
import 'package:um_media/AppConstants.dart';
import 'package:um_media/Models/Rooster.dart';
import 'package:http/http.dart' as http;

class ArtisanController extends GetxController {
  Rooster? rooster;
  Future<void> fetchArtisanDetails(int RoosterId) async {
    var response = await http.post(
        Uri.parse(AppConstants.base_URL + AppConstants.rooster_details),
        headers: AppConstants.httpHeader,
        body: {"roster_id": "$RoosterId"});
    var jsonData = jsonDecode(response.body)['data'];
    // roosterNumbers = jsonData.map((e) => RoosterData.fromJson(e)).toList();
    rooster = Rooster.fromJson(jsonData);
    
  }
}
