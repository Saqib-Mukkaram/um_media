import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:um_media/AppConstants.dart';
import 'package:um_media/Models/TalentCategory.dart';
// Import the Category class

class TalentController extends GetxController {
  List<TalentCategory> categories = []; // Create a list to store Category objects
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
