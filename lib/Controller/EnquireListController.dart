

import 'package:get/get.dart';
import 'package:um_media/AppConstants.dart';
import 'package:um_media/Models/Client.dart';
import 'package:um_media/Models/Rooster.dart';
import 'package:um_media/Models/Studio.dart';
import 'package:http/http.dart' as http;

class EnquireRooster {
  final Rooster rooster;

  EnquireRooster({required this.rooster});
}

class EnquireStudio {
  final Studio studio;

  EnquireStudio({required this.studio});
}

class EnquireListController extends GetxController {
  var roosterEnquireList = <EnquireRooster>[].obs;
  var studioList = <EnquireStudio>[].obs;

  //add these two in a single list

  Future<void> fetchAll() async {
    print("EnquireRooster List Fetched ${roosterEnquireList.length}}");
    print("Enquire List Fetched ${studioList.length}}");
  }

  Future<bool> EnquiredRooster(ClientEnquiry client) async {
    var response = await http.post(
        Uri.parse("${AppConstants.base_URL}${AppConstants.enquire_rooster}"),
        headers: AppConstants.httpHeader,
        body: {
          "name": client.name,
          "email":client.email,
          "phone": client.phone,
          "message": client.message,
          "roster_id": client.Enquiredroosters
        });
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
